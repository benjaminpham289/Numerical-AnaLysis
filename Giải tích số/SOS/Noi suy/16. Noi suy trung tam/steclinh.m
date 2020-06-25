function P = steclinh(x0,h,n,Y)
    syms x P1 P2 P;
    if (rem(n,2)==0)
        error('n phai chia 2 du 1 :v');
    end
    if (n ~= length(Y))
        error('Kich co phai bang nhau');
    end
    P1 = gauss1(x0,h,n,Y);
    P2 = gauss2(x0,h,n,Y);
    P = (P1 + P2)/2;
end
