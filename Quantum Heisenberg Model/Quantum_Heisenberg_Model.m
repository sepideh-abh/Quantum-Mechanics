clc
clear
close all


n=2;%number of particles

[sx1,sy1,sz1]=SpinMatrix(1,n);
H=0*(sx1*sx1);%make Zero matrix with size of H

for i=1:n-1
[sx1,sy1,sz1]=SpinMatrix(i,n);
[sx2,sy2,sz2]=SpinMatrix(i+1,n);
 H=H+sx1*sx2+sy1*sy2+sz1*sz2;  
end


[eig_vectors,eig_values]=eig(H);
eigvalue=diag(eig_values);
psi=eig_vectors(:,1);%first eigenvector


