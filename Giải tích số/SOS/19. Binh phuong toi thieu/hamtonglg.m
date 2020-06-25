function I=hamtonglg(A,B,a,b)
    n=size(A,2);
    I=0;
    for i=1:n
        I=I+(A(a,i))*(B(b,i));
    end
end