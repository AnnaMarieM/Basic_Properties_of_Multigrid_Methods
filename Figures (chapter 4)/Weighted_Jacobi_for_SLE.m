% Author: Anna Marie Minarovičová, 
% Title: Basic Properties of Multigrid Methods, 
% Charles University

% Solve system of linear equations using the Jacobi method

function [x,it,resnorm,errornorm] = Weighted_Jacobi_for_SLE(A,b,x,tol,x_exact,omega)

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

        x = (1 - omega) * x + omega * (inv_D_b + inv_D_LU * x);
        resnorm(it) = norm(b - A*x);
        errornorm(it) = norm(x_exact - x);
    
        if resnorm(it)/nb < tol
            return
        end
    end

    % If maximum iterations reached without convergence
    warning('Weighted Jacobi method did not converge within the maximum number of iterations.');
end
