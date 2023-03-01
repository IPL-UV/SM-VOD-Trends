function Q=slope_extraction(c)
Q=struct();

sm=struct();
z=c.sm;
z(isnan(z))=0;
idx=size(z,1);
if size(z,2)>12
    z=reshape(z(:,1:72,:),idx,12,6,9);
    z=squeeze(nanmean(z,3));    
end
s=zeros(idx,12);
r=zeros(idx,12);
t=(1:9)';
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        [f,R]=fit(t,x,'poly1');
        s(i,j)=f.p1;
        r(i,j)=R.rsquare;
    end
end
sm.s=s;
sm.r=r;
Q.sm=sm;

vod=struct();
z=c.vod;
z(isnan(z))=0;
idx=size(z,1);
if size(z,2)>12
    z=reshape(z(:,1:72,:),idx,12,6,9);
    z=squeeze(nanmean(z,3));    
end
s=zeros(idx,12);
r=zeros(idx,12);
t=(1:9)';
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        [f,R]=fit(t,x,'poly1');
        s(i,j)=f.p1;
        r(i,j)=R.rsquare;
    end
end
vod.s=s;
vod.r=r;
Q.vod=vod;

ndvi=struct();
z=c.ndvi;
idx=size(z,1);
z(isnan(z))=0;
s=zeros(idx,12);
r=zeros(idx,12);
t=(1:9)';
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        [f,R]=fit(t,x,'poly1');
        s(i,j)=f.p1;
        r(i,j)=R.rsquare;
    end
end
ndvi.s=s;
ndvi.r=r;
Q.ndvi=ndvi;

prec=struct();
z=c.prec;
z(isnan(z))=0;
idx=size(z,1);
if size(z,2)>12
    z=reshape(z(:,1:72,:),idx,12,6,9);
    z=squeeze(nansum(z,3));    
end
s=zeros(idx,12);
r=zeros(idx,12);
t=(1:9)';
for i=1:idx
    for j=1:12
        x=squeeze(z(i,j,:));
        [f,R]=fit(t,x,'poly1');
        s(i,j)=f.p1;
        r(i,j)=R.rsquare;
    end
end
prec.s=s;
prec.r=r;
Q.prec=prec;