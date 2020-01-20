% Problem 1
function [ e, v ] = ps6_1_TyLimpasuvan( A )
    [~, n] = size(A);
    x = rand(n, 1);
    threshold = 0.00001;
    
    while true
        temp = A * x;
        temp = temp / norm(temp, Inf);
        if (norm(temp - x, Inf) < threshold)
            x = temp;
            break;
        end
        x = temp;
    end
    ev = A*x;
    e = ev(1) / x(1);
    v = x / norm(x);
end

