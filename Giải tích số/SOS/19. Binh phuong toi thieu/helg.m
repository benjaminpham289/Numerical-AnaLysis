function [x,ss]=helg(X,y,k)
    n=size(X,2);
    t=ones(k,n);
    A=zeros(k,n);
    B=zeros(k,n);
    C=zeros(2*k+1,2*k+1);
    m=zeros(k,n);
    for i=1:k
        for j=1:n
            A(i,j)=sin(i*X(j));
            B(i,j)=cos(i*X(j));
        end
    end
    for j=1:n
        for i=1:k
            m(i,j)=y(j);
        end
    end
    for i=2:2:2*k
        Y(i,1)=hamtonglg(B,m,i/2,1);
    end
    for i=3:2:2*k+1
        Y(i,1)=hamtonglg(A,m,(i-1)/2,1);
    end
    Y(1,1)=hamtonglg(m,t,1,1);
    for i=2:2:2*k
        for j=2:2:2*k
            C(i,j)=hamtonglg(B,B,j/2,i/2);
        end
    end
    for i=3:2:2*k+1
        for j=3:2:2*k+1
            C(i,j)=hamtonglg(A,A,(j-1)/2,(i-1)/2);
        end
    end
    for i=2:2:2*k
        C(1,i)=hamtonglg(B,t,i/2,1);
        C(i,1)=hamtonglg(B,t,i/2,1);
    end
    for i=3:2:2*k+1
        C(1,i)=hamtonglg(A,t,(i-1)/2,1);
        C(i,1)=hamtonglg(A,t,(i-1)/2,1);
    end
    C(1,1)=n;
    x=C\Y;
    ss=0;
    for i=1:n
        ss=ss+(y(i)-hamlg(x,X(i)))^2;
    end
    ss=sqrt((1/(2*k))*ss);
    
end
