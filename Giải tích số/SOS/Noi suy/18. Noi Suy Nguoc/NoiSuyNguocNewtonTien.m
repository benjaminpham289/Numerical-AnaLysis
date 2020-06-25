function P=NoiSuyNguocNewtonTien(X,Y)
syms x;
 n=size(Y,2);m=n;
fi=Y;
%lap day ti hieu
for i=1:n-1
   for j=1:m-1
       fi(j)=(fi(j+1)-fi(j))/(X(j+i)-X(j));
   end
   m=m-1;
   f(i)=fi(1);
end
P=Y(1);
tich=1;
%tinh Pn
for i=1:n-1
    tich=tich*(x-X(i));
    P=P+f(i)*tich;
end
P=expand(P);
end