function T = chebyshev(n)
% tra ve da thuc chebyshev cap n.
syms x;
if n <= 0
    T = 1;
    return;
else if n == 1;
    T = x;
    return;
    end;
T = 2*x*chebyshev(n-1)-chebyshev(n-2);
T = expand(T);
end;