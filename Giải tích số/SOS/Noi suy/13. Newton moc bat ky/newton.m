function P = newton(X,Y)
syms x P real
n=size(X,2);
C(n)=Y(n);
for i=n-1:-1:1
    C(i)=Y(i);
    for k=i+1:n
        C(k)=(C(k)-C(k-1))/(X(k)-X(i));
    end 
end
P=C(n);
for k=n-1:-1:1
    P=P*(x-X(k))+C(k);
end