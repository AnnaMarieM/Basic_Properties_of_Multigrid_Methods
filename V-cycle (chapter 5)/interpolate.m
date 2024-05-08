function [interpolated_vector] = interpolate(vector,m,n,o)
    if n == 0 && o == 0
        interpolated_vector = [1/2 * vector(1), interp1(1:1:length(vector), vector,1:0.5:length(vector)) , 1/2 *vector(length(vector))]';
    
    elseif o == 0
        vector = reshape(vector, n-1, m-1)';

        grid = zeros(m + 1, n + 1);
        grid(2:m, 2:n) = vector;
        interpolated_grid = interp2(grid,"linear");
    
        grid = interpolated_grid(2:end-1, 2:end-1);
        interpolated_vector = reshape(grid', (2*n-1)*(2*m-1),1);

    elseif m == n && n == o
        vector = pagetranspose(reshape(vector, n-1, n-1, n-1));
        
        grid = zeros(n+1, n+1, n+1);
        grid(2:n, 2:n, 2:n) = vector;
        interpolated_grid = interp3(grid,"linear");
    
        grid = interpolated_grid(2:end-1, 2:end-1, 2:end-1);
        interpolated_vector = reshape(pagetranspose(grid), [],1);

    else
        disp("Something went wrong during interpolation.");
        interpolated_vector = 0;

    end
end
