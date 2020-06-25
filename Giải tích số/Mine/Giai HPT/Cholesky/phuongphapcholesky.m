C=load('a.txt');
D=load('b.txt');
A=C'*C;
B=C'*D';
n=length(A);
S=zeros(n);
S(1,1)=sqrt(A(1,1));
if S(1,1)==0
    error('khong giai duoc bang phuong phap cholesky ');
% k la bien chay chi so cot
% h la bien chay chi so hang

else
    %tinh ma tran am giac S thoa man A=S'S
    for k=1:n
        S(1,k)=A(1,k)/S(1,1); %tinh s(1,j)
    end
end
%tinh s(i,i)
for k=2:n
    for h=1:n
        if h==k   
           c=0;
           for l=1:(k-1)
              c=c+S(l,k)*S(l,k);
           end
           S(k,k)=sqrt(A(k,k)-c);
        elseif k<h
            c=0;
 %tinh s(i,j) voi i<j
            for l=1:(k-1)
                c=c+S(l,k)*S(l,h);
            end
            if S(k,k)==0
                error('k giai duoc bang cholesky do det(S)=0');
            else
                S(k,h)=(A(k,h)-c)/S(k,k);
            end
        else
            S(k,h)=0;    %tinh s(i,j) voi i>j
        end
    end
end
disp('ma tran S thoa man la');
disp(S);
%tinh nghiem Y trung gian thoa man S'Y=B
y=zeros(1,n);
y(1)=B(1)/S(1,1);
for k=2:n
    c=0;
    for l=1:(k-1)
        c=c+S(l,k)*y(l);
    end
    y(k)=(B(k)-c)/S(k,k);
end
disp('nghiem trung gian la y=');
disp(y);
%tinh nghiem X ban dau cua bai toan AX=B
x=zeros(1,n);
x(n)=y(n)/S(n,n);
k=n-1;
while k>0
    c=0;
    for l=(k+1):n
        c=c+x(l)*S(k,l);
    end
    x(k)=(y(k)-c)/S(k,k);
    k=k-1;
end
disp('Vay nghiem cua phuong trinh la x=');
disp(x)