function I=tong2(y,b,X)
    n=size(X,2);
    I=0;
    for i=1:n 
        I=I+(y(i))*(subs(b,(X(i))));
    end
end