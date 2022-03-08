clc
clear
close all

epsilon=0.02;
N=5000;

[eig_vectors,eig_values]=eig(H(0));
Gzero=eig_vectors(:,1);
alpha=[];
T=[];%time
U=[1 0; 0 1];
for n=0:N
U=expm(-1i*epsilon*H(n*epsilon))*U;
G=U*Gzero;
alpha(n+1)=imag(log(G'*Gzero));
T(n+1)=n*epsilon;
end

figure
plot(T,alpha,'color',[0.2 0.6 0.6],'linewidth',2)
xlabel('\tau')
ylabel('\alpha')
grid on