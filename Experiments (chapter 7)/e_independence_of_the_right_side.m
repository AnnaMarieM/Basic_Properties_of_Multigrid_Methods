% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

m = 128; % 1st dimension
n = 128; % 2nd dimension
o = 128; % 3rd dimension

k1 = 3; % number of iterations of iterative method in pre-smoothing
k2 = 3; % number of iterations of iterative method in post-smoothing
l = 4; % number of grid levels

solver = "J"; % J or GS - Jacobi or Gauss-Seidel solver
omega = 4/5;

% Init matrices 
A = cell(1, l);  
for i = 1:l       
    A{i} = generate(m/(2^(l-i)), n/(2^(l-i)), o/(2^(l-i)));
end

% Define test right-hand sides
f2 = ones(abs((m-1)*(n-1)*(o-1)),1);

[x, y, z] = meshgrid(linspace(0, 1, m-1), linspace(0, 1, n-1), linspace(0, 1, o-1));

f = sin(x) .* cos(y) + sin(y) .* cos(z) + sin(z) .* cos(x);
f3 = reshape(f, [], 1);

f = sin(x/10) + sin(y/10) + sin(z/10);
f4 = reshape(f, [], 1);

f = 100 .* exp(-((x - 0.7).^2 + (y - 0.3).^2 + (z - 0.5).^2) ./ 0.0001);
f5 = reshape(f, [], 1);

f = 1 ./ sqrt((x - 0.7).^2 + (y - 0.3).^2 + (z - 0.5).^2 + 1e-3);
f6 = reshape(f, [], 1); 

f = 1 ./ sqrt((x - 0.7).^2 + (y - 0.3).^2 + (z - 0.5).^2 + 1e-5);
f7 = reshape(f, [], 1); 

ResI= zeros(6,3);


%% run test

% relative residual
figure(1);

ff_all = {f2, f3, f4, f5, f6, f7};
leg = {"f1", "f2", "f3", "f4", "f5", "f6"};

set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)

for index = 1:length(ff_all)
    ff = ff_all{index};

    s = tic();
    res_norm = [];
    res_norm(1) = norm(ff);

    iteration = 1;
    u_solution = V_cycle_recursion(A, ff, m, n, o, k1, k2, l, 1, solver, omega);
    res_norm(iteration+1) = norm(ff - A{l}*u_solution); 
    for iteration = 2:10
        u_solution = V_cycle_recursion(A, ff, m, n, o, k1, k2, l, u_solution, solver, omega);
        res_norm(iteration+1) = norm(ff - A{l}*u_solution);
    end
    t = toc(s);
    semilogy(res_norm/res_norm(1)); hold on;
    ResI(index,:) = [t, iteration, norm(ff - A{l}*u_solution)/norm(ff)];
end
hold off
legend(leg)
%title("Convergence for varying rhs")
xlabel("Iteration")
ylabel("Relative residual")
set(gca,"xticklabel",0:10)


% relative energy error norm
figure(2);

for index = 1:length(ff_all)
    ff = ff_all{index};

    % approximate exact solution
    u_exact = V_cycle_recursion(A, ff, m, n, o, k1, k2, l, 1, solver, omega);
    for iter = 1:30
        u_exact = V_cycle_recursion(A, ff, m, n, o, k1, k2, l, u_exact, solver, omega);
    end

    s = tic();
    res_norm = [];
    eng_norm(1) = sqrt(u_exact'*(A{l}*u_exact)); 
    
    iteration = 1;
    u_solution = V_cycle_recursion(A, ff, m, n, o, k1, k2, l, 1, solver, omega);
    error = u_exact - u_solution;
    eng_norm(iteration+1) = sqrt(error'*(A{l}*error));    
    
    for iteration = 2:10
        u_solution = V_cycle_recursion(A, ff, m, n, o, k1, k2, l, u_solution, solver, omega);
        error = u_exact - u_solution;
        eng_norm(iteration+1) = sqrt(error'*(A{l}*error));
    end
    t = toc(s);
    semilogy(eng_norm/eng_norm(1)); hold on;
end

hold off
legend(leg)
%title("Convergence for varying rhs")
xlabel("Iteration")
ylabel("Relative energy error norm")
set(gca,"xticklabel",0:10)

return