function q=extract_quantile(M)
q=zeros(5,2,2);
m=M.sm;
m1=squeeze(m(:,:,1));m1=m1(:);
m2=squeeze(m(:,:,end));m2=m2(:);
q(:,1,1)=quantile(m1,[0.1,0.25,0.5,0.75,0.9]);
q(:,2,1)=quantile(m2,[0.1,0.25,0.5,0.75,0.9]);
m=M.vod;
m1=squeeze(m(:,:,1));m1=m1(:);
m2=squeeze(m(:,:,end));m2=m2(:);
q(:,1,2)=quantile(m1,[0.1,0.25,0.5,0.75,0.9]);
q(:,2,2)=quantile(m2,[0.1,0.25,0.5,0.75,0.9]);