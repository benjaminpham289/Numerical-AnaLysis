function I=luoitrum(fun,a,b,epsilon)
n=1;
I1=simpson(fun,a,b,n);
I2=simpson(fun,a,b,n+1);
while(abs(I2-I1)>=epsilon)
    n=n+1;
    I1=I2;
    I2=simpson(fun,a,b,n+1);
end
I=I2;
end
