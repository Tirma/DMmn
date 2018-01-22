function g=uniform_grid(xmin, xmax, ymin, ymax, hx, hy)
%
% g=uniform_grid(xmin, xmax, ymin, ymax, hx, hy)
% generation d'un grille rectangulaire s'étendant de xmin a  xmax
% et de  ymin a  ymax
% entree :
%     intervalles xmin, xmax, ymin, ymax
%     pas hx, hya
% sortie :
%     structure g
%     g.Nx et g.Ny nombre de points selon Ox et Oy
%     g.dx et g.dy pas de la grille selon Ox et Oy
%     g.indice(1:g.Nx, 1:g.Ny) = 1
%     g.p(:, 1:2) coordonnees des points de la grille
% 

lx=xmin+hx/2:hx:xmax-hx/2;
ly=ymin+hy/2:hy:ymax-hy/2;
[g.x,g.y] = meshgrid(lx, ly);
g.x=transpose(g.x);
g.y=transpose(g.y);

g.p     = [g.x(:),g.y(:)];
[g.Nx, g.Ny]=size(g.x);
g.reg =zeros(g.Nx, g.Ny);
g.indice =ones(g.Nx, g.Ny);
g.N=g.Nx*g.Ny;
g.nrg=0;
g.dx=hx;
g.dy=hy;
figure(1)
plot(g.p(:, 1), g.p(:, 2), 'ro');
hold on
end


