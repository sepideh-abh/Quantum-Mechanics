clc

N=1001;
a=0.01;

x = [];
for i= -5:a:5
  x = [x i];
end
X=diag(x);
P=diag(ones(1,N-1),1)+diag(-1*ones(1,N-1),-1);
P(1,N)=-1;
P(N,1)=1;
P=P/(1i*a*2);
V=X*X/2;
H=P*P/2+V;
[eig_vectors,eig_values]=eig(H);
eigvalue=diag(eig_values);
psi=eig_vectors(:,2); %determine the state by choocing the eig_vector

PSI=[];
k=1;
for i=1:500
    PSI(i)=psi(i*2);
end

%plot
xrange=-5:a*2:4.98;
plot(xrange,PSI.^2,'LineWidth',2,'Color',[1 0.4 0.4]);
ylabel('p_{x}')
xlabel('x')
