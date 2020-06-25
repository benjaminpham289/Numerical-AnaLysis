function p=dtlt(n)
syms x;
p=1;
if(n>1)
    for i=1:n-1
        p=p*(x+i-1)/(i);
    end
    p=int(p,x,0,1);
end
end
