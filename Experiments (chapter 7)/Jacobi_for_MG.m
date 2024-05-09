% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

% Solve system of linear equations using the (Weighted) Jacobi method, 
% optimised for Multigrid method

function [x] = Jacobi_for_MG(A,b,x,maxit,omega)
   
    d = A(1,1);    
    for it = 1:maxit
        x = x + omega * (b - A*x) / d;
    end
end
     
    


