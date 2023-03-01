clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% load cluster index
load index_clusters

%% load labels
names={'NA1','NA2','AM1','AM2','AM3','AM4','AR','CA1','CA2','EA1','EA2','IN',...
    'RU1','RU2','CH','AU'};

%% load data
load C1
load C2
load C3
load C4
load C5

%% plots
index=[1*ones(size(C1.sm_s,1)-1,1);...
    2*ones(size(C2.sm_s,1)-1,1);...
    3*ones(size(C3.sm_s,1)-1,1);...
    4*ones(size(C4.sm_s,1)-1,1);...
    5*ones(size(C5.sm_s,1)-1,1)];

x=zeros(1,12);
x=[x;100*C1.sm_s(2:end,:)./C1.sm_m(2:end,:)];
x=[x;100*C2.sm_s(2:end,:)./C2.sm_m(2:end,:)];
x=[x;100*C3.sm_s(2:end,:)./C3.sm_m(2:end,:)];
x=[x;100*C4.sm_s(2:end,:)./C4.sm_m(2:end,:)];
x=[x;100*C5.sm_s(2:end,:)./C5.sm_m(2:end,:)];
x(x>100)=nan;

y=zeros(1,12);
y=[y;100*C1.vod_s(2:end,:)./C1.vod_m(2:end,:)]+1;
y=[y;100*C2.vod_s(2:end,:)./C2.vod_m(2:end,:)];
y=[y;100*C3.vod_s(2:end,:)./C3.vod_m(2:end,:)];
y=[y;100*C4.vod_s(2:end,:)./C4.vod_m(2:end,:)];
y=[y;100*C5.vod_s(2:end,:)./C5.vod_m(2:end,:)];
y(y>100)=nan;

x(1,:)=[];
y(1,:)=[];

nat_clusters_intersect(nanmedian(x,2),nanmedian(y,2),index,...
    '$\Delta SM /year [\%]$','$\Delta VOD /year [\%]$',...
    -20,10,-20,10,17);

%% SM 
index=[1*ones(size(C1.sm_s,1)-1,1);...
    2*ones(size(C2.sm_s,1)-1,1);...
    3*ones(size(C3.sm_s,1)-1,1);...
    4*ones(size(C4.sm_s,1)-1,1);...
    5*ones(size(C5.sm_s,1)-1,1)];

x=zeros(1,12);
x=[x;100*C1.sm_s(2:end,:)./C1.sm_m(2:end,:)];
x=[x;100*C2.sm_s(2:end,:)./C2.sm_m(2:end,:)];
x=[x;100*C3.sm_s(2:end,:)./C3.sm_m(2:end,:)];
x=[x;100*C4.sm_s(2:end,:)./C4.sm_m(2:end,:)];
x=[x;100*C5.sm_s(2:end,:)./C5.sm_m(2:end,:)];
x(x>100)=nan;

y=zeros(1,12);
y=[y;C1.sm_m(2:end,:)];
y=[y;C2.sm_m(2:end,:)];
y=[y;C3.sm_m(2:end,:)];
y=[y;C4.sm_m(2:end,:)];
y=[y;C5.sm_m(2:end,:)];
y(y>100)=nan;

x(1,:)=[];
y(1,:)=[];

nat_clusters_intersect(nanmedian(x,2),nanmedian(y,2),index,...
    '$\Delta SM /year [\%]$','Mean annual $ SM $',...
    -20,15,0,0.6,14);

%% VOD
index=[1*ones(size(C1.vod_s,1)-1,1);...
    2*ones(size(C2.vod_s,1)-1,1);...
    3*ones(size(C3.vod_s,1)-1,1);...
    4*ones(size(C4.vod_s,1)-1,1);...
    5*ones(size(C5.vod_s,1)-1,1)];

x=zeros(1,12);
x=[x;100*C1.vod_s(2:end,:)./C1.vod_m(2:end,:)]+1;
x=[x;100*C2.vod_s(2:end,:)./C2.vod_m(2:end,:)];
x=[x;100*C3.vod_s(2:end,:)./C3.vod_m(2:end,:)];
x=[x;100*C4.vod_s(2:end,:)./C4.vod_m(2:end,:)];
x=[x;100*C5.vod_s(2:end,:)./C5.vod_m(2:end,:)];
x(x>100)=nan;

