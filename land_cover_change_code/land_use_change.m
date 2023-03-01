function data=land_use_change(a,b)
data=zeros(11);
for i=1:11
    for j=1:11
        aux1=zeros(584,1388);
        aux1(a==i)=1;
        aux2=zeros(584,1388);
        aux2(b==j)=1;
        data(i,j)=sum((aux1(:)+aux2(:))==2);
    end
end