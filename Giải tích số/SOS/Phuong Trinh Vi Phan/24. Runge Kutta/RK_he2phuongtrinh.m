function [  ] = RK_he2phuongtrinh(f,g,x0,y0,z0,x1,n)
%Dung phuong phap Runge-Kutta bac 4 giai he 2 phuong trinh vi phan dang
%y'=f(x,y,z) z'=g(x,y,z) 
%y0=y(x0) z0=z(x0) 
%n : So buoc lap
%x1: Can tinh gia tri y(x) va z(x) tai vi tri x1
format long g;

h=(x1-x0)/n; % h la do dai moi buoc lap

syms x y z

xhientai=x0;
yhientai=y0;
zhientai=z0;

for i=1:n 
    k1=h*double(subs(subs(subs(f,x,xhientai),y,yhientai),z,zhientai)); 
    l1=h*double(subs(subs(subs(g,x,xhientai),y,yhientai),z,zhientai));
    k2=h*double(subs(subs(subs(f,x,xhientai+h/2),y,yhientai+k1/2),z,zhientai+l1/2)); 
    l2=h*double(subs(subs(subs(g,x,xhientai+h/2),y,yhientai+k1/2),z,zhientai+l1/2)); 
    k3=h*double(subs(subs(subs(f,x,xhientai+h/2),y,yhientai+k2/2),z,zhientai+l2/2)); 
    l3=h*double(subs(subs(subs(g,x,xhientai+h/2),y,yhientai+k2/2),z,zhientai+l2/2));  
    k4=h*double(subs(subs(subs(f,x,xhientai+h),y,yhientai+k3),z,zhientai+l3));
    l4=h*double(subs(subs(subs(g,x,xhientai+h),y,yhientai+k3),z,zhientai+l3));
    
    xhientai=xhientai+h;
    yhientai=yhientai+(k1+2*k2+2*k3+k4)/6;
    zhientai=zhientai+(l1+2*l2+2*l3+l4)/6;
end

%fprintf('%f\n %f\n %f\n %f\n %f\n %f\n %f\n %f\n',k1,l1,k2,l2,k3,l3,k4,l4);
fprintf('Do dai moi buoc lap la : %f\n', double(h));
fprintf('y(x1) = '); disp(yhientai); fprintf('\n');
fprintf('z(x1) = '); disp(zhientai); fprintf('\n');
end
