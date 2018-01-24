% Stern Progress in Electromagnetics Research (1995), PIER 10, 123-186
% Finite Difference Analysis of Planar Optical Waveguides
%
% Quasi-TE (Ex) modes
% BT3 structure
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

function g=BT3
clc
clear all
close all

hx=0.0976;
hy=0.10;

%g=uniform_grid(-1.0-h/2:h:3.0+h/2, -1.0-h/2:h:3.0+h/2);
g=uniform_grid(-6.5, 6.5, -11.33, 3.33, hx, hy);
g.lambda=1.55;
g.hx = hx;
g.hy = hy;

% Enmicro metres
W=4;
H=2.5;
D=3.5;
Xs=4.34;
Ys=7.550;
Yc=0.550;
nG=3.44;
nS=3.435;
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


