clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% maps
%% load data
load AM

lat=AM.c1.lat;
lon=AM.c1.lon;

mp1=AM.c1.map;
mp2=AM.c2.map;
mp3=AM.c3.map;
mp4=AM.c4.map;

clear('AM');

load AM_sens
% C1
n1=size(AM_sens.c1.sm.s,1);
C1s=zeros(n1,4);
C1r=zeros(n1,4);
x=AM_sens.c1.sm.s;x=squeeze(nanmedian(x,2));
C1s(:,1)=x;
x=AM_sens.c1.sm.r;x=squeeze(nanmedian(x,2));
C1r(:,1)=x;
x=AM_sens.c1.vod.s;x=squeeze(nanmedian(x,2));
C1s(:,2)=x;
x=AM_sens.c1.vod.r;x=squeeze(nanmedian(x,2));
C1r(:,2)=x;
x=AM_sens.c1.ndvi.s;x=squeeze(nanmedian(x,2));
C1s(:,3)=x;
x=AM_sens.c1.ndvi.r;x=squeeze(nanmedian(x,2));
C1r(:,3)=x;
x=AM_sens.c1.prec.s;x=squeeze(nansum(x,2));
C1s(:,4)=x;
x=AM_sens.c1.prec.r;x=squeeze(nansum(x,2));
C1r(:,4)=x;

% C3
n3=size(AM_sens.c3.sm.s,1);
C3s=zeros(n3,4);
C3r=zeros(n3,4);
x=AM_sens.c3.sm.s;x=squeeze(nanmedian(x,2));
C3s(:,1)=x;
x=AM_sens.c3.sm.r;x=squeeze(nanmedian(x,2));
C3r(:,1)=x;
x=AM_sens.c3.vod.s;x=squeeze(nanmedian(x,2));
C3s(:,2)=x;
x=AM_sens.c3.vod.r;x=squeeze(nanmedian(x,2));
C3r(:,2)=x;
x=AM_sens.c3.ndvi.s;x=squeeze(nanmedian(x,2));
C3s(:,3)=x;
x=AM_sens.c3.ndvi.r;x=squeeze(nanmedian(x,2));
C3r(:,3)=x;
x=AM_sens.c3.prec.s;x=squeeze(nansum(x,2));
C3s(:,4)=x;
x=AM_sens.c3.prec.r;x=squeeze(nansum(x,2));
C3r(:,4)=x;

% C2
n2=size(AM_sens.c2.sm.s,1);
C2s=zeros(n2,4);
C2r=zeros(n2,4);
x=AM_sens.c2.sm.s;x=squeeze(nanmedian(x,2));
C2s(:,1)=x;
x=AM_sens.c2.sm.r;x=squeeze(nanmedian(x,2));
C2r(:,1)=x;
x=AM_sens.c2.vod.s;x=squeeze(nanmedian(x,2));
C2s(:,2)=x;
x=AM_sens.c2.vod.r;x=squeeze(nanmedian(x,2));
C2r(:,2)=x;
x=AM_sens.c2.ndvi.s;x=squeeze(nanmedian(x,2));
C2s(:,3)=x;
x=AM_sens.c2.ndvi.r;x=squeeze(nanmedian(x,2));
C2r(:,3)=x;
x=AM_sens.c2.prec.s;x=squeeze(nansum(x,2));
C2s(:,4)=x;
x=AM_sens.c2.prec.r;x=squeeze(nansum(x,2));
C2r(:,4)=x;

% C4
n4=size(AM_sens.c4.sm.s,1);
C4s=zeros(n4,4);
C4r=zeros(n4,4);
x=AM_sens.c4.sm.s;x=squeeze(nanmedian(x,2));
C4s(:,1)=x;
x=AM_sens.c4.sm.r;x=squeeze(nanmedian(x,2));
C4r(:,1)=x;
x=AM_sens.c4.vod.s;x=squeeze(nanmedian(x,2));
C4s(:,2)=x;
x=AM_sens.c4.vod.r;x=squeeze(nanmedian(x,2));
C4r(:,2)=x;
x=AM_sens.c4.ndvi.s;x=squeeze(nanmedian(x,2));
C4s(:,3)=x;
x=AM_sens.c4.ndvi.r;x=squeeze(nanmedian(x,2));
C4r(:,3)=x;
x=AM_sens.c4.prec.s;x=squeeze(nansum(x,2));
C4s(:,4)=x;
x=AM_sens.c4.prec.r;x=squeeze(nansum(x,2));
C4r(:,4)=x;

