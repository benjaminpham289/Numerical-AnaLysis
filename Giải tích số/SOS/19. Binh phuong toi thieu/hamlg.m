function I=hamlg(A,x)
    k=size(A,1);
    I=0;
    for i=2:2:k-1
        I=I+A(i,1)*(cos((i/2)*x));
    end
    for i=3:2:k
        I=I+A(i,1)*(sin(((i-1)/2)*x));
    end
    I=I+A(1,1);
end