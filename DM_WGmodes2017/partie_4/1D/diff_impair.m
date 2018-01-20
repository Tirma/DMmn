%Fonction diff_impair calculant la différence entre les deux membres de
%l'équation de diffusion pour les modes impairs
%
%Input   
%   neff        -- Vecteur des neff à tester 
%   lambda      -- Longueur d'onde du champ (m)
%   a           -- epaisseur des couches de dielectrique (m)
%Output  
%    difference -- Vecteur des differences entre chaque membre de
%    l'equation de diffusion pour les modes impairs

function [difference] = diff_impair(neff,lambda,a,n)
difference = -1./tan(2*pi*a/lambda.*sqrt(n^2-neff.^2))-sqrt((neff.^2-1)./(n^2-neff.^2));
end