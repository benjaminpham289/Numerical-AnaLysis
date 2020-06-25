function N= newtoncachdeu(x0, h, Y, a, b)
% x0 la moc noi suy dau tien % h la buoc % Y la cac gia tri cua ham
% a va b la gia tri x yeu cau tinh gia tri da thuc va dao ham
n=length(Y); 
%sau day ta tinh bang sai phan
D= zeros(n-1, n-1);
for i=1:(n-1)
    D(i,1)= Y(i+1)-Y(i);
end
for j=2:(n-1)
    for i=1:(n-j)
        D(i,j)= D(i+1, j-1) -D(i,j-1);
    end
end
syms x t real;
s=1;
R=D(1,n-1);
 %ta se so sanh xem dung da thuc noi suy tien hay lui
if (a- x0)< (x0 + h*n - a)
    %xay dung da thuc noi suy tien
    fprintf('vi %f gan dau bang nen ta se dung da thuc noi suy newton tien \n', a);
    y=Y(1);
     for i=1:n-1
         s = s*(t-i+1)/i;
         y = y + D(1,i)*s;
     end
    f=subs(y, t);
    %in da thuc dang chinh tac ra man hinh
    disp('da thuc noi suy dang chinh tac la');
    f=vpa(expand(subs(f,(x-x0)/h)),5) 
    %xay dung cong thuc tinh sai so
        for k=0:n-1
        R=R*(t-i)/(i+1);
    end 
    R=subs(R,(x-x0)/h);
else
    % xay dung da thuc noi suy lui
    fprintf('vi %f gan cuoi bang nen ta se dung da thuc noi suy newton lui \n', a);
    y=Y(n);
     for i=1:n-1
         s = s * (t+i-1)/i;
         y = y + D(n-i,i)*s;
     end
    f=subs(y,t);
    %in da thuc dang chinh tac ra man hinh
    disp('da thuc noi suy dang chinh tac la');
    f=vpa(expand(subs(f,-(x0+(n-1)*h-x)/h)),5)
    % xay dung cong thuc tinh sai so
    for k=0:n-1
        R=R*(t+k)/(k+1);
    end
    R=subs(R,-(x0+(n-1)*h-x)/h);
end
% tra ve ket  qua gia tri da thuc va sai so tai a
% su dung ham diff cua Mathlab ho tro viec tinh dao ham
disp('dao ham bac nhat la');
g= diff(f)
% tra ve ket qua gia tri dao ham tai diem b
end
