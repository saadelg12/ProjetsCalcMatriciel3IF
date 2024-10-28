% Ouverture de l'image 'ImageTest.png'
[im, map] = imread('image.jpg');

% Convertir l'image en double
im = double(im);

% Construction de la palette 'Niveau de Gris'
gris = ([0:255]/255)' * [1 1 1];

% % Affichage de l'image originale
% figure(1)
% image(uint8(im)) % Affichage en tant qu'image (3 canaux de couleurs)
% colormap(gris)
% title('Image d''origine')

% Nombre de valeurs singulières à conserver pour la transmission progressive
num_values_to_keep = 50; % Vous pouvez ajuster ce nombre

% Initialisation de l'image résultante
imres = zeros(size(im));

for k = 1:size(U,2)
    im_partial = zeros(size(im));
    for channel = 1:3
        % Décomposition SVD sur chaque canal de couleur
        [U, S, V] = svd(im(:, :, channel));
        % Reconstruction partielle de chaque canal
        im_partial(:, :, channel) = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';
    end
    
    % Affichage de l'image partielle
    figure(2)
    image(uint8(im_partial)) % Affichage en tant qu'image (3 canaux de couleurs)
    colormap(gris)
    title(['Image avec ', num2str(k), ' valeurs singulières'])
    
    
    pause(0.5); % Attente avant de passer à la prochaine image partielle
end

