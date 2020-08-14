clear
tic

%---------solving Laplace's equation with relaxation method-------%

Xmax=5; 
Xmin=-5;
Ymax=5;
Ymin=-5;
h=0.1; % discretization size
Nx=(Xmax-Xmin)/h; 
Ny=(Ymax-Ymin)/h;
V=rand(Nx,Ny); % potenstial 

V(:,1)=1;  %boundry condition
V(:,Ny)=1; %boundry condition
V(1,:)=0; %boundry condition
V(Nx,:)=0; %boundry condition

M=2000; 

for k=1:M*Nx*Ny
    i=randi([2,Nx-1]);
    j=randi([2,Ny-1]);
    V(i,j)=(V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4;
    if rem(k,Nx*Ny)==0
        m=k/(Nx*Ny);
        s(m)=mean(V(:));
   end
    
end
figure
plot(s);title('Mean of V');xlabel('Iteration');ylabel('Mean(v)')
figure
imagesc(V); %profile of potential
toc
