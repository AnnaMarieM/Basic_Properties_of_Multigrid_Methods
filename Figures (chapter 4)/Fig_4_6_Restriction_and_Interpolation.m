n = 12;

jj = 0:n;

f1 = @(j) sin(j*1*pi/n);
u_1 = f1(jj)';

f2 = @(j) sin(j*2*pi/n);
u_2 = f2(jj)';

f6 = @(j) sin(j*6*pi/n);
u_6 = f6(jj)';

f32 = @(j) sin(j*5*pi/n);
u_32 = f32(jj)';

f = 1/4 * (u_1 + u_2 + u_6 + u_32);

%f = rand(n+1,1);
fint = interp1(linspace(0,1,numel(f)), f, linspace(0,1,2*n+1) );
a = 1/4 * [f(1); f(1:2:(n-2)); f(n+1)];
b = 1/2 * [f(1); f(2:2:(n-1)); f(n+1)];
c = 1/4 * [f(1); f(3:2:(n)); f(n+1)];
fres = a+b+c;

set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)

tiledlayout(3,1)

nexttile
plot(0:2*n,fint,'-o')
xlim([0, 24]);

% Top plot
nexttile
plot(0:n,f,'-o')

% Bottom plot
nexttile
plot(0:(n/2),fres,'-o')