% cooling equation
clear
TR=25;
TL=60;
k=0.5;
X=1000;
h_0=0.1;
deltah=0.005;
T=100;
h=deltah;
for j=1:T
    for i=1:X
        t=i*h;
        T_th(j,i) = TR + (TL - TR)*exp(-k*t);
    end
end

T_n=zeros(T,X);
T_n(:,1)=TR;
T_n(:,end)=TL;
for j=1:T

    for i=2:X-1
        t = i*h;
        T_n(j,i+1) = T_n(j,i+1) + (TL- T_n(j,i-1))*exp(-k*t);
    end
end
I=(1:X);
figure;plot(h_0*I(1:X),T_th,'--');
hold on
plot(h_0*I(1:X),T_n);title('Temperature per distance');
legend('Theoretical','Numerical');xlabel('distance');ylabel('Temperature');

    
    
    
