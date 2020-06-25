function Q=nghichdao(A)
if(det(A)==0) fprintf(' Ma tran A khong kha nghich');
else
n=size(A,1);
D=zeros(n,n);
D=A';
A=A*D;
U=zeros(2,2);
delta=A(1,1)*A(2,2)-A(1,2)*A(2,1);
U(1,1)=A(2,2)/delta;
U(1,2)=-A(1,2)/delta;
U(2,1)=-A(2,1)/delta;
U(2,2)=A(1,1)/delta;
Q=zeros(size(A));
for i=3:n
    a11=A(1:i-1,1:i-1);
    a12=A(1:i-1,i);
    a21=A(i,1:i-1);
    a22=A(i,i);
    X=U*a12;
    Y=a21*U;
    Z=a22-a21*X; 
    T=1/Z;
    B11=U+X*T*Y;
    B12=-X*T;
    B21=-T*Y;
    B22=T;
    U=[B11 B12; B21 B22];
end
Q=D*U;
end
end
