% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

% Solve system of linear equations using Gauss-Seidel method

function [x,res,it,resnorm] = Gauss_Seidel_for_MG(A,b,x,tol,maxit)
    DL = tril(A);
    U = -triu(A,1);
    inv_DL_b = DL\b;
    nb = norm(b);
        
    resnorm = zeros(1, maxit);  

    for it = 1:maxit

        x = DL \ (U * x) + inv_DL_b;

        resnorm(it) = norm(b - A*x);
    
        if resnorm(it)/nb < tol
            res = b - A*x;
            return
        end
    end
    res = b - A*x;
end
     
    


