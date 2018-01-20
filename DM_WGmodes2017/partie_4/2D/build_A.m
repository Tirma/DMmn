%Fonction construisant la matrice A permettant de calculer matriciellement
%le champ en tout point de la grille
%La fonction dirchlet doit avoir été executée au préalable

function [A] = build_A(g)

%Recuperation des parametres de grille
Nx = g.Nx;
Ny = g.Ny;
N=Nx*Ny;

% Definition des coeficients
alpha=-2*(g.lambda/(2*pi))^2*((1/g.dx)^2 + (1/g.dy)^2);
beta=(g.lambda/(2*pi))^2*(1/g.dx)^2;
gamma=(g.lambda/(2*pi))^2*(1/g.dy)^2;

%Construction de la matrice
A = spdiags([gamma*ones(N,1) beta*ones(N,1) alpha*ones(N,1) beta*ones(N,1) gamma*ones(N,1)],[-Nx -1 0 1 Nx],N,N);

%rajout de l'indice optique sur la diagonale
diagonale = [];
for j = 1:Ny
    diagonale = [diagonale (g.indice(:,j).^2)'];
end
A = A + spdiags(diagonale',0,N,N);

%suppression des lignes correspondant aux noeuds de dirichlet
for ind = 1:N
    if any(ind==g.ld)
        A(ind,:)=(zeros(N,1))';
    end
end

end
