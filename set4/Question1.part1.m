clear
% n=load('marks.txt');
n=randn([1 10000]);
N=length(n);     % sample data
M=40;                                % number of bins
x=n;
dx=(max(x)-min(x))/M;
offset=floor(min(x)/dx)-1;           % for making indices non-zero
y=zeros(M+1,1);
z=zeros(M+1,1);
for i=1:N
    ll=floor((x(i)/dx))-offset;
    y(ll,1)=y(ll,1)+1;
    z(ll,1)=ll+offset;
end
y=y/i;

 %%%     kernel     %%%
 
VK=0.3;                                % variance for Gausian kernel
w=y;
for j=3:length(y)-2                 
    w(j,1)=y(j-2,1)*exp(-(dx^2)/VK)+y(j-1,1)*exp(-(dx^2)/(2*VK))...
        +y(j,1)+y(j+1,1)*exp(-(dx^2)/(2*VK))+y(j+2,1)*exp(-(dx^2)/VK);%using kernel by using neighbors
end
figure;plot(z,y);title('PDF');xlabel('X');ylabel('PDF');
figure
plot(z,w);title('Kernel PDF');xlabel('X');ylabel('PDF');
