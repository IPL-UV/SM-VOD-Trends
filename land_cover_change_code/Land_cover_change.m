clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

x1=importdata('Frac_LC_MODIS_2011.tif');
x2=importdata('Frac_LC_MODIS_2019.tif');
load CA
Z1=CA.c1.map;
lon_x=CA.c1.lon;
lat_x=CA.c1.lat;
Z2=CA.c2.map;

Z=Z1+Z2;
Z(Z>1)=1;


% epecific change
load coastlines
load borderdata
lax=lat;
lox=lon;
lat=lat_x;
lon=lon_x;
z=Z;

laxx=linspace(-84.5171,83.5171,584)';
[la1,lo1]=meshgrid(laxx,lon);
lo1=lo1';
la1=la1';
la1(Z==0)=[];
lo1(Z==0)=[];


[~,x]=max(double(x1),[],3);
x=flip(x);
[~,y]=max(double(x2),[],3);
y=flip(y);

la=linspace(-90,90,662)';
[~,idx]=min(abs(la-83.5171));
[~,idy]=min(abs(la+83.5171));
x=x(idy:idx,:);
y=y(idy:idx,:);

x=imresize(x,[584,1388],'nearest'); 
y=imresize(y,[584,1388],'nearest'); 

figure,


% fluvial diagram

CC = bwconncomp(z,8);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
kk=1;
Zx=zeros(size(z));
while biggest>200
[biggest,idx] = max(numPixels);
if biggest<200
else
    if biggest==584
    else
        Zx(CC.PixelIdxList{idx}) = kk;
        kk=kk+1;
    end
    numPixels(idx)=1;
end
end

labels={'evergreen needleleaf',...
    'evergreen broadleaf',...
    'decidious needleleleaf',...
    'decidious broadleaf',...
    'shrubland',...
    'grassland',...
    'cereal cropland',...
    'broadleaf cropland',...
    'urban',...
    'snow-ice',...
    'non-vegetated'};

cluster=1;
a=y.*(Zx==cluster);
b=x.*(Zx==cluster);
data=zeros(11);
for i=1:11
    for j=1:11
        aux1=zeros(584,1388);
        aux1(a==i)=1;
        aux2=zeros(584,1388);
        aux2(b==j)=1;
        data(i,j)=sum((aux1(:)+aux2(:))==2);
    end
end

labels={'evergreen needleleaf',...
    'evergreen broadleaf',...
    'decidious needleleleaf',...
    'decidious broadleaf',...
    'shrubland',...
    'grassland',...
    'cereal cropland',...
    'broadleaf cropland',...
    'urban',...
    'snow-ice',...
    'non-vegetated'};

subplot(2,2,[1,3]);

idx=find(diag(data)>60);

data=data(idx,idx);
labels=labels(idx);

[color]=alluvialflow(data', labels, labels, '$2011 \rightarrow 2019$');
set(gca,'fontsize',18);

% maps
map=[0.6*ones(1,3);ones(1,3);color];


xx=x.*z;
k=1;
for i=1:11
    if sum(idx==i)==0
        xx(xx==i)=-1;
    else
       xx(xx==i)=k;
       k=k+1;
    end
end
subplot(2,2,2);
imagesc(lon,lat,xx);
colormap(map);
hold on;
for i=1:302
    plot(cell2mat(lox(i)),cell2mat(lax(i)),'color',0.6*ones(1,3))
    hold on;
end
plot(coastlon,coastlat,'k');
grid;
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'ydir','normal');
axis([min(lo1)-2 max(lo1)+2 min(la1)-2 max(la1)+2]);

set(gca,'fontsize',18);
% colorbar;
title('2011');

xx=y.*z;
k=1;
for i=1:11
    if sum(idx==i)==0
        xx(xx==i)=-1;
    else
       xx(xx==i)=k;
       k=k+1;
    end
end
subplot(2,2,4);
imagesc(lon,lat,xx);
colormap(map);
hold on;
for i=1:302
    plot(cell2mat(lox(i)),cell2mat(lax(i)),'color',0.6*ones(1,3))
    hold on;
end
plot(coastlon,coastlat,'k');
grid;
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'ydir','normal');
axis([min(lo1)-2 max(lo1)+2 min(la1)-2 max(la1)+2]);

set(gca,'fontsize',18);
% colorbar;
title('2019');



