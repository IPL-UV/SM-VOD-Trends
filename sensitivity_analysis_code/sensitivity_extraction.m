clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% Estimation of sensitvity by month and variable
%% NA
load NA
NA_sens=struct();
c=NA.c1;
c=slope_extraction(c);
NA_sens.c1=c;
c=NA.c2;
c=slope_extraction(c);
NA_sens.c2=c;
save('NA_sens.mat','NA_sens');
disp('NA done');
clear('NA','NA_sens');

%% AM
load AM
AM_sens=struct();
c=AM.c1;
c=slope_extraction(c);
AM_sens.c1=c;
c=AM.c2;
c=slope_extraction(c);
AM_sens.c2=c;
c=AM.c3;
c=slope_extraction(c);
AM_sens.c3=c;
c=AM.c4;
c=slope_extraction(c);
AM_sens.c4=c;
save('AM_sens.mat','AM_sens');
disp('AM done');
clear('AM','AM_sens');

%% AR
load AR
AR_sens=struct();
c=AR.c1;
c=slope_extraction(c);
AR_sens.c1=c;
save('AR_sens.mat','AR_sens');
disp('AR done');
clear('AR','AR_sens');

%% CA
load CA
CA_sens=struct();
c=CA.c1;
c=slope_extraction(c);
CA_sens.c1=c;
c=CA.c2;
c=slope_extraction(c);
CA_sens.c2=c;
save('CA_sens.mat','CA_sens');
disp('CA done');
clear('CA','CA_sens');

%% EA
load EA
EA_sens=struct();
c=EA.c1;
c=slope_extraction(c);
EA_sens.c1=c;
c=EA.c2;
c=slope_extraction(c);
EA_sens.c2=c;
save('EA_sens.mat','EA_sens');
disp('EA done');
clear('EA','EA_sens');

%% IN
load IN
IN_sens=struct();
c=IN.c1;
c=slope_extraction(c);
IN_sens.c1=c;
save('IN_sens.mat','IN_sens');
disp('IN done');
clear('IN','IN_sens');

%% RU
load RU
RU_sens=struct();
c=RU.c1;
c=slope_extraction(c);
RU_sens.c1=c;
c=RU.c2;
c=slope_extraction(c);
RU_sens.c2=c;
save('RU_sens.mat','RU_sens');
disp('RU done');
clear('RU','RU_sens');

%% CH
load CH
CH_sens=struct();
c=CH.c1;
c=slope_extraction(c);
CH_sens.c1=c;
save('CH_sens.mat','CH_sens');
disp('CH done');
clear('CH','CH_sens');

%% AU
load AU
AU_sens=struct();
c=AU.c1;
c=slope_extraction(c);
AU_sens.c1=c;
save('AU_sens.mat','AU_sens');
disp('AU done');
clear('AU','AU_sens');