n = 24;

jj = 0:n;


f1 = @(j) 1/3*(sin(j*4*pi/n)+sin(j*14*pi/n) + sin(j*21*pi/n));
f1 = f1(jj)' + 1/6*rand(n+1,1);

fres1 = [f1(1:2:(n+1))];
fint1 = interp1( linspace(0,1,numel(fres1)), fres1, linspace(0,1,2*(n/2)+1) );


f2 = @(j) 1/2*(sin(j*2*pi/n)+sin(j*4*pi/n));
f2 = f2(jj)' + 1/6*rand(n+1,1);

fres2 = [f2(1:2:(n+1))];
fint2 = interp1( linspace(0,1,numel(fres2)), fres2, linspace(0,1,2*(n/2)+1) );



set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)

tiledlayout(2,1)

nexttile
p2 = plot(0:n,f2,'-o',0:n,fint2,'-o');
p2(1).MarkerSize = 3;
p2(2).MarkerSize = 3;
legend("Smooth error", "Interpolation of exactly computed approximation on \Omega_{2h}")

nexttile
p1 = plot(0:n,f1,'-o',0:n,fint1,'-o');
p1(1).MarkerSize = 3;
p1(2).MarkerSize = 3;
legend("Oscillatory error", "Interpolation of exactly computed approximation on \Omega_{2h}")