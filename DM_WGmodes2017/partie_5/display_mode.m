function [Z] = display_mode(g, nmode)
%
% display_mode(g, nmode)
% contour du mode numero nmode
% entree :
%   structure g et numero de mode a representer
%
Nx=g.Nx;
Ny=g.Ny;
X=g.x;
Y=g.y;
sol=g.Vp(:, nmode);

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
title(['neff=' num2str(g.neff(nmode)) ' x-component of the electric field']);
end


