%Fonction construisant la matrice A permettant de calculer matriciellement
%le champ en tout point de la grille
%La fonction dirchlet doit avoir été executée au préalable

function [A] = build_A(g)

Nx = g.Nx;
Ny = g.Ny;
N=Nx*Ny;

alpha=-2*(g.lambda/(2*pi))^2*(1/g.dx^2 + 1/g.dy^2)
beta=(g.lambda/(2*pi))^2*1/g.dx^2
gamma=(g.lambda/(2*pi))^2*1/g.dy^2

A = sparse(diag(alpha*ones(N,1)) + diag(beta*ones(N-1,1),1) + diag(beta*ones(N-1,1),-1)+ diag(gamma*ones(N-Nx,1),Nx) + diag(gamma*ones(N-Nx,1),-Nx));

for ix = 1:Nx
    for iy = 1:Ny
        indice = (iy-1)*Nx + ix;
        A(indice,indice) = A(indice,indice) + g.indice(ix,iy)^2;
    end
end

for ind = 1:N
    if any(ind==g.ld)
        A(ind,:)=(zeros(N,1))';
    end
end

end