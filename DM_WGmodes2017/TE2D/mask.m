function g=mask(g, region)
%
% g=mask(g, region)
% genere un masque de 1 dans la region
% a l'intersection de la grille
%
figure(1)
hold on
tic, [in,bnd] = inpoly(g.p,region); t1 = toc;
if find(bnd==1)
    warning('regions on boundaries detected')
end;
g.nrg=g.nrg+1;
lst_in=find(in==1);
g.mask(lst_in)=1;
%plot(g.p(in,1),g.p(in,2),'bo',g.p(~in,1),g.p(~in,2),'ro',g.p(bnd,1),g.p(bnd,2),'go')
plot(g.p(in,1),g.p(in,2),'r+')
hold on
% Plot geometry
nn    = size(region,1);
cnect = [(1:nn-1)',(2:nn)'; nn,1];
patch('faces',cnect,'vertices',region,'facecolor','none','edgecolor','r'), axis equal 
drawnow()
%pause(5)
end

