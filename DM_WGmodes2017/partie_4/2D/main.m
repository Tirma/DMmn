% Fonction principale du programme
% Dans un premier temps :
%   Analyse des 4 premier modes du guide semiconducteur
%   décrit par Stern à la figure 10.

function main
clear all
close all
clc

g = WGgen;
g = dirichlet(g);
g = solve(g,4);
g.neff
%display 4 premiers modes
Z = display_mode(g,1);
Z1max=max(max(Z))
figure;
surf(g.x,g.y,Z);

xlabel('x (µm)');
ylabel('y (µm)');
zlabel('Amplitude');
Z = display_mode(g,2);



figure;
surf(g.x,g.y,Z);
xlabel('x (µm)');
ylabel('y (µm)');
zlabel('Amplitude');
Z = display_mode(g,3);

figure;
surf(g.x,g.y,Z);
xlabel('x (µm)');
ylabel('y (µm)');
zlabel('Amplitude');
Z = display_mode(g,4);


figure;
surf(g.x,g.y,Z);
xlabel('x (µm)');
ylabel('y (µm)');
zlabel('Amplitude');

figure
cutline(g,1,0,0.5,2,0.5);
hold on
x=0:0.01:2;
plot(x,sin(x*pi/2)*sin(0.5*pi)*Z1max,'b--');
cutline(g,2,0,0.5,2,0.5);
plot(x,sin(2*x*pi/2)*sin(0.5*pi)*Z1max,'b--');
cutline(g,3,0,0.5,2,0.5);
plot(x,sin(3*x*pi/2)*sin(0.5*pi)*Z1max,'b--');
cutline(g,4,0,0.5,2,0.5);
plot(x,sin(x*pi/2)*sin(2*0.5*pi)*Z1max,'b--');
legend("numerique","analytique");
hold off

figure
cutline(g,1,1,0,1,1);
hold on
y=0:0.01:1;
plot(y,sin(pi/2)*sin(y*pi)*Z1max,'b--');
cutline(g,2,1,0,1,1);
plot(y,sin(2*pi/2)*sin(y*pi)*Z1max,'b--');
cutline(g,3,1,0,1,1);
plot(y,sin(3*pi/2)*sin(y*pi)*Z1max,'b--');
cutline(g,4,1,0,1,1);
plot(y,sin(pi/2)*sin(2*y*pi)*Z1max,'b--');
legend("numerique","analytique");
% pas = 0.2; %pas h de discretisation en micro m
% cote = 10; % demi dimension du guide
% 
% g_SMF = WGgen_SMF(pas,cote);
% g_SMF=dirichlet(g_SMF)
% g_SMF = solve(g_SMF,2);
% g_SMF.neff
% Z = display_mode(g_SMF,1);
% figure;
% surf(g_SMF.x,g_SMF.y,Z);
% Z = display_mode(g_SMF,2);
% figure;
% surf(g_SMF.x,g_SMF.y,Z);
  
 % cutline(g_SMF,1,-10,0,10,0);

end
