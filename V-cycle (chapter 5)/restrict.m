function [restricted_vector] = restrict(vector,m,n,o)
    if n == 0 && o == 0
        a = 1/4 * [vector(1:2:(m-2))];
        b = 1/2 * [vector(2:2:(m-1))];
        c = 1/4 * [vector(3:2:(m))];

        restricted_vector = a + b + c;
    
    elseif o == 0
        grid = reshape(vector, n-1, m-1)';

        coarse_grid = zeros(m/2-1, n/2-1);
        
        for i = 1:(m/2 - 1)
            for j = 1:(n/2 - 1)
                coarse_grid(i, j) = (grid(2*i-1, 2*j-1) + grid(2*i-1, 2*j+1) + grid(2*i+1, 2*j-1) ...
                    + grid(2*i+1, 2*j+1) + 2 * grid(2*i, 2*j-1) + 2 * grid(2*i-1, 2*j) + ...
                    2 * grid(2*i, 2*j+1) + 2 * grid(2*i+1, 2*j) + 4 * grid(2*i, 2*j)) / 16;
            end
        end
        restricted_vector = reshape(coarse_grid',(m/2-1) * (n/2-1), 1);

    elseif m == n && n == o
        grid = pagetranspose(reshape(vector, n-1,n-1,n-1));
        
        coarse_grid = zeros((n)/2-1, (n)/2-1, (n)/2-1);
        
        for i = 1:(n)/2-1
            for j = 1:(n)/2-1
                for k = 1:(n)/2-1
                    coarse_grid(i,j,k) = (grid(2*i-1, 2*j-1, 2*k-1) + grid(2*i+1, 2*j-1, 2*k-1) + grid(2*i-1, 2*j+1, 2*k-1) + grid(2*i-1, 2*j-1, 2*k+1) ...
                        + grid(2*i+1, 2*j+1, 2*k+1) + grid(2*i-1, 2*j+1, 2*k+1) + grid(2*i+1, 2*j-1, 2*k+1) + grid(2*i+1, 2*j+1, 2*k-1) ...
                        + 2 * grid(2*i, 2*j-1, 2*k-1) + 2 * grid(2*i, 2*j-1, 2*k+1) + 2 * grid(2*i, 2*j+1, 2*k-1) ...
                        + 2 * grid(2*i, 2*j+1, 2*k+1) + 2 * grid(2*i-1, 2*j, 2*k-1) + 2 * grid(2*i-1, 2*j, 2*k+1) ...
                        + 2 * grid(2*i+1, 2*j, 2*k-1) + 2 * grid(2*i+1, 2*j, 2*k+1) + 2 * grid(2*i-1, 2*j-1, 2*k) ...
                        + 2 * grid(2*i-1, 2*j+1, 2*k) + 2 * grid(2*i+1, 2*j-1, 2*k) + 2 * grid(2*i+1, 2*j+1, 2*k) ...
                        + 4 * grid(2*i, 2*j, 2*k-1) + 4 * grid(2*i, 2*j, 2*k+1) + 4 * grid(2*i, 2*j-1, 2*k) ...
                        + 4 * grid(2*i, 2*j+1, 2*k) + 4 * grid(2*i-1, 2*j, 2*k) + 4 * grid(2*i+1, 2*j, 2*k) +  8 * grid(2*i, 2*j, 2*k)) / 64;
                end
            end
        end
        restricted_vector = reshape(pagetranspose(coarse_grid), [], 1);
        
    else
        disp("Something went wrong during restriction.");
        restricted_vector = 0;

    end
end