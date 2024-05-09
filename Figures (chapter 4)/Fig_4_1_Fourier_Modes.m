% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

n = 500;
j = 0:n;

f0 = @(j) sin(j*0*pi/n);
FNk0 = f0(j);

f1 = @(j) sin(j*1*pi/n);
FNk1 = f1(j);

f2 = @(j) sin(j*2*pi/n);
FNk2 = f2(j);

f3 = @(j) sin(j*3*pi/n);
FNk3 = f3(j);

f4 = @(j) sin(j*4*pi/n);
FNk4 = f4(j);

f8 = @(j) sin(j*8*pi/n);
FNk8 = f8(j);

set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)
plot(j, FNk0, j, FNk1, j, FNk2, j, FNk3, j, FNk4, j, FNk8);
legend("k = 0", "k = 1", "k = 2", "k = 3", "k = 4", "k = 8")

