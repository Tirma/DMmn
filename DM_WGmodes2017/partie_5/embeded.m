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

function g=embeded
clc
clear all
close all

hx=0.0976;
hy=0.1;

%g=uniform_grid(-1.0-h/2:h:3.0+h/2, -1.0-h/2:h:3.0+h/2);
g=uniform_grid(-6.4, 6.5, -5.7, 2.6, hx, hy);
g.lambda=8.3;
g.hx = hx;
g.hy = hy;

% En mm
W=4.;
H=1.;
D=1.;
Xs=4.342;
Ys=4.55;
Yc=1.55;
nG=2.02;
nS=1.42;
nC=1.0;

guide = [
       -W/2   -D;
       -W/2      H;
       +W/2      H;
       +W/2      -D;
        ];
  
g=insert(g, guide, nG);

substrat =[
        -W/2-Xs    0;
        -W/2       0;
        -W/2      -D;
         W/2      -D;
         W/2       0;
         W/2+Xs    0;
         W/2+Xs   -D-Ys;
        -W/2-Xs   -D-Ys;
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


