function cutline(g, nmode, x1, y1, x2, y2)
%
% g=cutline(g, nmode, x1, y1, x2, y2)
%
% entree : 
%    structure g, numero de mode nmode
%    coords des extremites du segments x1, y1, x2, y2
%
% sortie :
%    structure g
%       g.s : abscisse curviligne
%       g.val : valeurs echantillonnees sur le ligne de coupe
%
Nx=g.Nx;
Ny=g.Ny;
X=g.x;
Y=g.y;
sol=g.Vp(:, nmode);

Npts=200;
d=sqrt((x2-x1)^2+(y2-y1)^2);
dx=(x2-x1)/(Npts-1); 
dy=(y2-y1)/(Npts-1);
dr=sqrt(dx*dx+dy*dy);

g.s=linspace(0, d, Npts);
g.val=zeros(1, Npts);

for i=1:Npts
    x0=x1+(i-1)*dx;
    y0=y1+(i-1)*dy;
    [id, dist]=nearestNodeAt(g, x0, y0);
    g.val(i)=mean(sol(id));
end;

% version optimisee suppose index(g, i, j) := (j-1)*g.Nx+i;
% Z=reshape(sol, Nx, Ny);

plot(g.s, g.val, 'r')
title(['cutline (x1, y1) = (' num2str(x1) ',' num2str(y1) ...
          ') -> (x2, y2) = (' num2str(x2) ',' num2str(y2) ]);
grid on          
end



function [id, dist]=nearestNodeAt(g, x0, y0)
%
% [id, dist]=nearestNodeAt(g, x0, y0)
% liste des NV=4 proches voisins et leur distance à (x0, y0)
%
NV=4;
[neighborIds, neighborDistances] = smallkNearestNeighbors(g.p, [x0 y0], NV);
id=neighborIds;
dist=neighborDistances;
end

function [neighborIds, neighborDistances] = smallkNearestNeighbors(dataMatrix, queryMatrix, k)
%--------------------------------------------------------------------------
% Program to find the k - nearest neighbors (kNN) within a set of points. 
% Distance metric used: Euclidean distance
% 
% Usage:
% [neighbors distances] = kNearestNeighbors(dataMatrix, queryMatrix, k);
% dataMatrix  (N x D) - N vectors with dimensionality D (within which we search for the nearest neighbors)
% queryMatrix (M x D) - M query vectors with dimensionality D
% k           (1 x 1) - Number of nearest neighbors desired
% 
% Example:
% a = [1 1; 2 2; 3 2; 4 4; 5 6];
% b = [1 1; 2 1; 6 2];
% [neighbors distances] = kNearestNeighbors(a,b,2);
% 
% Output:
% neighbors =
%      1     2
%      1     2
%      4     3
% 
% distances =
%          0    1.4142
%     1.0000    1.0000
%     2.8284    3.0000
%--------------------------------------------------------------------------

neighborIds = zeros(size(queryMatrix,1),k);
neighborDistances = neighborIds;

numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);

for i=1:numQueryVectors,
    dist = sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2);
    sortval=zeros(1, k);
    for j=1:k,
        [sortval(j),ind] = min(dist);
        sortpos(j)=ind;
        dist(ind) = +Inf ;
    end
    neighborIds(i,:) = sortpos(1:k);
    neighborDistances(i,:) = sqrt(sortval(1:k));
end
end


function [neighborIds neighborDistances] = kNearestNeighbors(dataMatrix, queryMatrix, k)
%--------------------------------------------------------------------------
% Program to find the k - nearest neighbors (kNN) within a set of points. 
% Distance metric used: Euclidean distance
% 
% Usage:
% [neighbors distances] = kNearestNeighbors(dataMatrix, queryMatrix, k);
% dataMatrix  (N x D) - N vectors with dimensionality D (within which we search for the nearest neighbors)
% queryMatrix (M x D) - M query vectors with dimensionality D
% k           (1 x 1) - Number of nearest neighbors desired
% 
% Example:
% a = [1 1; 2 2; 3 2; 4 4; 5 6];
% b = [1 1; 2 1; 6 2];
% [neighbors distances] = kNearestNeighbors(a,b,2);
% 
% Output:
% neighbors =
%      1     2
%      1     2
%      4     3
% 
% distances =
%          0    1.4142
%     1.0000    1.0000
%     2.8284    3.0000
%--------------------------------------------------------------------------

neighborIds = zeros(size(queryMatrix,1),k);
neighborDistances = neighborIds;

numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
for i=1:numQueryVectors,
    dist = sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2);
    [sortval sortpos] = sort(dist,'ascend');
    neighborIds(i,:) = sortpos(1:k);
    neighborDistances(i,:) = sqrt(sortval(1:k));
end
end
