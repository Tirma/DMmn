function [g]=solve(g,n)

N=g.Nx*g.Ny;

A = build_A(g);

P = sparse(eye(N));
P(g.ld,:)=[];


Ap = P * A * P';
[Vp,Dp] = eigs(Ap - ((max(max(g.indice)))^2)*eye(size(Ap,2)), n, 'sm'); %renvoie les n plus petites valeurs propres de la matrice et leur vecteurs propres associés
lambda_p = diag(Dp) + (max(max(g.indice)))^2; %On recalcule les lambda
neff = sqrt(lambda_p);
g.neff = neff;
Vp = P'*Vp; %Retour dans l'espace de départ (réel)
g.Vp = Vp;

end