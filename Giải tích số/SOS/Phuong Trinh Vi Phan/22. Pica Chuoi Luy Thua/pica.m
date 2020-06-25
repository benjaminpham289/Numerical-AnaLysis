function Y = pica(f,x0,y0,n,k,h)
syms x y;
X=(x0+h):h:(x0+k*h);
Y=y0;
for i=1:n
    Y=xapxihamY(f,Y,y0,x0,h,k);
end
