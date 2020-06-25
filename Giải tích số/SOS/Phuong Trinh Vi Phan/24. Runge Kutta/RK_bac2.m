function [ ] = RK_bac2(g,x0,y0,x1,n)
%Dung phuong phap Runge-Kutta bac 4 giai phuong trinh vi phan bac 2 dang
%y''=g(x,y,y') 
%Ham g nhap vao can co dang : g(x,y,y1) voi y1=y'
%y0 = [y(x0) y'(x0)]
%n : So buoc lap
%x1: Can tinh gia tri y(x) tai vi tri x1
format long g;

h=(x1-x0)/n; % h la do dai moi buoc lap

syms x y y1
f=y1;

xhientai=x0; X(1)=x0;
yhientai=y0(1); Y(1)=y0(1);
y1hientai=y0(2);

for i=1:n 
    k1=h*double(subs(f,y1,y1hientai)); 
    l1=h*double(subs(subs(subs(g,x,xhientai),y,yhientai),y1,y1hientai));
    k2=h*double(subs(f,y1,y1hientai+l1/2)); 
    l2=h*double(subs(subs(subs(g,x,xhientai+h/2),y,yhientai+k1/2),y1,y1hientai+l1/2)); 
    k3=h*double(subs(f,y1,y1hientai+l2/2)); 
    l3=h*double(subs(subs(subs(g,x,xhientai+h/2),y,yhientai+k2/2),y1,y1hientai+l2/2));  
    k4=h*double(subs(f,y1,y1hientai+l3));
    l4=h*double(subs(subs(subs(g,x,xhientai+h),y,yhientai+k3),y1,y1hientai+l3));
    
    xhientai=xhientai+h;
    yhientai=yhientai+(k1+2*k2+2*k3+k4)/6;
    y1hientai=y1hientai+(l1+2*l2+2*l3+l4)/6;
    
    X(i+1)=xhientai;
    Y(i+1)=yhientai;
end

%fprintf('%f\n %f\n %f\n %f\n %f\n %f\n %f\n %f\n',k1,l1,k2,l2,k3,l3,k4,l4);
fprintf('Do dai moi buoc lap la : %f\n', double(h));
fprintf('y( %f ) = ', double(x1)); disp(yhientai); fprintf('\n');
%y = sqrt(pi/2)*exp(-x*x/2)*erfi(x/sqrt(2));
%fprintf('Gia tri chuan :  '); disp(double(subs(y,x,x1))); fprintf('\n');

plot(X,Y,'rx-','Linewidth',1.0);
title('Do thi mau do : Do thi xap xi');
grid on;

%Ve do thi de so sanh truc quan gia tri cua phan xap xi duoc voi ham chinh
%xac

%hold on;
%xlabel('Do thi mau xanh : Do thi chinh xac');
%x = min(x0,x1):h/10:max(x0,x1);
%y = sqrt(pi/2)*exp(-x.*x/2).*erfi(x/sqrt(2));
%plot(x,y,'b-','Linewidth',0.1);
end
