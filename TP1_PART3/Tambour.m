% %Modélisation 1 <=> Modélisation 4 
% //Donne c = 0.5358 // Points fixes a 1, centraux
% positifs (3 ou 4), voisins négatifs
% function [ A ] = Tambour()
% 
% X=ones(15,40);
% i=0;%lignes
% j=0;%colonnes
% 
% % // Points immobiles
% X(1,1)=0;
% 
% for j=15:40 % Bord haut
%     X(1,j)=0;
% end
% 
% for i=1:15 % Bord droite
%     X(i,40)=0;
% end
% 
% for i=6:10 %Lignes milieu
%     X(i,10)=0;
%     X(i,25)=0;
% end
% 
% for j=1:40 %Bord bas
%     X(15,j)=0;
% end
% 
% B=reshape(X',600,1);
% 
% A=zeros(600);
% for i=1:600
%     if B(i)==1
%         A(i,i)=4;
%         if mod(i-1,40)~=0
%             A(i,mod(i-1+1,600)+1)=-1; %Sauf bord droit
%         else
%             A(i,i)=A(i,i)-1; %Cas du bord droit
%         end
%         if mod(i-1,40)~=1
%             A(i,mod(i-1-1,600)+1)=-1; %sauf bord gauche
%         else
%             A(i,i)=A(i,i)-1; %Cas du bord gauche
%         end
%         if i<=560
%             A(i,mod(i-1+40,600)+1)=-1; %sauf bord bas
%         else
%             A(i,i)=A(i,i)-1; %Cas du bas de la matrice
%         end
%         if i>=40
%             A(i,mod(i-1-40,600)+1)=-1; %sauf bord haut
%         else
%             A(i,i)=A(i,i)-1; %Cas du haut de la matrice
%         end
%     else
%         A(i,i)=1;
%     end
% end
% 
% end

% %Modélisation 2 //Donne c = 1 // Points fixes a 1 ; points centraux de
% valeur négative (-3 ou -4) ; leurs voisins de valeur positive (1)
% function [ A,B ] = Tambour()
% 
% 
% X=ones(15,40);
% i=0;%lignes
% j=0;%colonnes
% 
% % // Points immobiles
% X(1,1)=0;
% 
% for j=15:40 % Bord haut
%     X(1,j)=0;
% end
% 
% for i=1:15 % Bord droite
%     X(i,40)=0;
% end
% 
% for i=6:10 %Lignes milieu
%     X(i,10)=0;
%     X(i,25)=0;
% end
% 
% for j=1:40 %Bord bas
%     X(15,j)=0;
% end
% 
% B=reshape(X',600,1);
% 
% A=zeros(600);
% for i=1:600
%     if B(i)==1
%         A(i,i)=-4;
%         if mod(i-1,40)~=0
%             A(i,mod(i-1+1,600)+1)=1; %Sauf bord droit
%         else
%             A(i,i)=A(i,i)+1; %Cas du bord droit
%         end
%         if mod(i-1,40)~=1
%             A(i,mod(i-1-1,600)+1)=1; %sauf bord gauche
%         else
%             A(i,i)=A(i,i)+1; %Cas du bord gauche
%         end
%         if i<=560
%             A(i,mod(i-1+40,600)+1)=1; %sauf bord bas
%         else
%             A(i,i)=A(i,i)+1; %Cas du bas de la matrice
%         end
%         if i>=40
%             A(i,mod(i-1-40,600)+1)=1; %sauf bord haut
%         else
%             A(i,i)=A(i,i)+1; %Cas du haut de la matrice
%         end
%     else
%         A(i,i)=1;
%     end
% end




%Modélisation 3 <=> Modélisation 2 
%Dans cette modélisation, les points fixes
%sont initialisés a 1 au lieu de zéro ; les points centres sont de valeur
%négative (-3 ; -4) ; leurs voisins de valeur positive (+1)
function [A] = tambour()
A = zeros(600,600);
verif = zeros(600,1);
% coin haut gauche
verif(1,1) = 1;
A(1,1) = 1;
% milieu gauche
for i=141:145
    verif(i,1) = 1;
    A(i,i) = 1;
end
% milieu droit
for i=366:370
    verif(i,1) = 1;
    A(i,i) = 1;
end
% mur haut
for i=211:15:586
    verif(i,1) = 1;
    A(i,i) = 1;
end
% mur droit
for i=586:600
    verif(i,1) = 1;
    A(i,i) = 1;
end
% mur bas
for i=15:15:600
    verif(i,1) = 1;
    A(i,i) = 1;
end
% trou haut
for i=16:15:196
    verif(i,1) = 1;
    A(i,i) = -3;
    A(i,i+1) = 1;
    A(i,i+15) = 1;
    A(i,i-15) = 1;
end
% trou gauche
for i=2:14
    verif(i,1) = 1;
    A(i,i) = -3;
    A(i,i+1) = 1;
    A(i,i+15) = 1;
    A(i,i-1) = 1;
end
% reste
for i=1:600
    if verif(i,1) == 1
        continue
    end
    A(i,i) = -4;
    A(i,i+1) = 1;
    A(i,i+15) = 1;
    A(i,i-1) = 1;
    A(i,i-15) = 1;
end

%Modélisation 4 //Donne c = 0.5298 // Dans cette modélisation, les points fixes
%sont initialisés a 1 au lieu de zéro ; les points centres sont de valeur
%positive (3 ; 4) ; leurs voisins de valeur négative (-1)
%Je choisis cette modélisation car : 
%vp -> fréquences : positives (les autres me donnent des fréquences
%négatives)
%Le résultat est plus cohérent (et proche de c)
%Erreurs peuvent être liées au fait qu'on associe la même valeur aux points
%fixes et aux centraux (1) dans les autres modélisation --> les points
%fixes ne sont pas censés avoir la même valeur

% function [A] = tambour()
% A = zeros(600,600);
% verif = zeros(600,1);
% % coin haut gauche
% verif(1,1) = 1;
% A(1,1) = 1;
% % milieu gauche
% for i=141:145
%     verif(i,1) = 1;
%     A(i,i) = 1;
% end
% % milieu droit
% for i=366:370
%     verif(i,1) = 1;
%     A(i,i) = 1;
% end
% % mur haut
% for i=211:15:586
%     verif(i,1) = 1;
%     A(i,i) = 1;
% end
% % mur droit
% for i=586:600
%     verif(i,1) = 1;
%     A(i,i) = 1;
% end
% % mur bas
% for i=15:15:600
%     verif(i,1) = 1;
%     A(i,i) = 1;
% end
% % trou haut
% for i=16:15:196
%     verif(i,1) = 1;
%     A(i,i) = 3;
%     A(i,i+1) = -1;
%     A(i,i+15) = -1;
%     A(i,i-15) = -1;
% end
% % trou gauche
% for i=2:14
%     verif(i,1) = 1;
%     A(i,i) = 3;
%     A(i,i+1) = -1;
%     A(i,i+15) = -1;
%     A(i,i-1) = -1;
% end
% % reste
% for i=1:600
%     if verif(i,1) == 1
%         continue
%     end
%     A(i,i) = 4;
%     A(i,i+1) = -1;
%     A(i,i+15) = -1;
%     A(i,i-1) = -1;
%     A(i,i-15) = -1;
% end

end
