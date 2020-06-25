function x=kiemtra3dc(M)
error = 0;
n=size(M,1);
if -M(1,2)/M(1,1)<0 
    error=1;
end
if -M(1,2)/M(1,1)>=1
    error=1;
end
if -M(n,n-1)/M(n,n)<0
    error=1;
end
if -M(n,n-1)/M(n,n)>=1
    error=1;
end
    %kiem tra hang dau va hang cuoi
    A=zeros(n-2,1); B=zeros(n-2,1); C=zeros(n-2,1); D=zeros(n-2,1);
for i= 1:n-2
    A(i) = M(i+1,i);
    B(i) = M(i+1,i+2);
    C(i) = -M(i+1,i+1);
    D(i) = C(i)-A(i)-B(i);
end
for i=1:n-2
    if A(i)<=0
        error=1;
    end
    if B(i)<=0
        error=1;
    end
    if D(i)<0;
        error=1;
    end
end
    %kiemtra Ai, Bi > 0 va Ci>=Ai+Bi
if error ==1
    disp('Ma tran nhap vao ko thoa man dieu kien on dinh');
else
    j = size(M,1)-1;
anpha = zeros(1,j+1); anpha(1)= -M(1,2)/M(1,1);
beta = zeros(1,j+1); beta(1)= M(1,j+2)/M(1,1);
A = zeros(1,j); B = zeros(1,j); C = zeros(1,j);d = zeros(1,j);
for i= 1:j
    A(i) = M(i+1,i);
    B(i) = M(i+1,i+2);
    C(i) = -M(i+1,i+1);
    d(i) = -M(i+1,j+2);
        %thiet lap cac day Ai,Bi,Ci,di cua he 3duong cheo
    anpha(i+1) = B(i)/(C(i)-anpha(i)*A(i));
    beta(i+1) = (A(i)*beta(i)+d(i))/(C(i)-anpha(i)*A(i));
        %tinh day anpha, beta
end
x = zeros(1,j+1); 
x(j+1) = (A(j)*beta(j) + d(j))/(C(j) - A(j)*anpha(j));
        %tinh xn truoc
for i= j:-1:1
    x(i) = anpha(i)*x(i+1) + beta(i);
end

end



