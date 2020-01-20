% Problem 5

clear deltav;
clear deltau;
ns = 10:10:100;
deltav = zeros(10, 1);
deltau = zeros(10, 1);
for n = ns
    % gram_schmidt is defined in a separate file
    V = gram_schmidt(hilb(n));
    A1 = eye(n) - V' * V;
    deltav(n/10) = norm(A1, Inf);
    % gram_schmidt_stable is defined in a separate file
    U = gram_schmidt_stable(hilb(n));
    A2 = eye(n) - U' * U;
    deltau(n/10) = norm(A2, Inf);
end

plot(ns, deltav, '-+r');
title('Stability of Gram-Schmidt process');
grid on;
hold on;
plot(ns, deltau, '-*b');
legend({'$\delta_v(n)$', '$\delta_u(n)$'},'Interpreter','latex');
ylabel('$\delta(n)$','Interpreter','latex');
xlabel('n');
hold off;