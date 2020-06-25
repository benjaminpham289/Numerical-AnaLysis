function [ yhientai ] = RK_chobuoclap_phu(f,x0,y0,x1,n)
%Tinh gia tri y(x1) tu phuong trinh vi phan cap 1 y'=f(x,y) bang phuong phap Runghe-Kutta bac 4
%f = f(x,y)
%y0=y(x0) la gia tri cua y tai vi tri x0 cho truoc
%n la so buoc lap
format long g;

h = double((x1-x0)/n); %h la do dai moi buoc lap
syms x y

xhientai=x0; %xhientai la gia tri x tai buoc lap hien tai
yhientai=y0; %yhientai la gia tri y tai buoc lap hien tai

for i=1:n
    k1 = h*double(subs(subs(f,x,xhientai),y,yhientai)); 
    k2 = h*double(subs(subs(f,x,xhientai+h/2),y,yhientai+k1/2));  
    k3 = h*double(subs(subs(f,x,xhientai+h/2),y,yhientai+k2/2)); 
    k4 = h*double(subs(subs(f,x,xhientai+h),y,yhientai+k3)); 
    
    yhientai = yhientai + (k1+2*k2+2*k3+k4)/6; 
    xhientai = xhientai + h; 
end
%Ve do thi de so sanh truc quan gia tri cua phan xap xi duoc voi ham chinh
%xac

%xlabel('Do thi mau xanh : Do thi chinh xac');
%x = min(x0,x1):h/10:max(x0,x1);
%y = sqrt(2*x+1);
%plot(x,y,'b-','Linewidth',0.1);
end

