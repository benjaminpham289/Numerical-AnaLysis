function [a,ss]=nghieme(X,y,z)
    syms x;
    m=size(z,1);
    n=size(X,2);
    for i=1:n
        Y(i)=log10(y(i));
    end
    z(m+1)=x^(0);
    c=hedltt(X,Y,z);
    for i=1:m
        a(i,1)=c(i)/(log10(exp(1)));
    end
    a(m+1,1)=10^(c(m+1));
    ss=0;
    for i=1:n
        ss=ss+(y(i)-hee(z,a,X(i)))^2;
    end
    ss=sqrt((1/n)*ss);
    ss=double(ss);
end
