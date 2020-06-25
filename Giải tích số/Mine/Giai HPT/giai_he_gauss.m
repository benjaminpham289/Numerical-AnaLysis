function x=giai_he_gauss(A,b)
% Giai bang phuong phap Gauss
% input A la ma tran he so
%       b la vecto ve phai he
% output x la vecto nghiem cua he
b=b(:); % dam bao vector luon o dang cot
if det(A)==0 && any(b)~=any(zeros(length(A),1))
    error('he vo nghiem');
end
if det(A)==0 && any(b)==any(zeros(length(A),1))
    error('he co vo so nghiem: chuong trinh khong ho tro tim ho nghiem');
end
n=size(A,1);
nb=n+1; Ab=[A b];
% qua trinh thuan
for i=1:n-1
    for j=i+1:n
        Ab(j,i:nb)=Ab(j,i:nb)-Ab(j,i)*Ab(i,i:nb)/Ab(i,i);
    end
end

% qua trinh nghich
x=zeros(n,1);
x(n)=Ab(n,nb)/Ab(n,n);
for i=n-1:-1:1
    x(i)= (Ab(i,nb)-Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
end