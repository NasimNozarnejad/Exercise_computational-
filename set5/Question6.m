clear

 %--------------set5-prob6---------------%
 Nt=100000;
 tmax=50; 
 tmin=0;
dt=(tmax-tmin)/(Nt-1);
t=tmin:dt:tmax;
y=[];
A=[];
y(1)=3; %Initial value
A(1)=0; %Initial value
a=1; 
w=1; 
w1=2;

for i=1:Nt-1
    f1(i)=A(i);
    g1(i)=-a*f1(i)-w^2*y(i)+cos(w1*i*dt);
    f2(i)=f1(i)+g1(i)*dt/2;
    g2(i)=-a*(f1(i)+g1(i)*dt/2)-w^2*(y(i)+f1(i)*dt/2)+cos(w1*(i*dt+dt/2));
    f3(i)=f2(i)+dt/2*g2(i);
    g3(i)=-a*(f1(i)+g2(i)*dt/2)-w^2*(y(i)+f2(i)*dt/2)+cos(w1*(i*dt+dt/2));
    f4(i)=f3(i)+dt*g3(i);    
    g4(i)=-a*(A(i)+g3(i)*dt) - w^2*(y(i)+f3(i)*dt) + cos(w1*(i*dt+dt));
    y(i+1)=y(i) + (f1(i) + f2(i) + f3(i) + f4(i) )*dt/6;
    A(i+1)=A(i) + (g1(i) + g2(i) + g3(i) + g4(i) )*dt/6;
end
figure;plot(y);title('y(t)');xlabel('t');ylabel('y');
figure;plot(A);title('dy/dt');xlabel('t');ylabel('y');
figure;plot(y,A);title('phase diagram');xlabel('y');ylabel('dy/dt');

