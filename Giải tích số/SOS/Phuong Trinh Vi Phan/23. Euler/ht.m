function yn=ht(func,x0,y0,xn,h,epsilon)
    if nargin==5
        yn=hinhthang(func,x0,y0,xn,h);
    end
    if nargin==6
        d=(epsilon/2);
        while d>=(epsilon/2)
            yn=hinhthang(func,x0,y0,xn,h);
            zn=hinhthang(func,x0,y0,xn,h/2);
            d=abs(zn-yn);
            h=h/2;
        end
    end
    x=(x0:h:xn);
    n=length(x);
    y=y0*ones(n,1);
    for i=2:n
        t=y(i-1)+h*feval(func,x(i-1),y(i-1));
        y(i)=y(i-1)+h*(feval(func,x(i-1),y(i-1))+feval(func,x(i),t))/2;
    end
    plot(x,y,'-d');
    x
    y
    h
end
function z=hinhthang(func,x0,xn,y0,h)
x=(x0:h:xn);
n=length(x);
y=y0*ones(n,1);
for i=2:n
    t=y(i-1)+h*feval(func,x(i-1),y(i-1));
    y(i)=y(i-1)+h*(feval(func,x(i-1),y(i-1))+feval(func,x(i),t))/2;
end
z=y(n);
end
