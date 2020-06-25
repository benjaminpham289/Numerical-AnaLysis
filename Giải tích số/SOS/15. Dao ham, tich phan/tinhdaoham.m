function I =tinhdaoham(s,p,X,Y)
if p==1 %p la cap cua dao ham va s la vi tri can tinh dao ham cua X(s);
   if  length(X)==3
       h=(X(2)-X(1));
       y=zeros(1,3);
       y(1)=(-3*Y(1)+4*Y(2)-Y(3))/(2*h);
       y(2)=(-Y(1)+Y(3))/(2*h);
       y(3)=(Y(1)-4*Y(2)+3*Y(3))/(2*h)
       for i=1:3
          if i==s
              I=y(i);
          end
       end
   end
    if length(X)==4
      h=(X(2)-X(1));
      y=zeros(1,4);
      y(1)=(-11*Y(1)+18*Y(2)-9*Y(3)+2*Y(4))/(6*h);
      y(2)=(-2*Y(1)-3*Y(2)+6*Y(3)-Y(4))/(6*h);
      y(3)=(Y(1)-6*Y(2)+3*Y(3)+2*Y(4))/(6*h);
      y(4)=(-2*Y(1)+9*Y(2)-18*Y(3)+11*Y(4))/(6*h);
      for i=1:4
          if i==s ,  I=y(i);
          end
      end  
    end
end
if p==2
    h=X(2)-X(1);
    y(2)=(Y(1)-2*Y(2)+Y(3))/(h*h);
    I= y(2);
end
if p==3
    h=X(2)-X(1);
    y(3)=(Y(5)-2*Y(4)+2*Y(2)-Y(1))/(2*h*h*h);
    I=y(3);
end
if p==4
    h=X(2)-X(1);
    y(3)=(Y(5)-4*Y(4)+6*Y(3)-4*Y(2)+Y(1))/(h^4);
    I=y(3);
end
end

     


    
    