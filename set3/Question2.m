clear
v=0:0.01:5;
b=4;
c=1;
V=length(v);
N=100000;
n=zeros(N,1);
P=b*(v.^2).*(exp(-c*(v.^2)));          %making M-B PDF
P=P/sum(P);
j=0;
k=0;
for i=1:V
    m=floor(N*P(i));
    k=k+m;
    n(j+1:k)=v(i);
    j=k;
end
% Shuffling
for ii=1:10*V
    i=floor(rand*N)+1;
    j=floor(rand*N)+1;
    nn=n(i);
    n(i)=n(j);
    n(j)=nn;
end
% testing n(x) by making PDF
M=500;                                % number of bins
x=n;
dx=(max(x)-min(x))/M;
offset=floor(min(x)/dx)-1;            
y=zeros(M+1,1);
z=zeros(M+1,1);
for j=1:N
    ll=floor((x(j)/dx))-offset;
    y(ll,1)=y(ll,1)+1;
    z(ll,1)=ll+offset;
end
y=y/j;
figure;
plot(y(1:end));title('PDF-simple');xlabel('X');ylabel('PDF');
