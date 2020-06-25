function NoiSuyNguoc(X,Y)
if size(X,2)~=size(Y,2)
    fprintf('Input khong hop le!!!');
else
[X,Y]=HandleData(X,Y);
count=1;n=size(X,2);
for i=1:n
    if isnan(X(i))||i==n
        x=X([count:i-1]);
        y=Y([count:i-1]);
        NoisuyNguocLagrange(x,y);
        count=i+1;
    end
end
end
end