% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

n = 48;
jj = 1:n-1;

Ah = generate_1D(n);
invA2h = inv(generate_1D(n/2));


e0 = @(j) 1/2*(sin(j*pi/n) + sin(j*2*pi/n));
e0 = e0(jj)';
efin0 = Ah * e0;
eres0 = invA2h * 1/4 * (efin0(1:2:(n-2)) + 2 * efin0(2:2:(n-1)) + efin0(3:2:(n)));
eint0 = interp1(1:numel(eres0), eres0, linspace(1, numel(eres0), n-1));

e1 = @(j) 1/2*(sin(j*2*pi/n)+sin(j*4*pi/n));
e1 = e1(jj)';
efin1 = Ah * e1;
eres1 = invA2h * 1/4 * (efin1(1:2:(n-2)) + 2 * efin1(2:2:(n-1)) + efin1(3:2:(n)));
eint1 = interp1(1:numel(eres1), eres1, linspace(1, numel(eres1), n-1));

e2 = @(j) 1/3*(sin(j*8*pi/n)+sin(j*14*pi/n) + sin(j*21*pi/n));
e2 = e2(jj)';
efin2 = Ah * e2;
eres2 = invA2h * 1/4 * (efin2(1:2:(n-2)) + 2 * efin2(2:2:(n-1)) + efin2(3:2:(n)));
eint2 = interp1(1:numel(eres2), eres2, linspace(1, numel(eres2), n-1));

e3 = @(j) 1/2*(sin(j*18*pi/n) + sin(j*22*pi/n));
e3 = e3(jj)';
efin3 = Ah * e3;
eres3 = invA2h * 1/4 * (efin3(1:2:(n-2)) + 2 * efin3(2:2:(n-1)) + efin3(3:2:(n)));
eint3 = interp1(1:numel(eres3), eres3, linspace(1, numel(eres3), n-1));



set(0, "DefaultLineLinewidth", 2)
set(0, "DefaultAxesFontsize", 22)

tiledlayout(4,1)

nexttile
p0 = plot(1:n-1,e0,'-o', 1:n-1,eint0,'-o');
p0(1).MarkerSize = 3;
p0(2).MarkerSize = 3;
legend("Smooth error", "Restriction of vector")

nexttile
p1 = plot(1:n-1,e1,'-o', 1:n-1,eint1,'-o');
p1(1).MarkerSize = 3;
p1(2).MarkerSize = 3;
legend("Smooth error", "Restriction of vector")

nexttile
p2 = plot(1:n-1,e2,'-o', 1:n-1,eint2,'-o');
p2(1).MarkerSize = 3;
p2(2).MarkerSize = 3;
legend("Oscillatory error", "Restriction of vector")

nexttile
p3 = plot(1:n-1,e3,'-o', 1:n-1,eint3,'-o');
p3(1).MarkerSize = 3;
p3(2).MarkerSize = 3;
legend("Oscillatory error", "Restriction of vector")

