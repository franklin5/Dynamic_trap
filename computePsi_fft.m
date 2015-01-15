function u=computePsi_fft(h,V,c,psi,x,dt,Num)

L=2*max(abs(x));
N=Num;
n = [-N/2:1:N/2-1].';           % Indices
e = -4*n.*n*pi*pi/L/L;         % Squares of wavenumbers.
c0=c;
u=psi.';
V=V.';

u = exp(-dt*1i*(V+c0*(abs(u).*abs(u)))/2.0).*u; % propagate in physical space
cu = fftshift(fft(u));                 % Take Fourier transform
cu = exp(dt*1i*e/2).*cu;                   % Advance in Fourier space
u = ifft(fftshift(cu));                % Return to physical space 
u = exp(-dt*1i*(V+c0*(abs(u).*abs(u)))/2.0).*u; % propagate in physical space                                        

% u=1/sqrt(sum(abs(u).^2*h))*u;
u=u.';