function [I]=congthuctrapezoid(fun,a,b,n)
m = n + 1;
h=(b-a)/n;
x=a:h:b;
f= zeros(size(x));
for i=1:m
    f(i)=feval(fun,x(i));  
end
I=h*(0.5*f(1)+sum(f(2:m-1))+0.5*f(m));
end




