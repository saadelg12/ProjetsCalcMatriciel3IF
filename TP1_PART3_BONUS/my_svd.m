function [U, S, V] = my_svd(A, precision)
    % Initialisation de Q1 pour la SVD partielle
    Q1 = A' * A; % Calcul de la matrice carrée Q1 comme le produit de A transposée et A
    n = size(Q1, 1); % Nombre de colonnes (ou lignes) de Q1
    V = zeros(n, n); % Initialisation de la matrice V
    D = zeros(n, n); % Initialisation de la matrice D (sera la matrice des valeurs singulières)

    for i = 1:n
        % Puissance itérée pour obtenir les vecteurs propres dominants et valeurs propres
        [Vp, lambda] = puissanceIt(Q1, precision); % Appel de la fonction puissanceIt
        V(:, i) = Vp; % Stockage du vecteur propre dans V
        D(i, i) = sqrt(lambda); % Stockage de la racine carrée de la valeur propre dans D

        % Mise à jour de Q1 pour la prochaine itération
        Q1 = Q1 - lambda * (Vp * Vp'); % Déflation de Q1 en enlevant la contribution du vecteur propre trouvé
    end

    % Calcul de U en utilisant la relation A = UDV'
    U = A * V * inv(D); % Calcul de U en utilisant la relation A = UDV'

    % Retourner les matrices U, S, V
    S = D; % S est la matrice des valeurs singulières (racines carrées des valeurs propres de A'A)
end


function [v, lambda] = puissanceIt(A, precision)
    % Algorithme de puissance itérée pour trouver le vecteur propre dominant et valeur propre
    n = size(A, 1); % Taille de la matrice A
    v = rand(n, 1); % Initialisation aléatoire du vecteur v
    lambda = 0; % Initialisation de la valeur propre lambda

    for k = 1:1000 % Limite d'itérations à 1000
        w = A * v; % Multiplication de A par le vecteur v
        v = w / norm(w); % Normalisation du vecteur w pour obtenir le nouveau v
        lambda_old = lambda; % Stockage de l'ancienne valeur de lambda
        lambda = v' * A * v; % Calcul de la nouvelle valeur de lambda

        % Vérification de la convergence
        if abs(lambda - lambda_old) < precision % Si la différence est inférieure à la précision, arrêter
            break;
        end
    end
end

