function NoiSuyNguocCachDeu(X,Y,y)
syms t;syms x
%Lap bang sai phan huu han
n=size(Y,2);m=n;p=n-1;
Deltai=Y;
for i=1:p
    for j=1:m-1
    Deltai(j)=Deltai(j+1)-Deltai(j);
    end
    m=m-1;
    Delta(i)=Deltai(1);
end
phi=(y-Y(1))/Delta(1);
tich=t;
for i=1:p-1
    tich=tich*(t-i)/(i+1);
    phi=phi-Delta(i+1)*tich/Delta(1);
end
phi=expand(phi)
t0=(y-Y(1))/Delta(1);
t1=subs(phi,t0);
n=1;
while abs(t1-t0)>0.000001&&n<1000
    t0=t1;
    t1=double(subs(phi,t1));
    n=n+1;
end
x=X(1)+(X(2)-X(1))*t1;
n
x=double(x)
end
