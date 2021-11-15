PACKAGE BODY Initialisation IS

 FUNCTION genere_Ligne (G: Ligne_au_Hasard.Generator) RETURN Ligne_hasard IS                 -----------------------------------------------------------------
   BEGIN                                                                                     -- Fonction qui permet de g�n�rer un nombre al�atoire de Ligne --
      RETURN Random(G);                                                                      -----------------------------------------------------------------
   END genere_Ligne;

 FUNCTION genere_Batonnet (G2: Batonnet_au_Hasard.Generator) RETURN nb_Batonnet IS
   BEGIN                                                                                     ---------------------------------------------------------------------
      RETURN Random(G2);                                                                     -- Fonction qui permet de g�n�rer un nombre al�atoire de Batonnets --
   END Genere_Batonnet;                                                                      ---------------------------------------------------------------------


   -------------------------------------------
   -- Procedure d'initialisation du tableau --
   -------------------------------------------
   PROCEDURE InitTab (T: IN OUT Tableau) IS
   BEGIN

      IF type_affichage=2                                 ----------------------------------------------------------------------------
          THEN Ligne:=1;                                  -- si l'affichage choisi est 2 alors il n'ya qu'une Ligne dans le plateau --
      END IF;                                             ----------------------------------------------------------------------------

      IF Type_Ia=2 and type_affichage=2
          THEN LOOP                                       ---------------------------------------------------------------------------------------------------------------------
                  Reset(G2);                              -- si c'est sur une Ligne et que l'ia choisi est l'ia invincible alors on g�n�re un nombre de Batonnet qui �gale a --
                  Batonnet:=Random(G2);                   -- 5,9,13,17,21,25 ou 29                                                                                           --
                                                          ---------------------------------------------------------------------------------------------------------------------
               EXIT WHEN (Batonnet=13 or Batonnet=17 or Batonnet=21 or Batonnet=25 or Batonnet=29);
               END LOOP;
      END IF;

      IF Type_Affichage/=2                                -----------------------------------------------------------------------------------------
         then Reset(G);                                   -- Si l'affichage n'est pas sur une C.Ligne alors on g�n�re un nombre de Ligne al�atoire --
              Ligne:=Random(G);                           -----------------------------------------------------------------------------------------
      END IF;

      FOR E IN 1..Ligne LOOP
         IF Type_Affichage=1 OR Type_Affichage=3          ---------------------------------------------------------------
            then Reset(G2);                               -- A chaque C.Ligne on g�n�re un nombre al�atoire de Batonnets --
                 Batonnet:=Random(G2);                    ---------------------------------------------------------------
         END IF;

         For k in 1..Batonnet loop
            IF T(E,K)/=1                                  -----------------------------------------------------------------------------------------
               then T(E,K):=1;                            -- On initialise chaque case du tableau a 1 qui correspond a la pr�sence d'un Batonnet --
            end if;                                       -----------------------------------------------------------------------------------------
         end loop;
      END LOOP;

   END Inittab;
End Initialisation;
