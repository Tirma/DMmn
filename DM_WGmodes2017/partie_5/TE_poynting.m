% Fonction determinant la composante S_z du vecteur de Poynting.
%Input : g guide discretise
%        nmode numero du mode

function TE_poynting(g,nmode)

%e0 = 8.854187e-12;
%c = 299792458;
e0c = 2.6544e-3;

hx = g.hx;
hy = g.hy;

d2xEx = zeros(g.Nx*g.Ny,1)';
for ind = 1 : g.Nx*g.Ny

    if any(ind==g.ld)
        
        d2xEx(ind)=0;      
    else
       B = g.indice(ind)^2/(g.indice(ind-1)^2 + g.indice(ind)^2)+g.indice(ind)^2/(g.indice(ind+1)^2 + g.indice(ind)^2);
       Droite = g.indice(ind+1)^2/(g.indice(ind+1)^2+g.indice(ind)^2);
       Gauche = g.indice(ind-1)^2/(g.indice(ind-1)^2+g.indice(ind)^2);

       d2xEx(ind) = 2*Droite/hx^2*g.Vp(ind+1,nmode) -2*(B/hx^2)*g.Vp(ind,nmode) +2*Gauche/hx^2*g.Vp(ind-1,nmode);
    end
end
Sz = g.neff(nmode)*e0c/2*(g.Vp(:,nmode).^2-(g.lambda/(2*pi*g.neff(nmode)))^2*g.Vp(:,nmode)*d2xEx(1,:));
%%%%%%%%%% Display à partir de display_mode.m %%%%%%%%
g
Nx=g.Nx;
Ny=g.Ny;
X=g.x;
Y=g.y;
sol=Sz;

for i=1:Nx
    for j=1:Ny
        n=index(g, i, j);
        Z(i, j)=sol(n);
    end;
end;

% version optimisee suppose index(g, i, j) := (j-1)*g.Nx+i;
% Z=reshape(sol, Nx, Ny);

figure
colormap jet
shading interp
xlim=[min(X(:)), max(X(:))];
ylim=[min(Y(:)), max(Y(:))];

contourf(X, Y, Z, 15);
colorbar
daspect([1 1 1])
title(['neff=' num2str(g.neff(nmode)) ' z-component of the Poynting vector']);


end