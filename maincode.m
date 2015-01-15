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
zstart=-10;
zend=10;
h=(zend-zstart)/Num;     % spacial step
z=zstart:h:zend-h;
len=length(z);

c=-5;

psi=ITP_trap(c);

save grst_in_a_box.mat