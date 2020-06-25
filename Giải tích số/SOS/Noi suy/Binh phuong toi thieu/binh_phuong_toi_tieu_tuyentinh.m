disp ('Phuong phap binh phuong be nhat dang y=a0+a1.x+a2.x^2+...+an.x^n')
A = input ('Nhap ma tran cac gia tri voi cot 1 la x va cot 2 la y tuong ung\n');
m = length(A(:,1));
n = input('Nhap bac cua ham xap xi mong muon  ');
n1 = 2*n+1;
K = zeros (n1,1);
format long
for i = 1:1:n1
    for j =1:1:m
        K(i,1) = K(i,1)+ A(j,1)^(i-1);
    end
end
H = zeros (n+1);
for i = 0:1:n
    for j =0:1:n
        H(i+1,j+1) = K(i+j+1,1);
    end
end
I = zeros (n+1,1);
for i = 1:1:(n+1)
    for j = 1:1:m
        I(i,1)=I(i,1)+A(j,2)*A(j,1)^(i-1);
    end
end
if det(H)==0 disp ('Khong tim duoc ham xap xi'),...
else disp ('Ma tran cot cac he so a0 a1 a2 ... la '), X = H^-1*I
    disp ('Sai so cua phuong phap la:  '),saiso=0;
    for i = 1:1:m
        Fx = 0;
    for j = 0:1:n
       Fx = Fx+ X(j+1,1)*A(i,1)^j;
    end
   saiso = saiso + (A(i,2)-Fx)^2;
   end
saiso = sqrt(1/m*saiso)
end