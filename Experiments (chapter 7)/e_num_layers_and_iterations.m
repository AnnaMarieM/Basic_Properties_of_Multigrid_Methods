m = 128; % 1st dimension
n = 128; % 2nd dimension
o = 128; % 3rd dimension

maxk = 7;
maxl = 6;
results = cell(maxk, maxl-1); 
repeat = 5;

% Right side
f = ones(abs((m-1)*(n-1)*(o-1)),1);

% Init matrices 
A = cell(1, maxl);  
for i = 1:maxl     
    A{i} = generate(m/(2^(maxl-i)), n/(2^(maxl-i)), o/(2^(maxl-i)));
end


for l = 2:maxl
    As = A(end-(l-1):end);
    for k = 1:maxk
        s = tic();
        u_solution = V_cycle_recursion(As, f, m, n, o, k, k, l, 1, "J", 1);
        iteration = 1;
        for rep = 1:repeat            
    
            while norm(f - As{l} * u_solution)/norm(f) > 1e-6
                u_solution = V_cycle_recursion(As, f, m, n, o, k, k, l, u_solution, "J", 1);
                iteration = iteration + 1;
            end
        end
        time = toc(s);
        
        results{k,l} = [time/repeat, iteration/repeat];
    end
end

disp(results)

eval(sprintf('ResGS%d = results;', m))
