r=3:0.001:4;
n=length(r);
x=zeros(1,n);
R=zeros(1,n);
Landa=zeros(1,n);
j=0;
for r=3:0.001:4
    x(1)=rand();
    landa=0;
    j=j+1;
    for i=1:n
        x(1)=r*x(1)*(1-x(1));
    end
    
    for i=1:n-1
    x(i+1)=r*x(i)*(1-x(i));
    landa=landa+log(abs(r-2*r*x(i+1)));
    end
    Landa(j)=landa/1000;
    
 R(1,j)=r;   
end
plot(R,Landa)
xlabel('r');ylabel('Landa')
