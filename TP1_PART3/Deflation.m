% Voici une explication détaillée de ce que fait le code :
% 
% Il utilise la fonction P_iteree (que vous avez fournie précédemment) pour trouver la valeur propre dominante l1 et 
% le vecteur propre correspondant v de la matrice A.
% 
% Il utilise également la fonction P_iteree pour trouver la valeur propre dominante l2 et le vecteur propre correspondant u de la matrice transposée A'.
% 
% Il vérifie si les valeurs propres l1 et l2 sont proches l'une de l'autre (à une tolérance de 1E-1).
% Si c'est le cas, il calcule la nouvelle matrice X en soustrayant le produit externe de v et u multiplié par l1 de la matrice A.
% 
% Si l1 et l2 ne sont pas proches, il appelle récursivement la fonction Deflation sur la matrice A jusqu'à ce qu'ils soient proches.
% 
% À la fin, le code renvoie la matrice X qui est la matrice A avec la valeur propre dominante supprimée, et la valeur propre dominante l1.

function [ X, l1] = Deflation( A )
%Suppression du vecteur propre max d'une matrice A dont on veut supprimer la valeur max

[v,l1]=P_iteree(A);
[u,l2]=P_iteree(A');

if abs(l1-l2)<=1E-1
    X=A-l1*((v*(u'))/((u')*v));
else
    [X, l1] = Deflation(A);
end

% Autre code plus pratique si execution de ce programme seul
% function [X,l] = Deflation(A,nb_Deflations)
% %
% %   A : Matrice a tester
% %   nb_Deflations : rang de la vp qu'on souhaite extraire a chaque execution
% %   du code ; REMARQUE : SI ON DECOMMENTE LES DISP, LE CODE AFFICHERA
% %   TOUTES LES VP PRECEDENT LA VP QU'ON VEUT EXTRAIRE
% 
% [u,l1] = P_iteree(A') ; %Calcul du vecteur propre ligne et de sa valeur propre dominante associée
% [v,l2] = P_iteree(A) ; %Calcul du vecteur propre colonne et de sa valeur propre dominante associée
% 
% % disp(l2) ;
% % disp(v) ; 
% 
% l = l2 ; 
% X = v ;
% 
% for i = 2 : nb_Deflations
%     A = A - l1 * (v*u') / (u'*v) ; 
%     [u,l1] = P_iteree(A') ;
%     [v,l2] = P_iteree(A) ;
%     l = l2 ; 
%     X = v ;
%     % disp(l) ;
%     % disp(X) ; 
% end

