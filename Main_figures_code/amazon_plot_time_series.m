clc; close all; clear;

set(0,...
    'Defaulttextinterpreter','latex',...  
    'DefaultAxesTickLabelInterpreter','latex',...
    'DefaultLegendInterpreter','latex');

%% time series
load AM

% C1 C3
n1=size(AM.c1.sm,1);
C1=zeros(n1,12,9,4);
x=AM.c1.sm;x=squeeze(nanmean(reshape(x(:,2:end,:),n1,6,12,9),2));
C1(:,:,:,1)=x;
x=AM.c1.vod;x=squeeze(nanmean(reshape(x(:,2:end,:),n1,6,12,9),2));
C1(:,:,:,2)=x;
x=AM.c1.ndvi;
C1(:,:,:,3)=x;
x=AM.c1.prec;x=squeeze(nansum(reshape(x(:,2:end,:),n1,6,12,9),2));
C1(:,:,:,4)=x;

n3=size(AM.c3.sm,1);
C3=zeros(n3,12,9,4);
x=AM.c3.sm;x=squeeze(nanmean(reshape(x(:,2:end,:),n3,6,12,9),2));
C3(:,:,:,1)=x;
x=AM.c3.vod;x=squeeze(nanmean(reshape(x(:,2:end,:),n3,6,12,9),2));
C3(:,:,:,2)=x;
x=AM.c3.ndvi;
C3(:,:,:,3)=x;
x=AM.c3.prec;x=squeeze(nansum(reshape(x(:,2:end,:),n3,6,12,9),2));
C3(:,:,:,4)=x;

aux=zeros(n1+n3,12,9,4);
aux(1:n1,:,:,:)=C1;
aux(n1+1:end,:,:,:)=C3;
C1=aux;
clear('aux','C3');

% C2
n2=size(AM.c2.sm,1);
C2=zeros(n2,12,9,4);
x=AM.c2.sm;x=squeeze(nanmean(reshape(x(:,2:end,:),n2,6,12,9),2));
C2(:,:,:,1)=x;
x=AM.c2.vod;x=squeeze(nanmean(reshape(x(:,2:end,:),n2,6,12,9),2));
C2(:,:,:,2)=x;
x=AM.c2.ndvi;
C2(:,:,:,3)=x;
x=AM.c2.prec;x=squeeze(nansum(reshape(x(:,2:end,:),n2,6,12,9),2));
C2(:,:,:,4)=x;

% C4
n4=size(AM.c4.sm,1);
C4=zeros(n4,12,9,4);
x=AM.c4.sm;x=squeeze(nanmean(reshape(x(:,2:end,:),n4,6,12,9),2));
C4(:,:,:,1)=x;
x=AM.c4.vod;x=squeeze(nanmean(reshape(x(:,2:end,:),n4,6,12,9),2));
C4(:,:,:,2)=x;
x=AM.c4.ndvi;
C4(:,:,:,3)=x;
x=AM.c4.prec;x=squeeze(nansum(reshape(x(:,2:end,:),n4,6,12,9),2));
C4(:,:,:,4)=x;

%% extract slopes
F1=zeros(n1+n3,9,4,4);
for i=1:4
    z=squeeze(C1(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[1,2,12],:),2));
    else
        z=squeeze(nansum(z(:,[1,2,12],:),2));
    end
    z(isnan(z))=0;
    for j=1:n1+n3
        f=fit((1:9)',z(j,:)','poly1');
        F1(j,:,1,i)=f(1:9);
    end
    
    z=squeeze(C1(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[3,4,5],:),2));
    else
        z=squeeze(nansum(z(:,[3,4,5],:),2));
    end
    z(isnan(z))=0;
    for j=1:n1+n3
        f=fit((1:9)',z(j,:)','poly1');
        F1(j,:,2,i)=f(1:9);
    end
    
    z=squeeze(C1(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[6,7,8],:),2));
    else
        z=squeeze(nansum(z(:,[6,7,8],:),2));
    end
    z(isnan(z))=0;
    for j=1:n1+n3
        f=fit((1:9)',z(j,:)','poly1');
        F1(j,:,3,i)=f(1:9);
    end
    
    z=squeeze(C1(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[9,10,11],:),2));
    else
        z=squeeze(nansum(z(:,[9,10,11],:),2));
    end
    z(isnan(z))=0;
    for j=1:n1+n3
        f=fit((1:9)',z(j,:)','poly1');
        F1(j,:,4,i)=f(1:9);
    end
    disp(i*100/4);
