clear

v=-50:0.01:50;
V=length(v);
N=10000000;
n=zeros(N,1);
P=(exp(-(v.^2)));             %making Gaussian PDF
P=P/sum(P);
j=0;k=0;
for ii=1:V
    m=floor(N*P(ii));
    k=k+m;
    n(j+1:k)=v(ii);
    j=k;
end
% Shuffling
for ii=1:10*V
    i=floor(rand()*N)+1; j=floor(rand()*N)+1;
    nn=n(i); n(i)=n(j);n(j)=nn;
end

% testing n(x) by making PDF
M=50;                                % number of bins
x=n;
dx=(max(x)-min(x))/M;
offset=floor(min(x)/dx)-1;            % for making indices non-zero
y=zeros(M+1,1);
z=zeros(M+1,1);
for j=1:N
    ll=floor((x(j)/dx))-offset;
    y(ll,1)=y(ll,1)+1;
    z(ll,1)=ll+offset;
end
y=y/j;
figure;
plot(z,y);title('PDF');xlabel('number');ylabel('PDF');
