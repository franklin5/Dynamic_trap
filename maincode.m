%%
% 1D Schrodinger Equation
% -1/2*psi_zz+(1/2*z^2+c*|psi|^2)psi=i*psi_t
% Units:    hbar=m=omega=1
% Time:     1/omega
% Energy:   hbar*omega
% Length:   sqrt(hbar/(m*omega))
%% dimensionless parameters
clear
clc
global z h len Num
Num=2^10;     % grid number
%xlim=20;     % spacial width
zstart=-20;
zend=20;
h=(zend-zstart)/Num;     % spacial step
z=zstart:h:zend-h;
len=length(z);

c=0;

psi=ITP_trap(c);

save grst_c0.mat