function main
clc
clear all
close all

a = 0.3; %demie longueur du guide en µm
lambda=1.;
nombres_de_modes =5;

g = solve(WGgen(a,lambda),nombres_de_modes);

%Analytique
disp("neff analytique : ");
disp(" ");
neff_pair_impair;
traceur_modes_guides;

disp(" ");
disp("neff numerique : ");
g.neff

figure
hold on;
for elt=g.Vp
    plot(g.x,elt,'Linewidth',3);
    
end
hold off;
xlabel("x");
ylabel("Amplitude")
title("y-component of the electric field")
legend(strcat('neff=',num2str(g.neff(1))),strcat('neff=',num2str(g.neff(2))),strcat('neff=',num2str(g.neff(3))),strcat('neff=',num2str(g.neff(4))),strcat('neff=',num2str(g.neff(5))))


%On effectue la resolution numerique pour Lx=2µm et lambda=1µm en changeant les
%parametres a pour a=1 et lambda=1 dans le programme main.
%Pour la resolution analytique, il faut refaire la demarche effectuée en
%première partie du BE


end