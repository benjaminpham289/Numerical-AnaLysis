load matran;
H = zeros (2);
I = zeros (2,1);
for i = 1:1:m
    H(1,1) = m; H(1,2) = H(1,2)+A(i,1);
    H(2,1)=H(1,2); H(2,2) = H(2,2) +A(i,1)^2;
    I(1,1) = I(1,1)+A(i,2); I(2,1) = I(2,1)+A(i,1)*A(i,2);
end
if det(H) == 0, else  X = H^-1*I; end