% DEMO_P_LAPLACIEN_1D
% Probleme-test independant : -( |u'|^(p-2) u' )' = 1 sur (0,1).
% Conditions aux limites : u(0) = u(1) = 0.
% Exemple de bilan des flux en 1D, sans donnees de recherche.

clear; close all; clc;

N = 80;                         % Nombre de sous-intervalles
x = linspace(0, 1, N+1)';      % Noeuds
h = 1 / N;
x_face = (x(1:end-1) + x(2:end)) / 2;
p_values = [2, 4];

figure('Name', 'p-Laplacien 1D - demonstration');
hold on; grid on;

for k = 1:numel(p_values)
    p = p_values(k);

    % Pour f = 1, l'equilibre q'(x) = -1 et la symetrie donnent :
    q_face = 0.5 - x_face;

    % Relation constitutive : q = |u'|^(p-2) u'
    du_face = sign(q_face) .* abs(q_face).^(1/(p-1));

    % Reconstruction de u avec la condition u(0) = 0.
    u = [0; cumsum(h * du_face)];

    % Solution exacte pour comparaison.
    exponent = p / (p-1);
    u_exact = (p-1)/p * (0.5^exponent - abs(x - 0.5).^exponent);

    % Controle du residu discret et de la condition au bord droit.
    q_reconstruit = abs(diff(u)/h).^(p-2) .* (diff(u)/h);
    residu = -(q_reconstruit(2:end) - q_reconstruit(1:end-1))/h - 1;
    fprintf('p = %g : erreur max = %.3e, residu max = %.3e, |u(1)| = %.3e\n', ...
        p, max(abs(u-u_exact)), max(abs(residu)), abs(u(end)));

    plot(x, u, 'o-', 'DisplayName', sprintf('Numerique p=%g', p));
    plot(x, u_exact, '--', 'DisplayName', sprintf('Exacte p=%g', p));
end

xlabel('x'); ylabel('u(x)');
title('p-Laplacien 1D : solution numerique et solution exacte');
legend('Location', 'best');
hold off;
