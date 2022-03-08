clc
clear
close all

N=1001;
a=0.01;
epsilon=1e-4;

%Position operator
x = [];
for i= -5:a:5
  x = [x i];
end
X=diag(x);
%Momentum operator
P=diag(ones(1,N-1),1)+diag(-1*ones(1,N-1),-1);
P(1,N)=-1;
P(N,1)=1;
P=P/(-1i*a*2);
%Potential energy operator
v = [];
for i= -5:a:5
  v = [v -1/(epsilon+abs(i))];
end
V=diag(v);

%Hamiltonian operator
H=P*P/2+V;
[eig_vectors,eig_values]=eig(H);
eigvalue=diag(eig_values);

psi=eig_vectors(:,5); %determine the state by choocing the eig_vector

PSI=[];
k=1;
for i=1:500
    PSI(i)=psi(i*2);
end
%plot
xrange=-5:a*2:4.98;
plot(xrange,PSI.^2,'LineWidth',2,'Color',[0.2 0.6 0.4]);
%ylim([0,4.1e-3]);
ylabel('P_{x}')
xlabel('x')
