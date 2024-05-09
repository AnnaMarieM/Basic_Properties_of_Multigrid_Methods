% Author: Anna Marie Minarovičová
% code supporting the bachelor thesis Basic Properties of Multigrid Methods 
% Charles University, may 2025

function [] = plot_poisson_sol(m,n,o,u1)
    % plot in 1D
    if n == 0 && o == 0
        plot(0:m,[0;u1;0])
        xlim([0 m])

    % plot in 2D
    elseif o == 0
        grid = zeros(m + 1, n + 1);
        grid(2:m, 2:n) = reshape(u1, n-1, m-1)';

        pcolor(grid);
        colormap('jet');
        shading interp; 
        %contour(grid,'LineColor','none');
        colorbar;
        
        xlim([0 n])
        ylim([0 m])

    % plot in 3D
    elseif m == n && n == o
        grid = zeros(n+1, n+1, n+1);
        grid(2:n, 2:n, 2:n) = pagetranspose(reshape(u1, n-1, n-1, n-1));
        
        [X, Y, Z] = meshgrid(0:n, 0:n, 0:n);
        
        scatter3(X(:), Y(:), Z(:), 10, grid(:), 'filled');
        
        colormap('jet');
        colorbar;
        alpha(0.4);
        
        xlim([-2 n+2])
        ylim([-2 n+2])
        zlim([-2 n+2])
    end
end