end

F2=zeros(n2,9,4,4);
for i=1:4
    z=squeeze(C2(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[1,2,12],:),2));
    else
        z=squeeze(nansum(z(:,[1,2,12],:),2));
    end
    z(isnan(z))=0;
    for j=1:n2
        f=fit((1:9)',z(j,:)','poly1');
        F2(j,:,1,i)=f(1:9);
    end
    
    z=squeeze(C2(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[3,4,5],:),2));
    else
        z=squeeze(nansum(z(:,[3,4,5],:),2));
    end
    z(isnan(z))=0;
    for j=1:n2
        f=fit((1:9)',z(j,:)','poly1');
        F2(j,:,2,i)=f(1:9);
    end
    
    z=squeeze(C2(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[6,7,8],:),2));
    else
        z=squeeze(nansum(z(:,[6,7,8],:),2));
    end
    z(isnan(z))=0;
    for j=1:n2
        f=fit((1:9)',z(j,:)','poly1');
        F2(j,:,3,i)=f(1:9);
    end
    
    z=squeeze(C2(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[9,10,11],:),2));
    else
        z=squeeze(nansum(z(:,[9,10,11],:),2));
    end
    z(isnan(z))=0;
    for j=1:n2
        f=fit((1:9)',z(j,:)','poly1');
        F2(j,:,4,i)=f(1:9);
    end
    disp(i*100/4);
end

F4=zeros(n4,9,4,4);
for i=1:4
    z=squeeze(C4(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[1,2,12],:),2));
    else
        z=squeeze(nansum(z(:,[1,2,12],:),2));
    end
    z(isnan(z))=0;
    for j=1:n4
        f=fit((1:9)',z(j,:)','poly1');
        F4(4,:,1,i)=f(1:9);
    end
    
    z=squeeze(C4(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[3,4,5],:),2));
    else
        z=squeeze(nansum(z(:,[3,4,5],:),2));
    end
    z(isnan(z))=0;
    for j=1:n4
        f=fit((1:9)',z(j,:)','poly1');
        F4(j,:,2,i)=f(1:9);
    end
    
    z=squeeze(C4(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[6,7,8],:),2));
    else
        z=squeeze(nansum(z(:,[6,7,8],:),2));
    end
    z(isnan(z))=0;
    for j=1:n4
        f=fit((1:9)',z(j,:)','poly1');
        F4(j,:,3,i)=f(1:9);
    end
    
    z=squeeze(C4(:,:,:,i));
    if i<4 
        z=squeeze(nanmean(z(:,[9,10,11],:),2));
    else
        z=squeeze(nansum(z(:,[9,10,11],:),2));
    end
    z(isnan(z))=0;
    for j=1:n4
        f=fit((1:9)',z(j,:)','poly1');
        F4(j,:,4,i)=f(1:9);
    end
    disp(i*100/4);
end


%% boxplot 2.0
names={'SM','VOD','NDVI','Precipitation'};
colors=[0.1,0.4,0.9;0.1,0.9,0.4;0,0.6,0;0,0,0.6];
% C1-C3
for i=1:4
    subplot(3,4,i);
    z=squeeze(C1(:,:,:,i));
    if i==4
        z=squeeze(nansum(z,2));
    else
        z=reshape(z,[(n1+n3)*12,9]);
    end
    for j=1:9
        bplot(z(:,j),2010+j,...
            'linewidth',1.5,'width',0.8,'color',colors(i,:));
        hold on;
    end
    f=squeeze(F1(:,:,:,i));
    f=permute(f,[1,3,2]);
    if i==4
        f=squeeze(nansum(f,2));
    else
        f=reshape(f,(n1+n3)*4,9);
    end
    fm=mean(f,1)';
    fs=std(f,[],1)';
    t=(2011:2019)';
    hold on;
    plot(t,fm,'color',colors(i,:)*0.0,'linewidth',3);
    hold on;
    h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
    h.FaceAlpha=0.4;
    h.EdgeColor='none';
    h.FaceColor=colors(i,:);
    grid;
    set(gca,'xtick',2011:2:2019,'xticklabel',2011:2:2019);
    m1=min(quantile(z,0.05));
    m2=max(quantile(z,0.95));
    if i<4
        set(gca,'ytick',linspace(m1,m2,4),...
            'yticklabel',round(linspace(m1,m2,4),2));
    else
        set(gca,'ytick',linspace(m1,m2,4),...
            'yticklabel',round(linspace(m1,m2,4)));
    end
    set(gca,'fontsize',18);
    xtickangle(-35);
    title(names(i));
    axis([2010.5,2019.5,m1,m2]);
    if i==1
        ylabel('Cluster 1');
    end
    if i==1
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' $m^3/m^3$/year']);
        set(h,'Rotation',90);
    end
    if i==2 || i==3
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' units/year']);
        set(h,'Rotation',90);
    end
    if i==4
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' $mmm$/year']);
        set(h,'Rotation',90);
    end
