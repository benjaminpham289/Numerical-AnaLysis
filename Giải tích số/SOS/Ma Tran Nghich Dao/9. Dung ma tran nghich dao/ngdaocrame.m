function U=ngdaocrame(A);
             if size(A,2)~=size(A,1)
                    disp('A khong co ma tran nghich dao');
             else
               if det(A) ==0
                  disp('A khong co ma tran nghich dao');
               else
                 n=size(A,1);
                 C=zeros(n);
                 for i=1:n
                 for j=1:n
                    B=A;
                    B(i,:)=[];
                    B(:,j)=[];
                    C(j,i)=(-1)^(i+j)*det(B)/det(A);
                 end
                 end
                 U=C;
               end
             end
end

