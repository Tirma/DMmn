% Script réalisant la résolution des équations de dispersion pour neff
% dans le cas des modes pairs et impairs
%
%On se place dans le cas où a=300nm, n=3.5, lambda=1µm
%
%Output : solutions neff des equations de dispersion pour les modes pairs
%et impairs
%clc;
%clear all;
%close all;

lambda = 1;
a = 0.3;
n = 3.5;
neff = 0:0.00001:3.5;

diffpair = diff_pair(neff,lambda,a,n);
diffimpair = diff_impair(neff,lambda,a,n);
% Le graphique en semilog permet de voir plus facilement les zeros de
% l'équation
figure
semilogy(neff,abs(diffpair));
title('Difference equation de diffusion paire');
xlabel('neff');

figure
semilogy(neff,abs(diffimpair));
title('Difference equation de diffusion impaire');
xlabel('neff');

sol_pair = @(neff) diff_pair(neff,lambda,a,n); 
disp(strcat("racine pair ", num2str(fzero(sol_pair,[1 1.1]))));
disp(strcat("racine pair ", num2str(fzero(sol_pair,[2.7 2.8]))));
disp(strcat("racine pair ", num2str(fzero(sol_pair,[3.4 3.45]))));

sol_impair = @(neff) diff_impair(neff,lambda,a,n); 
disp(strcat("racine impair ", num2str(fzero(sol_impair,[2 2.1]))));
disp(strcat("racine impair ", num2str(fzero(sol_impair,[3.1 3.2]))));
