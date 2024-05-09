% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

function [u] = V_cycle_recursion(A, f, m, n, o, k1, k2, l, init_vector, solver, omega)
    % Inputs: matrix A, right-side f, 
    %         1st dimension m, 2nd dimension n, 3rd dimension o, 
    %         number of iterations in Jacobi iteration k1 in pre-smoothing
    %         and k2 in post-smoothing
    %         grid level l
    %         J or GS - Jacobi or Gauss-Seidel solver

    if l == 1
        u = A{l}\f;
        return;
    end

    if init_vector == 1
        init_vector = zero_vector(m,n,o,1);
    end

    if solver == "J"
        u = Jacobi_for_MG(A{l}, f, init_vector, k1, omega);
    elseif solver == "GS"
        u = Gauss_Seidel_for_MG(A{l}, f, init_vector, k1);
    end
    
    r = f - A{l}*u;
    coarse_sol = V_cycle_recursion(A, restrict(r,m,n,o), m/2, n/2, o/2, k1, k2, l-1, 1, solver, omega);
    
    u = u + interpolate(coarse_sol, m/2, n/2, o/2);
    
    if solver == "J"
        u = Jacobi_for_MG(A{l}, f, u, k2, omega);
    elseif solver == "GS"
        u = Gauss_Seidel_for_MG(A{l}, f, u, k2);
    end
end

