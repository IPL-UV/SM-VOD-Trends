clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% Analysis of cluster
load RU_sens
load RU_mean
load RU_lcc
load LCC_cluster_biome

S=RU_sens.c1;
M=RU_mean.c1;
L=RU_lcc.c1;
D=LCC(:,:,1);

sm_s=S.sm.s;
sm_m=M.sm.mean;
vod_s=S.vod.s;
vod_m=M.vod.mean;
ndvi_s=S.ndvi.s;
ndvi_m=M.ndvi.mean;
prec_s=S.prec.s;
prec_m=M.prec.mean;

z1=L.lcc_2011;
z2=L.lcc_2019;
a=L.area;

%% label of biomes
labels={'evergreen needleleaf',...  %1
    'evergreen broadleaf',...       %2
    'decidious needleleleaf',...    %3
    'decidious broadleaf',...       %4
    'shrubland',...                 %5
    'grassland',...                 %6
    'cereal cropland',...           %7
    'broadleaf cropland',...        %8
    'urban',...                     %9
    'snow-ice',...                  %10
    'non-vegetated'};               %11

%% max number of change
% percentage of change
x1=sm_s;
y1=sm_m;
z=100*x1./y1;
qs=zeros(3*size(z,1),4);
qs(:,1)=[z(:,12);z(:,1);z(:,2)];
qs(:,2)=[z(:,3);z(:,4);z(:,5)];
qs(:,3)=[z(:,6);z(:,7);z(:,8)];
qs(:,4)=[z(:,9);z(:,10);z(:,11)];

x1=vod_s;
y1=vod_m;
z=100*x1./y1;
qv=zeros(3*size(z,1),4);
qv(:,1)=[z(:,12);z(:,1);z(:,2)];
qv(:,2)=[z(:,3);z(:,4);z(:,5)];
qv(:,3)=[z(:,6);z(:,7);z(:,8)];
qv(:,4)=[z(:,9);z(:,10);z(:,11)];

x1=ndvi_s;
y1=ndvi_m;
z=100*x1./y1;
qn=zeros(3*size(z,1),4);
qn(:,1)=[z(:,12);z(:,1);z(:,2)];
qn(:,2)=[z(:,3);z(:,4);z(:,5)];
qn(:,3)=[z(:,6);z(:,7);z(:,8)];
qn(:,4)=[z(:,9);z(:,10);z(:,11)];

x1=prec_s;
y1=prec_m;
z=100*x1./y1;
qp=zeros(3*size(z,1),4);
qp(:,1)=[z(:,12);z(:,1);z(:,2)];
qp(:,2)=[z(:,3);z(:,4);z(:,5)];
qp(:,3)=[z(:,6);z(:,7);z(:,8)];
qp(:,4)=[z(:,9);z(:,10);z(:,11)];

m1=quantile([qs(:);qv(:);qn(:);qp(:)],0.01);
m2=quantile([qs(:);qv(:);qn(:);qp(:)],0.99);

subplot(1,2,1);
for i=1:4
    bplot(qs(:,i),i-0.3,'linewidth',0.5,'width',0.2,'color',[0.1,0.5,0.9,0.6]);
    hold on;
    bplot(qp(:,i),i-0.1,'linewidth',0.5,'width',0.2,'color',[0.0,0.3,0.5,0.6]);
    hold on;
    bplot(qv(:,i),i+0.1,'linewidth',0.5,'width',0.2,'color',[0.1,0.9,0.2,0.6]);
    hold on;
    bplot(qn(:,i),i+0.3,'linewidth',0.5,'width',0.2,'color',[0.0,0.5,0.0,0.6]);
    hold on;
end
set(gca,'xtick',1:4,'xticklabel',{'DJF','MAM','JJA','SON'});
ylabel('$\%$ Change');
set(gca,'fontsize',18);
axis([0.6,4.4,m1,m2]);
axis square;
grid;

% land cover change
d=zeros(11,2);
for i=1:11
    d(i,1)=sum(a(z1==i));
    d(i,2)=sum(a(z2==i));
end

idx=d(:,1)>0.1*sum(d(:,1));
d(d(:,1)<0.1*sum(d(:,1)),:)=[];
d=100*(d(:,2)-d(:,1))./d(:,1);
subplot(1,2,2);
barh(d,1,'black');
set(gca,'fontsize',18);
set(gca,'ytick',1:size(d),'yticklabel',labels(idx));
axis square;
set(gcf, 'Position',  [100, 100, 1000, 400])