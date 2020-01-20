%Problem 3
load carbig;
m = length(MPG);

% Get number of NaN data points
badCount = 0;
for i = 1:m
    if isnan(MPG(i)) || isnan(Weight(i)) || isnan(Horsepower(i))
        badCount = badCount + 1;
    end
end

n = m - badCount;
y = zeros(n, 1);
x1s = zeros(n, 1);
x2s = zeros(n, 1);
A = zeros(n, 4);

% Populate matrices with "good" data
i = 1;
for j = 1:m
    if isnan(MPG(j)) || isnan(Weight(j)) || isnan(Horsepower(j))
        continue;
    end
    y(i) = MPG(j);
    x1 = Weight(j);
    x1s(i) = x1;
    x2 = Horsepower(j);
    x2s(i) = x2;
    A(i, :) = [1, x1, x2, x1 * x2];
    i = i + 1;
end

% Part B
bStar = A\y;

% Part C
hold on;
scatter3(x1s, x2s, y); 
title('Problem 3, part (c)');
fh = @(x1,x2) [1, x1, x2, x1 * x2] * bStar;
ezsurf(fh);
hold off;