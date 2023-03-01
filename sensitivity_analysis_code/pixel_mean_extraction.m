clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% Estimation of sensitvity by month and variable
%% NA
load NA
NA_mean=struct();
c=NA.c1;
c=mean_extraction(c);
NA_mean.c1=c;
c=NA.c2;
c=mean_extraction(c);
NA_mean.c2=c;
save('NA_mean.mat','NA_mean');
disp('NA done');
clear('NA','NA_mean');

%% AM
load AM
AM_mean=struct();
c=AM.c1;
c=mean_extraction(c);
AM_mean.c1=c;
c=AM.c2;
c=mean_extraction(c);
AM_mean.c2=c;
c=AM.c3;
c=mean_extraction(c);
AM_mean.c3=c;
c=AM.c4;
c=mean_extraction(c);
AM_mean.c4=c;
save('AM_mean.mat','AM_mean');
disp('AM done');
clear('AM','AM_mean');

%% AR
load AR
AR_mean=struct();
c=AR.c1;
c=mean_extraction(c);
AR_mean.c1=c;
save('AR_mean.mat','AR_mean');
disp('AR done');
clear('AR','AR_mean');

%% CA
load CA
CA_mean=struct();
c=CA.c1;
c=mean_extraction(c);
CA_mean.c1=c;
c=CA.c2;
c=mean_extraction(c);
CA_mean.c2=c;
save('CA_mean.mat','CA_mean');
disp('CA done');
clear('CA','CA_mean');

%% EA
load EA
EA_mean=struct();
c=EA.c1;
c=mean_extraction(c);
EA_mean.c1=c;
c=EA.c2;
c=mean_extraction(c);
EA_mean.c2=c;
save('EA_mean.mat','EA_mean');
disp('EA done');
clear('EA','EA_mean');

%% IN
load IN
IN_mean=struct();
c=IN.c1;
c=mean_extraction(c);
IN_mean.c1=c;
save('IN_mean.mat','IN_mean');
disp('IN done');
clear('IN','IN_mean');

%% RU
load RU
RU_mean=struct();
c=RU.c1;
c=mean_extraction(c);
RU_mean.c1=c;
c=RU.c2;
c=mean_extraction(c);
RU_mean.c2=c;
save('RU_mean.mat','RU_mean');
disp('RU done');
clear('RU','RU_mean');

%% CH
load CH
CH_mean=struct();
c=CH.c1;
c=mean_extraction(c);
CH_mean.c1=c;
save('CH_mean.mat','CH_mean');
disp('CH done');
clear('CH','CH_mean');

%% AU
load AU
AU_mean=struct();
c=AU.c1;
c=mean_extraction(c);
AU_mean.c1=c;
save('AU_mean.mat','AU_mean');
disp('AU done');
clear('AU','AU_mean');