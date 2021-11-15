WITH Ada.Text_IO; USE Ada.Text_IO;
WITH AdA.Integer_Text_IO; USE Ada.Integer_Text_IO;

PACKAGE body Affiche IS

   PROCEDURE Affichage (T: IN Tableau) IS
      BEGIN
         FOR I IN 1..Ligne LOOP
            Batonnet_restant:=0;
            z:=i;
            for h in 1.. Ligne loop
               FOR K IN 1..Batonnet LOOP
                   IF T(z,K)=1
                       THEN Batonnet_Restant:= Batonnet_Restant+1;
                   END IF;
               END LOOP;
            end loop;

            IF (Batonnet_Restant/=0 AND I=1) or ( i>1) --and Batonnet_restant/=0 )
               then Put("             +");
            end if;

            FOR J IN 1..Batonnet LOOP      --
              IF (T(I,J)=1) and i=1     --
                  THEN Put("----+");    --premiere C.Ligne qui permet de fermer le tableau
              END IF;                  --
            END LOOP;                      --

            IF I>1 THEN
               FOR K IN 1.. Batonnet LOOP
                  IF ((T(I,K)=1 and Batonnet_restant/=0) or T(i-1,k)=1)
                     THEN Put("----+");
                  END IF;
               END LOOP;
            end if;

            IF (Batonnet_Restant/=0 AND I=1) or ( i>1)
               THEN New_Line;
            end if;


            FOR J IN 1..Batonnet LOOP
               Batonnet_restant:=0;
               z:=i;
               for h in 1.. Ligne loop
                  FOR K IN 1..Batonnet LOOP
                     IF T(z,K)=1
                        THEN Batonnet_Restant:= Batonnet_Restant+1;
                     END IF;
                  END LOOP;
               END LOOP;

               IF J = 1 AND Z=I AND Batonnet_Restant/=0
                  THEN Put("             |");
               END IF;
               IF T(I,J)=1
                  then Put("    ");
                       Put("|");
               end if;
            END LOOP;

            if z=i and Batonnet_restant/=0
               then New_Line;
            end if;

            FOR J IN 1..Batonnet LOOP
               Batonnet_restant:=0;
               z:=i;
               for h in 1.. Ligne loop
                  FOR K IN 1..Batonnet LOOP
                     IF T(z,K)=1
                        THEN Batonnet_Restant:= Batonnet_Restant+1;
                     END IF;
                  END LOOP;
               END LOOP;

               if J = 1 and i<10 and z=i and Batonnet_restant/=0
                  THEN Put("Ligne"& Integer'Image(I) &"      |");
               end if;

               IF J=1 AND I>9 and z=i and Batonnet_restant/=0
                  then Put("Ligne"& Integer'Image(I) &"     |");
               END IF;

               IF T(I,J)=1
                then if T(I,J) < 10
                        THEN Put(" ");
                     END IF;

                     IF (T(I,J) > 0 and (type_affichage=1 or type_affichage=2)) or (T(I,J) > 0 and (type_affichage=3) and (i mod 2)/=0)
                        then Put("I");
                     ELSIF T(I,J)>0 AND (type_affichage=3) and (i mod 2)=0
                        THEN Put("°");
                     else Put(" ");
                     END IF;

   	               if T(I,J) < 10
	                  then Put("  ");
	               END IF;
                     Put("|");
               end if;
            END LOOP;

            if z=i and Batonnet_restant/=0
               then New_Line;
            end if;

            for J in 1..Batonnet loop
               Batonnet_restant:=0;
               z:=i;
               for h in 1.. Ligne loop
                  FOR K IN 1..Batonnet LOOP
                     IF T(z,K)=1
                        THEN Batonnet_Restant:= Batonnet_Restant+1;
                     END IF;
                  END LOOP;
               END LOOP;

               IF J = 1 and z=i and Batonnet_restant/=0
                     THEN Put("             |");
               END IF;

               IF T(I,J)=1
                  then Put("    ");
                       Put("|");
               end if;
            END LOOP;

            if z=i and Batonnet_restant/=0
               then New_Line;
            END IF;
            Delay 0.7;
      END LOOP;

      FOR I IN 1..Ligne LOOP
          Batonnet_restant:=0;
          z:=i;
          for h in 1.. Ligne loop
              FOR K IN 1..Batonnet LOOP
                  IF T(z,K)=1
                     THEN Batonnet_Restant:= Batonnet_Restant+1;
                  END IF;
              END LOOP;
          END LOOP;

          if i=Ligne and Z=I AND Batonnet_Restant/=0
               then Put("             +");
                    FOR J IN 1..Batonnet LOOP
                        IF (t(i,j)=1)
                           then put("----+");
                        END IF;
                    END LOOP;
          end if;
      END LOOP;

      New_Line;
      New_Line;

      IF Nombre_Case_Restante>0 or Nombre_case_restante_bis>0
          THEN Put("             Joueur"& Integer'Image(Joueur)&" a vous de jouer");
               Delay 1.0;
               New_line;
      END IF;
   END Affichage;


      -----------------------------------
      -- Procedure affiche_mode_de_jeu --
      -----------------------------------
   PROCEDURE Affiche_Mode_De_Jeu IS
      BEGIN
         Put("Bienvenue au Jeu du Batonnet");
         New_Line;
         New_line;

         Put("             Bonjour,"); New_Line;
         Delay 0.5;
         Put("             Voulez vous jouer une partie : ");
         Delay 0.5;
         New_Line;
         Put("             -1) Un contre un");
         Delay 0.5;
         New_Line;
         Put("             -2) Un contre l'ordinateur");
         Delay 0.5;
         New_Line;
         Put("             -3) Un contre plusieurs personnes");
         Delay 0.5;
         New_Line;
         Put("             -4) Un contre plusieurs personnes avec une ia");
         DELAY 0.5;
         New_Line;
         Put("             -5) Quitter le jeu");
         New_Line;

         LOOP
            Get(Mode_De_Jeu);
            IF Mode_De_Jeu<0 OR Mode_De_Jeu>5
               THEN Put("             Je vois que tu a fait une erreur, je te conseille de traduire la phrase si tu ne comprend pas le français !");
                    New_Line;
            END IF;
            EXIT WHEN (Mode_De_Jeu>0 AND Mode_De_Jeu<=5) ;
         END LOOP;

         IF Mode_De_Jeu=3
            THEN DELAY 0.5;
                 Put("             Veuillez saisir le nombre de joueurs :");
                 LOOP
                    New_line;
                    Get(Nb_Joueurs);
                    IF Nb_Joueurs<=2
                       THEN DELAY 0.5;
                            Put("             Nous prend tu pour des noobs, nous avons traiter toutes les possibilites choisis un nombre supperieur a 2 ou bien change de mode de jeu");
                    END IF;
                  EXIT WHEN Nb_Joueurs>2;
                 END LOOP;

         ELSIF Mode_De_Jeu=4
            THEN DELAY 0.5;
                 Put("             Veuillez saisir le nombre de joueurs avec l'ia compris :");
                 LOOP
                    New_line;
                    Get(Nb_Joueurs);
                    IF Nb_Joueurs<=2
                       THEN DELAY 0.5;
                            Put("             Nous prend tu pour des noobs, nous avons traiter toutes les possibilites choisis un nombre supperieur a 2 ou bien change de mode de jeu");
                    END IF;
                  EXIT WHEN Nb_Joueurs>2;
                 END LOOP;
         END IF;

   END Affiche_Mode_De_Jeu;


                     --------------------------------------
                     -- Procedure Affiche_type_affichage --
                     --------------------------------------
   PROCEDURE Affiche_Type_Affichage IS
      BEGIN
          Put("             Veuillez choisir le type d'affichage que vous voulez tester : ");         ------------------------------------------------
          Delay 0.5;                                                                                  -- On propose a l'utilisateur de choisir le   --
          New_Line;                                                                                   -- type d'affichage du tableau tout cela avec --
          Put("             -1) Tableau aleatoire");                                                  ------------------------------------------------
          Delay 0.5;
          New_Line;
          Put("             -2) Sur une Ligne ou l'on peut retirer au maximum 3 Batonnets");
          Delay 0.5;
          New_Line;
          Put("             -3) Aleatoire avec des cubes");
          New_line;

          LOOP
             Get(Type_Affichage);                                                                                                         -------------------------------------
             IF Type_Affichage<0 OR Type_Affichage>=4                                                                                     -- verifie que la variable entre   --
                THEN Delay 0.5;                                                                                                           -- est possible sinon elle renvoie --
                     Put("             J'espere que ce n'est pas toi qui a tenter de me faire bugger sur la question precedente !!");     -- un message                      --
                     New_Line;                                                                                                            -------------------------------------
             END IF;
             EXIT WHEN Type_Affichage>0 AND Type_Affichage<=4;
         end loop;
   END Affiche_Type_Affichage;



      -------------------------------
      -- Procedure Affiche type_ia --
      -------------------------------
   PROCEDURE Affiche_Type_Ia IS
      BEGIN
         Put("             Veuillez choisir le type d'IA que vous voulez tester : ");         ----------------------------------------------------------------------------
         Delay 0.5;                                                                           -- Demande le type de l'ia, en fonction du mode de jeu choisi precedement --
         New_Line;                                                                            ----------------------------------------------------------------------------
         Put("             -1) IA Hasardeuse");
         DELAY 0.5;
         New_Line;

         If Type_affichage/=2 and Type_affichage/=3
            THEN Put("             -2) IA Strategique");
                 New_line;
         end if;
         Delay 0.5;

         IF Type_Affichage=2
               THEN Put("             -2) IA invincible");
                    new_line;
         END IF;

         LOOP
            Get(Type_Ia);
            IF (Type_Ia<0 AND Type_Ia>2 AND Type_Affichage/=2) OR (Type_Ia<0 AND Type_Ia>2 AND Type_Affichage=2)   -----------------------------------------
                THEN  Delay 0.5;                                                                                   -- verifie l'existence de ce type d'ia --
                      Put("             Bon tu vois bien que nous avons mis une condition");                       -----------------------------------------
            END IF;

           EXIT WHEN (Type_Ia>0 AND Type_Ia<=2 and Type_Affichage/=2) or (Type_Ia>0 AND Type_Ia<=2 and Type_Affichage=2);
         END LOOP;
    end affiche_type_ia;

end affiche;
