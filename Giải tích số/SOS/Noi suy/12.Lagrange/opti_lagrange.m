function p = opti_lagrange(f,n,a,b)
%sap xi ham f bang 1 da thuc cap n tren doan a, b
x = zeros(n+1,1);
for i = 0:n
    x(i+1) = 1/2*((b-a)*cos((2*i+1)/(2*(n+1))*pi) + b + a)
end;
y = zeros(n+1,1);
for i = 1:n+1
    y(i) = f(x(i))
end;
p = langrange(x,y);
end