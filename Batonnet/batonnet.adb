WITH Ada.Text_IO; USE Ada.Text_IO;
with Variables; use Variables;
with Affiche; use Affiche;
WITH Initialisation; USE Initialisation;
WITH Coup; USE Coup;

PROCEDURE Batonnet IS

BEGIN
   LOOP
      Affiche_mode_de_jeu;                     ---------------------------------------------------------------
      IF Mode_De_Jeu=1                         -- On demande le mode de jeu que l'on souhaite faire         --
         THEN Affiche_Type_Affichage;          -- Et en fonction de celui-ci on éffectue les différents     --''
              InitTab(T);                      -- affichage qui correspondent à l'ia, le nombre de ligne... --
              Tour;                            ---------------------------------------------------------------
      ELSIF Mode_De_Jeu=2 or mode_de_jeu=4
         THEN Affiche_Type_Affichage;
              Affiche_Type_Ia;
              InitTab(T);
              Tour;
      ELSIF Mode_De_Jeu=3
         THEN Affiche_Type_Affichage;
              InitTab(T);
              Tour;
      END IF;

      New_Line;
      New_Line;

      exit when Mode_de_jeu=5;                  -----------------------------------------------------------
   END LOOP;                                    -- On quitte le jeu quand la valeur de mode_de_jeu est 4 --
                                                -----------------------------------------------------------
   New_Line;
   Delay 2.0;
   Put("             Au Revoir et a bientot j'espere ;)");

End Batonnet;