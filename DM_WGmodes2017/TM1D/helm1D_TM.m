% Stern Progress in Electromagnetics Research (1995), PIER 10, 123-186
% Finite Difference Analysis of Planar Optical Waveguides
%
% Quasi-TM (Ex) modes
%
%   ._____________.____._______.____.__________________.
%
% condtions de dirichlet 

function g=helm1D_TM
clc
clear all
close all

h=0.05;
g=uniform_grid(-5.0, 5.0, h);
g.lambda=1;

W=2;
nG=3.44;

region = [-W +W];
g=insert(g, region, nG);

% A COMPLETER

end