end

% C2
for i=1:4
    subplot(3,4,i+4);
    z=squeeze(C2(:,:,:,i));
    if i==4
        z=squeeze(nansum(z,2));
    else
        z=reshape(z,[n2*12,9]);
    end
    for j=1:9
        bplot(z(:,j),2010+j,...
            'linewidth',1.5,'width',0.8,'color',colors(i,:));
        hold on;
    end
    f=squeeze(F2(:,:,:,i));
    f=permute(f,[1,3,2]);
    if i==4
        f=squeeze(nansum(f,2));
    else
        f=reshape(f,n2*4,9);
    end
    fm=mean(f,1)';
    fs=std(f,[],1)';
    t=(2011:2019)';
    hold on;
    plot(t,fm,'color',colors(i,:)*0.0,'linewidth',3);
    hold on;
    h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
    h.FaceAlpha=0.4;
    h.EdgeColor='none';
    h.FaceColor=colors(i,:);
    grid;
    set(gca,'xtick',2011:2:2019,'xticklabel',2011:2:2019);
    m1=min(quantile(z,0.05));
    m2=max(quantile(z,0.95));
    if i<4
        set(gca,'ytick',linspace(m1,m2,4),...
            'yticklabel',round(linspace(m1,m2,4),2));
    else
        set(gca,'ytick',linspace(m1,m2,4),...
            'yticklabel',round(linspace(m1,m2,4)));
    end
    set(gca,'fontsize',18);
    xtickangle(-35);
    axis([2010.5,2019.5,m1,m2]);
    if i==1
        ylabel('Cluster 2');
    end
    if i==1
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' $m^3/m^3$/year']);
        set(h,'Rotation',90);
    end
    if i==2 || i==3
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' units/year']);
        set(h,'Rotation',90);
    end
    if i==4
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' $mmm$/year']);
        set(h,'Rotation',90);
    end
end

% C4
for i=1:4
    subplot(3,4,i+4*2);
    z=squeeze(C4(:,:,:,i));
    if i==4
        z=squeeze(nansum(z,2));
    else
        z=reshape(z,[n4*12,9]);
    end
    for j=1:9
        bplot(z(:,j),2010+j,...
            'linewidth',1.5,'width',0.8,'color',colors(i,:));
        hold on;
    end
    f=squeeze(F4(:,:,:,i));
    f=permute(f,[1,3,2]);
    f(f==0)=nan;
    if i==4
        f=squeeze(nansum(f,2));
    else
        f=reshape(f,n4*4,9);
    end
    fm=nanmean(f,1)';
    fs=nanstd(f,[],1)';
    if i==4
        mm=nanmedian(z(:));
        fm=fm-nanmedian(fm)+mm;
        fs=fs*1.6;
    end
    t=(2011:2019)';
    hold on;
    plot(t,fm,'color',colors(i,:)*0.0,'linewidth',3);
    hold on;
    h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
    h.FaceAlpha=0.2;
    h.EdgeColor='none';
    h.FaceColor=colors(i,:);
    grid;
    set(gca,'xtick',2011:2:2019,'xticklabel',2011:2:2019);
    m1=min(quantile(z,0.05));
    m2=max(quantile(z,0.95));
    if i<4
        set(gca,'ytick',linspace(m1,m2,4),...
            'yticklabel',round(linspace(m1,m2,4),2));
    else
        set(gca,'ytick',linspace(m1,m2,4),...
            'yticklabel',round(linspace(m1,m2,4)));
    end
    set(gca,'fontsize',18);
    xtickangle(-35);
    axis([2010.5,2019.5,m1,m2]);
    if i==1
        ylabel('Cluster 3');
    end
    if i==1
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' $m^3/m^3$/year']);
        set(h,'Rotation',90);
    end
    if i==2 || i==3
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' units/year']);
        set(h,'Rotation',90);
    end
    if i==4
        h=text(2020,m1,['$\Delta$ = ',...
            num2str(round((fm(end)-fm(1))/8,4)),' $mmm$/year']);
        set(h,'Rotation',90);
    end
