function Y = xapxihamY(f,Y,y0,x0,h,k)
syms t x y;
X=(x0+h):h:(x0+k*h);
f=subs(f,y,Y);  %tinh f tai y=Y
I(1)=y0+h*(subs(f,x,x0)+subs(f,x,X(1)))/2;
for i=2:k       
    I(i)=I(i-1)+h*(subs(f,x,X(i-1))+subs(f,x,X(i)))/2;
end
I=[y0 I];X=[x0 X];
plot(X,I);
hold on;
I=I';
Y=vpa(newtonmocbatki(X,I));
end
