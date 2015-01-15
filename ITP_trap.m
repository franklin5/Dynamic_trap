function psi=ITP_trap(c)
%% Parameterization
global z h len Num
V=zeros(1,length(z));
dt=-1i/100;    % time step

%% Exact 
exact_psi=exp(-(z).^2/2)/pi^(1/4);
%plot(x,exact_psi.^2)

%% Initialization 
% Gaussian function
psi=exp(-2*(z).^2/2)/pi^(1/4);
psi=psi/sqrt(h*sum(abs(psi).^2));
mu=conj(psi)*computeH(len,V,c,psi,h,z)*psi.';
%% split spectrum operator method. 
delta=1;

ncount=1;
while delta>10^-6
    
    psi=computePsi_fft(h,V,c,psi,z,dt,Num);
    
    psi=1/sqrt(sum(abs(psi).^2*h))*psi;
    mup=conj(psi)*computeH(len,V,c,psi,h,z)*psi.';
    delta=abs(mu-mup);
    mu=mup;
    if mod(ncount,5)==0
%         plot(x,psi.*conj(psi),x,...
%              (1/pi^(1/4)*exp(-x.^2/2)).^2,x,V);
        plot(z,abs(psi).^2,'b',z,exact_psi.^2,'r')
        %axis([-xlim xlim 0 4])
        drawnow
    end
     ncount=ncount+1;
     
end

end