function Q = tichphankeplai(fun,x1,x2,y1,y2,n,m,x,y)
h=(x2-x1)/(2*n);
k=(y2-y1)/(2*m);
z=zeros(2*n+1,2*m+1);
I=zeros(n,m);
X=x1:h:x2;
Y=y1:k:y2;
for j=1:(2*m+1)
    for i=1:(2*n+1)
        z(i,j)=subs(subs(fun,x,X(i)),y,Y(j));
    end
end
for i=1:n
    for j=1:m
         I(i,j)=h*k*((z(2*i-1,2*j-1)+z(2*i-1,2*j+1)+z(2*i+1,2*j-1)+z(2*i+1,2*j+1))+4*(z(2*i,2*j-1)+z(2*i,2*j+1)+z(2*i-1,2*j)+z(2*i+1,2*j))+16*z(2*i,2*j))/9;
    end
end
Q=0;
for i=1:n
    for j=1:m
        Q=Q+I(i,j);
    end
end
end