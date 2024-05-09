% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

n = 200;
j1 = 0:n;
j2 = 0:2:n;


f0 = @(j) sin(j*1*pi/(length(j1)));
FNk0 = f0(j1);

f1 = @(j) sin(j*1*pi/(length(j2)));
FNk1 = f1(j2);

f2 = @(j) sin(j*2*pi/(length(j1)));
FNk2 = f2(j1);

f3 = @(j) sin(j*2*pi/(length(j2)));
FNk3 = f3(j2);

f4 = @(j) sin(j*4*pi/(length(j1)-1));
FNk4 = f4(j1);

f5 = @(j) sin(j*4*pi/(length(j2)-1));
FNk5 = f5(j2);

f6 = @(j) sin(j*8*pi/(length(j1)-1));
FNk6 = f6(j1);

f7 = @(j) sin(j*8*pi/(length(j2)-1));
FNk7 = f7(j2);


set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)

tiledlayout(4,1)

nexttile
plot(j1, FNk0, j2, FNk1)
legend("\Omega_h", "\Omega_{2h}")
title("Fourier mode with k = 1")

nexttile
plot(j1, FNk2, j2, FNk3)
legend("\Omega_h", "\Omega_{2h}")
title("Fourier mode with k = 2")

nexttile
plot(j1, FNk4, j2, FNk5)
legend("\Omega_h", "\Omega_{2h}")
title("Fourier mode with k = 4")

nexttile
plot(j1, FNk6, j2, FNk7)
legend("\Omega_h", "\Omega_{2h}")
title("Fourier mode with k = 8")

