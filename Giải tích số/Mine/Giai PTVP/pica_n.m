% vd giai y'=x+y^2;y(0)=1 voi 4 lan lap
% nhap syms x y
% pica_n(x+y^2,0,1,4)
function pica_n(f,x0,y0,n)
% f =f(x,y)
%y0=y(x0)
% n la so lan lap
syms x y;
h=expand(subs(f,{x,y},{x,y0}));
yx=y0+int(h,x0,x);
for i=2:n
    h=expand(subs(f,{x,y},{x,yx}));% tinh f(x,yn)
    yx=y0+int(h,x0,x);%tinh yn
end
fprintf('nghiem gan dung trong lan can x=%.3f la:',x0);
y=vpa(expand(yx),4)