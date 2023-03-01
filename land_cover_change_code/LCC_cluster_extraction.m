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

%% biome labels
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

%% LCC extrcation per cluster
%% NA
load NA
C=NA;
NA_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
NA_lcc.c1.lcc_2011=lcc_2011;
NA_lcc.c1.lcc_2019=lcc_2019;
NA_lcc.c1.area=area;
map=C.c2.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
NA_lcc.c2.lcc_2011=lcc_2011;
NA_lcc.c2.lcc_2019=lcc_2019;
NA_lcc.c2.area=area;
save('NA_lcc.mat','NA_lcc');
clear('NA','NA_lcc');

%% AM
load AM
C=AM;
AM_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
AM_lcc.c1.lcc_2011=lcc_2011;
AM_lcc.c1.lcc_2019=lcc_2019;
AM_lcc.c1.area=area;
map=C.c2.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
AM_lcc.c2.lcc_2011=lcc_2011;
AM_lcc.c2.lcc_2019=lcc_2019;
AM_lcc.c2.area=area;
map=C.c3.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
AM_lcc.c3.lcc_2011=lcc_2011;
AM_lcc.c3.lcc_2019=lcc_2019;
AM_lcc.c3.area=area;
map=C.c4.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
AM_lcc.c4.lcc_2011=lcc_2011;
AM_lcc.c4.lcc_2019=lcc_2019;
AM_lcc.c4.area=area;
save('AM_lcc.mat','AM_lcc');
clear('AM','AM_lcc');

%% AR
load AR
C=AR;
AR_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
AR_lcc.c1.lcc_2011=lcc_2011;
AR_lcc.c1.lcc_2019=lcc_2019;
AR_lcc.c1.area=area;
save('AR_lcc.mat','AR_lcc');
clear('AR','AR_lcc');

%% CA
load CA
C=CA;
CA_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
CA_lcc.c1.lcc_2011=lcc_2011;
CA_lcc.c1.lcc_2019=lcc_2019;
CA_lcc.c1.area=area;
map=C.c2.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
CA_lcc.c2.lcc_2011=lcc_2011;
CA_lcc.c2.lcc_2019=lcc_2019;
CA_lcc.c2.area=area;
save('CA_lcc.mat','CA_lcc');
clear('CA','CA_lcc');

%% EA
load EA
C=EA;
EA_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
EA_lcc.c1.lcc_2011=lcc_2011;
EA_lcc.c1.lcc_2019=lcc_2019;
EA_lcc.c1.area=area;
map=C.c2.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
EA_lcc.c2.lcc_2011=lcc_2011;
EA_lcc.c2.lcc_2019=lcc_2019;
EA_lcc.c2.area=area;
save('EA_lcc.mat','EA_lcc');
clear('EA','EA_lcc');

%% IN
load IN
C=IN;
IN_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
IN_lcc.c1.lcc_2011=lcc_2011;
IN_lcc.c1.lcc_2019=lcc_2019;
IN_lcc.c1.area=area;
save('IN_lcc.mat','IN_lcc');
clear('IN','IN_lcc');

%% RU
load RU
C=RU;
RU_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
RU_lcc.c1.lcc_2011=lcc_2011;
RU_lcc.c1.lcc_2019=lcc_2019;
RU_lcc.c1.area=area;
map=C.c2.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
RU_lcc.c2.lcc_2011=lcc_2011;
RU_lcc.c2.lcc_2019=lcc_2019;
RU_lcc.c2.area=area;
save('RU_lcc.mat','RU_lcc');
clear('RU','RU_lcc');

%% CH
load CH
C=CH;
CH_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
CH_lcc.c1.lcc_2011=lcc_2011;
CH_lcc.c1.lcc_2019=lcc_2019;
CH_lcc.c1.area=area;
save('CH_lcc.mat','CH_lcc');
clear('CH','CH_lcc');

%% AU
load AU
C=AU;
AU_lcc=struct();
map=C.c1.map;
lcc_2011=map.*x;lcc_2011(lcc_2011==0)=[];
lcc_2019=map.*y;lcc_2019(lcc_2019==0)=[];
area=map.*global_area;area(area==0)=[];
AU_lcc.c1.lcc_2011=lcc_2011;
AU_lcc.c1.lcc_2019=lcc_2019;
AU_lcc.c1.area=area;
save('AU_lcc.mat','AU_lcc');
clear('AU','AU_lcc');