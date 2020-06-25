disp ('Phuong phap day cung')
disp('(Trong khoang phan ly nghiem (a,b)');
f=input('Nhap ma tra he so cua PT (Duoi dang ma tran cot): ');
a=input('Nhap can duoi a: ');
b=input('Nhap can tren b: ');
e=input('Nhap sai so mong muon: ');
syms x; F = 0;
longf = length(f);
for i = 1:1:longf
    F = F + x^(longf-i)*f(i);
    end
dF=diff(F,x);
ddF=diff(dF,x);
n=0;
if (subs(F,{x},b)*subs(ddF,{x},b)>0)
    while(1)
        y=b-(subs(F,{x},b)/subs(dF,{x},b));
        m=min(abs(subs(dF,{x},b)),abs(subs(dF,{x},a)));
        M=max(abs(subs(ddF,{x},b)),abs(subs(ddF,{x},a)));
        if (abs(subs(F,{x},y))/m<e) break
        elseif (M/(2*m)*(abs(y-b))^2<e) break;
        end;
        b=y;
        n=n+1;
    end;
    disp(n);
else
   while(1)
        y=a-(subs(F,{x},a)/subs(dF,{x},a));
        m=min(abs(subs(dF,{x},b)),abs(subs(dF,{x},a)));
        M=max(abs(subs(ddF,{x},b)),abs(subs(ddF,{x},a)));
        if (abs(subs(F,{x},y))/m<e) break
        elseif (M/(2*m)*(abs(y-a))^2<e) break;
        end;
        a=y;
        n=n+1;
    end;
    disp(n); 
end;      
    fprintf('Nghiem cua PT tim duoc la: %.10f\n',y);

