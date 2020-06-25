function P=NoisuyNguocLagrange(X,Y)
n=size(X,2);
syms x;
P=0;
for i=1:n
    mau=1;tu=1;
    for j=1:n
        if j~=i
        mau=mau*(X(i)-X(j));
        tu=tu*(x-X(j));
        end
    end
    Li=tu/mau;
    P=P+Y(i)*Li;
end
P=expand(P)
end