clear
%-------set5-prob5------%

%double precisions
m=0;
a=0.5;
while m~=1
    a=a/10;
    m=1+a;
end
a
%single precisions
n=0;
b=0.5;
while n~=1
    b=b/10;
    n=1+single(b);
end
