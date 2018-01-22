%Fonction construisant la matrice A permettant de calculer matriciellement
%le champ en tout point de la grille
function [A] = build_A_TE(g)


%Recuperation des parametres de grille
Nx = g.Nx;
Ny = g.Ny;
N=Nx*Ny;
hx = g.hx;
hy = g.hy;
A = [];
%rajout de l'indice optique sur la diagonale
diagonale = [];
for j = 1:Ny
    diagonale = [diagonale (g.indice(:,j).^2)'];
end
A = spdiags(diagonale',0,N,N);

%ajout des coefficients des 4 diagonales
diagonale = [];
for ind = 1:N
   if any(ind==g.ld)
       continue;
   
   else
       reste = mod(ind, Nx);
       quotient = floor(ind/Nx);
       ix = reste;
       iy = quotient +1;
       
       B = g.indice(ind)^2/(g.indice(ind-1)^2 + g.indice(ind)^2)+g.indice(ind)^2/(g.indice(ind+1)^2 + g.indice(ind)^2);
       A(ind,ind) = A(ind,ind) -2*(g.lambda/(2*pi))^2 * (B/hx^2 + 1/hy^2);
       
       Droite = g.indice(ind+1)^2/(g.indice(ind+1)^2+g.indice(ind)^2);
       A(ind,ind+1) = 2*(g.lambda/(2*pi))^2 * Droite/hx^2;
       
       Gauche = g.indice(ind-1)^2/(g.indice(ind-1)^2+g.indice(ind)^2);
       A(ind,ind-1) = 2*(g.lambda/(2*pi))^2 * Gauche/hx^2;
       
       Haut = 1;
       A(ind,ind+Nx) = (g.lambda/(2*pi))^2 * Haut/hy^2;
       
       Bas = 1;
       A(ind,ind-Nx) = (g.lambda/(2*pi))^2 * Haut/hy^2;
       
   end
end


%suppression des lignes correspondant aux noeuds de dirichlet
for ind = 1:N
    if any(ind==g.ld)
        A(ind,:)=(zeros(N,1))';
    end
end

end
