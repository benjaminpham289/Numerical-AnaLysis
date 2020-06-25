X = [11 13 14 18 19 21];
Y = [1342 2210 2758 5850 6878 9282];
tyhieu = Y;
syms x;
P = 0;
P = P + tyhieu(1);
pX=1;
tyhieu
for j = 1:(length(Y)-1)
    for i = 1:(length(tyhieu)-1)
        tyhieu(i) = (tyhieu(i+1) - tyhieu(i))/(X(i+j)-X(i));
    end
    pX = pX*(x - X(j));
    P = P + tyhieu(1)*pX;
    tyhieu(length(tyhieu)) = [];
    tyhieu
end
P
simplify(P)