function [ ] = RK_chosaiso( f, x0, y0, x1, saiso)
%Tinh gia tri y(x1) tu phuong trinh vi phan cap 1 y'=f(x,y) bang phuong phap Runghe-Kutta bac 4
%f = f(x,y)
%y0=y(x0) la gia tri cua y tai vi tri x0 cho truoc
%saiso : sai so cho truoc
format long g;

%Xac dinh sai so nho nhat co dang 0.0...1 co the xac dinh duoc bang tinh
%toan
saiso1=1;
while (saiso1>saiso)
    saiso1=saiso1/10;
end

h=0.2;
n=abs(x1-x0);
ytruoc = RK_chobuoclap_phu(f,x0,y0,x1,n/h);

kt=0; %Chay chuong trinh cho den khi kt =1 thi thoa man
%dung phuong phap chia doi de tim so buoc lap nho nhat thoa man
while (kt == 0) 
    h=h/2;
    yhientai = RK_chobuoclap_phu(f,x0,y0,x1,n/h);
    if abs(yhientai-ytruoc)<=saiso1
        kt = 1;
      else
        ytruoc = yhientai;
    end
end

fprintf('So buoc lap la : %.0f\n', double(n/h));
RK_chobuoclap(f,x0,y0,x1,n/h);
end