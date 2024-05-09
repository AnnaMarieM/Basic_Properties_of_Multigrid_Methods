% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

n = 48;
jj = 0:n;


f0 = @(j) 1/2*(sin(j*pi/n) + sin(j*2*pi/n));
f0 = f0(jj)';
fres0 = 1/4 * ([f0(1); f0(1:2:(n-2)); f0(n+1)] + 2 * [f0(1); f0(2:2:(n-1)); f0(n+1)] + [f0(1); f0(3:2:(n)); f0(n+1)]);
fint0 = interp1( linspace(0,1,numel(fres0)), fres0, linspace(0,1,2*(n/2)+1));


f1 = @(j) 1/2*(sin(j*2*pi/n)+sin(j*4*pi/n));
f1 = f1(jj)';
fres1 = 1/4 * ([f1(1); f1(1:2:(n-2)); f1(n+1)] + 2 * [f1(1); f1(2:2:(n-1)); f1(n+1)] + [f1(1); f1(3:2:(n)); f1(n+1)]);
fint1 = interp1( linspace(0,1,numel(fres1)), fres1, linspace(0,1,2*(n/2)+1));


f2 = @(j) 1/3*(sin(j*8*pi/n)+sin(j*14*pi/n) + sin(j*21*pi/n));
f2 = f2(jj)';
fres2 = 1/4 * ([f2(1); f2(1:2:(n-2)); f2(n+1)] + 2 * [f2(1); f2(2:2:(n-1)); f2(n+1)] + [f2(1); f2(3:2:(n)); f2(n+1)]);
fint2 = interp1( linspace(0,1,numel(fres2)), fres2, linspace(0,1,2*(n/2)+1) );


f3 = @(j) 1/2*(sin(j*18*pi/n) + sin(j*21*pi/n));
f3 = f3(jj)';
fres3 = 1/4 * ([f3(1); f3(1:2:(n-2)); f3(n+1)] + 2 * [f3(1); f3(2:2:(n-1)); f3(n+1)] + [f3(1); f3(3:2:(n)); f3(n+1)]);
fint3 = interp1( linspace(0,1,numel(fres3)), fres3, linspace(0,1,2*(n/2)+1) );


set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)

tiledlayout(4,1)

nexttile
p0 = plot(0:n,f0,'-o', 0:2:n,fres0,'-o');
p0(1).MarkerSize = 3;
p0(2).MarkerSize = 3;
legend("Smooth vector", "Restriction of vector")

nexttile
p1 = plot(0:n,f1,'-o', 0:2:n,fres1,'-o');
p1(1).MarkerSize = 3;
p1(2).MarkerSize = 3;
legend("Smooth vector", "Restriction of vector")

nexttile
p2 = plot(0:n,f2,'-o', 0:2:n,fres2,'-o');
p2(1).MarkerSize = 3;
p2(2).MarkerSize = 3;
legend("Oscillatory vector", "Restriction of vector")

nexttile
p3 = plot(0:n,f3,'-o', 0:2:n,fres3,'-o');
p3(1).MarkerSize = 3;
p3(2).MarkerSize = 3;
legend("Oscillatory vector", "Restriction of vector")