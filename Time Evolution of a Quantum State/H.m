function [Ht]=H(t)
sigmax=[0 1;1 0];
sigmay=[0 -1i;1i 0];
sigmaz=[1 0;0 -1];
Ht=(cos(pi/3)*sigmaz+sin(pi/3)*(cos(2*pi/100*t)*sigmax+sin(2*pi/100*t)*sigmay))/2;
end