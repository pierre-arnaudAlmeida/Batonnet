WITH Variables; USE Variables;

PACKAGE BODY Joueurs IS

   ------------------------
   -- Procedure Qui_Joue --
   -----------------------
   PROCEDURE Qui_Joue IS
   BEGIN
      IF Mode_De_Jeu=3 or mode_de_jeu=4                --------------------------------------------------------------------------------------
            THEN IF Joueur<=(Nb_Joueurs-1)             -- Si le mode de jeu est 3 soit ou une personne entre le nombre de joueurs          --
                     then Joueur:= Joueur+1;           -- alors a la fin de chaque tour on ajoute +1 a "joueur" tant que joueur est        --
                 ELSIF Joueur=Nb_Joueurs               -- inférieur au nombre de joueurs entré au début, quand il ateint ce seuil "joueur" --
                     THEN Joueur:=1;                   -- revient à 1                                                                      --
                 END IF;                               --------------------------------------------------------------------------------------
      else IF Joueur<=1
               then Joueur:=Joueur+1;                  ----------------------------------------------------------------------------------------
           ELSIF Joueur=2                              -- si c'est le mode normal avec deux joueurs, une fois sur deux la valeur de "joueur" --
               then Joueur:=1;                         -- est 1                                                                              --
           END IF;                                     ----------------------------------------------------------------------------------------
      end if;
   END Qui_Joue;
end joueurs;

