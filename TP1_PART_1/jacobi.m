function [X,m] = jacobi(A,B,e)
%Méthode de Jacobi
%   Paramètres : 
%   A : Matrice A
%   B : Vecteur B 
%   X : Vecteur X tel que A.X = B
%   m : Nombre d'itérations souhaitées
%   e : Précision souhaitée
%   n : Taille de la matrice

n = size(A,1) ; % size(A,1) donne le nombre de lignes et size(A,2) donne le nombre de lignes

X0 = diag(rand(n)) ; % On initialise le vecteur 0
X = diag(zeros(n)) ;  % On initialise le vecteur X
m = 0 ;  % On initialise le nombre d'itérations

while max(abs(A*X - B)) >= e % Tant que la solution approximative n'est pas dans l'intervalle de tolérance de la solution courante
    for i = 1 : 1 : n
        S = 0 ; % On initialise la somme
        for j = 1 : 1 : n
            if i ~= j 
                S = S + A(i,j)*X0(j) ; 
            end
        X(i) = (1/A(i,i))*(B(i) - S) ;
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
