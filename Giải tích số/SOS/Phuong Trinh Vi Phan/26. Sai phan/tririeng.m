function [y]= tririeng(p,q,r,N,a,b)
% N la so khoang nut luoi
% a,b la 2 bien
%pt M la ma tran co da thuc dac trung giong vs dinh thuc pt=0
h=(b-a)/N;
x=zeros(1,N+1);
for i=0:N
    x(i+1)= a + i*h;
end
%tinh day xi
M=zeros(N-1,N-1);
Ai=zeros(N-1,1);
Bi=zeros(N-1,1);
Ci=zeros(N-1,1);
f=zeros(N-1,1);
for i=1:N-1
    f(i)=r(x(i+1));
end
for i=1:N-1
    Ai(i)=-(p(x(i)+h/2))/(h*h*f(i));

    Bi(i)=-(p(x(i+1)+h/2))/(h*h*f(i));

    Ci(i)=(p(x(i))+p(x(i))+h*h*q(x(i+1)))/(h*h*f(i));
end
for i=1:N-1
    M(i,i)=Ci(i);
end
for i=2:N-1
    M(i,i-1)=Ai(i);
end
for i=1:N-2
     M(i,i+1)=Bi(i);
end
y=eig(M);
end