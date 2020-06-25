function I=hee(z,a,t)
syms x;
I=1;
m=size(z,1);
for i=1:(m-1)
    I=I*exp((a(i))*(subs((z(i)),t)));
end
I=I*a(m);
end