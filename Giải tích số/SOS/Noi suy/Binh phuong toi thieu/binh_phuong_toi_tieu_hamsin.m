disp ('Phuong phap binh phuong be nhat dang y=a+bcosx+csinx')
A = input ('Nhap ma tran cac gia tri voi cot 1 la x va cot 2 la y tuong ung\n');
m = length(A(:,1));
format long
H = zeros (3);
for i = 1:1:m
    H(1,1)=n; H(1,2) = H(1,2)+cos(A(i,1)); H(1,3) = H(1,3) + sin(A(i,1));
    H(2,1) = H(1,2); H(2,2) = H(2,2)+cos(A(i,1))^2; H(2,3) = H(2,3)+cos(A(i,1))*sin(A(i,1));
    H(3,1) = H(1,3); H(3,2) = H(2,3); H(3,3) = H(3,3)+ sin(A(i,1))^2;
end
 I = zeros (3,1);
 for i = 1:1:m
     I(1,1) = I(1,1)+A(i,2);
     I(2,1) = I(2,1)+ A(i,2)*cos(A(i,1));
     I(3,1) = I(3,1) + A(i,2)*sin(A(i,1));
 end
if det(H) ==0 disp('Khong tim duoc ham xap xi'),...
else disp ('Ma tran cot cac he so a b c la')
X = H^-1*I, saiso=0;
for i = 1:1:m
    saiso = saiso + (A(i,2)-X(1,1)-X(2,1)*cos(A(i,1))-X(3,1)*sin(A(i,1)))^2;
end
    saiso = sqrt(1/m*saiso)
end