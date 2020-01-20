% problem 7 code
n = 100;

% Creating A
A = zeros(n);
for i = 1:n
    for j = 1:n
        A(i,j) = i * n - (n - j);
    end
end
b = (1:n)';
% We want the first (n-rank(A)) = 2 components to be zero
% thus we want to find the values of the last 2 columns
B = A(:, n-1:n);

x0 = pinv(B)*b; % last 2 values of x
x = zeros(n, 1);
x(n-1) = x0(1);
x(n) = x0(2);
x