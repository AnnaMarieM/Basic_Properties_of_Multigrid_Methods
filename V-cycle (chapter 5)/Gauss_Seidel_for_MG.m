% Solve system of linear equations using Gauss-Seidel method

function [x,res,it,resnorm] = Gauss_Seidel_for_MG(A,b,x,tol,maxit)
    % D = diag(diag(A));
    % L = -tril(A);
    % U = -triu(A);

    DL = tril(A);
    U = -triu(A,1);
    %inv_DL_U = DL\U;
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
     
    