y=zeros(1,12);
y=[y;C1.vod_m(2:end,:)];
y=[y;C2.vod_m(2:end,:)];
y=[y;C3.vod_m(2:end,:)];
y=[y;C4.vod_m(2:end,:)];
y=[y;C5.vod_m(2:end,:)];
y(y>100)=nan;

x(1,:)=[];
y(1,:)=[];

nat_clusters_intersect(nanmedian(x,2),nanmedian(y,2),index,...
    '$\Delta VOD /year [\%]$','Mean annual $ VOD $',...
    -20,15,0,1.2,18);

%% agrupation by cluster
% %% cluster 1
% C1=struct();
% sm_s=zeros(1,12);
% sm_m=zeros(1,12);
% vod_s=zeros(1,12);
% vod_m=zeros(1,12);
% ndvi_s=zeros(1,12);
% ndvi_m=zeros(1,12);
% prec_s=zeros(1,12);
% prec_m=zeros(1,12);
% 
% load NA_sens
% load NA_mean
% sm_s=[sm_s;NA_sens.c1.sm.s];
% sm_m=[sm_m;NA_mean.c1.sm.mean];
% vod_s=[vod_s;NA_sens.c1.vod.s];
% vod_m=[vod_m;NA_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;NA_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;NA_mean.c1.ndvi.mean];
% prec_s=[prec_s;NA_sens.c1.prec.s];
% prec_m=[prec_m;NA_mean.c1.prec.mean];
% clear('NA_sens','NA_mean');
% load EA_sens
% load EA_mean
% sm_s=[sm_s;EA_sens.c1.sm.s];
% sm_m=[sm_m;EA_mean.c1.sm.mean];
% vod_s=[vod_s;EA_sens.c1.vod.s];
% vod_m=[vod_m;EA_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;EA_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;EA_mean.c1.ndvi.mean];
% prec_s=[prec_s;EA_sens.c1.prec.s];
% prec_m=[prec_m;EA_mean.c1.prec.mean];
% sm_s=[sm_s;EA_sens.c2.sm.s];
% sm_m=[sm_m;EA_mean.c2.sm.mean];
% vod_s=[vod_s;EA_sens.c2.vod.s];
% vod_m=[vod_m;EA_mean.c2.vod.mean];
% ndvi_s=[ndvi_s;EA_sens.c2.ndvi.s];
% ndvi_m=[ndvi_m;EA_mean.c2.ndvi.mean];
% prec_s=[prec_s;EA_sens.c2.prec.s];
% prec_m=[prec_m;EA_mean.c2.prec.mean];
% clear('EA_sens','EA_mean');
% load RU_sens
% load RU_mean
% sm_s=[sm_s;RU_sens.c1.sm.s];
% sm_m=[sm_m;RU_mean.c1.sm.mean];
% vod_s=[vod_s;RU_sens.c1.vod.s];
% vod_m=[vod_m;RU_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;RU_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;RU_mean.c1.ndvi.mean];
% prec_s=[prec_s;RU_sens.c1.prec.s];
% prec_m=[prec_m;RU_mean.c1.prec.mean];
% clear('RU_sens','RU_mean');
% 
% C1.sm_m=sm_m;
% C1.sm_s=sm_s;
% C1.vod_m=vod_m;
% C1.vod_s=vod_s;
% C1.ndvi_m=ndvi_m;
% C1.ndvi_s=ndvi_s;
% C1.prec_m=prec_m;
% C1.prec_s=prec_s;
% save('C1.mat','C1');
% 
% %% cluster 2
% C2=struct();
% sm_s=zeros(1,12);
% sm_m=zeros(1,12);
% vod_s=zeros(1,12);
% vod_m=zeros(1,12);
% ndvi_s=zeros(1,12);
% ndvi_m=zeros(1,12);
% prec_s=zeros(1,12);
% prec_m=zeros(1,12);
% 
% load NA_sens
% load NA_mean
% sm_s=[sm_s;NA_sens.c2.sm.s];
% sm_m=[sm_m;NA_mean.c2.sm.mean];
% vod_s=[vod_s;NA_sens.c2.vod.s];
% vod_m=[vod_m;NA_mean.c2.vod.mean];
% ndvi_s=[ndvi_s;NA_sens.c2.ndvi.s];
% ndvi_m=[ndvi_m;NA_mean.c2.ndvi.mean];
% prec_s=[prec_s;NA_sens.c2.prec.s];
% prec_m=[prec_m;NA_mean.c2.prec.mean];
% clear('NA_sens','NA_mean');
% load AR_sens
% load AR_mean
% sm_s=[sm_s;AR_sens.c1.sm.s];
% sm_m=[sm_m;AR_mean.c1.sm.mean];
% vod_s=[vod_s;AR_sens.c1.vod.s];
% vod_m=[vod_m;AR_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;AR_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;AR_mean.c1.ndvi.mean];
% prec_s=[prec_s;AR_sens.c1.prec.s];
% prec_m=[prec_m;AR_mean.c1.prec.mean];
% clear('AR_sens','AR_mean');
% load RU_sens
% load RU_mean
% sm_s=[sm_s;RU_sens.c2.sm.s];
% sm_m=[sm_m;RU_mean.c2.sm.mean];
% vod_s=[vod_s;RU_sens.c2.vod.s];
% vod_m=[vod_m;RU_mean.c2.vod.mean];
% ndvi_s=[ndvi_s;RU_sens.c2.ndvi.s];
% ndvi_m=[ndvi_m;RU_mean.c2.ndvi.mean];
% prec_s=[prec_s;RU_sens.c2.prec.s];
% prec_m=[prec_m;RU_mean.c2.prec.mean];
% clear('RU_sens','RU_mean');
% load IN_sens
% load IN_mean
% sm_s=[sm_s;IN_sens.c1.sm.s];
% sm_m=[sm_m;IN_mean.c1.sm.mean];
% vod_s=[vod_s;IN_sens.c1.vod.s];
% vod_m=[vod_m;IN_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;IN_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;IN_mean.c1.ndvi.mean];
% prec_s=[prec_s;IN_sens.c1.prec.s];
% prec_m=[prec_m;IN_mean.c1.prec.mean];
% clear('IN_sens','IN_mean');
% 
% C2.sm_m=sm_m;
% C2.sm_s=sm_s;
% C2.vod_m=vod_m;
% C2.vod_s=vod_s;
% C2.ndvi_m=ndvi_m;
% C2.ndvi_s=ndvi_s;
% C2.prec_m=prec_m;
% C2.prec_s=prec_s;
% save('C2.mat','C2');
% 
% %% cluster 3
% C3=struct();
% sm_s=zeros(1,12);
% sm_m=zeros(1,12);
% vod_s=zeros(1,12);
% vod_m=zeros(1,12);
% ndvi_s=zeros(1,12);
% ndvi_m=zeros(1,12);
% prec_s=zeros(1,12);
% prec_m=zeros(1,12);
% 
% load AM_sens
% load AM_mean
% sm_s=[sm_s;AM_sens.c1.sm.s];
% sm_m=[sm_m;AM_mean.c1.sm.mean];
% vod_s=[vod_s;AM_sens.c1.vod.s];
% vod_m=[vod_m;AM_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;AM_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;AM_mean.c1.ndvi.mean];
% prec_s=[prec_s;AM_sens.c1.prec.s];
% prec_m=[prec_m;AM_mean.c1.prec.mean];
% sm_s=[sm_s;AM_sens.c2.sm.s];
% sm_m=[sm_m;AM_mean.c2.sm.mean];
% vod_s=[vod_s;AM_sens.c2.vod.s];
% vod_m=[vod_m;AM_mean.c2.vod.mean];
% ndvi_s=[ndvi_s;AM_sens.c2.ndvi.s];
% ndvi_m=[ndvi_m;AM_mean.c2.ndvi.mean];
% prec_s=[prec_s;AM_sens.c2.prec.s];
% prec_m=[prec_m;AM_mean.c2.prec.mean];
% sm_s=[sm_s;AM_sens.c3.sm.s];
% sm_m=[sm_m;AM_mean.c3.sm.mean];
% vod_s=[vod_s;AM_sens.c3.vod.s];
% vod_m=[vod_m;AM_mean.c3.vod.mean];
% ndvi_s=[ndvi_s;AM_sens.c3.ndvi.s];
% ndvi_m=[ndvi_m;AM_mean.c3.ndvi.mean];
% prec_s=[prec_s;AM_sens.c3.prec.s];
% prec_m=[prec_m;AM_mean.c3.prec.mean];
% sm_s=[sm_s;AM_sens.c4.sm.s];
% sm_m=[sm_m;AM_mean.c4.sm.mean];
% vod_s=[vod_s;AM_sens.c4.vod.s];
% vod_m=[vod_m;AM_mean.c4.vod.mean];
% ndvi_s=[ndvi_s;AM_sens.c4.ndvi.s];
% ndvi_m=[ndvi_m;AM_mean.c4.ndvi.mean];
% prec_s=[prec_s;AM_sens.c4.prec.s];
% prec_m=[prec_m;AM_mean.c4.prec.mean];
% clear('AM_sens','AM_mean');
% 
% load CA_sens
% load CA_mean
% sm_s=[sm_s;CA_sens.c1.sm.s];
% sm_m=[sm_m;CA_mean.c1.sm.mean];
% vod_s=[vod_s;CA_sens.c1.vod.s];
% vod_m=[vod_m;CA_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;CA_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;CA_mean.c1.ndvi.mean];
% prec_s=[prec_s;CA_sens.c1.prec.s];
% prec_m=[prec_m;CA_mean.c1.prec.mean];
% sm_s=[sm_s;CA_sens.c2.sm.s];
% sm_m=[sm_m;CA_mean.c2.sm.mean];
% vod_s=[vod_s;CA_sens.c2.vod.s];
% vod_m=[vod_m;CA_mean.c2.vod.mean];
% ndvi_s=[ndvi_s;CA_sens.c2.ndvi.s];
% ndvi_m=[ndvi_m;CA_mean.c2.ndvi.mean];
% prec_s=[prec_s;CA_sens.c2.prec.s];
% prec_m=[prec_m;CA_mean.c2.prec.mean];
% clear('CA_sens','CA_mean');
% 
% C3.sm_m=sm_m;
% C3.sm_s=sm_s;
% C3.vod_m=vod_m;
% C3.vod_s=vod_s;
% C3.ndvi_m=ndvi_m;
% C3.ndvi_s=ndvi_s;
% C3.prec_m=prec_m;
% C3.prec_s=prec_s;
% save('C3.mat','C3');
% 
% %% cluster 4
% C4=struct();
% sm_s=zeros(1,12);
% sm_m=zeros(1,12);
% vod_s=zeros(1,12);
% vod_m=zeros(1,12);
% ndvi_s=zeros(1,12);
% ndvi_m=zeros(1,12);
% prec_s=zeros(1,12);
% prec_m=zeros(1,12);
% 
% load CH_sens
% load CH_mean
% sm_s=[sm_s;CH_sens.c1.sm.s];
% sm_m=[sm_m;CH_mean.c1.sm.mean];
% vod_s=[vod_s;CH_sens.c1.vod.s];
% vod_m=[vod_m;CH_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;CH_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;CH_mean.c1.ndvi.mean];
% prec_s=[prec_s;CH_sens.c1.prec.s];
% prec_m=[prec_m;CH_mean.c1.prec.mean];
% clear('CH_sens','CH_mean');
% 
% C4.sm_m=sm_m;
% C4.sm_s=sm_s;
% C4.vod_m=vod_m;
% C4.vod_s=vod_s;
% C4.ndvi_m=ndvi_m;
% C4.ndvi_s=ndvi_s;
% C4.prec_m=prec_m;
% C4.prec_s=prec_s;
% save('C4.mat','C4');
% 
% %% cluster 5
% C5=struct();
% sm_s=zeros(1,12);
% sm_m=zeros(1,12);
% vod_s=zeros(1,12);
% vod_m=zeros(1,12);
% ndvi_s=zeros(1,12);
% ndvi_m=zeros(1,12);
% prec_s=zeros(1,12);
% prec_m=zeros(1,12);
% 
% load AU_sens
% load AU_mean
% sm_s=[sm_s;AU_sens.c1.sm.s];
% sm_m=[sm_m;AU_mean.c1.sm.mean];
% vod_s=[vod_s;AU_sens.c1.vod.s];
% vod_m=[vod_m;AU_mean.c1.vod.mean];
% ndvi_s=[ndvi_s;AU_sens.c1.ndvi.s];
% ndvi_m=[ndvi_m;AU_mean.c1.ndvi.mean];
% prec_s=[prec_s;AU_sens.c1.prec.s];
% prec_m=[prec_m;AU_mean.c1.prec.mean];
% clear('AU_sens','AU_mean');
% 
% C5.sm_m=sm_m;
% C5.sm_s=sm_s;
% C5.vod_m=vod_m;
% C5.vod_s=vod_s;
% C5.ndvi_m=ndvi_m;
% C5.ndvi_s=ndvi_s;
% C5.prec_m=prec_m;
% C5.prec_s=prec_s;
% save('C5.mat','C5');