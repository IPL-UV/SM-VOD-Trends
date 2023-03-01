clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% Extraction of information from data (cluster size and NaN number)
X=zeros(4,16,2);
k=1;

load NA
x=NA;clear('NA');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c2.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c2.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c2.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c2.prec(:))));
X(1,k,2)=size(x.c2.sm,1);
X(2,k,2)=size(x.c2.vod,1);
X(3,k,2)=size(x.c2.ndvi,1);
X(4,k,2)=size(x.c2.prec,1);
k=k+1;

load AM
x=AM;clear('AM');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c2.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c2.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c2.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c2.prec(:))));
X(1,k,2)=size(x.c2.sm,1);
X(2,k,2)=size(x.c2.vod,1);
X(3,k,2)=size(x.c2.ndvi,1);
X(4,k,2)=size(x.c2.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c3.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c3.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c3.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c3.prec(:))));
X(1,k,2)=size(x.c3.sm,1);
X(2,k,2)=size(x.c3.vod,1);
X(3,k,2)=size(x.c3.ndvi,1);
X(4,k,2)=size(x.c3.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c4.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c4.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c4.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c4.prec(:))));
X(1,k,2)=size(x.c4.sm,1);
X(2,k,2)=size(x.c4.vod,1);
X(3,k,2)=size(x.c4.ndvi,1);
X(4,k,2)=size(x.c4.prec,1);
k=k+1;

load AR
x=AR;clear('AR');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;

load CA
x=CA;clear('CA');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c2.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c2.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c2.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c2.prec(:))));
X(1,k,2)=size(x.c2.sm,1);
X(2,k,2)=size(x.c2.vod,1);
X(3,k,2)=size(x.c2.ndvi,1);
X(4,k,2)=size(x.c2.prec,1);
k=k+1;

load EA
x=EA;clear('EA');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c2.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c2.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c2.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c2.prec(:))));
X(1,k,2)=size(x.c2.sm,1);
X(2,k,2)=size(x.c2.vod,1);
X(3,k,2)=size(x.c2.ndvi,1);
X(4,k,2)=size(x.c2.prec,1);
k=k+1;

load IN
x=IN;clear('IN');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;

load RU
x=RU;clear('RU');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;
X(1,k,1)=sum(sum(isnan(x.c2.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c2.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c2.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c2.prec(:))));
X(1,k,2)=size(x.c2.sm,1);
X(2,k,2)=size(x.c2.vod,1);
X(3,k,2)=size(x.c2.ndvi,1);
X(4,k,2)=size(x.c2.prec,1);
k=k+1;

load CH
x=CH;clear('CH');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);
k=k+1;

load AU
x=AU;clear('AU');
X(1,k,1)=sum(sum(isnan(x.c1.sm(:))));
X(2,k,1)=sum(sum(isnan(x.c1.vod(:))));
X(3,k,1)=sum(sum(isnan(x.c1.ndvi(:))));
X(4,k,1)=sum(sum(isnan(x.c1.prec(:))));
X(1,k,2)=size(x.c1.sm,1);
X(2,k,2)=size(x.c1.vod,1);
X(3,k,2)=size(x.c1.ndvi,1);
X(4,k,2)=size(x.c1.prec,1);

%% Comprobation of results
figure,
subplot(2,1,1);
imagesc(X(:,:,1));
subplot(2,1,2);
imagesc(X(:,:,2));
