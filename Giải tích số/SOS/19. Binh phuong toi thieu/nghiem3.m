function [x,ss]=nghiem3(X,y)
n=size(X,2);
xx=zeros(1,n);
z=zeros(2,1);
Y=zeros(1,n);
for i=1:n
    xx(i)=log10(X(i));
    Y(i)=log10(y(i));
end
z=nghiem1(xx,Y,1);
x(1)=10^z(1,1);
x(2)=z(2,1);
ss=0;
for i=1:n
    ss=ss+(y(i)-x(1)*(X(i))^x(2))^2;
end
ss=sqrt((1/n)*ss);
end
