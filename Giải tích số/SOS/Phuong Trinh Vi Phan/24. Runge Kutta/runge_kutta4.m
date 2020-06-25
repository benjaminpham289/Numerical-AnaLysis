function y = runge_kutta4(f, a, b, N, alpha)
 
 h  = (b-a)/N;
 x = zeros(1, N+1);
 y = zeros(1, N+1);
 x(1) = a;
 y(1) = alpha;
 
 for i = 1:N
  k1 = h*f(x(i), y(i));
  k2 = h*f(x(i)+h/2, y(i)+(k1)/2);
  k3 = h*f(x(i)+h/2, y(i)+(k2)/2);
  k4 = h*f(x(i)+h, y(i)+k3);
  y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
  x(i+1) = a + i*h;
 end
 
 [x' y']
 plot(x, y, '-rd')
end