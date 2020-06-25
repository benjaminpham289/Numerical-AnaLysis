function [x,y]= saiphan1(p,q,f,N,a,b,c,d)
% N la so nut luoi
% a,b la 2 bien
% c = u(a), d = u(b)
h=(b-a)/N;
x=zeros(1,N+1);
for i=0:N
    x(i+1)= a + i*h;
end
        %tinh day xi
M=zeros(N+1,N+2);
Ai=zeros(N-1,1);
Bi=zeros(N-1,1);
Ci=zeros(N-1,1);
Phi=zeros(N-1,1);
for i=1:N-1
    Ai(i)=(p(x(i)+h/2))/(h*h);
    Bi(i)=(p(x(i+1)+h/2))/(h*h);
    Ci(i)=(p(x(i+1)+h/2)+p(x(i)+h/2)+h*h*q(x(i+1)))/(h*h);
end
for i=1:N-1
    Phi(i)=f(x(i+1));
end
for i=2:N
    M(i,i)=-Ci(i-1,1);
    M(i,i-1)=Ai(i-1,1);
    M(i,i+1)=Bi(i-1,1);
end
M(1,1)=1; M(N+1,N+1)=1;
M(1,N+2)=c;M(N+1,N+2)=d;
for i=2:N
    M(i,N+2)=-Phi(i-1,1);
end
disp(M);
        %su dung ham luoi thu duoc phuong trinh co ma tran he so M
n = size(M,1)-1;
anpha = zeros(1,n+1); anpha(1)= -M(1,2)/M(1,1);
beta = zeros(1,n+1); beta(1)= M(1,n+2)/M(1,1);
A = zeros(1,n); B = zeros(1,n); C = zeros(1,n);d = zeros(1,n);
for i= 1:n
    A(i) = M(i+1,i);
    B(i) = M(i+1,i+2);
    C(i) = -M(i+1,i+1);
    d(i) = -M(i+1,n+2);
        %thiet lap cac day Ai,Bi,Ci,di cua he 3duong cheo
    anpha(i+1) = B(i)/(C(i)-anpha(i)*A(i));
    beta(i+1) = (A(i)*beta(i)+d(i))/(C(i)-anpha(i)*A(i));
        %tinh day anpha, beta
end
y = zeros(1,n+1); 
y(n+1) = (A(n)*beta(n) + d(n))/(C(n) - A(n)*anpha(n));
        %tinh yn truoc
for i= n:-1:1
    y(i) = anpha(i)*y(i+1) + beta(i);
end

      

    
    


