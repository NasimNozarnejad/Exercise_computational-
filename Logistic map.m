x=zeros(1,1000);

for r=2:0.01:4
    x(1)=rand();
    for i=1:1000
       x(1)=r*x(1)*(1-x(1));
   end
    for i=1:999
        x(i+1)=r*x(i)*(1-x(i));
    end
hold on
plot(r,x)
end
hold off
xlabel('r')
ylabel('x')


    
