% WGgen : generateur d'une grille reguliere de type 
% differences/volumes finis
% Auteurs JC Toussaint & L Bastard - BE EM

% Bibliographie :
% Stern Progress in Electromagnetics Research (1995), PIER 10, 123-186
% Finite Difference Analysis of Planar Optical Waveguides
%

function g=WGgen(a,lambda,h,c)
%clc
%clear all
%close all
if nargin>4
    error("myfuns:WGgen:TooManyInputs","maximum is 4 parameters");
end
switch nargin
    case 2
        h=0.001;
        c = 5;
end
h
c
g=uniform_grid(-c, c, h);
g.lambda=lambda;

% coordonnees des sommets du polygone
% decrivant une portion du guide

node1 = [-5 -a];
node2 = [-a a];
node3 = [a 5];

indice=3.5;

%On fait un saut d'indice
g=insert(g, node1, 1);
g=insert(g, node2, indice);
g=insert(g, node3, 1)
end

function g=uniform_grid(xmin, xmax, hx)
g.x=xmin+hx/2:hx:xmax-hx/2;

g.p     = g.x(:);
g.Nx=length(g.x);
g.reg =zeros(g.Nx, 1);
g.indice =ones(g.Nx, 1);
g.N=g.Nx;
g.nrg=0;
g.dx=hx;

figure(1)
plot(g.p, g.indice, 'ro');
hold on
end

function g=insert(g, nodes, indice)
assert(length(nodes)==2, 'node length > 2')
figure(1)

xmin=nodes(1);
xmax=nodes(2);
xmin=min(xmin, xmax);
xmax=max(xmin, xmax);
lst_in=find((g.p>xmin) & (g.p<xmax));

g.nrg=g.nrg+1;
g.reg(lst_in)=g.nrg;
g.indice(lst_in)=indice;


plot(g.p, g.indice, 'b-')
plot(g.p(lst_in), ones(length(lst_in), 1), 'bo-')
grid on
hold on
title('indices')
drawnow()
end
