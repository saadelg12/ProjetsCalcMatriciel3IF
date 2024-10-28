function [X,m] = GS(A,B,e)
%Méthode de Gauss-Seidel
%   Paramètres : 
%   A : Matrice A
%   B : Vecteur B 
%   X : Vecteur X tel que A.X = B
%   m : Nombre d'itérations souhaitées
%   e : Précision souhaitée
%   n : Taille de la matrice

n = size(A,1) ; % size(A,1) donne le nombre de lignes et size(A,2) donne le nombre de lignes

X0 = diag(rand(n)) ; % On initialise le vecteur X0
X = diag(zeros(n)) ;  % On initialise le vecteur X
m = 0 ;  % On initialise le nombre d'itérations

while max(abs(A*X - B)) >= e % Tant que la solution approximative n'est pas dans l'intervalle de tolérance de la solution courante
    for i = 1 : 1 : n
        S1 = 0 ; % On initialise la somme 1
        S2 = 0 ; % On initialise la somme 2
        for j = 1 : 1 : n
            if j < i
                S1 = S1 + A(i,j)*X(j) ;
            end
            if j > i 
                    S2 = S2 + A(i,j)*X0(j) ;
            end
        X(i) = (1/A(i,i))*(B(i) - S1 - S2) ;
        end
    end
    m = m+1 ;
    X0 = X ; 
end

% disp('Solution approximative') ;
% disp(X);
% disp('précision');
% disp(e);
% disp('Nombre iterations');
% disp(m);

end
