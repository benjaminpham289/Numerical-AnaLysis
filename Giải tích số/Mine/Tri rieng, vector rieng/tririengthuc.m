%tririengthuc
function [] = tririengthuc(A) 
% Tim gia tri rieng lon nhat  
% bang thuat loan lap luy thua 
[n,m] = size(A); 
if n ~= m 
    error('Chi dung cho cac ma tran vuong');  
end 

saiso=0.001;
vectorieng=ones(n,1);
sobuoclap=0;

while sobuoclap<=200
   Q=A*vectorieng;
   Y=Q./vectorieng;
   lambda=max(Y);
   lambda1=min(Y);
   if abs(lambda1-lambda)<saiso
       break;
   end
   vectorieng=Q;
   sobuoclap=sobuoclap+1;
end

if sobuoclap==201
    fprintf('Khong the tim tri rieng bang phuong phap nay');
else
    disp(lambda);
    x=max(vectorieng);
    disp(vectorieng./x);
    disp(sobuoclap);
end