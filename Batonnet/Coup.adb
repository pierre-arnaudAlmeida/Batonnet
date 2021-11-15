WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Affiche; USE Affiche;
WITH Fin_De_Jeu; USE Fin_De_Jeu;

   PACKAGE BODY Coup IS

   FUNCTION genere_Ligne (G: Ligne_au_Hasard.Generator) RETURN Ligne_hasard IS                      ---------------------------------------------
   BEGIN                                                                                            -- génere une ligne aléatoire et un nombre --
      RETURN Random(G);                                                                             -- de batonnet qui seront utilisé par l'ia --
   END genere_Ligne;                                                                                -- hasardeuse                              --
                                                                                                   ---------------------------------------------
   FUNCTION genere_Batonnet (G2: Batonnet_au_Hasard.Generator) RETURN Batonnet_hasard IS
      BEGIN
         RETURN Random(G2);
   END Genere_Batonnet;

    ----------------------------------------------------------------------
    -- fonction qui demande le coup en fonction de différent parametre --
    ----------------------------------------------------------------------
   Function Demande_Coup return Coup IS
      BEGIN
         IF (Joueur mod 2)=0 and (type_ia=1)                                    -------------------------------------------------
            THEN Reset(G);                                                      -- c'est aléatoire quand c'est a l'ia de jouer --
                 Reset(G2);                                                     -- et que le type d'ia est "hasardeuse"        --
                 C.SelectLigne:=Random(G);                                      -------------------------------------------------
                 C.SelectNombre:=Random(G2);

         ELSIF (Joueur mod 2)=0 AND (type_ia=1 and type_affichage=2)            --------------------------------------------------
            THEN Reset(G2);                                                     -- genere juste un nombre de batonnet car c'est --
                 C.SelectLigne:=1;                                              -- sur un affichage avec une ligne              --
                 C.Selectnombre:= Random(G2);                                   --------------------------------------------------

         ELSIF ((Joueur mod 2)=0 AND (type_affichage=2 and type_ia=2)) or ((joueur=Nb_joueurs) and (type_ia=2) and (type_affichage=2) and (mode_de_jeu=4)) -------------------------------------------
            THEN ia_invincible;                                                                                                                            -- On utilise la procedure ia_invincible --
                                                                                                                                                           -------------------------------------------
         ELSIF ((Joueur mod 2=0) AND (Type_Ia=2) AND (Type_Affichage/=2) and mode_de_jeu=2) or ((joueur=Nb_joueurs) and (type_ia=2) and (type_affichage/=2) and (mode_de_jeu=4))  -------------------------------------------
            THEN ia_strategique(t,p);                                                                                                                                             -- utilise la procedure d'ia strategique --
                                                                                                                                                                                  -------------------------------------------
            New_line;
         ELSE If Type_affichage/=2
                  then New_Line;
                  Delay 0.5;                                                                                             ----------------------------------------------------------
                  Put("                               Vous ne pouvez pas passer votre tour.");                           -- Quand c'est le tour d'une personne physique de jouer --
                  Delay 0.5;                                                                                             -- on demande la ligne et le nombre de batonnet qu'il   --
                  New_Line;                                                                                              -- souhaite retirer                                     --
                  Put("              Veuillez saisir le numero de la Ligne ou vous voulez retirer des Batonnets");       ----------------------------------------------------------
                  New_Line;

                  LOOP
                     Get(C.SelectLigne);
                     MaxBatonnet(t);
                     New_line;                                                                                                                                    ----------------------------------------
                     IF C.SelectLigne<1 OR C.SelectLigne>Ligne or Max_Batonnet=0                                                                                  -- Verifie que le nombre de batonnets --
                        THEN DELAY 0.5;                                                                                                                           -- et de ligne existe et que la ligne --
                                                                                                                                                                  -- possède au moins un batonnets      --
                             Put("              Je crois que tu ne sais pas lire, nous t'avons demander un nombre de Ligne possible, pas ton age :)...");         ----------------------------------------
                             New_line;
                     END IF;
                     EXIT WHEN C.SelectLigne>=1 AND C.SelectLigne<=Ligne and Max_Batonnet>0;
                  END LOOP;
               ELSE C.SelectLigne:=1;
               end if;

               Delay 0.5;
               PUt("              Veuillez saisir a present le nombre de Batonnets a retirer");
               New_Line;

               LOOP
                  Get(C.SelectNombre);
                  MaxBatonnet(T);

                  IF (C.SelectNombre<1 OR  C.selectNombre>Max_Batonnet)                                                               ---------------------------------------------
                     THEN DELAY 0.5;                                                                                                  -- quand le nombre saisie est impossible   --
                          Put("              Saisir un nombre compris entre 1 et " & Integer'Image(Max_Batonnet)&":");                -- il donne le nombre de batonnets restant --
                          Delay 0.5;                                                                                                  ---------------------------------------------
                          New_line;
                          Put("              A ce niveau la, je pense que tu ne doit pas savoir compter :( c'est triste...");
                          Delay 0.5;
                          New_Line;
                          Put("              je pense que tu devrais retourner en CP");
                          Delay 0.5;
                          New_Line;

                  ELSIF Type_Affichage=2 and (C.Selectnombre<1 or (C.Selectnombre>3 or C.selectnombre>Max_Batonnet))
                     THEN DELAY 0.5;
                          Put("              Saisir un nombre compris entre 1 et 3 :");
                          Delay 0.5;
                          New_line;
                          Put("              A ce niveau la, je pense que tu ne doit pas savoir compter :( c'est triste...");
                          Delay 0.5;
                          New_Line;
                          Put("              je pense que tu devrais retourner en CP");
                          Delay 0.5;
                          New_Line;
                  end if;
               EXIT WHEN (type_affichage/=2 and (C.SelectNombre>=1 AND C.SelectNombre<=Max_Batonnet)) or (C.SelectNombre>=1 AND (C.SelectNombre<=Max_Batonnet and C.SelectNombre<=3) and type_affichage=2);
               END LOOP;
         END IF;
         return c;
   END Demande_Coup;

      ---------------------------
      -- Procedure MaxBatonnet --
      ---------------------------
   PROCEDURE MaxBatonnet (T: in Tableau) IS                         ------------------------------------------------------------
   BEGIN                                                            -- compte le nombre de batonnets qu'il reste sur la ligne --
      IF C.SelectLigne<=Ligne AND C.SelectLigne>=1                  -- que je joueur a décidé de jouerpour son coup           --
         then FOR I IN 1..Ligne LOOP                                ------------------------------------------------------------
                 Max_Batonnet:=0;
                 For j IN 1..Batonnet LOOP
                    IF T(C.SelectLigne,J)=1
                       THEN Max_Batonnet:= Max_Batonnet+1;
                    END IF;
                 END LOOP;
         END LOOP;
      END IF;
   END MaxBatonnet;

   ---------------------------
   -- Procedure Suppression --
   ---------------------------
   PROCEDURE Suppression (T: in out Tableau) IS
   BEGIN
         Valeur_Supprimer:=0;                                          ---------------------------------------------
         FOR I IN 1..Ligne LOOP                                        -- Permet de supprimer le nombre batonnets --
             FOR J IN 1..Batonnet LOOP                                 -- choisi par le joueur                    --
                 IF T(C.SelectLigne,J)= 1                              ---------------------------------------------
                    then IF Valeur_Supprimer<C.Selectnombre
                       then T(C.SelectLigne,J):=0;
                            Valeur_Supprimer:=Valeur_Supprimer+1;
                    END IF;
                 end if;
             END LOOP;
         END LOOP;
         Choix_De_Ia:= Choix_De_Ia - Valeur_Supprimer;

   END Suppression;

   --------------------
   -- Procedure Tour --
   --------------------
   PROCEDURE Tour IS
      BEGIN
         LOOP
            Affichage(T);                                                                        -----------------------------------------------------
            C:=Demande_coup;                                                                     -- regroupe les procedure affichage de suppression --
            Suppression(T);                                                                      -- ainsi que la procedure perdu                    --
            Qui_Perd(T);                                                                         -----------------------------------------------------
            IF Type_Affichage=3
                  THEN exit when Nombre_Case_Restante_Bis=0 or Nombre_case_restante=0;
            else exit when Nombre_case_restante=0;
            end if;
         END LOOP;
         Affichage(T);
      END Tour;

      -----------------------------
      -- Procedure Ia_invincible --
      -----------------------------
PROCEDURE Ia_Invincible IS
         BEGIN
            IF choix_de_ia=29
                 THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=28
                 THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=27
                 THEN C.Selectnombre:=2;                        --------------------------------------------
            ELSIF choix_de_ia=26                                -- donne le nombre de batonnets a retirer --
                  THEN C.Selectnombre:=1;                       -- en fonction du nombre de batonnet      --
            ELSIF choix_de_ia=25                                -- restant sur le plateau qui possède une --
                  THEN C.Selectnombre:=3;                       -- ligne                                  --
            ELSIF choix_de_ia=24                                --------------------------------------------
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=23
                  THEN C.Selectnombre:=2;
            ELSIF choix_de_ia=22                                ----------------------------------------------
                  THEN C.Selectnombre:=1;                       -- Toutes les possibilitées on été marquer, --
            ELSIF choix_de_ia=21                                -- cela veut dire que pour tout les cases   --
                  THEN C.Selectnombre:=3;                       -- restantes il existe une solution         --
            ELSIF choix_de_ia=20                                ----------------------------------------------
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=19
                  THEN C.Selectnombre:=2;
            ELSIF choix_de_ia=18
                  THEN C.Selectnombre:=1;
            ELSIF choix_de_ia=17
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=16
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=15
                  then C.Selectnombre:=2;
            ELSIF Choix_De_Ia=14
                  THEN C.Selectnombre:=1;
            ELSIF choix_de_ia=13
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=12
                  then C.Selectnombre:=3;
            ELSIF choix_de_ia=11
                  THEN C.Selectnombre:=2;
            ELSIF choix_de_ia=10
                  THEN C.Selectnombre:=1;
            ELSIF choix_de_ia=9
                  THEN C.Selectnombre:=2;
            ELSIF choix_de_ia=8
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=7
                  THEN C.Selectnombre:=2;
            ELSIF choix_de_ia=6
                  THEN C.Selectnombre:=1;
            ELSIF choix_de_ia=5
                  THEN C.Selectnombre:=1;
            ELSIF choix_de_ia=4
                  THEN C.Selectnombre:=3;
            ELSIF choix_de_ia=3
                  THEN C.Selectnombre:=2;
            ELSIF choix_de_ia=2
                  THEN C.Selectnombre:=1;
            ELSIF choix_de_ia=1
                  THEN C.Selectnombre:=1;
            END IF;
      END Ia_Invincible;


         ------------------------------
         -- Procedure Ia_strategique --
         ------------------------------
         PROCEDURE Ia_Strategique (T: IN Tableau; P: in out reserve) IS
            egal: integer;                                                                        -----------------------------------------------------------
         BEGIN                                                                                    -- on initialise toutes les valeurs dont on a besoin a 0 --
            a:=0;b:=0;e:=0;d:=0;Z:=0;y:=0;w:=0;x:=0;v:=0;u:=0;r:=0;s:=0;                          -----------------------------------------------------------
            Nb_Ligne1:=0;
            egal:=1;
            Ligne_Restante:=Ligne;

            FOR H IN 1.. Ligne LOOP                                                      ---------------------------------------------------------------------
               Batonnet_Restant:=0;                                                      -- on verifie le nombre de batonnets restant sur toutes les lignes --
               FOR K IN 1..Batonnet LOOP                                                 ---------------------------------------------------------------------
                   IF T(h,K)=1
                      THEN Batonnet_Restant:= Batonnet_Restant+1;
                    END IF;
               END LOOP;

               FOR J IN P'RANGE LOOP                     ----------------------------------------------------------------------------------------------------
                  P(j):=0;                               -- On les affectes a un tableau qui regroupe le nombre de batonnet restant en fonction des lignes --
                  P(H):=Batonnet_Restant;                ----------------------------------------------------------------------------------------------------
               END LOOP;

               IF Batonnet_Restant=0                           -----------------------------------------------------------------------------------
                  THEN Ligne_Restante:=Ligne_Restante-1;       -- Si il y a une ligne avec aucun batonnet on réduit le nombre de ligne_restante --
               END IF;                                         -----------------------------------------------------------------------------------

               IF Batonnet_Restant=1                           ------------------------------------------------------------------------------------------------
                  THEN Nb_Ligne1:=Nb_Ligne1+1;                 -- Quand il y a une ligne avec 1 batonnet on retient le nombre de ligne qui sont a 1 batonnet --
                       w:=h;                                   -- et on retient le numéro de la ligne avec une autre variable                                --
               END IF;                                         ------------------------------------------------------------------------------------------------

               IF Batonnet_Restant=3                           -----------------------------------------------------------------------------------------------------
                     THEN X:=x+1;                              -- Quand sur une ligne possède 3 batonnet on retient le nombre de ligne avec ce nombre de batonnet --
               END IF;                                         -----------------------------------------------------------------------------------------------------

               FOR n IN P'RANGE LOOP
                  IF P(N)/=0
                     then E:=a;                                ---------------------------------------------------------------------------------------------
                          d:=b;                                -- On crée une sauvegarde du nombre de batonnets des 4 derniere lignes                     --
                          a:=v;                                -- en faisant un décallage, permettent de les réutilisé et de les comparer plus facilement --
                          b:=u;                                ---------------------------------------------------------------------------------------------
                          V:=Y;
                          U:=Z;
                          Y:=P(N);
                          Z:=H;
                  END IF;
               END LOOP;

               IF ((e=A) AND (e=V) AND (A=V) AND (e/=Y)) and ligne_restante=4            --------------------------------------------------
                    THEN egal:=3;                                                        -- Quand il y a 3 batonnets avec la meme valeur --
               ELSIF ((E=A) AND (E=Y) AND (A=Y) AND (E/=V)) and ligne_restante=4         -- et qu'il reste 4 ligne, on affecte a une     --
                    THEN egal:=3;                                                        -- nouvelle variable la valeur 3 et quand toute --
               ELSIF ((E=Y) AND (E=V) AND (Y=V) AND (E/=A)) and ligne_restante=4         -- les varaibles sont égales on affecte la      --
                    THEN Egal:=3;                                                        -- la valeur 4                                  --
               ELSIF (E=A) AND (E=V) AND (E=Y) AND Ligne_Restante=4                      --------------------------------------------------
                    THEN Egal:=4;
               Elsif ((y=A) AND (y=V) and ligne_restante=3)
                     THEN Egal:=3;
               ELSIF ((E=A) OR (E=V) OR (E=Y) OR (A=V) OR (A=Y) OR (V=Y)) and ligne_restante=4
                  then egal:=2;
               end if;
                                                                                            ----------------------------------------------------
               IF ((Y<=Batonnet_Restant OR Batonnet_Restant<=Y) AND Batonnet_Restant>0)      -- Quand le nombre de batonnet est suppérieur a 0 --
                     THEN Y:=Batonnet_restant;                                               -- on la sauvegarde dans une valeur               --
                          z:=h;                                                              ----------------------------------------------------
               END IF;

               IF (r<Batonnet_Restant)                   ----------------------------------------------------------------------------------------
                     THEN r:= Batonnet_Restant;          -- le plus grand nombre de batonnet dans le plateau est sauvegarder dans deux valeurs --
                          S:=H;                          ----------------------------------------------------------------------------------------
               end if;
            END LOOP;


            IF Egal=4 AND Ligne_Restante=4 and r>1
                THEN C.Selectligne:=S;
                     C.Selectnombre:=(R-1);

            ELSIF Egal=3 AND Ligne_Restante=3 and nb_ligne1=0
               THEN C.Selectligne:=z;
                    C.Selectnombre:=Y;

            ELSIF Nb_Ligne1=3 AND Ligne_Restante=4
               THEN C.Selectligne:=S;
                    C.Selectnombre:=R;

            ELSIF (Ligne_Restante=(Nb_Ligne1+1)) AND ((Nb_Ligne1 mod 2) =0)            -------------------------------------------------------------------------
               THEN C.Selectligne:=S;                                                  -- Quand il reste plusieurs ligne avec un batonnet et                  --
                    C.Selectnombre:=(R-1);                                             -- qu'il existe une seule ligne avec plus de 1 batonnet                --
            elsif (Ligne_Restante=(Nb_Ligne1+1)) AND ((Nb_Ligne1 mod 2) /=0)           -- alors on supprime toute la ligne ou presque si c'est impaire ou non --
               THEN C.Selectligne:=S;                                                  -------------------------------------------------------------------------
                    C.Selectnombre:=R;

            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y=4 OR V=4 OR A=4) AND (Y>4 OR V>4 OR A>4) then
               IF (A=1 AND V=4 AND Y>4) AND Ligne_Restante=3
                  THEN C.Selectligne:=Z;
                       C.Selectnombre:=1;
               elsif (A=1 AND y=4 AND v>4) AND Ligne_Restante=3
                  THEN C.Selectligne:=u;
                       C.Selectnombre:=1;
               elsif (v=1 AND y=4 AND a>4) AND Ligne_Restante=3
                  THEN C.Selectligne:=b;
                       C.Selectnombre:=1;
               elsif (v=1 AND a=4 AND y>4) AND Ligne_Restante=3
                  THEN C.Selectligne:=z;
                       C.Selectnombre:=1;
               elsif (Y=1 AND V=4 AND a>4) AND Ligne_Restante=3
                  THEN C.Selectligne:=b;
                       C.Selectnombre:=1;
               elsif (Y=1 AND A=4 AND V>4) AND Ligne_Restante=3
                  THEN C.Selectligne:=U;
                       C.Selectnombre:=1;
               end if;

            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y<A AND V=1 AND ((Y>2 and A>2) or (y=2 and a=3)))              -------------------------------------
               THEN C.Selectligne:=z;                                                                                   -- quand il reste 3 ligne et qu'il --
                    C.Selectnombre:=1;                                                                                  -- y a une ligne à 1, on supprime  --
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y>a AND v=1 and ((Y>2 and A>2) or (a=2 and y=3)))              -- 1 batonnet de la ligne qui ne   --
               THEN C.Selectligne:=b;                                                                                   -- possede n'y le plus, n'y le     --
                    C.Selectnombre:=1;                                                                                  -- moins de batonnets dans le jeu  --
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y>A AND V=1 AND (A=2) and y/=3)                                  -------------------------------------
               THEN C.Selectligne:=z;
                    C.Selectnombre:=(Y-3);
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y<a AND v=1 AND (Y=2) and a/=3)
               THEN C.Selectligne:=b;
                    C.selectnombre:=(a-3);
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y<v AND a=1 and ((y>2 and v>2) or (y=2 and v=3)))
               THEN C.Selectligne:=z;
                    C.Selectnombre:=1;
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y>v AND a=1 and ((y>2 and v>2) or (v=2 and y=3)))
               THEN C.Selectligne:=u;
                    C.Selectnombre:=1;
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y>v AND a=1 AND (v=2) and y/=3)
               THEN C.Selectligne:=z;
                    C.Selectnombre:=(Y-3);
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (Y<v AND a=1 AND (Y=2) and v/=3)
               THEN C.Selectligne:=u;
                    C.selectnombre:=(v-3);
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (a<v AND y=1 and ((v>2 and A>2) or (a=2 and v=3)))
               THEN C.Selectligne:=b;
                    C.Selectnombre:=1;
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (a>v AND y=1 and ((v>2 and A>2) or (v=2 and a=3)))
               THEN C.Selectligne:=u;
                    C.Selectnombre:=1;
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (a>v AND y=1 AND (A=2) and v/=3)
               THEN C.Selectligne:=u;
                    C.Selectnombre:=(v-3);
            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (a<v AND y=1 AND (v=2) and a/=3)
               THEN C.Selectligne:=b;
                    C.selectnombre:=(a-3);

            ELSIF Ligne_Restante=4 AND Egal=3 and nb_ligne1=1
               THEN C.Selectligne:=S;
                    C.selectnombre:=(R-1);

            elsIF ((e=A) AND (e=V) AND (A=V) AND (e/=Y) and (e>=3) and (y<e) and y>1) and ligne_restante=4      ---------------------------------------------------------
               THEN C.Selectligne:=z;                                                                           -- Quand il y a 3 valeur egales et qu'il reste 4 ligne --
                    C.selectnombre:=(y-1);                                                                      -- on retire tous les batonnet sauf 1 de la ligne      --
            ELSIF ((E=A) AND (E=Y) AND (A=Y) AND (E/=V) AND (e>=3) and (V<e) and v>1) AND Ligne_Restante=4      -- différente si elle est suppérieur a 1 et que le     --
               THEN C.Selectligne:=u;                                                                           -- nombre de batonnets des autres ligne soit suppérieur--
                    C.Selectnombre:=(V-1);                                                                      -- ou égal a 3                                         --
            ELSIF ((e=Y) AND (e=V) AND (Y=V) AND (e/=A) and (e>=3) and (a<e) and a>1) and ligne_restante=4      ---------------------------------------------------------
               THEN C.Selectligne:=B;
                    C.selectnombre:=(a-1);
            ELSIF ((A=V) AND (V=Y) AND (A=Y) AND (A/=e) AND (a>=3) AND (e<y) and e>1) and Ligne_Restante=4
               THEN C.Selectligne:=d;
                    C.Selectnombre:=(E-1);


            ElsIF ((e=A) AND (e=V) AND (A=V) AND (e/=Y) and (y>e)) and y>=3 and ligne_restante=4       --------------------------------------------------------------
               THEN C.Selectligne:=z;                                                                 -- quand il reste 3 ligne avec le meme nombre de batonnets, --
                    C.selectnombre:=(y-v);                                                            -- qu'il reste 4 ligne, que le nombre de batonnet de la     --
            ELSIF ((E=A) AND (E=Y) AND (A=Y) AND (E/=V) AND (V>E)) AND V>=3 AND Ligne_Restante=4       -- ligne différente soit supérieur au nombre de batonnets   --
               THEN C.Selectligne:=u;                                                                  -- des autres lignes restante, alors on retire le nombre de --
                    C.Selectnombre:=(V-E);                                                             -- batonnets qu'il y a en trop, et ainsi on aura 4 ligne    --
            ELSIF ((e=Y) AND (e=V) AND (Y=V) AND (e/=A) and (a>e)) and a>=3 and ligne_restante=4       -- avec le meme nombre de batonnet                          --
               THEN C.Selectligne:=B;                                                                  --------------------------------------------------------------
                    C.selectnombre:=(a-e);
            ELSIF ((A=V) AND (V=Y) AND (A=Y) AND (A/=e) and (e>y)) AND e>=3 and Ligne_Restante=4
               THEN C.Selectligne:=d;
                    C.Selectnombre:=(E-V);


            elsIF ((e=A) AND (e=V) AND (A=V) AND (e/=Y) and (y=2) and (e>=3)) and ligne_restante=4       ---------------------------------------------------------------
               THEN C.Selectligne:=z;                                                                    -- Quand il reste 3 ligne avec le meme nombre de batonnets   --
                    C.selectnombre:=1;                                                                   -- et qu'il reste 4 ligne sur le plateau, que le nombre de   --
            ELSIF ((e=A) AND (e=Y) AND (A=Y) AND (e/=V) and (v=2) and (e>=3)) and ligne_restante=4       -- batonnet de la ligne différente est de 2 et que le nombre --
               THEN C.Selectligne:=u;                                                                    -- de batonnets des autres ligne soit suppérieur ou égal a 3 --
                    C.Selectnombre:=1;                                                                   -- alors on supprime 1 batonnet a la ligne qui est différente--
            ELSIF ((e=Y) AND (e=V) AND (Y=V) AND (e/=A) and (a=2) and (y>=3)) and ligne_restante=4       ---------------------------------------------------------------
               THEN C.Selectligne:=b;
                    C.Selectnombre:=1;
            ELSIF ((A=V) AND (V=Y) AND (A=Y) AND (A/=e) and (e=2) and (a>=3)) and ligne_restante=4
               THEN C.Selectligne:=d;
                    C.Selectnombre:=1;

            ELSIF (Nb_Ligne1>=1) and (Ligne_Restante>4)                      ---------------------------------------------------------------------------------
               THEN C.SelectLigne:=w;                                        -- quand une ligne a 1 batonnets et qu'il reste plus de 4 ligne on la supprime --
                    C.SelectNombre:=1;                                       ---------------------------------------------------------------------------------

            ElsIF (Ligne_Restante=2 AND ((y=v) or (v=y))) OR (Nb_Ligne1=2 AND Y=1 AND V=1) -----------------------------------------------------------------------------
               THEN C.SelectLigne:=z;                                                      -- Quand il reste deux ligne et qu'elles sont egales on retire un batonnet --
                    C.SelectNombre:=1;                                                     -----------------------------------------------------------------------------

            ELSIF (Ligne_Restante=2 AND Y>=3 AND V>=3 AND y/=v and Nb_Ligne1=0) THEN ------------------------------------------------------
               IF Y>V                                                                -- SI il reste deux lignes avec un nombre différent --
                   then C.SelectLigne:=z;                                            -- et suppérieur ou égale à 3, il supprimer la      --
                        C.Selectnombre:=(Y-V);                                       -- différence pour qu'il soient au meme niveau      --
               ELSIF V>Y                                                             ------------------------------------------------------
                   then C.SelectLigne:=u;
                        C.Selectnombre:=(V-Y);
               END IF;

            ELSIF Egal=2  and ligne_restante=4 and nb_ligne1=1 then
               If (((e=v) and (y=1)) or ((e=y) and (v=1)) or ((v=y) and (e=1))) and ligne_restante=4
                  THEN C.Selectligne:=b;
                       C.Selectnombre:=(a-1);
               Elsif (((a=v) and (y=1)) or ((a=y) and (v=1)) or ((v=y) and (a=1))) and ligne_restante=4
                  THEN C.Selectligne:=d;
                       C.Selectnombre:=(E-1);
               Elsif (((e=a) and (y=1)) or ((e=y) and (a=1)) or ((a=y) and (e=1))) and ligne_restante=4
                  THEN C.Selectligne:=u;
                       C.Selectnombre:=(V-1);
               elsif (((e=a) and (v=1)) or ((e=v) and (a=1)) or ((a=v) and (e=1))) and ligne_restante=4
                  THEN C.Selectligne:=z;
                       C.Selectnombre:=(y-1);
               end if;

            ELSIF Egal=2  and ligne_restante=4 and nb_ligne1=0 then
               If ((e=v) or (e=y) or (e=a)) and ligne_restante=4
                  THEN C.Selectligne:=d;
                       C.Selectnombre:=1;
               Elsif ((y=a) or (y=v)) and ligne_restante=4
                  THEN C.Selectligne:=z;
                       C.Selectnombre:=1;
               Elsif (a=v) and ligne_restante=4
                  THEN C.Selectligne:=b;
                       C.Selectnombre:=1;
               end if;

            ELSIF Ligne_Restante=4 AND Nb_Ligne1=0 AND Egal=1
               THEN C.Selectligne:=s;
                    C.selectnombre:=(r-2);
            ELSIF Ligne_Restante=4 AND Nb_Ligne1=1 and egal=1              -------------------------------------------------------------------------------
               THEN C.Selectligne:=W;                                      -- Quand il y a une ligne a 1 batonnet et qu'il reste 4 ligne on la supprime --
                    C.Selectnombre:=1;                                     -------------------------------------------------------------------------------
            ELSIF Ligne_Restante=4 AND Nb_Ligne1>1 and egal=1              -- Quand il reste 4 lignes et qu'une ligne possède 1 seul batonnet --
               THEN C.Selectligne:=s;                                      -- on supprime un batonnet de la ligne qui en a le plus            --
                    C.Selectnombre:=1;                                     ---------------------------------------------------------------------

            elsIF (Nb_Ligne1=2 AND Ligne_Restante=3) or (Ligne_Restante=1 AND Y>1)       ----------------------------------------------------------
               THEN C.SelectLigne:=s;                                                    -- quand il reste 3 ligne et que 2 sont a 1 batonnet ou --
                    C.Selectnombre:=r-1;                                                 -- qu'il reste une ligne avec plus d'un batonnet on     --
                                                                                         -- supprime quasi toute la ligne et on en laisse juste 1--
            elsIf (Ligne_Restante=2 AND ((v=2 and y>=3)))                                ----------------------------------------------------------
               THEN C.SelectLigne:=z;                                                    -- Quand il reste 2 lignes et que l'une est egale a 2   --
                    C.SelectNombre:=Y-2;                                                 -- et l'autre suppérieur ou egal a 3, alors on supprime --
            ELSIF (Ligne_Restante=2 AND ((V>=3 AND Y=2)))                                -- la dans celle qui a le plus, la différence pour en   --
               THEN C.Selectligne:=u;                                                    -- avoir le meme nombre                                 --
                    C.selectnombre:=v-2;                                                 ----------------------------------------------------------
                                                                                         -----------------------------------------------------------
            elsiF (Nb_Ligne1=1 and Y>1 and Ligne_restante=2)                             -- Quand il reste 2 ligne, avec une où il y a 1 batonnet --
               then C.SelectLigne:=z;                                                    -- et une autre avec plus de 3 batonnet,  l'ia supprime  --
                    C.Selectnombre:=y;                                                   -- entièrement la ligne qui en possède le plus           --
            elsiF (Nb_Ligne1=1 and v>1 and Ligne_restante=2)                             -----------------------------------------------------------
               then C.SelectLigne:=u;
                    C.Selectnombre:=v;

            elsIF (X>=1 AND Ligne_Restante=2 and (V=3 and Y>3)) ----------------------------------------------------------------
               THEN C.SelectLigne:=z;                           -- Quand il reste deux lignes, avec une ligne avec 3 batonnet --
                    C.Selectnombre:=Y-3;                        -- et une autre avec plus de 3 batonnet, il supprime la       --
            ELSIF (X>=1 AND Ligne_Restante=2 AND (Y=3 AND V>3)) -- différence                                                 --
               THEN C.Selectligne:=u;                           ----------------------------------------------------------------
                    C.Selectnombre:=v-3;

            ELSIF (Nb_Ligne1=1 AND (Ligne_Restante=2 OR Ligne_Restante=3))
               THEN C.Selectligne:=W;
                    c.selectnombre:=1;
            ELSIF (Nb_Ligne1>2 AND Y=1) OR ((Nb_Ligne1/=1) and Ligne_restante>4)                                                                     ---------------------------------------------------------
               THEN C.SelectLigne:=s;                                                                                                                -- il supprime la ligne ou il y a le plus de batonnet --
                    C.Selectnombre:=R;                                                                                                               -- quand il y a une ligne a 1 ou bien quand il reste  --
                                                                                                                                                     -- plus de 4 lignes                                   --
            ELSIF Nb_Ligne1=1 and ligne_restante=2                 ------------------------------------------------------------------------          --------------------------------------------------------
               THEN C.SelectLigne:=s;                              -- Quand il reste deux ligne, une à 1 batonnet et une autre avec plus --
                    C.selectnombre:=r;                             -- il supprimer entierement la deuxieme                               --
                                                                   ------------------------------------------------------------------------
            ELSIF Nb_Ligne1=1 AND Y=1 and ligne_restante=1         -- quand il reste un seul batonnet et une seule ligne il le supprime  --
               THEN C.Selectligne:=z;                              ------------------------------------------------------------------------
                    C.selectnombre:=y;

            elsIF (a=y) AND (A/=v) and ligne_restante=3 AND nb_ligne1<=1            ------------------------------------------------
               THEN C.Selectligne:=u;                                               -- quand il reste 3 lignes, et qu'il y a deux --
                    C.Selectnombre:=V;                                              -- lignes avec le meme nombre de batonnets    --
            ELSIF (A=v) AND (A/=y) and ligne_restante=3 AND nb_ligne1<=1           -- et une seule différente, alors il          --
               THEN C.Selectligne:=z;                                               -- supprime entièrement la ligne qui est      --
                    C.Selectnombre:=Y;                                              -- différente                                 --
            ELSIF (V=y) AND (A/=y) and ligne_restante=3 AND nb_ligne1<=1             ------------------------------------------------
               THEN C.Selectligne:=B;
                    C.Selectnombre:=A;

            ELSIF Ligne_restante=3 and (a/=v and a/=y and y/=v) and nb_ligne1=0 THEN     ------------------------------------------
               IF(Y<V AND Y<A)                                                           -- Quand il reste 3 lignes et que les 3 --
                   then C.Selectligne:=z;                                           -- lignes on un nombre différent de     --
                        C.Selectnombre:=1;                                          -- batonnets, on supprime un batonnet   --
               ELSIF (V<A AND V<Y)                                                  -- de la ligne qui en a le moins        --
                   then C.Selectligne:=u;                                           ------------------------------------------
                        C.Selectnombre:=1;
               ELSIF (A<V AND A<Y)
                   then C.Selectligne:=B;
                        C.Selectnombre:=1;
               END IF;

            ELSIF Ligne_Restante=4 AND Nb_Ligne1=2 AND (E=2 OR A=2 OR Y=2 OR V=2)
                  THEN C.Selectligne:=S;
                  C.selectnombre:=(r-2);

            ELSIF Ligne_Restante=3 AND Nb_Ligne1=1 AND (A>=3 OR V>=3 OR Y>=3) AND (A/=Y AND A/=V AND V/=Y) ------------------------------------------------
               THEN C.Selectligne:=s;                                                                      -- Quand il reste 3 lignes et qu'il une ligne --
                    C.Selectnombre:=(R-2);                                                                 -- avec un batonnet et qu'il existe une ligne --
            END IF;                                                                                        -- avec plus de 3 batonnets et qu'elles sont  --
         END Ia_Strategique;                                                                               -- toutes différentes, on supprime 2 batonnets--
                                                                                                           -- a la ligne qui en à le plus                --
END Coup;                                                                                                  ------------------------------------------------   