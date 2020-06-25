% vd giai y'=x+y;y(1)=0 den cap 10
% nhap syms x y
% taylor_n(x+y,1,0,10)
% pt y''=x+y+y' ;y(1)=2;y'(1)=3 den cap 10
% nhap syms x y dy
% taylor_n(x+y+dy,1,[2 3],10)
function taylor_n(f,x0,my,n)
% f = f(x,y) hoac f(x,y,dy)
% my=y(x0) hoac [y(x0) y'(x0)]
% n la cap cua chuoi taylor
syms x y dy;
h=f*x/x;
k=length(my);
if k==1
    my(2)=subs(f,{x,y},{x0,my(1)});
    if abs(my(2))==Inf
        error('f(x,y) k lien tuc');
    end
    dx=[1;x-x0];
    for i=3:n+1
        k=k*(i-1);
        h=expand(diff(h,x)+diff(h,y)*f);% tinh dao ham
        my(i)=subs(h,{x,y},{x0,my(1)})/k;% tinh gia tri chuoi taylor
        if abs(my(i))==Inf
            error('f(x,y) k co dao ham lien tuc');
        end
        dx(i)=(x-x0)^(i-1);
    end
elseif k==2
    my(3)=subs(f,{x,y,dy},{x0,my(1),my(2)})/2;
    if abs(my(3))==Inf
        error('f k lien tuc');
    end
    dx=[1;x-x0;(x-x0)^2];
    for i=4:n+1
        k=k*(i-1);
        h=expand(diff(h,x)+diff(h,y)*dy+diff(h,dy)*f);% tinh dao ham
        my(i)=subs(h,{x,y,dy},{x0,my(1),my(2)})/k;% tinh gia tri chuoi taylor
        if abs(my(i))==Inf
            error('f k co dao ham lien tuc');
        end
        dx(i)=(x-x0)^(i-1);
    end
else error('my = y(x0) hoac [y(x0) y''(x0)]');
end
fprintf('nghiem gan dung trong lan can x=%.3f la: \n y=',x0);
disp(vpa((my*dx),4));
end
