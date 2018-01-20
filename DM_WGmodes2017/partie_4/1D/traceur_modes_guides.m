%Script tracant les modes pairs et impairs pour les indices effectifs :
%neff_pair = 1.007, 2.7741, 3.4254
%neff_impair = 2.0903, 3.1934
%clc;
%clear all;
%close all;


%
%DEFINITION DES CONSTANTES ================================================
%

lambda = 1;
a = 0.3;
n = 3.5;
pas = 0.001;


neffp1=1.007;
neffp2=2.7741;
neffp3=3.4254;

neffip1=2.0903;
neffip2=3.1934;

%==========================================================================

X = -2*a:pas:2*a;

figure
E_x = E_pair(X,lambda,a,n,neffp1,pas);
plot(X,E_x,'y','LineWidth',3);
hold on;
E_x = E_pair(X,lambda,a,n,neffp2,pas);
plot(X,E_x,'m','LineWidth',3);
hold on;
E_x = E_pair(X,lambda,a,n,neffp3,pas);
plot(X,E_x,'b','LineWidth',3);
hold off;
title('Modes pairs');
xlabel('x(µm)');
ylabel('Amplitude pour E0 = 1 V.µm-1');
legend(strcat('neff=',num2str(neffp1)),strcat('neff=',num2str(neffp2)),strcat('neff=',num2str(neffp3)))


figure
E_x = E_impair(X,lambda,a,n,neffip1,pas);
plot(X,E_x,'y','LineWidth',3);
hold on;
E_x = E_impair(X,lambda,a,n,neffip2,pas);
plot(X,E_x,'m','LineWidth',3);
hold off;
title('Modes impairs');
xlabel('x(µm)');
ylabel('Amplitude pour E0 = 1 V.µm-1');
legend(strcat('neff=',num2str(neffip1)),strcat('neff=',num2str(neffip2)))






