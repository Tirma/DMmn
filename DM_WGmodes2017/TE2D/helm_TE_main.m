% Stern Progress in Electromagnetics Research (1995), PIER 10, 123-186
% Finite Difference Analysis of Planar Optical Waveguides
%
% Quasi-TE (Ex) modes
% BT1 structure
%
%
%
%                  .______ 2W______.
%                  |               |
%                  2H              2H
%                  |               |
%                  ._______________.
%
% conditions de dirichlet 

function g=helm_TE_main
clc
clear all
close all

hx=0.05;
hy=0.10;
%g=uniform_grid(-1.0-h/2:h:3.0+h/2, -1.0-h/2:h:3.0+h/2);
g=uniform_grid(-3.0, 3.0, -2.0, 2.0, hx, hy);
g.lambda=1.55;

W=2;
H=1.0; 
nG=3.44;

region = [
       -W   -H;
       +W   -H;
       +W    H;
       -W    H
       ];
 
g=insert(g, region, nG);

% A COMPLETER

end


