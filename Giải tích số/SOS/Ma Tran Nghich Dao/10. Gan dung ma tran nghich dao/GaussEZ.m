function x= GaussEZ(A);
n=size(A,2)-1;
  for i=1:n
      while A(i,i)==0
             for k=i:n
              if A(k,i)~=0, break;
              end
             end
           A(i,:)=A(i,:)+A(k,:);   
      end
     for j=i+1:n
         A(j,1:end)=A(j,1:end)-A(j,i)*A(i,1:end)/A(i,i);
     end
  end
                x=zeros(n,1);
                x(n)=A(n,n+1)/A(n,n);
                i=n-1; 
                while i>0
                    x(i)=(A(i,n+1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
                    i=i-1;
                end
  end   