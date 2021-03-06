% Stern Progress in Electromagnetics Research (1995), PIER 10, 123-186
% Finite Difference Analysis of Planar Optical Waveguides
%
% Quasi-TE (Ex) modes
% BT2 structure
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

function g=BT2
clc
clear all
close all

hx=0.0968;
hy=0.05;

%g=uniform_grid(-1.0-h/2:h:3.0+h/2, -1.0-h/2:h:3.0+h/2);
g=uniform_grid(-4.8, 4.8, -6.3, 1.01, hx, hy);
g.lambda=1.55;
g.hx = hx;
g.hy = hy;

% Enmicro metres
W=3;
H=0.1;
D=0.9;
Xs=3.05;
Ys=5.025;
Yc=0.525;
nG=3.44;
nS=3.36;
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