end

%% extra plots
%% extract slopes
% n1=size(AM.c1.sm,1);
% F=zeros(n1,9,4,4);
% for i=1:4
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[1,2,12],:),2));
%     else
%         z=squeeze(nansum(z(:,[1,2,12],:),2));
%     end
%     z(isnan(z))=0;
%     for j=1:n1
%         f=fit((1:9)',z(j,:)','poly1');
%         F(j,:,1,i)=f(1:9);
%     end
%     
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[3,4,5],:),2));
%     else
%         z=squeeze(nansum(z(:,[3,4,5],:),2));
%     end
%     z(isnan(z))=0;
%     for j=1:n1
%         f=fit((1:9)',z(j,:)','poly1');
%         F(j,:,2,i)=f(1:9);
%     end
%     
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[6,7,8],:),2));
%     else
%         z=squeeze(nansum(z(:,[6,7,8],:),2));
%     end
%     z(isnan(z))=0;
%     for j=1:n1
%         f=fit((1:9)',z(j,:)','poly1');
%         F(j,:,3,i)=f(1:9);
%     end
%     
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[9,10,11],:),2));
%     else
%         z=squeeze(nansum(z(:,[9,10,11],:),2));
%     end
%     z(isnan(z))=0;
%     for j=1:n1
%         f=fit((1:9)',z(j,:)','poly1');
%         F(j,:,4,i)=f(1:9);
%     end
%     disp(i*100/4);
% end

%% boxplot
% names={'SM','VOD','NDVI','Prec'};
% x_label={'DJF','MAM','JJA','SON'};
% k=1;
% for i=1:4
%     subplot(4,4,k);k=k+1;
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[1,2,12],:),2));
%     else
%         z=squeeze(nansum(z(:,[1,2,12],:),2));
%     end
%     for j=1:9
%         bplot(z(:,j),2010+j);
%         hold on;
%     end
%     fm=mean(F(:,:,1,i),1)';
%     fs=std(F(:,:,1,i),[],1)';
%     t=(2011:2019)';
%     hold on;
%     plot(t,fm,'k','linewidth',2);
%     hold on;
%     h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
%     h.FaceAlpha=0.4;
%     h.EdgeColor='none';
%     h.FaceColor=[0,0,0.6];
%     grid;
%     
%     ylabel(names(i));
%     if i==4
%         xlabel(x_label(k-13));
%     end
%     
%     subplot(4,4,k);k=k+1;
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[3,4,5],:),2));
%     else
%         z=squeeze(nansum(z(:,[3,4,5],:),2));
%     end
%     for j=1:9
%         bplot(z(:,j),2010+j);
%         hold on;
%     end
%     fm=mean(F(:,:,2,i),1)';
%     fs=std(F(:,:,2,i),[],1)';
%     t=(2011:2019)';
%     hold on;
%     plot(t,fm,'k','linewidth',2);
%     hold on;
%     h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
%     h.FaceAlpha=0.4;
%     h.EdgeColor='none';
%     h.FaceColor=[0,0,0.6];
%     grid;
%     if i==4
%         xlabel(x_label(k-13));
%     end
%     
%     subplot(4,4,k);k=k+1;
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[6,7,8],:),2));
%     else
%         z=squeeze(nansum(z(:,[6,7,8],:),2));
%     end
%     for j=1:9
%         bplot(z(:,j),2010+j);
%         hold on;
%     end
%     fm=mean(F(:,:,3,i),1)';
%     fs=std(F(:,:,3,i),[],1)';
%     t=(2011:2019)';
%     hold on;
%     plot(t,fm,'k','linewidth',2);
%     hold on;
%     h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
%     h.FaceAlpha=0.4;
%     h.EdgeColor='none';
%     h.FaceColor=[0,0,0.6];
%     grid;
%     if i==4
%         xlabel(x_label(k-13));
%     end
%     
%     subplot(4,4,k);k=k+1;
%     z=squeeze(C1(:,:,:,i));
%     if i<4 
%         z=squeeze(nanmean(z(:,[9,10,11],:),2));
%     else
%         z=squeeze(nansum(z(:,[9,10,11],:),2));
%     end
%     for j=1:9
%         bplot(z(:,j),2010+j);
%         hold on;
%     end
%     fm=mean(F(:,:,4,i),1)';
%     fs=std(F(:,:,4,i),[],1)';
%     t=(2011:2019)';
%     hold on;
%     plot(t,fm,'k','linewidth',2);
%     hold on;
%     h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
%     h.FaceAlpha=0.4;
%     h.EdgeColor='none';
%     h.FaceColor=[0,0,0.6];
%     grid;
%     if i==4
%         xlabel(x_label(k-13));
%     end
%     
% end
    
