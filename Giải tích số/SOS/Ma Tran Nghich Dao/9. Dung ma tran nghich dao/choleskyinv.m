function B=choleskyinv(A)
if (size(A,1)~=size(A,2)) 
   fprintf('Ma tran A khong vuong');
   fprintf('\nA khong co ma tran nghich dao');
    return;
end
if (det(A)==0) 
  fprintf('\nA khong co ma tran nghich dao');
    return;
end;
C=A'*A;
n=size(C,1);%tim ma tran nghich dao
Q=cholesky(A,zeros(n,1)); 
P=zeros(n,n);
for i=1:n
    P(i,i)=1/Q(i,i);
end
for i=n-1:-1:1
    for j=i+1:n
        P(i,j)=-Q(i,i+1:n)*P(i+1:n,j)/Q(i,i);
    end
end
C1=P*P';
B=C1*A';
