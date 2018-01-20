function [A] = build_A(g)
N= g.Nx ;
A = sparse(diag(-2*ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1)) ;
A = A * (g.lambda/(2*pi*g.dx))^2;
A = A + sparse(diag(g.indice.^2));
A(1,1)=0;
A(1,2)=0;
A(N,N)=0;
A(N,N-1)=0;
end

