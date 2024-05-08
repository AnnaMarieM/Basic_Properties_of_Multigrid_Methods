n = 100; 
tol = 10^(-3);

A = generate_1D(n+2);

jj = 0:n;
f = zeros(n+1,1);

iterations = zeros(1, n);
errors = zeros(1, n);

for i = 1:2:n
    ff = @(j) sin(j*i*pi/n);
    u = ff(jj)';
    [x,it,resnorm,errornorm] = Jacobi_for_SLE(A,u,f,tol,A\u);
    errors(i) = errornorm(end)/norm(u);
    iterations(i) = it;
end

set(0, "DefaultLineLinewidth", 1.5)
set(0, "DefaultAxesFontsize", 14)

plot(1:2:n,iterations(1:2:end))


