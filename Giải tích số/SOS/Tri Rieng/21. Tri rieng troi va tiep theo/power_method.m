function E = power_method(A, m, epsilon)
if A' ~= A
    disp('ma tran A khong vuong');
    return;
end;
E = [];
n = size(A,1);
Y = ones(n,1)/100;
for i = 1:n,
    Q = A^(m+1)*Y./(A^m*Y);
    if abs(max(Q)-min(Q)) < epsilon,
        E = [E max(Q)];
        X = A^(m+1)*Y/max(A^(m+1)*Y);
    else
        Q = A^(m+2)*Y./(A^m*Y);
        if abs(max(Q)-min(Q)) < epsilon,
            E = [E max(Q)];
            X = (A^(2*m)*Y + max(Q)*A^(2*m-1)*y)./ max((A^(2*m)*Y + max(Q)*A^(2*m-1)*y));
        else
            c1 = (A^(m)* Y); c2 = (A^(m + 1)*Y) ; c3=(A^(m+2)*Y);
            a1=c1(1,1)*c2(2,1)-c1(2,1)*c2(1,1);
            a2=c1(2,1)*c3(1,1)-c1(1,1)*c3(2,1);
            a3=c2(1,1)*c3(2,1)-c2(2,1)*c3(1,1);
            r = roots([a1 a2 a3]);
            E = [E r(1)];
            X = c2 - r(1)*c1;
        end;
    end;
I = eye(n);
O = I;
[r,c] = max(X);
X = X/max(X);
O(1:n, c) = O(1:n, c) - X;
A = O*A;
end;
end
        
        
        
        
        
        
        
