% Problem 2
load USAirTransportation;
[m, n] = size(A);
L = zeros(m, n);

% Converting A into a column-stochastic matrix
for j = 1:n
    aCol = A(:, j);
    L(:, j) = aCol / sum(aCol);
end
S = zeros(m,n);
S(:) = 1/n;
alphas = [0.1, 0.15, 0.2]';

% ranking vectors for different alpha values
for i = 1:size(alphas)
    Lb = (1 - alphas(i)) * L + alphas(i) * S;
    % Find the ranking vector
    [e, v] = ps6_1_TyLimpasuvan(Lb);
    
    % Find top 10 airports
    sortedV = sort(v, 'descend');
    maxValues = sortedV(1:10, 1);
    ids = zeros(0, 1);
    for j = 1:10
        idx = find(v == maxValues(j, 1));
        ids = [ids; idx];
    end

    fprintf('IDs of top 10 important airports for alpha = %.2f,\n', alphas(i));
    fprintf('descending:\n');
    for j = 1:size(ids)
        fprintf('%i  ', ids(j));
    end
    fprintf('\n\n');
end
