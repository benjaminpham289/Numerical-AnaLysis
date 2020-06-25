function [xy]=ngsuyadam(f,x0,y0,X,h,S) 
syms u v;
n=0;
while n<2*S
    h=h/2;
    n=(X-x0)/h;
end
x=x0:h:X;
y=zeros(1,length(x));
y(1,1)=y0;
for s=2:S+1
    a=zeros(1,s-1);
    for i=1:s-1
        a(1,i)=dtlt(i);
    end
    b=a*pascal(s-1,1);
        T=0;
        for j=1:s-1
            T=T+h*b(1,j)*subs(f,{u,v},{x(1,s-j),y(1,s-j)});
        end
        y(1,s)=y(1,s-1)+T;
end
for i=S+2:length(x)
    T=0;
        for j=1:S
            T=T+h*b(1,j)*subs(f,{u,v},{x(1,i-j),y(1,i-j)});
        end
        y(1,i)=y(1,i-1)+T;
end
x=x';
y=y';
xy=[x y];
plot(x,y,'-r');
end