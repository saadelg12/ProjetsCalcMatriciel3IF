% Charger une image et la convertir en matrice de valeurs
[Im, map] = imread('image.jpg'); % Lire l'image 'test2.jpg' dans Im et la colormap dans map
Im = double(Im); % Convertir l'image en un tableau de doubles pour le traitement

% Convertir l'image en niveaux de gris si elle est en couleur
if size(Im, 3) == 3 % Vérifier si l'image a 3 canaux (couleur)
    Im = rgb2gray(uint8(Im)); % Convertir l'image couleur en niveaux de gris
    Im = double(Im); % Convertir à nouveau l'image en un tableau de doubles
end

% Définir la précision pour l'algorithme de la puissance itérée dans la SVD
precision = 1e-6;

% Créer une colormap en nuances de gris et afficher l'image d'origine
gris = ([0:255]/255)' * [1 1 1]; % Créer une colormap en nuances de gris
figure(1); % Ouvrir une nouvelle figure
image(uint8(Im)); % Afficher l'image d'origine
colormap(gris); % Utiliser la colormap en nuances de gris

% Appliquer la SVD personnalisée à l'image
[U, S, V] = my_svd(Im, precision); % Appliquer la SVD avec la fonction personnalisée

% Reconstruction de l'image avec différentes quantités de détails
for i = 1:size(U, 2) % Boucler sur toutes les valeurs singulières
    % Reconstruction partielle de l'image
    imres = U(:, 1:i) * S(1:i, 1:i) * V(:, 1:i)'; % Reconstruire l'image avec les i premières valeurs singulières

    % Affichage de l'image reconstruite à chaque itération
    figure(2); % Ouvrir une nouvelle figure ou mettre à jour la figure existante
    image(uint8(imres)); % Afficher l'image reconstruite
    colormap(gris); % Utiliser la colormap en nuances de gris

    % Afficher le nombre de valeurs singulières utilisées dans le titre
    title(['Reconstruction avec ', num2str(i), ' valeurs singulières']);

    pause(0.5); % Pause pour visualiser chaque itération
end

