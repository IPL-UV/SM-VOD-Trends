function Q=mean_extraction(c)
Q=struct();

sm=struct();
z=c.sm;
idx=size(z,1);
if size(z,2)>12
    z=reshape(z(:,1:72,:),idx,12,6,9);
    z=squeeze(nanmean(z,3));    
end
m=zeros(idx,12);
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        m(i,j)=nanmean(x(:));
    end
end
sm.mean=m;
Q.sm=sm;

vod=struct();
z=c.vod;
idx=size(z,1);
if size(z,2)>12
    z=reshape(z(:,1:72,:),idx,12,6,9);
    z=squeeze(nanmean(z,3));    
end
m=zeros(idx,12);
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        m(i,j)=nanmean(x(:));
    end
end
vod.mean=m;
Q.vod=vod;

ndvi=struct();
z=c.ndvi;
idx=size(z,1);
m=zeros(idx,12);
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        m(i,j)=nanmean(x(:));
    end
end
ndvi.mean=m;
Q.ndvi=ndvi;

prec=struct();
z=c.prec;
idx=size(z,1);
if size(z,2)>12
    z=reshape(z(:,1:72,:),idx,12,6,9);
    z=squeeze(nansum(z,3));    
end
m=zeros(idx,12);
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        m(i,j)=nanmean(x(:));
    end
end
prec.mean=m;
Q.prec=prec;