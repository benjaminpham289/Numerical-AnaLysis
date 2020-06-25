function U=ngdaogaussjordan(A);
    n=size(A,2);
    if size(A,1)~=size(A,2)
             disp('khong co ma tran nghich dao');
    else
    if det(A)==0, disp('Khong co ma tran nghich dao');
                            return;
    else
        B=eye(n);
        C=[A B];
        for i=1:1:n
            if C(i,i)==0
                for k=i:1:n 
                    if C(k,i)~=0, break;
                    end
                end
                C(i,:)=A(i,:)+C(k,:);
            end
        for i=1:n
        C(i,[1:i-1 i+1:2*n])= C(i,[1:i-1 i+1:end])/C(i,i);
        C(i,i)=1;
        S=C(i,i+1:2*n)
        for j=[1:i-1 i+1:n] 
           C(j,i+1:2*n)= C(j,i+1:2*n)-C(j,i)*S;
        end
        C([1:i-1 i+1:n],i)=0;
        end
        end
    for i=1:n
        C(:,1)=[];
    end
    U=C;
    end
    end
    end
