m = 128; % 1st dimension
n = 128; % 2nd dimension
o = 128; % 3rd dimension


k1 = 4; % number of iterations of iterative method in pre-smoothing
k2 = 4; % number of iterations of iterative method in post-smoothing
l = 5; % number of grid levels
solver = "J"; % J or GS - Jacobi or Gauss-Seidel solver


% Right side
f = ones(abs((m-1)*(n-1)*(o-1)),1);
%f = sin((1:abs((m-1)*(n-1)*(o-1)))');
%f = zeros(abs((m-1)*(n-1)*(o-1)),1);   % Laplace operator


% init matrices 
A = cell(1, l);  
for i = 1:l       
    A{i} = generate(m/(2^(l-i)), n/(2^(l-i)), o/(2^(l-i)));
end


s = tic();

u_solution = V_cycle_recursion(A, f, m, n, o, k1, k2, l, 1, solver, 1);
iteration = 1;
while norm(f - A{l}*u_solution)/norm(f) > 1e-6
    u_solution = V_cycle_recursion(A, f, m, n, o, k1, k2, l, u_solution, solver, 1);
    iteration = iteration + 1;
end

t = toc(s)


disp(iteration);
disp(norm(f - A{l}*u_solution)/norm(f));


%plot_poisson_sol(m, n, o, u_solution);  % uncomment if you want to plot
                                         % the obtained solution
