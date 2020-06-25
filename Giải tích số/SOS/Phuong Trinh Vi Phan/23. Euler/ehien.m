%Ap dung phuong phap Euler giai ptvp cap 1
%Input:_ f la ham f(x,y)
%         _ [x0,xn] la doan can tinh nghiem
%         _ y0 la gia tri ban dau cua an ham
%         _ buoc h
%         _ epsilon
%Output:_ yn la gia tri y(xn)
function yn = ehien(f, x0, y0, xn, h, epsilon)
    if nargin == 5
        yn = euler_hien(f, x0, y0, xn, h);
    end
    if nargin == 6
        d = (epsilon/2);
        while d >= (epsilon / 2)
            yn = euler_hien(f, x0, y0, xn, h);
            zn = euler_hien(f, x0, y0, xn, h / 2);
            d = abs(zn - yn);
            h = h / 2;
        end
    end
    x = (x0:h:xn);
    n = length(x);
    y = y0 * ones(n, 1);
    for i = 2:n
        y(i) = y(i - 1) + h * f(x(i - 1), y(i - 1));
    end
    [x' y]
    plot(x, y, '-d');
    h
end
function z = euler_hien(f, x0, y0, xn, h)
    x = (x0:h:xn);
    n = length(x);
    y = y0 * ones(n, 1);
    for i=2:n
        y(i) = y(i - 1) + h * f(x(i - 1), y(i - 1));
    end
    z = y(n);
end