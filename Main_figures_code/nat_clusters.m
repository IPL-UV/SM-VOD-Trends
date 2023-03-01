function h=nat_clusters(x,y,index,thres,x_label,y_label)

%% create a smooth PDF ina defined spatial grid
N=10;
z=[x,y];
[h,f,~,~]=kde2d(z,N,min(z),max(z));

f = histcn(z,size(f,1)-1,size(f,2)-1);
f=f/sum(f(:));

[~,idx]=hist(x,size(f,1));
[~,idy]=hist(y,size(f,1));


idx1=linspace(min(idx),max(idx),1000);
idy1=linspace(min(idy),max(idy),1000);
[X,Y]=meshgrid(idx,idy);
[X1,Y1]=meshgrid(idx1,idy1);
F=interp2(X,Y,f,X1,Y1);
K = (1/441)*ones(21);
for i=1:2
F = conv2(F,K,'same');
end


%% colorbars (6 max)
nbc=1000;
map=zeros(nbc*6,3);
map(1:nbc,:)=[linspace(1,0,nbc)',linspace(1,0.6,nbc)',linspace(1,0,nbc)'];
map(nbc+1:2*nbc,:)=[linspace(1,0.6,nbc)',linspace(1,0,nbc)',linspace(1,0.6,nbc)'];
map(2*nbc+1:3*nbc,:)=[linspace(1,0,nbc)',linspace(1,0.6,nbc)',linspace(1,0.6,nbc)'];
map(3*nbc+1:4*nbc,:)=[linspace(1,0.6,nbc)',linspace(1,0,nbc)',linspace(1,0,nbc)'];
map(4*nbc+1:5*nbc,:)=[linspace(1,0.6,nbc)',linspace(1,0.6,nbc)',linspace(1,0,nbc)'];
map(5*nbc+1:6*nbc,:)=[linspace(1,0,nbc)',linspace(1,0,nbc)',linspace(1,0.6,nbc)'];

hist_color=...
    [0,0.6,0;
    0.6,0,0.6;
    0,0.6,0.6;
    0.6,0,0;
    0.6,0.6,0;
    0,0,0.6];

%% separate each cluster
Nclus=size(unique(index),1);
map=map(1:nbc*Nclus,:);
hist_color=hist_color(1:Nclus,:);

Fx=F;
Fx(Fx<thres)=0;
Fx(Fx>0)=1;

CC = bwconncomp(Fx,8);
numPixels = cellfun(@numel,CC.PixelIdxList);
kk=1;
f=zeros(size(F));
while kk<Nclus+1
    [~,ix] = max(numPixels);
    f(CC.PixelIdxList{ix}) = kk;
    kk=kk+1;
    numPixels(ix)=1;
end
f(f==0)=nan;
f=f-1;

%% coordinate colours
D=zeros(Nclus);
for i=1:Nclus
    for j=1:Nclus
        aux1=nansum(f==j-1,1);
        [~,ix1]=max(aux1);
        ix1=idy1(ix1);
        aux2=nansum(f==j-1,2);
        [~,ix2]=max(aux2);
        ix2=idx1(ix2);
    
        z1=nanmean(x(index==i-1));
        z2=nanmean(y(index==i-1));
        
        D(i,j)=sqrt((ix1-z2).^2+(ix2-z1).^2);
    end     
end
[~,d]=min(D,[],2);
hist_color=hist_color(d,:);

%% main plot
figure,

ax(1)=subplot(2,2,3);
contourf(idx1',idy1',(f+F/max(F(:)))',6*Nclus);
grid;
colormap(ax(1),map);
axis square;
set(gca,'fontsize',18);
xlabel(x_label);
ylabel(y_label);


ax(2)=subplot(2,2,1);
for i=1:Nclus
    [px,ix]=hist(x(index==i-1),50);
    for j=1:2
        px=smooth(px);
    end
    px=px/sum(px(:));
    h=area(ix,px);
    h.FaceAlpha=0.6;
    h.FaceColor=hist_color(i,:);
    hold on;
end
axis off;


ax(3)=subplot(2,2,4);
for i=1:Nclus
    [px,ix]=hist(y(index==i-1),50);
    for j=1:2
        px=smooth(px);
    end
    px=px/sum(px(:));
    h=area(ix,px);
    h.FaceAlpha=0.6;
    h.FaceColor=hist_color(i,:);
    hold on;
end
axis off;
set(gca,'view',[90 -90]);

%% stack subplots
pos=get(ax,'position');
bottom=pos{1}(2);
top=pos{2}(2)+pos{2}(4);

plotspace=top-bottom;
pos{1}(4)=plotspace/2;
pos{2}(4)=0.3*plotspace/2;
pos{2}(2)=bottom+plotspace/2;

pos{3}(1)=pos{1}(1)+pos{1}(3);
pos{3}(2)=pos{1}(2);
pos{3}(3)=pos{1}(3)*0.4;
pos{3}(4)=pos{1}(4);

for i=1:3
    pos{i}(1)=pos{i}(1)+0.2;
    pos{i}(2)=pos{i}(2)+0.2;
end

set(ax(1),'position',pos{1});
set(ax(2),'position',pos{2});
set(ax(3),'position',pos{3});

