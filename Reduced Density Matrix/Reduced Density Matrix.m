clc
clear
close all

N=10;%number of particles
n=1;%tedada dar chap

[sx1,sy1,sz1]=SpinMatrix(1,N);
H=0*(sx1*sx1);%sahktan matrix 0 ba andaze H

for i=1:N-1
[sx1,sy1,sz1]=SpinMatrix(i,N);
[sx2,sy2,sz2]=SpinMatrix(i+1,N);
 H=H+sx1*sx2+sy1*sy2+sz1*sz2;  
end

[eig_vectors,eig_values]=eig(H);
eigvalue=diag(eig_values);
psi=eig_vectors(:,1);%first eigenvector

rho=psi*psi';
[eigvectors,eigvalues]=eig(psi*psi');%total density matrix
omega=diag(eigvalues);%eigen values of total density matrix
omega(omega<1e-15)=1e-15;

s=0;%total entropy
for i=1:2^N
    s=s-omega(i)*log(omega(i));
end
repsi=reshape(psi,2^n,2^(N-n));
rho_left=repsi*repsi';
[eigvectors_left,eigvalues_left]=eig(rho_left);%total density matrix
omega_left=diag(eigvalues_left);%eigen values of total density matrix
omega_left(omega_left<1e-15)=1e-15;
s_left=0;
for i=1:2^n
    s_left=s_left-omega_left(i)*log(omega_left(i));
end

rho_right=repsi.'*conj(repsi);
[eigvectors_right,eigvalues_right]=eig(rho_right);%total density matrix
omega_right=diag(eigvalues_right);%eigen values of total density matrix
omega_right(omega_right<1e-15)=1e-15;
s_right=0;

for i=1:2^(N-n)
    s_right=s_right-omega_right(i)*log(omega_right(i));
end

