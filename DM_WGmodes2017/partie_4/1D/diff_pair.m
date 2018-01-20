%Fonction diff_pair calculant la différence entre les deux membres de
%l'équation de diffusion pour les modes pairs
%
%Input   
%   neff        -- Vecteur des neff à tester 
%   lambda      -- Longueur d'onde du champ (m)
%   a           -- epaisseur des couches de dielectrique (m)
%Output  
%    difference -- Vecteur des differences entre chaque membre de
%    l'equation de diffusion pour les modes pairs

function [difference] = diff_pair(neff,lambda,a,n)
difference = tan(2*pi*a/lambda.*sqrt(n^2-neff.^2))-sqrt((neff.^2-1)./(n^2-neff.^2));
end