clear
clc
load grst.mat
dt = 1/500;
t = 0:dt:100;
COM = zeros(1,length(t));
Omega = 2; % dynamic trap modulation frequency
mu = 0.1;    % dynamic trap modulation amplitude
for nt = 1:length(t)
    V = 0.5*(z*(1+mu*cos(Omega*t(nt)))).^2;
    psi=computePsi_fft(h,V,c,psi,z,dt,Num);
    
    COM(nt) = psi*(z.*psi)'*h;
    figure(1)
    plot(z,V,'b',z,abs(psi).^2,'r')
    axis([zstart zend 0 1])
    drawnow
    if mod(nt,100)==0
        figure(2)
        scatter(t(nt),COM(nt))
        hold on
        drawnow
    end
end
plot(t,COM)
hold off
