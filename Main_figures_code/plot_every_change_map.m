clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% NA
load NA_sens
load NA_mean
load NA_lcc
load NA
mask=NA.c1.map;
lat=NA.c1.lat;
lon=NA.c1.lon;
S=NA_sens.c1;
M=NA_mean.c1;
L=NA_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'NA_c1_map');
close(f)
mask=NA.c2.map;
lat=NA.c2.lat;
lon=NA.c2.lon;
S=NA_sens.c2;
M=NA_mean.c2;
L=NA_lcc.c2;
f=plot_map_change(S,M,L,lon,lat,mask,'NA_c2_map');
close(f)
clear;

%% AM
load AM_sens
load AM_mean
load AM_lcc
load AM
mask=AM.c1.map;
lat=AM.c1.lat;
lon=AM.c1.lon;
S=AM_sens.c1;
M=AM_mean.c1;
L=AM_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'AM_c1_map');
close(f)
mask=AM.c2.map;
lat=AM.c2.lat;
lon=AM.c2.lon;
S=AM_sens.c2;
M=AM_mean.c2;
L=AM_lcc.c2;
f=plot_map_change(S,M,L,lon,lat,mask,'AM_c2_map');
close(f)
mask=AM.c3.map;
lat=AM.c3.lat;
lon=AM.c3.lon;
S=AM_sens.c3;
M=AM_mean.c3;
L=AM_lcc.c3;
f=plot_map_change(S,M,L,lon,lat,mask,'AM_c3_map');
close(f)
mask=AM.c4.map;
lat=AM.c4.lat;
lon=AM.c4.lon;
S=AM_sens.c4;
M=AM_mean.c4;
L=AM_lcc.c4;
f=plot_map_change(S,M,L,lon,lat,mask,'AM_c4_map');
close(f)
clear;

%% AR
load AR_sens
load AR_mean
load AR_lcc
load AR
mask=AR.c1.map;
lat=AR.c1.lat;
lon=AR.c1.lon;
S=AR_sens.c1;
M=AR_mean.c1;
L=AR_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'AR_c1_map');
close(f)
clear;

%% CA
load CA_sens
load CA_mean
load CA_lcc
load CA
mask=CA.c1.map;
lat=CA.c1.lat;
lon=CA.c1.lon;
S=CA_sens.c1;
M=CA_mean.c1;
L=CA_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'CA_c1_map');
close(f)
mask=CA.c2.map;
lat=CA.c2.lat;
lon=CA.c2.lon;
S=CA_sens.c2;
M=CA_mean.c2;
L=CA_lcc.c2;
f=plot_map_change(S,M,L,lon,lat,mask,'CA_c2_map');
close(f)
clear;

%% EA
load EA_sens
load EA_mean
load EA_lcc
load EA
mask=EA.c1.map;
lat=EA.c1.lat;
lon=EA.c1.lon;
S=EA_sens.c1;
M=EA_mean.c1;
L=EA_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'EA_c1_map');
close(f)
mask=EA.c2.map;
lat=EA.c2.lat;
lon=EA.c2.lon;
S=EA_sens.c2;
M=EA_mean.c2;
L=EA_lcc.c2;
f=plot_map_change(S,M,L,lon,lat,mask,'EA_c2_map');
close(f)
clear;

%% IN
load IN_sens
load IN_mean
load IN_lcc
load IN
mask=IN.c1.map;
lat=IN.c1.lat;
lon=IN.c1.lon;
S=IN_sens.c1;
M=IN_mean.c1;
L=IN_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'IN_c1_map');
close(f)
clear;

%% RU
load RU_sens
load RU_mean
load RU_lcc
load RU
mask=RU.c1.map;
lat=RU.c1.lat;
lon=RU.c1.lon;
S=RU_sens.c1;
M=RU_mean.c1;
L=RU_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'RU_c1_map');
close(f)
mask=RU.c2.map;
lat=RU.c2.lat;
lon=RU.c2.lon;
S=RU_sens.c2;
M=RU_mean.c2;
L=RU_lcc.c2;
f=plot_map_change(S,M,L,lon,lat,mask,'RU_c2_map');
close(f)
clear;

%% CH
load CH_sens
load CH_mean
load CH_lcc
load CH
mask=CH.c1.map;
lat=CH.c1.lat;
lon=CH.c1.lon;
S=CH_sens.c1;
M=CH_mean.c1;
L=CH_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'CH_c1_map');
close(f)
clear;

%% AU
load AU_sens
load AU_mean
load AU_lcc
load AU
mask=AU.c1.map;
lat=AU.c1.lat;
lon=AU.c1.lon;
S=AU_sens.c1;
M=AU_mean.c1;
L=AU_lcc.c1;
f=plot_map_change(S,M,L,lon,lat,mask,'AU_c1_map');
close(f)
clear;
