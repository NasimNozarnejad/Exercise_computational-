clear 
%mile ke abtedaye an be manba sard vasl ast,va entehaye digar be manbae
%garm,tahavol anra barresi mikonim,har ston namade zaman,va har satr dar
%har ston namade moalefe makanie mile ast
c=0.01;
x=100;
t=10;
x0=0;
N=100;
T=zeros(x+2,t+2);
T(1,:)=0;
T(x,:)=t;
for i=2:x-1
        
        T(i,2)=i*4;
end
deltax=(x-x0)/N;
deltat=0.01;
for i=2:t-1
    for j=2:x-1
    T(j,i+1)=(T(j,i)*(1-2*(((c^2)*deltat)/(deltax^2))))+(((c^2*deltat)/(deltax^2))*(T(j+1,i)+T(j-1,i)));
    end    
end

imagesc(T)
