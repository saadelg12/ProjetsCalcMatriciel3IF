open temp_surf.m;

A = zeros(500) ;

LigneA = 1;
for ligne = 0:19
    for colonne = 0:24
        
        
        if(ligne ==0)
            if(colonne == 0) %Point en haut a gauche
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA+25) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
                A(LigneA, LigneA+18) = 1 ;

            elseif colonne == 24 %Point en haut a droite
                A(LigneA, LigneA) = -2 ;
                A(LigneA, LigneA+25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
            else %reste de la ligne 0
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA+25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
            end
        elseif (ligne ==9 && colonne < 12) %Bordure milieu haut
            if(colonne == 0) %Point gauche de la bordure
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA-25) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
                A(LigneA, LigneA+18) = 1 ;
            else %reste des points de la bordure
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA-25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
            end
        elseif (ligne ==10 && colonne < 12) %bordure milieu bas
            if(colonne == 0) %point gauche de la bordure
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA+24) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
                A(LigneA, LigneA+25) = 1 ;
            else %reste de la bordure
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA+25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
            end
        elseif(ligne ==19) %bord bas
            if(colonne == 0) %point en bas a gauche
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA+24) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
                A(LigneA, LigneA-25) = 1 ;
            elseif colonne == 24 %point en bas a droite
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA-24) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA-25) = 1 ;
            else %reste bord bas
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA-25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA+1) = 1 ;
            end
        elseif(ligne <11 && colonne == 24) %Bord droit
            if ligne == 10 %Point bas
                A(LigneA, LigneA) = -4 ;
                A(LigneA, LigneA+25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA-25) = 1 ;
                A(LigneA, LigneA-24) = 1 ;
            else %reste
                A(LigneA, LigneA) = -3 ;
                A(LigneA, LigneA+25) = 1 ;
                A(LigneA, LigneA-1) = 1 ;
                A(LigneA, LigneA-25) = 1 ;
            end
        elseif ligne >= 1 && ligne <= 8 && colonne ==0 %bord gauche haut sans bordure
            A(LigneA, LigneA) = -4 ;
            
            A(LigneA, LigneA+18) = 1 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
            
        elseif ligne >= 1 && ligne <= 9 && colonne ==18 %pointillés
            A(LigneA, LigneA) = -5 ;
            
            A(LigneA, LigneA-1) = 1 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
            A(LigneA, LigneA-18) = 1 ;
            
        elseif ligne >= 13 && ligne <= 18 && colonne ==0 %bord gauche bas sans bordure
            A(LigneA, LigneA) = -4 ;
            
            A(LigneA, LigneA+24) = 1 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
        elseif  ligne >= 13 && ligne <= 18 && colonne == 24 %bord droit sans bordure
            A(LigneA, LigneA) = -4 ;
            A(LigneA, LigneA-24) = 1 ;
            A(LigneA, LigneA-1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
        else %reste
            A(LigneA, LigneA) = -4 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA-1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
        end
            
        LigneA = LigneA +1;
    end
    
end

% PB1
% dt = 1;
% Eadt = expm(A.*dt);
% Ut = temp_surf(); % U0
% surf(reshape(Ut,[25,20]));
% pause(0.01);
% for t = dt:1:5000
%     Ut = Eadt*Ut  ;
%     surf(reshape(Ut,[25,20]));
%     pause(0.1);
%     if (max(Ut)-min(Ut)) < 1 %Si la température et la température min sont suffisamment proches
%         fprintf("Etat d'équilibre atteint au bout de %d secondes\n", t);
%         fprintf("Température d'équilibre de %f °C\n", mean(Ut,'all'));
%         break ;
%     end
% end

%PB2
dt = 1;
Eadt = expm(A.*dt);
Ut = zeros(500,1);
surf(reshape(Ut,[25,20]));
pause(0.01);
for t = dt:dt:50000
    Ut(20+4*25) = 500;
    Ut(21+4*25) = 500;
    Ut(20+5*25) = 500;
    Ut(21+5*25) = 500;
    Ut(14+9*25) = 500;
    Ut(15+9*25) = 500;
    Ut(14+10*25) = 500;
    Ut(15+10*25) = 500;
    Ut = Eadt*Ut  ;
    surf(reshape(Ut,[25,20]));
    pause(0.01);
    if (max(Ut)-min(Ut)) < 1 %Si la température et la température min sont suffisamment proches
        fprintf("Etat d'équilibre atteint au bout de %d secondes\n", t);
        fprintf("Température d'équilibre de %f °C\n", mean(Ut,'all'));
        break ;
    end
end

    