function [x,ss]=nghiem1(X,y,m)
   n=size(X,2);
   A=zeros(m+1,m+1);
   Y=zeros(1+m,1);
   t=ones(n,1);
   for i=1:m+1
       Y(i,1)= hamtong(X,i-1,y);
       for j=1:m+1
               A(i,j)=hamtong(X,i+j-2,t);
       end
   end
   x=A\Y;
   ss=0;
   for j=1:n
           ss=ss+(y(j)-dathuc(x,X(j)))^2;
   end
   ss=sqrt((1/n)*ss);
   
end
