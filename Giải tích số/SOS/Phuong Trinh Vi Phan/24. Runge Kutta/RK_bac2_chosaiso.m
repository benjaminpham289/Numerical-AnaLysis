function [ ] = RK_bac2_chosaiso(g,x0,y0,x1,saiso)
%Dung phuong phap Runge-Kutta bac 4 giai phuong trinh vi phan bac 2 dang
%y''=f(x,y,y') 
%Ham g nhap vao can co dang : g(x,y,y1) voi y1=y'
%y0 = [y(x0) y'(x0)]
%saiso : sai so cho truoc
%x1: Can tinh gia tri y(x) tai vi tri x1
format long g;

%Xac dinh sai so nho nhat co dang 0.0...1 co the xac dinh duoc bang tinh
%toan
saiso1=1;
while (saiso1>saiso)
    saiso1=saiso1/10;
end

h = 0.2;
n = abs(x1-x0);
ytruoc = RK_bac2_phu(g,x0,y0,x1,n/h);

kt=0;
%Chay chuong trinh cho den khi kt =1 thi thoa man
%dung phuong phap chia doi de tim so buoc lap nho nhat thoa man

while (kt==0)
    h=h/2;
    yhientai = RK_bac2_phu(g,x0,y0,x1,n/h);
    if abs(yhientai-ytruoc) <= saiso1 
        kt=1;
    else
        ytruoc = yhientai;
    end
end

fprintf('So buoc lap la : %.0f\n', double(n/h));
RK_bac2(g,x0,y0,x1,n/h);
end
