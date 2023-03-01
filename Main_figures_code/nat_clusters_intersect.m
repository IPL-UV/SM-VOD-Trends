function h=nat_clusters_intersect(x,y,index,x_label,y_label,x_m,x_M,y_m,y_M,NN)

%% colorbars (6 max)
% nbc=1000;
% map=zeros(nbc*6,3);
% map(1:nbc,:)=[linspace(1,0,nbc)',linspace(1,0.6,nbc)',linspace(1,0,nbc)'];
% map(nbc+1:2*nbc,:)=[linspace(1,0.6,nbc)',linspace(1,0,nbc)',linspace(1,0.6,nbc)'];
% map(2*nbc+1:3*nbc,:)=[linspace(1,0,nbc)',linspace(1,0.6,nbc)',linspace(1,0.6,nbc)'];
% map(3*nbc+1:4*nbc,:)=[linspace(1,0.6,nbc)',linspace(1,0,nbc)',linspace(1,0,nbc)'];
% map(4*nbc+1:5*nbc,:)=[linspace(1,0.6,nbc)',linspace(1,0.6,nbc)',linspace(1,0,nbc)'];
% map(5*nbc+1:6*nbc,:)=[linspace(1,0,nbc)',linspace(1,0,nbc)',linspace(1,0.6,nbc)'];

% hist_color=...
%     [0,0.6,0;
%     0.6,0,0.6;
%     0,0.6,0.6;
%     0.6,0,0;
%     0.6,0.6,0;
%     0,0,0.6];

N=35;
map_ax=distinguishable_colors(N);
hist_color=map_ax([11,6,26,35,16],:);

nbc=1000;
map=zeros(nbc*5,3);
for i=1:5
map(nbc*(i-1)+1:nbc*i,:)=[linspace(1,hist_color(i,1),nbc)',...
    linspace(1,hist_color(i,2),nbc)',...
    linspace(1,hist_color(i,3),nbc)'];
end

%% separate each cluster
Nclus=size(unique(index),1);
map=map(1:nbc*Nclus,:);
hist_color=hist_color(1:Nclus,:);

%% new plot script
figure,

ax(1)=subplot(2,2,3);

for j=1:Nclus
N=NN;
% if j==5
%     N=10;
% end
z=[x(index==j),y(index==j)];
[~,f,~,~]=kde2d(z,N,min(z),max(z));

f = histcn(z,size(f,1)-1,size(f,2)-1);
f=f/sum(f(:));

[~,idx]=hist(x(index==j),size(f,1));
[~,idy]=hist(y(index==j),size(f,1));


idx1=linspace(min(idx),max(idx),1000);
idy1=linspace(min(idy),max(idy),1000);
[X,Y]=meshgrid(idx,idy);
[X1,Y1]=meshgrid(idx1,idy1);
F=interp2(X,Y,f,X1,Y1);
K = (1/441)*ones(21);
for i=1:2
F = conv2(F,K,'same');
end

[~, contourObj] = contourf(idx1',idy1',j+F'/max(F(:)),5,'color',0.4*ones(1,3),'linewidth',0.1);

% This is the secret that 'keeps' the transparency.
eventFcn = @(srcObj, e) updateTransparency(srcObj);
addlistener(contourObj, 'MarkedClean', eventFcn);
% % Elsewhere in script, a separate file, or another method of your class.
hold on;

% contour(idx1',idy1',j+F'/max(F(:)),15,'linewidth',5);
% hold on;

end

grid;
colormap(ax(1),map);
axis square;
set(gca,'fontsize',18);
xlabel(x_label);
ylabel(y_label);
axis([min(x),max(x),min(y),max(y)]);
axis([x_m,x_M,y_m,y_M]);

%% Lateral histagram plots
ax(2)=subplot(2,2,1);
for i=1:Nclus
    [px,idx]=hist(x(index==i),3*size(f,1));
    idx1=linspace(min(idx),max(idx),1000);
    px=interp1(idx,px,idx1);
    for j=1:6
        px=smooth(px);
    end
    px=px/max(px(:));
    h=area(idx1,px);
    h.FaceAlpha=0.6;
    h.FaceColor=hist_color(i,:);
    hold on;
end
axis([x_m,x_M,0,1.1]);
axis off;


ax(3)=subplot(2,2,4);
for i=1:Nclus
    [py,idy]=hist(y(index==i),3*size(f,1));
    idy1=linspace(min(idy),max(idy),1000);
    px=interp1(idy,py,idy1);
    for j=1:6
        px=smooth(px);
    end
    px=px/max(px(:));
    h=area(idy1,px);
    h.FaceAlpha=0.6;
    h.FaceColor=hist_color(i,:);
    hold on;
end
axis([y_m,y_M,0,1.1]);
axis off;
set(gca,'view',[90 -90]);

%% stack subplots % [left bottom width height]
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

pos{2}(4)=pos{2}(4)*0.8;
pos{3}(3)=pos{3}(3)*0.8;

for i=1:3
    pos{i}(1)=pos{i}(1)+0.2;
    pos{i}(2)=pos{i}(2)+0.2;
end

set(ax(1),'position',pos{1});
set(ax(2),'position',pos{2});
set(ax(3),'position',pos{3});
