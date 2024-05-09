% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

function [A] = generate(m,n,o)
    if n == 0 && o == 0
        h = 1/m;
        e = ones(m-1,1);
        A = 1/h^2 * spdiags([-e 2*e -e],-1:1,m-1,m-1);

    elseif o == 0
        h_x = 1/m;
        h_y = 1/n;
        B = 1/h_y^2 * spdiags([-ones(n-1,1) 2*(h_x^2 + h_y^2)*h_x^(-2)*ones(n-1,1) -ones(n-1,1)],-1:1,n-1,n-1);
        I = - 1/h_x^2 * speye(n-1);   
        A = kron(speye(m-1),B) + kron(diag(ones(m-2,1),-1) + diag(ones(m-2,1),1), I);

    elseif m == n && n == o 
        h = 1/n;
        e = ones(n-1,1);
        E = spdiags([-e 6*e -e],-1:1, n-1, n-1);
    
        D = kron(speye(n-1),E) + kron(diag(-ones(n-2,1),-1) + diag(-ones(n-2,1),1),speye(n-1));
        A = 1/h^2 * ((kron(speye(n-1),D)) + kron(diag(-ones(n-2,1),1) + diag(-ones(n-2,1),-1),speye((n-1)*(n-1))));

    else
        disp("Something went wrong.");
        A = 0;
    end
end