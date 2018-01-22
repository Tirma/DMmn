function g=insert(g, region, indice)
%
% g=insert(g, region, indice)
% insertion d'une region d'indice optique indice dans la grille
% entree:
%   structure g
%   tableau region
%   reel indice
% sortie ;
%   structure g
%
figure(1)
tic, [in,bnd] = inpoly(g.p,region); t1 = toc;
if find(bnd==1)
    warning('regions on boundaries detected')
end;
g.nrg=g.nrg+1;
lst_in=find(in==1);
g.reg(lst_in)=g.nrg;
g.indice(lst_in)=indice;
%plot(g.p(in,1),g.p(in,2),'bo',g.p(~in,1),g.p(~in,2),'ro',g.p(bnd,1),g.p(bnd,2),'go')
plot(g.p(in,1),g.p(in,2),'bo',g.p(bnd,1),g.p(bnd,2),'go')
hold on
title('Inside points (blue), outside points (red) & boundary points (green)')
% Plot geometry
nn    = size(region,1);
cnect = [(1:nn-1)',(2:nn)'; nn,1];
patch('faces',cnect,'vertices',region,'facecolor','none','edgecolor','k'), axis equal 
drawnow()
%pause(5)
end

