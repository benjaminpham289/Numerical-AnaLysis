function I=tong1(a,b,X)
    n=size(X,2);
    I=0;
    for i=1:n 
        I=I+(subs(a,(X(i))))*(subs(b,(X(i))));
    end
end