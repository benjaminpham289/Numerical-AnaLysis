function output = GaussJordan(A)
% Ma tran A nhap trong file txt. nhe - Ca cot he so luon
n = size(A,1);
r = 1:n;                                 
c = 1:n;
for k = 1:n
    p=0;
    B(r,c)=A(r,c);
    [p, q]=find(abs(B),1); 
    if p==0
        [p, q] = find(abs(B) == max(max(abs(B(r, c)))), 1); 
    end;   
    % tim phan tu troi
    if A(p,q)~=0   
        % truong hop bang con toan phan tu 0 thi dung
        r((r == p)) = []; 
        c((c == q)) = [];
        % xoa chi so hang, cot giai
        m = A(p, q); 
        A(p,:) = A(p,:) ./ m;
        % chia hang giai cho phan tu giai
        for i = 1 : n
            if i ~= p
                m = A(i,q);
                A(i,:) = A(i,:) - A(p,:) .* m;
            end
        end
        % thao tac tren cac hang khac
        if p~=q
            temp=A(p,:);
            A(p,:)=A(q,:);
            A(q,:)=temp;
        end
        % sap xep lai de duoc ma tran don vi
        B(p,:)=0;B(:,q)=0;
    end
end    
output = A;
end