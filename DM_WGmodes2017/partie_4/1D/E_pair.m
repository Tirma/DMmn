function [E_x] = E_pair(X,lambda,a,n,neff,pas) 

k1 = sqrt((neff^2-1^2)/lambda^2 * 4*pi^2); 
k2 = sqrt(-(neff^2-n^2)/lambda^2 * 4*pi^2);
k3 = sqrt((neff^2-1^2)/lambda^2 * 4*pi^2);


E_x = zeros(size(X,2),1);

E0=1;

E_x(1:floor(a/pas+1)) =  E0*cos(k2*a)*exp(k1*a)*exp(+k1*X(1:floor(a/pas+1)));
E_x(floor(a/pas+1):floor(3*a/pas+1)) = E0*cos(k2*X(floor(a/pas+1):floor(3*a/pas+1)));
E_x(floor(3*a/pas+1):floor(4*a/pas+1)) = E0*cos(k2*a)*exp(k1*a)*exp(-k1*X(floor(3*a/pas+1):floor(4*a/pas+1)));

end