% Fonction permettant de construire la liste ld des noeuds du bord ou sont
% appliqués les conditions de Dirichlet.
%
%Input : g structure du guide
%Output g avec g.ld liste des noeuds de dirichlet

function [g] = dirichlet(g)

%Les noeuds du bord sont ceux ou :
%    ix = 1 ou Nx
%    iy = 1 ou Ny

for ix = [1,g.Nx]
    for iy = 1:g.Ny
        ld = [ld, (iy-1)*g.Nx + ix];
    end
end

for iy = [1,g.Ny]
    for ix = 1:g.Nx
        ld = [ld, (iy-1)*g.Nx + ix];
    end
end

ld = unique(ld);
g.ld = ld;

end