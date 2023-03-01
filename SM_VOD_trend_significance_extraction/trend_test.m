clc; close all; clear;

names={'sm_r_world','vod_r_world'};
Q=[0.1,0.25,0.5,0.75,0.9];

for index1=1:2
for index2=1:5
    
%% load data
data=load([cell2mat(names(index1))]);
data = struct2cell(data);
data=cell2mat(data);
n=size(data,1);

load mask_world

nt=9;
x=reshape(data(:,42:657+41),n,73,9);
x(isnan(x))=0;
%% yearly agregation
x=squeeze(quantile(x,Q(index2),2));
x(isnan(x))=0;

%% take off auto correlation
y=zeros(n,nt-1);
for i=1:n
    q=x(i,:);
    qm=mean(q);
    r=nt*sum((q(1:end-1)-qm).*(q(2:end)-qm))/((nt-1)*sum((q-qm).^2));
    y(i,:)=q(2:end)+r*q(1:end-1);
    disp(i*100/n);
end
y(isnan(y))=0;

%% MK test
H=zeros(n,1);
p=zeros(n,1);
z_stat=zeros(n,1);
parfor i=1:n
    [~,~,H(i),p(i),z_stat(i)]= ktaub([(1:(nt-1))',y(i,:)'], 0.1);
    disp(i*100/n);
end
z=zeros(size(mask));
z(mask==1)=H;
P=zeros(size(mask));
P(mask==1)=p;
Z_stat=zeros(size(mask));
Z_stat(mask==1)=z_stat;

%% plot map
load coastlines
lat=linspace(90,-90,360)';
lon=linspace(-180,180,720)';
map=[1,1,1;0.95,0.95,0.95;0.6,0.6,0;0,0.6,0];
map1=cmocean('ice');
map1(1,:)=ones(1,3);
map2=flip(cmocean('curl'));
map2(1,:)=ones(1,3);

figure,

ax=subplot(2,2,1:2);
imagesc(lon,lat,flip(z));
colormap(ax,map);
hold on;
plot(coastlon,coastlat,'k');
grid;
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'ydir','normal');
title('Significant Positives','interpreter','latex');
set(gca,'fontsize',12);
% axis([-180,180,24,84]);

ax=subplot(2,2,3);
imagesc(lon,lat,flip(log10(P)));colorbar;
colormap(ax,map1);
hold on;
plot(coastlon,coastlat,'k');
grid;
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'ydir','normal');
title('$log_{10}(p)$','interpreter','latex');
set(gca,'fontsize',12);
% axis([-180,180,24,84]);

ax=subplot(2,2,4);
imagesc(lon,lat,flip(Z_stat));colorbar;
colormap(ax,map2);
hold on;
plot(coastlon,coastlat,'k');
grid;
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'ydir','normal');
title('z score','interpreter','latex');
set(gca,'fontsize',12);
% axis([-180,180,24,84]);

%% permutation test

it=100;
max_cluster=zeros(it,1);
for w=1:it
    idx=randperm(nt-1,nt-1);
    q=y(:,idx);
    h=zeros(n,1);
    parfor i=1:n
        [~,~,h(i)]= ktaub([(1:(nt-1))',q(i,:)'], 0.1);
    end
    zx=zeros(size(mask));
    zx(mask==1)=h;
    CC = bwconncomp(zx,8);
    numPixels = cellfun(@numel,CC.PixelIdxList);
    max_cluster(w) = max(numPixels);
    
    disp(w*100/it);
end

thres = quantile(max_cluster,0.9);

%% clusterize the image
load coastlines
load borderdata
lax=lat;
lox=lon;
lat=linspace(90,-90,360)';
lon=linspace(-180,180,720)';
map=[1,1,1;0.95,0.95,0.95;0.6,0.6,0;0,0.6,0];

Z=z;
Z(Z==1)=2;
CC = bwconncomp(z,8);
numPixels = cellfun(@numel,CC.PixelIdxList);
biggest = max(numPixels);
while biggest>thres
[biggest,idx] = max(numPixels);
Z(CC.PixelIdxList{idx}) = 3;
numPixels(idx)=1;
end



Z(mask==1 & Z==0)=1;

figure,
imagesc(lon,lat,flip(Z));
colormap(map);
hold on;
for i=1:302
    plot(cell2mat(lox(i)),cell2mat(lax(i)),'color',0.6*ones(1,3))
    hold on;
end
plot(coastlon,coastlat,'k');
grid;
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'ydir','normal');
%%
save([cell2mat(names(index1)),'_mk_test_q',num2str(100*Q(index2)),'.mat'],'Z','z','max_cluster','thres','P','Z_stat');

pause(0.1);
end
end

