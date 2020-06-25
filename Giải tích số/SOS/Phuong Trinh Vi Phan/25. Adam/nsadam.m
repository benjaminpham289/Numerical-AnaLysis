function [xy]=nsadam(f,x0,y0,X,h,S,epsi)
n=0;
while n<3*S
    h=h/2;
    n=(X-x0)/h;
end
x=x0:h:X;
y=zeros(1,length(x));
y(1,1)=y0;
for s=2:S+1
    a=zeros(1,s-1);
    for i=1:s-1
        a(1,i)=dtltns(i);
    end
    b=a*pascal(s-1,1);
    c=zeros(1,length(b)+1);
    for j=1:length(b)
        c(j)=b(j);
    end
    delta=0;
    for k=1:s-1
        delta=delta+c(k+1)*f(x(s-k),y(s-k));
    end
    p = @(m) y(s-1) + b(1)*h*f(x(s),m) + delta*h;
    u0 = p(y(s-1));
    u1 = p(u0);
    while (abs(u0-u1) > epsi)
        u0 = u1
        u1 = p(u1)
    end;
    y(s) = u1;
end
for i=S+2:length(x)
    delta=0;
    for k=2:S
        delta = delta + b(k)*f(x(i-k+1), y(i-k+1));
    end
    p = @(m) y(i-1) + b(1)*h*f(x(i),m) + delta*h;
    v0 = p(y(i-1));
    v1 = p(v0);
    while (abs(u0-u1) > epsi)
       v0 = v1;
       v1 = p(v1);
    end
    y(i) = v1;
end
x=x';
y=y';
xy=[x y];    
plot(x,y,'-b');
end