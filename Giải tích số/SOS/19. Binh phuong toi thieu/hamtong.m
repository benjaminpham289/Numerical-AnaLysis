function I=hamtong(X,k,t)
  n=size(X,2);
  I=0;
  for i=1:n
       I=I+t(i)*X(i)^k;
  end
end
       