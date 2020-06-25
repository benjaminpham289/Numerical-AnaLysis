function I = simpson(fun,a,b,n)
m=2*n+1;% n la so hinh thang cong con;
h=(b-a)/(m-1);
x=a:h:b;
f=zeros(size(x));
for i=1:m
    f(i)=subs(fun,x(i));
end
I=(h/3)*(f(1)+4*sum(f(2:2:m-1))+2*sum(f(3:2:m-2))+f(m));
end
