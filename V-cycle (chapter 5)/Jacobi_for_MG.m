% Solve system of linear equations using the Jacobi method

function [x] = Jacobi_for_MG(A,b,x,maxit,omega)
   
    d = A(1,1);    
    for it = 1:maxit
        x = x + omega * (b - A*x) / d;
    end
end
     
    


