% Stern Progress in Electromagnetics Research (1995), PIER 10, 123-186
% Finite Difference Analysis of Planar Optical Waveguides
%
% Quasi-TE (Ex) modes
% BT1 structure
%
%
%
%                  .______ W______.
%                  |               |
%                  H               H
%                  |               |
%                  ._______________.
%
% conditions de dirichlet 

function g=BT1
clc
clear all
close all

hx=0.0952;
hy=0.05;

%g=uniform_grid(-1.0-h/2:h:3.0+h/2, -1.0-h/2:h:3.0+h/2);
g=uniform_grid(-4.3, 4.3, -5.5, 1.85, hx, hy);
g.lambda=1.55;
g.hx = hx;
g.hy = hy;

% Enmicro metres
W=2;
H=1.1;
D=0.2;
Xs=3.00;
Ys=5.025;
Yc=0.525;
nG=3.44;
nS=3.34;
nC=1.0;

guide = [
       -W/2-Xs   0;
       -W/2      0;
       -W/2      H;
       +W/2      H;
       +W/2      0;
        W/2+Xs   0;
        W/2+Xs   -D;
       -W/2-Xs   -D;
       ];
  
g=insert(g, guide, nG);

substrat =[
        -W/2-Xs    -D;
        -W/2-Xs    -D-Ys;
         W/2+Xs    -D-Ys;
         W/2+Xs    -D;
];
g = insert(g, substrat, nS);


cladding = [
       -W/2-Xs   0;
       -W/2      0;
       -W/2      H;
       +W/2      H;
       +W/2      0;
        W/2+Xs   0;
        W/2+Xs   H+Yc;
       -W/2-Xs   H+Yc;
];
g = insert(g,cladding,nC);

% A COMPLETER

end


