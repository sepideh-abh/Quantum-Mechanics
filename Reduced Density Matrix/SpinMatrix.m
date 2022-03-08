function [Sx,Sy,Sz]=SpinMatrix(j,n)
    hbar=1;
    sigmax=hbar*[0 0.5;0.5 0];
    sigmay=hbar*[0 -1i/2;1i/2 0];
    sigmaz=hbar*[0.5 0/2;0 -0.5];
    I=[1 0;0 1];
    if j==1
        A=I;
        for i=1:n-2
            A=kron(A,I);
        end
        Sx=kron(sigmax,A);
        Sy=kron(sigmay,A);
        Sz=kron(sigmaz,A);
    elseif j==n
        A=I;
        for i=1:n-2
           A =kron(A,I);
        end
        Sx=kron(A,sigmax);
        Sy=kron(A,sigmay);
        Sz=kron(A,sigmaz);
    else
        A=I;
        B=I;
        for i=1:j-2
            A=kron(A,I);
        end
        for i=j+1:n-1
            B=kron(B,I);
        end
        sigmax=kron(sigmax,B);
        Sx=kron(A,sigmax);
        sigmay=kron(sigmay,B);
        Sy=kron(A,sigmay);
        sigmaz=kron(sigmaz,B);
        Sz=kron(A,sigmaz);
        
    end 

end