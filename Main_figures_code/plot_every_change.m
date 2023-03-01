clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% NA
load NA_sens
load NA_mean
load NA_lcc
S=NA_sens.c1;
M=NA_mean.c1;
L=NA_lcc.c1;
f=plot_change(S,M,L,'NA_c1');
close(f)
S=NA_sens.c2;
M=NA_mean.c2;
L=NA_lcc.c2;
f=plot_change(S,M,L,'NA_c2');
close(f)
clear;
%% AM
load AM_sens
load AM_mean
load AM_lcc
S=AM_sens.c1;
M=AM_mean.c1;
L=AM_lcc.c1;
f=plot_change(S,M,L,'AM_c1');
close(f)
S=AM_sens.c2;
M=AM_mean.c2;
L=AM_lcc.c2;
f=plot_change(S,M,L,'AM_c2');
close(f)
S=AM_sens.c3;
M=AM_mean.c3;
L=AM_lcc.c3;
f=plot_change(S,M,L,'AM_c3');
close(f)
S=AM_sens.c4;
M=AM_mean.c4;
L=AM_lcc.c4;
f=plot_change(S,M,L,'AM_c4');
close(f)
clear;
%% AR
load AR_sens
load AR_mean
load AR_lcc
S=AR_sens.c1;
M=AR_mean.c1;
L=AR_lcc.c1;
f=plot_change(S,M,L,'AR_c1');
close(f)
clear;
%% CA
load CA_sens
load CA_mean
load CA_lcc
S=CA_sens.c1;
M=CA_mean.c1;
L=CA_lcc.c1;
f=plot_change(S,M,L,'CA_c1');
close(f)
S=CA_sens.c2;
M=CA_mean.c2;
L=CA_lcc.c2;
f=plot_change(S,M,L,'CA_c2');
close(f)
clear;
%% EA
load EA_sens
load EA_mean
load EA_lcc
S=EA_sens.c1;
M=EA_mean.c1;
L=EA_lcc.c1;
f=plot_change(S,M,L,'EA_c1');
close(f)
S=EA_sens.c2;
M=EA_mean.c2;
L=EA_lcc.c2;
f=plot_change(S,M,L,'EA_c2');
close(f)
clear;
%% IN
load IN_sens
load IN_mean
load IN_lcc
S=IN_sens.c1;
M=IN_mean.c1;
L=IN_lcc.c1;
f=plot_change(S,M,L,'IN_c1');
close(f)
clear;
%% RU
load RU_sens
load RU_mean
load RU_lcc
S=RU_sens.c1;
M=RU_mean.c1;
L=RU_lcc.c1;
f=plot_change(S,M,L,'RU_c1');
close(f)
S=RU_sens.c2;
M=RU_mean.c2;
L=RU_lcc.c2;
f=plot_change(S,M,L,'RU_c2');
close(f)
clear;
%% CH
load CH_sens
load CH_mean
load CH_lcc
S=CH_sens.c1;
M=CH_mean.c1;
L=CH_lcc.c1;
f=plot_change(S,M,L,'CH_c1');
close(f)
%% AU
load AU_sens
load AU_mean
load AU_lcc
S=AU_sens.c1;
M=AU_mean.c1;
L=AU_lcc.c1;
f=plot_change(S,M,L,'AU_c1');
close(f)
clear;