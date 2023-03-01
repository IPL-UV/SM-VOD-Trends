clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex')

p=zeros(5,2,2,16);
k=1;
%% NA
load NA
M=NA.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=NA.c2;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('NA');
%% AM
load AM
M=AM.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=AM.c2;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=AM.c3;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=AM.c4;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('AM');
%% AR
load AR
M=AR.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('AR');
%% CA
load CA
M=CA.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=CA.c2;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('CA');
%% EA
load EA
M=EA.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=EA.c2;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('EA');
%% IN
load IN
M=IN.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('IN');
%% RU
load RU
M=RU.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
M=RU.c2;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('RU');
%% CH
load CH
M=CH.c1;
p(:,:,:,k)=extract_quantile(M);k=k+1;
clear('CH');
%% AU
load AU
M=AU.c1;
p(:,:,:,k)=extract_quantile(M);
clear('AU');

%% show data
k=16;
clc;
disp(round(squeeze(p(:,1,1,k))',2));
disp(round(squeeze(p(:,2,1,k))',2));
disp(round(squeeze(p(:,1,2,k))',2));
disp(round(squeeze(p(:,2,2,k))',2));

