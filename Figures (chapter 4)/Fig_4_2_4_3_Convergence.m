n = 500;
tol = 10^(-3);
smoother = "J"; %"J" for Jacobi, "GS" for Gauss-Seidel

A = generate_1D(n+2);

jj = 0:n;

f1 = @(j) sin(j*1*pi/n);
u_1 = f1(jj)';

f2 = @(j) sin(j*2*pi/n);
u_2 = f2(jj)';

f4 = @(j) sin(j*4*pi/n);
u_4 = f4(jj)';

f8 = @(j) sin(j*8*pi/n);
u_8 = f8(jj)';

f = zeros(n+1,1);


if solver == "J"
    [x_1,it1,resnorm1,errornorm1] = Jacobi_for_SLE(A,u_1,f,tol,A\u_1);
    [x_2,it2,resnorm2,errornorm2] = Jacobi_for_SLE(A,u_2,f,tol,A\u_2);
    [x_4,it4,resnorm4,errornorm4] = Jacobi_for_SLE(A,u_4,f,tol,A\u_4);
    [x_8,it8,resnorm8,errornorm8] = Jacobi_for_SLE(A,u_8,f,tol,A\u_8);
elseif solver == "GS"
    [x_1,it1,resnorm1,errornorm1] = Gauss_Seidel_for_SLE(A,u_1,f,tol,A\u_1);
    [x_2,it2,resnorm2,errornorm2] = Gauss_Seidel_for_SLE(A,u_2,f,tol,A\u_2);
    [x_4,it4,resnorm4,errornorm4] = Gauss_Seidel_for_SLE(A,u_4,f,tol,A\u_4);
    [x_8,it8,resnorm8,errornorm8] = Gauss_Seidel_for_SLE(A,u_8,f,tol,A\u_8);
end

set(0, "DefaultLineLinewidth", 1.5)
set(0, "DefaultAxesFontsize", 14)

figure(1);
semilogy([1, resnorm8/resnorm8(1)]); hold on
semilogy([1, resnorm4/resnorm4(1)]); hold on
semilogy([1, resnorm2/resnorm2(1)]); hold on
semilogy([1, resnorm1/resnorm1(1)])
legend("v_8", "v_4", "v_2", "v_1")
ylabel("Relative residual")
xlabel("Iteration")
%title("Relative residual norm")
hold off


figure(2);
semilogy([1, errornorm8/errornorm8(1)]); hold on
semilogy([1, errornorm4/errornorm4(1)]); hold on
semilogy([1, errornorm2/errornorm2(1)]); hold on
semilogy([1, errornorm1/errornorm1(1)])
legend("v_8", "v_4", "v_2", "v_1")
ylabel("Relative error")
xlabel("Iteration")
% title("Relative error norm")
hold off
