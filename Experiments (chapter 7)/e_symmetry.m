m = 128; % 1st dimension
n = 128; % 2nd dimension
o = 128; % 3rd dimension

l = 5; % number of grid levels

% Right side
f = ones(abs((m-1)*(n-1)*(o-1)),1);

% Init matrices 
A = cell(1, l);  
for i = 1:l       
    A{i} = generate(m/(2^(l-i)), n/(2^(l-i)), o/(2^(l-i)));
end

maxk1 = 7;
maxk2 = 7;

repeat = 5;

results = cell(maxk1, maxk2); 

i = 0;
for k1 = 1:maxk1
    for k2 = 1:maxk2
        i = i + 1;

        s = tic();
        iteration = 1;
        for rep = 1:repeat
        
            u_solution = V_cycle_recursion(A, f, m, n, o, k1, k2, l, 1, "J", 1);
            
    
            while norm(f - A{l}*u_solution)/norm(f) > 1e-6
                u_solution = V_cycle_recursion(A, f, m, n, o, k1, k2, l, u_solution, "J", 1);
                iteration = iteration + 1;
            end
        end
        t = toc(s);
        
        results{k1,k2} = [t/repeat, iteration/repeat];  
    end
end

disp(results)

eval(sprintf('ResSym%d%g = results;', m, l))
