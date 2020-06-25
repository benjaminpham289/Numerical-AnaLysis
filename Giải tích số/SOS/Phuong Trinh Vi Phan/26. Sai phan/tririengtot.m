function r=tririengtot(u,v)%u,v la 2 vector gom cac tri rieng
    m=size(u);
    n=size(v);
    c=abs(u(1,1)-v(1,1));
    for i=1:m
        for j=1:n
            if abs(u(i,1)-v(j,1))<=c
                ld=u(i,1);
            end
        end
    end
    r=ld;%r la tri rieng trong vecto u ma no chenh lech it nhat voi cac gia tri trong vecto v
end