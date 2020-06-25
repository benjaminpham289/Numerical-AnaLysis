X = [1 2 3 4 6];
Y = [1 4 9 16 25];
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