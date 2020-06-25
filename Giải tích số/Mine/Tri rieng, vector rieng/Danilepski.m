function Danilepski(A);

%Dau tien can nhap ma tran vuong A can tim tri rieng va vecto rieng
%Sau do dung lenh Danilepski(A);
%Hoac co the thay truc tiep A bang 1 ma tran vuong
%VD Danilepski([3 4 3;5 2 4;6 7 8]);

A
n=length(A);
T=eye(n);
Tnd=eye(n);

% Tim ma tran dong dang
for i=n:-1:2
    if A(i,i-1)==0
        for j=1:1:i-1
           if A(i,j)~=0
               M=eye(n);
               M(i-1,i-1)=0;
               M(j,j)=0;
               M(i-1,j)=1;
               M(j,i-1)=1;
               A=M*A*M;
               T=M*T;
               Tnd=Tnd*M;
               break;
           end
        end
    end
    if A(i,i-1)~=0
        M=eye(n);%Tao ma tran M
        for j=1:1:n
            M(i-1,j)=A(i,j);
        end
        Mnd=eye(n);%Tao ma tran nghich dao cua M
        for j=1:1:n
           if j==i-1 Mnd(i-1,j)=1/A(i,i-1); 
            else Mnd(i-1,j)=-A(i,j)/A(i,i-1);
            end
        end
        T=M*T;
        Tnd=Tnd*Mnd;
        A=M*A*Mnd;
    end
end
P=A
T
Tnd
fprintf('\nP=T*A*Tnd\n');

%In ra da thuc dac trung
fprintf('\nDa thuc dac trung cua A la:\nP(x)=');
k=n;
x=[];
for i=1:1:n
    x(i)=0;
end
B=[x' A];
while k~=0
    for i=k:-1:1
        if B(i,i)==0
            fprintf('(');
            for j=k-i+1:-1:0
                if j==k-i+1
                    fprintf('%.4fx^%.0f + ',(-1)^j,j);
                else
                    if j==0
                        fprintf('%.4f',(-1)^(k-i+1)*(-A(i,k)));
                    else if j==1
                          fprintf('%.4fx + ',(-1)^(k-i+1)*(-A(i,k-1)));  
                        else
                            fprintf('%.4fx^%.0f + ',(-1)^(k-i+1)*(-A(i,k-j)),j);
                        end
                    end
                end
            end
            fprintf(')');
            k=i-1;
        end
    end
end

%Tim Vecto rieng cua ma tran
fprintf('\n');
k=n;
while k~=0
    for i=k:-1:1
        if B(i,i)==0
            c=[1 -A(i,i:k)];
            x=roots(c);
            for j=1:1:(k-i+1)
                y=[];
                for h=1:1:n 
                    y(h)=0;
                end
                for h=k:-1:i
                    y(h)=x(j)^(k-h);
                end
                fprintf('\nGia tri rieng x=');
                disp(x(j));
                m=i-1;
                while m~=0
                    for v=m:-1:1                                        
                        if B(v,v)==0
                            z=[];                            
                            for h=1:1:(m-v+1)                        
                                z(h)=x(j)^(m-v+1-h); 
                            end                             
                            s=[-A(v,v:m)]*z'+x(j)^(m-v+1);
                            q=[A(v,m+1:k)]*y(m+1:k)';
                            if (s==0)&(q==0)
                                for h=m:-1:v
                                    y(h)=0;
                                end
                            else 
                                if(s==0)&(q~=0)
                                    for h=m:-1:v
                                        y(h)=x(j)^(m-h); 
                                    end
                                    for h=m+1:1:k
                                        y(h)=0;
                                    end
                                else                                     
                                    y(m)=q/s;                              
                                    for h=m-1:-1:v
                                        y(h)=y(h+1)*x(j);
                                    end
                                end
                            end
                            m=v-1;
                        end
                    end
                end
            fprintf('Vecto rieng:\n');
            disp(Tnd*y');
            end
            k=i-1;
        end
    end
end

%The End