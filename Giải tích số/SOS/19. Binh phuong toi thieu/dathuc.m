function I=dathuc(A,x)
    n=size(A,1);
    I=0;
    for i=1:n
        I=I+A(i,1)*x^(i-1);
    end
end