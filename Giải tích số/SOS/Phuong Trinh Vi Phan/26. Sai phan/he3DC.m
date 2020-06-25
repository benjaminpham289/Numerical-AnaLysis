function x=he3DC(M)
n = size(M,1)-1;
anpha = zeros(1,n+1); anpha(1)= -M(1,2)/M(1,1);
beta = zeros(1,n+1); beta(1)= M(1,n+2)/M(1,1);
A = zeros(1,n); B = zeros(1,n); C = zeros(1,n);d = zeros(1,n);
for i= 1:n
    A(i) = M(i+1,i);
    B(i) = M(i+1,i+2);
    C(i) = -M(i+1,i+1);
    d(i) = -M(i+1,n+2);
        %thiet lap cac day Ai,Bi,Ci,di cua he 3duong cheo
    anpha(i+1) = B(i)/(C(i)-anpha(i)*A(i));
    beta(i+1) = (A(i)*beta(i)+d(i))/(C(i)-anpha(i)*A(i));
        %tinh day anpha, beta
end
x = zeros(1,n+1); 
x(n+1) = (A(n)*beta(n) + d(n))/(C(n) - A(n)*anpha(n));
        %tinh xn truoc
for i= n:-1:1
    x(i) = anpha(i)*x(i+1) + beta(i);
end
disp(x);
        %tinh day xi