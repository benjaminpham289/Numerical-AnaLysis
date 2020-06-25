function P = gauss2(x0,h,n,Y)
    syms x y z P;
    if (rem(n,2)==0)
        error('n phai chia 2 du 1 :v');
    end
    if (n ~= length(Y))
        error('Kich co phai bang nhau');
    end
    t = (n+1)/2; %day la trung tam
    d = Y(:);
    k = n;
    y = 1;
    P = Y(t);
    z = (x - x0 - (t-1)*h)/h;
    for j = 2:n       
        if (rem(j,2)==0)
           for i = k-1:-1:1              
               d(i) = Y(i+1) - Y(i);
           end                     
               y = y*d(t-1)*(z-(j-2)/2)/(j-1);
               disp(y);
               P = P + y;
               k = k - 1;
               y = y/d(t-1);               
               Y = d(:);
        end
        if (rem(j,2)==1)
           for i = k-1:-1:1
               d(i) = Y(i+1) - Y(i);
           end
               y = y*d(t-1)*(z - (1 -j)/2)/(j-1);
               disp(y);
               P = P + y;
               k = k - 1;
               y = y/d(t-1);
               Y = d(:);
               t = t - 1;
        end    
    end
    P = expand(P);
end