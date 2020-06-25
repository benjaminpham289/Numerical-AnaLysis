function z = ptvpk(f, gtbd, x0, xn, h, k)
    n = (xn - x0) / h;
    x = (x0:h:xn);
    y = ones(n, 1);
    temp = gtbd;
    y(1) = gtbd(1);
    for i = 1:n
        x(i+1) = x0 + i * h;
        uhm = temp(k) + h * f(x(i), temp);
        for j = 1:k - 1
            temp(j) = temp(j) + h * temp(j + 1);
        end
        y(i + 1) = temp(1);
        temp(k) = uhm;
    end
    [x' y]
    plot(x, y, '-rd')
end