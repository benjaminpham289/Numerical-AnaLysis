function P = betxendm(x0,h,n,Y)
    syms x P1 P2 P;
    if (rem(n,2)==1)
        error('n phai chia 2 du 0 :v');
    end
    if (n ~= length(Y))
        error('Kich co phai bang nhau');
    end
    P1 = gauss2(x0+h,h,n-1,Y(2:n));
    P2 = gauss1(x0,h,n-1,Y(1:n-1));
    P = P1 + P2;
end

    