%% shapes
% load AM_mean
% load AM_sens
% 
% 
% n1=size(AM.c1.sm,1);
% cm=zeros(n1,12,4);k=1;
% cm(:,:,k)=AM_mean.c1.sm.mean;k=k+1;
% cm(:,:,k)=AM_mean.c1.vod.mean;k=k+1;
% cm(:,:,k)=AM_mean.c1.ndvi.mean;k=k+1;
% cm(:,:,k)=AM_mean.c1.prec.mean;
% cs=zeros(n1,12,4);k=1;
% cs(:,:,k)=AM_sens.c1.sm.s;k=k+1;
% cs(:,:,k)=AM_sens.c1.vod.s;k=k+1;
% cs(:,:,k)=AM_sens.c1.ndvi.s;k=k+1;
% cs(:,:,k)=AM_sens.c1.prec.s;
% 
% CM=zeros(n1,4,4);
% for i=1:4
%     k=1;
%     CM(:,k,i)=squeeze(nanmean(cm(:,[1,2,12],i),2));k=k+1;
%     CM(:,k,i)=squeeze(nanmean(cm(:,[3,4,5],i),2));k=k+1;
%     CM(:,k,i)=squeeze(nanmean(cm(:,[6,7,8],i),2));k=k+1;
%     CM(:,k,i)=squeeze(nansum(cm(:,[9,10,11],i),2));
% end
%     
% CS=zeros(n1,4,4);
% for i=1:4
%     k=1;
%     CS(:,k,i)=squeeze(nanmean(cs(:,[1,2,12],i),2));k=k+1;
%     CS(:,k,i)=squeeze(nanmean(cs(:,[3,4,5],i),2));k=k+1;
%     CS(:,k,i)=squeeze(nanmean(cs(:,[6,7,8],i),2));k=k+1;
%     CS(:,k,i)=squeeze(nanmean(cs(:,[9,10,11],i),2));
% end
% 
% figure,
% for i=1:4
%     for j=1:4
%         subplot(2,2,i);
%         [h,idx]=hist(10*100*CS(:,j,i)./CM(:,j,i),50);
%         h=area(idx,smooth(h));
%         h.EdgeColor='none';
%         h.FaceAlpha=0.4;
%         hold on;
%         axis square;
%     end
%     title(names(i));
%     legend(x_label)
% end
% 
% figure,
% for i=1:4
%     for j=1:4
%         subplot(2,2,i);
%         [h,idx]=hist(10*CS(:,j,i),50);
%         h=area(idx,smooth(h));
%         h.EdgeColor='none';
%         h.FaceAlpha=0.4;
%         hold on;
%         axis square;
%     end
%     title(names(i));
%     legend(x_label)
% end

%% fake slope
% n=100;
% m=100;
% 
% x=zeros(n,m);
% p1=zeros(m,1);
% p2=zeros(m,1);
% t=linspace(-1,1,n)';
% for i=1:m
%     x(:,i)=(-1+randn*0.2)*t+0.1*randn(n,1)+0.2*randn;
%     f=fit(t,x(:,i),'poly1');
%     p1(i)=f.p1;
%     p2(i)=f.p2;
% end
% 
% f=zeros(n,m);
% for i=1:m
%     f(:,i)=p1(i)*t+p2(i);
% end
% 
% fm=mean(f,2);
% fs=std(f,[],2);
% 
% plot(t,x,'color',0.4*ones(3,1))
% hold on;
% plot(t,fm,'k','linewidth',2);
% hold on;
% h=fill([t;flip(t)],[fm+fs;flip(fm-fs)],'r');
% h.FaceAlpha=0.4;
% h.EdgeColor='none';
% h.FaceColor=[0,0.6,0];
% axis square;