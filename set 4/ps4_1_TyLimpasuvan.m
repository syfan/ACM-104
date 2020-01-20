%Problem 1

A = [1 2 -1;
    0 -2 3;
    1 5 -1;
    -3 1 1];
b = [ 0; 5; 6; 8];

K = A'*A;
f = A' * b;
x_star = inv(K) * f;
A * x_star