%% projection
%% load
lx=lon;
ly=lat;
load coastlines
load borderdata
lox=lon;
lax=lat;
lon=lx;
lat=ly;
load coastlines

lla=linspace(-83.5171,83.5171,584)';
llo=linspace(-180,180,1388)';
[lo1,la1]=meshgrid(llo,lla);

%% extract info and reproject
figure,
names={'SM','VOD','NDVI','Precipitation'};
units_label={'$m^3/m^3$/year','units/year','units/year','$mmm$/year'};
idx_subp=[1,2,4,3];
map1=flip(cmocean('balance'));map1(1,:)=ones(1,3);
map2=flip(cmocean('curl'));map2(1,:)=ones(1,3);
map=zeros(256,3,4);
map(:,:,1)=map1;
map(:,:,2)=map2;
map(:,:,3)=map2;
map(:,:,4)=map1;

for ii=1:4

z=zeros(584,1388);
z(mp1==1)=C1s(:,ii);
z(mp2==1)=C2s(:,ii);
z(mp3==1)=C3s(:,ii);
z(mp4==1)=C4s(:,ii);
z(z==0)=nan;
z=z*0.5;

q=zeros(584,1388);
q(mp1==1)=C1r(:,ii);
q(mp2==1)=C2r(:,ii);
q(mp3==1)=C3r(:,ii);
q(mp4==1)=C4r(:,ii);
q(q==0)=nan;

if ii==4
    loz=lo1(q>0.99);
    laz=la1(q>0.99);
else
    loz=lo1(q>0.3);
    laz=la1(q>0.3);
end


ax=subplot(2,2,idx_subp(ii));
imagesc(lon,lat,z);

colormap(ax,map(:,:,ii));
c = colorbar;
c.Label.String = units_label(ii);
c.Label.Interpreter = 'latex';
c.Label.FontSize = 12;
set(c,'TickLabelInterpreter','latex')
hold on;
aux=mp1+mp3;aux(mp4>0)=0;
contour(llo,lla,aux,'color',[0.5,0.0,0.2],...
    'linewidth',1.2,'LevelList',1e-1);
hold on;
contour(llo,lla,mp2,'color',[0.0,0.0,0.0],...
    'linewidth',1.2,'LevelList',1e-1);
hold on;
contour(llo,lla,mp4,'color',[0.0,0.2,0.5],...
    'linewidth',1.2,'LevelList',1e-1);
hold on;
plot(coastlon,coastlat,'k');
hold on;
for i=1:302
    plot(cell2mat(lox(i)),cell2mat(lax(i)),'color',0.6*ones(1,3))
    hold on;
end
% plot(loz,laz,'.k','markersize',0.1);
grid;
axis([-70,-32,-20,6]);
if ii==3
    caxis([-0.2*max(abs(z(:))),0.2*max(abs(z(:)))])
else
    caxis([-max(abs(z(:))),max(abs(z(:)))])
end
set(gca,'ydir','normal');
set(gca,'DataAspectRatio',[1 1 1])
set(gcf, 'Position',  [100, 100, 1000, 600])
set(gca,'fontsize',18);
if ii==1
    title('$\Delta$ SM /year $[\%]$');
end
if ii==2
    title('$\Delta$ VOD /year $[\%]$');
end
if ii==3
    title('$\Delta$ NDVI /year $[\%]$');
end
if ii==4
    title('$\Delta$ Precipitation /year $[\%]$');
end
% title(names(ii));
text(-44,-18,'Cluster 1','fontsize',12);
text(-70,0,'Cluster 2','fontsize',12);
text(-70,-17,'Cluster 3','fontsize',12);
end