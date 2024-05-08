function [vector] = zero_vector(m,n,o,i)
    if o == 0
        if n == 0
            vector = zeros(m/(2^(i-1))-1,1);
        else 
            vector = zeros((m/(2^(i-1))-1)*(n/(2^(i-1))-1),1);
        end
    else
        vector = zeros((m/(2^(i-1))-1)*(n/(2^(i-1))-1)*(o/(2^(i-1))-1),1);
    end
end