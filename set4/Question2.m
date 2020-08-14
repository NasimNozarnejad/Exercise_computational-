clear
e=10000;              %# ensemble
s=1000;             %# step

v=zeros(e,s);
x=zeros(e,s);
v(:,1)=100;
x(:,1)=0;
k=0.2;
T=20;               %maximum time
delta_t=T/s;
%t=(0:delta_t:T);

for i=1:e
    for j=1:s-1
        v(i,j+1)=v(i,j)-((k*v(i,j))*delta_t)+normrnd(0,1)/e; 
        x(i,j+1)=x(i,j)+v(i,j)*delta_t;
    end
end
V=mean(v);
V2=mean((v.^2));
X=mean(x);
X2=mean((x.^2));
for u=1:s/2
    v1=0;
    x1=0;
    for y=1:s-u
    v1=v1+V(1,y)*V(1,y+u);
    x1=x1+X(1,y)*X(1,y+u);
    end
    V1V2(1,u)=v1;
    X1X2(1,u)=x1;
end
            % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%N=100;
%pdf=zeros(1,N+1);
%deltav=(max(V)-min(V))/N;
%for l=1:e
    %h=floor((v(1,2)-min(V))/deltav)+1;
    %pdf(1,h)=pdf(1,h)+1;
%end
%for g=1:N
    %vv(1,g)=((g-1)*deltav)+min(V);
    %PDF(1,g)=pdf(1,g)*deltav;
%end
H=[];
pdf=zeros(1,101);
bin=(max(v(:,10))-min(v(:,10)))/100;
for u=1:e
    h=floor((v(u,10)-min(v(:,10)))/bin)+1;
    H=[H,h];
    pdf(1,h)=pdf(1,h)+1;
end
