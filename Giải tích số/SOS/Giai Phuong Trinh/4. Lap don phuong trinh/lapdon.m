function [x,k] = lapdon(g,q,x0,epsilon)
if nargin<4
epsilon = 1e-5;
end
delta = epsilon*(1-q)/q;
k = 1;
x = feval(g,x0);
while (abs(x - x0) >= delta)
x0 = x;
x = feval(g,x0);
k = k+1;
end
disp('Sai so la:');
disp(abs(x-x0)*q/(1-q));
end