clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% load cluster index
load index_clusters

%% load colors
N=35;
map_ax=distinguishable_colors(N);
% for i=1:N
%     ax=subplot(5,7,i);
%     imagesc(ones(N));
%     colormap(ax,map_ax(i,:));
%     axis square;
%     title(i);
% end
% map=map_ax([6,35,11,16,26],:);
map=map_ax([11,6,26,35,16],:);
map=[ones(1,3);map];

%% iniciate map
z=zeros(584,1388);
load NA
lon=NA.c1.lon;
lat=NA.c1.lat;
clear('NA');
k=1;

%% NA
load NA
m=NA.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
m=NA.c2.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('NA');

%% AM
load AM
m=AM.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
m=AM.c2.map;
z(m==1)=idx_cluster(k);k=k+1;
m=AM.c3.map;
z(m==1)=idx_cluster(k);k=k+1;
m=AM.c4.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('AM');

%% AR
load AR
m=AR.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('AR');

%% CA
load CA
m=CA.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
m=CA.c2.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('CA');

%% EA
load EA
m=EA.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
m=EA.c2.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('EA');

%% IN
load IN
m=IN.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('IN');

%% RU
load RU
m=RU.c2.map;
z(m==1)=idx_cluster(k);k=k+1;
m=RU.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('RU');

%% CH
load CH
m=CH.c1.map;
z(m==1)=idx_cluster(k);k=k+1;
clear('CH');

%% AU
load AU
m=AU.c1.map;
z(m==1)=idx_cluster(k);
clear('AU');

%% PLOT MAP
lx=lon;
ly=lat;
load coastlines
load borderdata
lox=lon;
lax=lat;
lon=lx;
lat=ly;

figure,

for i=1:5
    h=area([-1:0],[-1:0]);
    h.FaceColor=map(i+1,:);
    hold on;
end

imagesc(lon,lat,z);
colormap(map);
hold on;
for i=1:302
    plot(cell2mat(lox(i)),cell2mat(lax(i)),'color',0.6*ones(1,3))
    hold on;
end
hold on;
plot(coastlon,coastlat,'k');
grid;
set(gca,'ydir','normal');
set(gca,'DataAspectRatio',[1 1 1])
set(gcf, 'Position',  [100, 100, 1000, 600])
set(gca,'fontsize',18);
legend('A: +$\Delta$SM',...
    'B: - $\Delta$SM - $\Delta$VOD',...
    'C: - $\Delta$SM +$\Delta$VOD',...
    'D: +$\Delta$VOD',...
    'E: - - $\Delta$SM - - $\Delta$VOD');