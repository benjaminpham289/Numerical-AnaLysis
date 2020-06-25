function I=hetm(z,c,a)
syms x;
m=size(z,1);
I=0;
for i=1:m
    I=I+(c(i,1))*(subs((z(i)),a));
end