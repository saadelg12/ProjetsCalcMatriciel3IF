% Voici une explication détaillée de ce que fait le code :
% 
% Il initialise un vecteur X avec des valeurs aléatoires et normalise ce vecteur.
% 
% Il entre dans une boucle while qui continue [jusqu'à ce que la différence entre les valeurs propres 
% calculées dans les itérations successives soit inférieure à une certaine tolérance (1E-3 dans ce cas).]
% 
% Dans chaque itération, il normalise le vecteur X, le multiplie par la matrice A pour obtenir un nouveau vecteur Y, 
% et normalise ce vecteur pour obtenir le vecteur propre vp.
% 
% Il multiplie ensuite la matrice A par le vecteur propre vp pour obtenir un nouveau vecteur Z.
% 
% Il trouve [l'élément maximum de Z et utilise son indice pour calculer la valeur propre l ' ...
% comme le rapport de l']élément correspondant de Z sur l'élément correspondant de vp.
% 
% Enfin, il met à jour la avec la valeur de l pour la prochaine itération.
% 
% À la fin de la boucle, le code renvoie la valeur propre dominante l et le vecteur propre correspondant vp.

function [ vp, l] = P_iteree( A )
%Méthode 1
%Retourne le vecteur propre max et la valeur propre associée
%   A : Matrice a tester
%   l : Valeur propre
%   vp: Vecteur propre

X=diag(rand(max(size(A))));
Ya=X;
Y=X;
l=4;
la=0;
while abs(l-la)>=1E-3
    la=l;
    Ya=Y;

    X=Ya/norm(Ya);
    Y=A*X;

    vp=Y/norm(Y);
    Z=A*vp;
    [M,k]=max(Z);

    l=(Z(k))/(vp(k));
end

% disp(l) ;
% disp(vp);

end


