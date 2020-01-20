% code for problem 6

numvals = 25;
ns = logspace(2, 4, numvals); % part a 
nLogs = zeros(1, numvals);

% part b
arrays = cell(1, numvals);
for i = 1 : numvals
    nInt = round(ns(i));
    arrays{i} = randn(nInt);
    nLogs(i) = log10(nInt);
end

%parts c and d
timeTaken = zeros(1, numvals);

for i = 1 : numvals
    tic
    det(arrays{i});
    timeTaken(i) = log10(toc);
end

% set up the plot
plot(nLogs, timeTaken)
title('Calculation time of determinant vs. matrix size')
xlabel('Matrix size, log10')
ylabel('Time (s), log10')
grid on