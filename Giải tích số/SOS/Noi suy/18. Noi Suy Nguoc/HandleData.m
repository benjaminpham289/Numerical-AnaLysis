%Ham xu li bang so lieu, tim cac khoang don dieu cua bang so
%X va Y la 2 vector co cung kich thuoc
function[X,Y]=HandleData(X,Y)
for i=1:size(X,2)-2
        if (Y(i)<Y(i+1))&&(Y(i+1)>Y(i+2))
            for j=(size(X,2)+2):i+4
                Y(j)=Y(j-2);
                X(j)=X(j-2);
            end
            X(i+3)=X(i+1);
            Y(i+3)=Y(i+1);
            X(i+2)=NaN;
            Y(i+2)=NaN;
        elseif (Y(i)>Y(i+1))&&(Y(i+1)<Y(i+2))
            for j=(size(X,2)+2):i+4
                Y(j)=Y(j-2);
                X(j)=X(j-2);
            end
            X(i+3)=X(i+1);
            Y(i+3)=Y(i+1);
            X(i+2)=NaN;
            Y(i+2)=NaN;
        end
end
end