function y=luythua_n(P,Q,F,my,n,x0)
% P chua p(x) hoac ma tran he so cua p(x)
% Q chua q(x) hoac ma tran he so cua q(x)
% F chua f(x) hoac ma tran he so cua f(x)
% my =[y(0) y'(0)]
syms x;
if length(P)==1
    P=matran(P,n);% tao ma tran chua he so cua p(x)
end
if length(Q)==1
    Q=matran(Q,n);% tao ma tran chua he so cua q(x)
end
if length(F)==1
    F=matran(F,n);% tao ma tran chua he so cua f(x)
end
 
y=my(1)+(x-x0)*my(2);% tinh y 
dy=my(2);
for i=3:n+1
    my(i)=(F(i-2)-P(1:i-2)*dy(i-2:-1:1)'-Q(1:i-2)*my(i-2:-1:1)')/((i-1)*(i-2));% tinh he so cua y(x)
    dy(i-1)=(i-1)*my(i); % tinh he so cua (x-x0)^(i-2) cua y'(x)
    y=y+my(i)*(x-x0)^(i-1); % tinh y
end
fprintf('nghiem gan dung trong lan can x=x0 la \n y=');
disp(vpa(expand(y),4));
fprintf('hay \n y=');
disp(y);
end
