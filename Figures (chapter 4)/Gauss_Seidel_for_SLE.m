% Solve system of linear equations using Gauss-Seidel method

function [x,it,resnorm,errornorm] = Gauss_Seidel_for_SLE(A,b,x,tol,x_exact)

    if nargin < 5 
        x_exact = zeros(size(x));
    end
    
    maxit = 10^6;

    DL = tril(A);
    U = -triu(A,1);
    inv_DL_b = DL\b;
    nb = norm(b);
        
    resnorm = zeros(1, maxit);    
    errornorm = zeros(1, maxit);  

    for it = 1:maxit

        x = DL \ (U * x) + inv_DL_b;

        resnorm(it) = norm(b - A*x);
        errornorm(it) = norm(x_exact - x);
    
        if resnorm(it)/nb < tol
            return
        end
    end
    res = b - A*x;
end

