clear
tic
L=100000;
a=rand([1 L]);                 % making random numbers
N=1000;                          % number of bins
K=[];
delta=(max(a)-min(a))/N;
pdf=zeros(N+1,1);
for i=1:L
    k=floor((a(i)-min(a))/delta)+1;
    K=[K,k];
    pdf(k,1)=pdf(k,1)+1;
end
for j=min(K):max(K)
    PDF(j,1)=pdf(j,1)*delta;
    d(j,1)=((j-1)*delta)+min(a);
end
figure
plot(d,PDF);title('PDF');xlabel('nember');ylabel('PDF');
toc
