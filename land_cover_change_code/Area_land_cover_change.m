clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% load land cover change data
x1=importdata('Frac_LC_MODIS_2011.tif');
x2=importdata('Frac_LC_MODIS_2019.tif');

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

%% Estimation of Areas
%% load global grid
load NA
lon=NA.c1.lon;
lat=NA.c1.lat;

%% calculate area of pixel from SMOS grid
% Latitude: 1 deg = 110.574 km
% Longitude: 1 deg = 111.320*cos(latitude) km
% real      -> 510.100.000 km^2
% estimated -> 505.305.800 km^2
% error approx. of 1%

dlo_x=diff(lon);
dlo=zeros(1388,1);
dlo(1)=dlo_x(1);
dlo(end)=dlo_x(end);
for i=2:1387
    dlo(i)=mean(dlo_x(i-1:i));
end

dla_x=diff(lat);
dla=zeros(584,1);
dla(1)=dla_x(1);
dla(end)=dla_x(end);
for i=2:583
    dla(i)=mean(dla_x(i-1:i));
end

global_area=zeros(584,1388);
for i=1:584
    for j=1:1388
        dx=111.320*dlo(j)*cos(lat(i)*pi/180);
        dy=110.574*dla(i);
        global_area(i,j)=dx*dy;
    end
    disp(i*100/584);
end


%% estimate area per cluster
Area=zeros(16,1);
k=1;

load NA
z=NA.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=NA.c2.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load AM
z=AM.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=AM.c2.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=AM.c3.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=AM.c4.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load AR
z=AR.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load CA
z=CA.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=CA.c2.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load EA
z=EA.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=EA.c2.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load IN
z=IN.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load RU
z=RU.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
z=RU.c2.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load CH
z=CH.c1.map;
Area(k)=sum(sum(z.*global_area));k=k+1;
load AU
z=AU.c1.map;
Area(k)=sum(sum(z.*global_area));

save('Area_clusters.mat','Area');
%% fluvial diagram
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

data=zeros(11,11,16);
k=1;

load NA
z=NA.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=NA.c2.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load AM
z=AM.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=AM.c2.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=AM.c3.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=AM.c4.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load AR
z=AR.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load CA
z=CA.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=CA.c2.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load EA
z=EA.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=EA.c2.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load IN
z=IN.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load RU
z=RU.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
z=RU.c2.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load CH
z=CH.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);k=k+1;
load AU
z=AU.c1.map;
a=y.*z;
b=x.*z;
data(:,:,k)=land_use_change(a,b);
LCC=data;
save('LCC_cluster_biome.mat','LCC');

