function [yint] = langrange (x, y)
%ham lagrange tim da thuc noi suy lagrange biet gia tri cac diem x,y , va
%tim dao ham cua da thuc noi suy ; 
%yint la da thuc noi suy lagrange
%x la gia tri cua cac doi so
%y la gia tri ham so tai cac diem x tuong ung 
n = length(x);
if length(y)~=n, error('x and y must be same length');
end
syms a;
s = 0;
for i= 1:n
    product = y(i);
    for j=1:n
        if i~=j
            product=product*(a-x(j))/(x(i)-x(j));
        end
    end
    s=s+product;
end
yint=s;
yint=expand(yint);
yint=vpa(yint,5);
