function [inv]=inv_lapdon(A,eps)
% input - A la ma tran vuong
format long
if det(A)~=0
    n=size(A,1);
    E=eye(n);
    G0=zeros(n);
    q=0.7;
    G0(1,1)=q;
    X=zeros(n);
    b=E-G0;
    %giai phuong trinh AX=E-G0 bang phuong phap khu gauss
    for i=1:n
        X(:,i)=GaussEZ([A b(:,i)]);
    end
    k=0;
    a=norm(X);
    ss=eps+1;
    while ss>eps
        k=k+1;
        X=X*(2*E-A*X);
        ss=(a/(1-q))*q^(2^k);
    end
    inv=X;
else
    disp('ma tran khong co nghich dao');
end
end
