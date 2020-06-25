function [x,ss]=nghiem2(X,y)
    z=zeros(2,1);
    n=size(X,2);
    Y=zeros(1,n);
    for i=1:n
        Y(i)=log10(y(i));
    end
    z=nghiem1(X,Y,1);
    x(1)=10^(z(1,1));
    x(2)=z(2,1)/(log10(exp(1)));
    ss=0;
    for i=1:n
        ss=ss+(y(i)-x(1)*exp(x(2)*X(i)))^2;
    end
    ss=sqrt((1/n)*ss);
end