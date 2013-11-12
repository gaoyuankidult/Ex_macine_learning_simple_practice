clc 
a= rand(1000, 800);
b= rand(1000, 800);


tic; d = sqrt( sum((a-b) .* (a-b),2)); toc;
%method A:
tic;k= (a-b); d = sqrt( sum( k.*k,2)); toc;

%method B
tic; d = sqrt( sum(a.*a + b.*b - 2 *( a .*b),2)); toc;

%method C
tic;
aa=sum(a.*a,1); bb=sum(b.*b,1);
 d = abs(aa( ones(size(bb,2),1), :)' + bb( ones(size(aa,2),1), :) - 2*a'*b); toc