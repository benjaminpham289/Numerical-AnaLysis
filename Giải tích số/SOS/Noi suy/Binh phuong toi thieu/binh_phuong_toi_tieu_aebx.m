disp('Dang y=a*e^bx')
A = input ('Nhap ma tran voi cot 1 la cac gia tri cua x, cot 2 la y tuong ung\n');
A (:,2) = log (A(:,2));
m = length(A(:,1));
save matran;
run binh_phuong_toi_tieu_bac1;
if det(H)==0 disp ('Khong tim duoc ham xap xi'),...
else X(1,1)=exp(X(1,1));
disp ('He so a la:')
X(1,1)
disp ('He so b la:')
X(2,1)
saiso=0; A(:,2) = exp (A(:,2));
for i = 1:1:m
    saiso = saiso + (A(i,2)-X(1,1)*exp(X(2,1)*A(i,1)))^2;
end
    saiso = sqrt(1/m * saiso)
    end