% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

% Solve system of linear equations using the Jacobi method

function [x,it,resnorm,errornorm] = Jacobi_for_SLE(A,b,x,tol,x_exact)

    if nargin < 5  
        x_exact = zeros(size(x));
    end
    
    D = diag(diag(A));
    LU = - A + D;

    inv_D_LU = D\LU;
    inv_D_b = D\b;
    nb = norm(b);

    maxit = 10^6;

    resnorm = zeros(1, maxit);    
    errornorm = zeros(1, maxit); 
    
    for it = 1:maxit

        x = inv_D_b + inv_D_LU * x;
        resnorm(it) = norm(b - A*x);
        errornorm(it) = norm(x_exact - x);
    
        if resnorm(it)/nb < tol
            return
        end
    end
end
     
    


