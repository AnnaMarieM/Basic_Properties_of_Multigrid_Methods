% generate finite difference matrix for Poisson equation in 1D
% based on n and m

function A = generate_1D(n)
    h = 1/n;
    A = 1/h^2 * (diag(2*ones(1,n-1)) + diag(-1*ones(1,n-2),1) + diag(-1*ones(1,n-2),-1));
end