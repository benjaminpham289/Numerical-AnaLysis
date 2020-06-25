function g=newtonmocbatki(X,Y)
        syms x;
        n=length(Y)-1;
        A=zeros(n+1,n);
        B=[Y A];
                 for j = 2:(n+1)   ;
                                 for i=j : (n+1)     ;
                                      B(i,j)=(B(i ,j-1)-B(i-1,j-1))/(X(i)-X(i-j+1));
                                 end ;
                 end;
        d=zeros(n,2);
        p=zeros(n+1,n+1);
        s=[1];
        p(n+1,n+1)=B(1,1);
                 for t=1:n             d(t,:)=[1,-X(t)];
                 end;
    for i=1:n ;
          s=conv(s,d(i,:));
          t=(n-i);
          p(i,:)=[zeros(1,t) s];
          p(i,:)=p(i,:)*B(i+1,i+1);
          p(n+1,:)=p(n+1,:)+p(i,:);
    end;
    g=0;
    for i=1:n+1
        g=g+p(n+1,i)*x^(n+1-i);
    end
