function [Q,x]=cholesky(A,b)
if (size(A,1)~=size(A,2)) 
    fprintf('Ma tran A khong vuong');
    return;
end
C=A'*A;
b1=A'*b;
n=size(C,1);
Q=zeros(n,n); 
if (det(A)==0) 
    fprintf('C khong xac dinh duong');
    return;
end
for i=1:n %phan tich ma tran
    for j=i:n
        if (j==1)
            s=C(i,i);
        else 
            s=C(i,j)-Q(1:i-1,i)'*Q(1:i-1,j);
        end
        if j>i
            Q(i,j)=s/Q(i,i);
        else
            Q(i,i)=sqrt(s);
        end
    end
end
y=zeros(n,1);
y(1)=b1(1)/Q(1,1); %giaihe Q^t*y=b1
for i=2:n
    s=b1(i)-Q(1:i-1,i)'*y(1:i-1);
    y(i)=s/Q(i,i);
end
x=zeros(n,1);
x(n)=y(n)/Q(n,n); %giai he Qx=y
for i=n-1:-1:1
    s=y(i) -Q(i,i+1:n)*x(i+1:n);
    x(i)=s/Q(i,i);
end
end
