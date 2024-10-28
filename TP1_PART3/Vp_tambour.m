function [min, max, l] = Vp_tambour(c)

[A] = Tambour();
min = zeros(50, 1); 
max = zeros(25, 1); 

% % ---------- Minima ------------
% disp('Affichage des 50 plus petites vp') ;
% vp = inv(A);
% for i = 1:50
%     [vp, l] = Deflation(vp);
%     min(i) = 1 / l;
%     disp(i) ;
%     disp(min(i,1))
% end

% % % ---------- Maxima ------------
% disp('Affichage des 25 plus grandes vp') ;
% vp = A;
% for i = 1:25
%     [vp, l] = Deflation(vp);
%     max(i) = l;
%     disp(i) ;
%     disp(max(i,1))
% end
% 
% % ---------- Proche de c ------
disp('Affichage vp plus proche de c') ;
[vp, l] = Deflation(inv(A - c * eye(600)));
l = c + 1 / l;
disp(l) ;

% ---------- Visualisations ---
figure;
hold on;

% % Visualisation des vibrations associées à min
% for i = 1:size(min, 1)
%     [vp, ~] = P_iteree(inv(A - min(i) * eye(600)));
%     vp = reshape(vp, 15, 40);
%     subplot(5, 10, i); % Affichage sur une grille de 5*5
%     surf(vp);
%     title(['Min ', num2str(i)]);
% end

% Visualisation des vibrations associées à max
% for i = 1:size(max, 1)
%     [vp, ~] = P_iteree(inv(A - max(i) * eye(600)));
%     %vp = reshape(vp, 15, 40);
%     vp = reshape(vp, 15, 40);
%     subplot(5, 5, i); % Affichage sur une grille de 5*5
%     surf(vp);
%     title(['Max', num2str(i)]);
% end

% % Visualisation de la vibration associée à c
[vp, ~] = P_iteree(inv(A - c * eye(600)));
vp = reshape(vp, 15, 40);
subplot(2, 2,1);
surf(vp);
title(['Proche de c']);

hold off;

end

