function [c,ss]=hedltt(X,y,z)
    syms x;
    n=size(X,2);
    m=size(z,1);
    A=zeros(m,m);
    Y=zeros(m,1);
    c=zeros(m,1);
    for i=1:m
        Y(i,1)=tong2(y,z(i),X);
    end
    for i=1:m
        for j=1:m
            A(i,j)=tong1(z(i),z(j),X);
        end
    end
    c=A\Y;
    ss=0;
    for i=1:n
        ss=ss+(y(i)-hetm(z,c,X(i)))^2;
    end
    ss=sqrt((1/n)*ss);
    c=double(c);
    ss=double(ss);
end
    
    