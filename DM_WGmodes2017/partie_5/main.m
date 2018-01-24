% Exécution des codes de résolution des modes quasi-TE/TM dans divers modes
% Décommenter la partie voulue. Temps d'execution approximatif sur mon pc,
% pour les réduire, reduire le pas de discretisation dans les fichiers
% correspondant
%
% Guide ruban de Stern 
%
% 1 : TE dans BTC1 (5 min)
% 2 : TE dans BTC2 (8 min)
% 3 : TE dans BTC3 (25 min)
%
% 4 : TM dans BTC1 (4 min)
% 5 : TM dans BTC2 (6 min)
% 6 : TM dans BTC3 (23 min)
%
%
% Guide integre de Stern Table14 page 175 (2min)
%  faire varier le lambda dans embeded.m





function main

% g = BT1; %discretisation du guide
% g = TE_solve(g,1);
% g.neff
% g.V = g.Vp;
% TE_poynting(g,1);
% Z = display_mode(g,1);
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (µm)');
% ylabel('y (µm)');
% zlabel('Amplitude');

% g = BT2; %discretisation du guide
% g = TE_solve(g,1);
% g.neff
% TE_poynting(g,1); 
% Z = display_mode(g,1);
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (µm)');
% ylabel('y (µm)');
% zlabel('Amplitude');

% g = BT3; %discretisation du guide
% g = TE_solve(g,1);
% g.neff
% TE_poynting(g,1);
% Z = display_mode(g,1);
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (µm)');
% ylabel('y (µm)');
% zlabel('Amplitude');




% g = BT1; %discretisation du guide
% g = TM_solve(g,1);
% g.neff
% TM_poynting(g,1);
% Z = display_mode(g,1);
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (µm)');
% ylabel('y (µm)');
% zlabel('Amplitude');

% g = BT2; %discretisation du guide
% g = TM_solve(g,1);
% g.neff
%TM_poynting(g,1);
% Z = display_mode(g,1);
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (µm)');
% ylabel('y (µm)');
% zlabel('Amplitude');

% g = BT3; %discretisation du guide
% g = TM_solve(g,1);
% g.neff
% TM_poynting(g,1);
% Z = display_mode(g,1);
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (µm)');
% ylabel('y (µm)');
% zlabel('Amplitude');




% g = embeded; %discretisation du guide
% g = TE_solve(g,1);
% g.neff
% g.V = g.Vp;
% TE_poynting(g,1);
% xlabel('x (mm)');
% ylabel('y (mm)');
% Z = display_mode(g,1);
% xlabel('x (mm)');
% ylabel('y (mm)');
% figure
% surfc(g.x,g.y,Z);
% xlabel('x (mm)');
% ylabel('y (mm)');
% zlabel('Amplitude');


g = embeded; %discretisation du guide
g = TM_solve(g,1);
g.neff
g.V = g.Vp;
TM_poynting(g,1);

xlabel('x (mm)');
ylabel('y (mm)');
Z = display_mode(g,1);
title(['neff=' num2str(g.neff(1)) ' y-component of the electric field']);
xlabel('x (mm)');
ylabel('y (mm)');
figure
surfc(g.x,g.y,Z);
xlabel('x (mm)');
ylabel('y (mm)');
zlabel('Amplitude');

end