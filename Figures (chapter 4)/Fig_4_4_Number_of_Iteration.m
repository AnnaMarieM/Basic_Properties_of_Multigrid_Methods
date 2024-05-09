n = 100; 
tol = 10^(-3);

A = generate_1D(n+2);

jj = 0:n;
f = zeros(n+1,1);

iterationsJ = zeros(1, n);
errorsJ = zeros(1, n);

for i = 1:2:n
    ff = @(j) sin(j*i*pi/n);
    u = ff(jj)';
    [x,it,resnorm,errornorm] = Jacobi_for_SLE(A,u,f,tol,A\u);
    errorsJ(i) = errornorm(end)/norm(u);
    iterationsJ(i) = it;
end

iterationsWJ = zeros(1, n);
errorsWJ = zeros(1, n);

for i = 1:2:n
    ff = @(j) sin(j*i*pi/n);
    u = ff(jj)';
    [x,it,resnorm,errornorm] = Weighted_Jacobi_for_SLE(A,u,f,tol,A\u, 4/5);
    errorsWJ(i) = errornorm(end)/norm(u);
    iterationsWJ(i) = it;
end

set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)


% First figure
subplot(1,2,1);
plot(1:2:n,iterationsJ(1:2:end))
xlabel("Frequency")
ylabel("Iterations")
title("Jacobi")

% Second figure
subplot(1,2,2);
plot(1:2:n,iterationsWJ(1:2:end))
xlabel("Frequency")
ylabel("Iterations")
title("Weighted Jacobi")




