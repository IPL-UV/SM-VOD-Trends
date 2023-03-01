function f=plot_map_change(S,M,L,lon,lat,mask,name)
lx=lon;
ly=lat;
load coastlines
load borderdata
lox=lon;
lax=lat;
lon=lx;
lat=ly;

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

%% max number of change
% percentage of change
x1=sm_s;
y1=sm_m;
zs=100*x1./y1;

x1=vod_s;
y1=vod_m;
zv=100*x1./y1;

x1=ndvi_s;
y1=ndvi_m;
zn=100*x1./y1;

x1=prec_s;
y1=prec_m;
zp=100*x1./y1;

%% maps
%% map (example)
lla=linspace(-83.5171,83.5171,584)';
llo=linspace(-180,180,1388)';
[lo1,la1]=meshgrid(llo,lla);
a1=max(la1(mask==1));
a2=min(la1(mask==1));
b1=max(lo1(mask==1));
b2=min(lo1(mask==1));

qs=nanmean(zs,2);Ms=zeros(584,1388);Ms(mask==1)=qs;
qv=nanmean(zv,2);Mv=zeros(584,1388);Mv(mask==1)=qv;
qn=nanmean(zn,2);Mn=zeros(584,1388);Mn(mask==1)=qn;
qp=nanmean(zp,2);Mp=zeros(584,1388);Mp(mask==1)=qp;

idx=abs(z2-z1)>0;
lz=zeros(584,1388);lz(mask==1)=idx;
loz=lo1(lz==1);
laz=la1(lz==1);

h=2;

f=figure;
ax=subplot(2,2,1);
imagesc(lon,lat,Ms);
colormap(ax,flip(cmocean('balance')));
caxis([-quantile(abs(qs(:)),0.9),quantile(abs(qs(:)),0.9)])
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
axis([b2-h,b1+h,a2-h,a1+h]);
hold on;
plot(loz,laz,'.m');
colorbar;
title('$\Delta$ SM ($\%$)','interpreter','latex');

ax=subplot(2,2,2);
imagesc(lon,lat,Mv);
colormap(ax,flip(cmocean('curl')));
caxis([-quantile(abs(qv(:)),0.9),quantile(abs(qv(:)),0.9)])
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
axis([b2-h,b1+h,a2-h,a1+h]);
hold on;
plot(loz,laz,'.m');
colorbar;
title('$\Delta$ VOD ($\%$)','interpreter','latex');

ax=subplot(2,2,3);
imagesc(lon,lat,Mp);
colormap(ax,flip(cmocean('balance')));
caxis([-quantile(abs(qp(:)),0.9),quantile(abs(qp(:)),0.9)])
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
axis([b2-h,b1+h,a2-h,a1+h]);
hold on;
plot(loz,laz,'.m');
colorbar;
title('$\Delta$ precipitation ($\%$)','interpreter','latex');

ax=subplot(2,2,4);
imagesc(lon,lat,Mn);
colormap(ax,flip(cmocean('curl')));
caxis([-quantile(abs(qn(:)),0.9),quantile(abs(qn(:)),0.9)])
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
axis([b2-h,b1+h,a2-h,a1+h]);
hold on;
plot(loz,laz,'.m');
colorbar;
title('$\Delta$ NDVI ($\%$)','interpreter','latex');

set(gcf, 'Position',  [100, 100, 1000, 600])

saveas(f,name,'png')