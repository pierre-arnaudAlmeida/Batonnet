WITH Ada.Text_IO; USE Ada.Text_IO;
with joueurs; use Joueurs;

PACKAGE BODY Fin_De_Jeu IS

   ------------------------
   -- Procedure Qui_Perd --
   ------------------------
   PROCEDURE Qui_Perd (T:Tableau) IS
   BEGIN
      Nombre_case_restante:=0;
      FOR I IN 1..Ligne LOOP                                              ------------------------------------------------------------------------------
         FOR J IN 1..Batonnet LOOP                                        -- Boucle qui vérifie le nombre de case restante dans l'ensemble du tableau --
            IF T(I,J)=1                                                   -- et affecte a "Nombre_case_restante" la meme valeur +1                    --
               THEN Nombre_Case_Restante:= Nombre_Case_Restante+1;        ------------------------------------------------------------------------------
            END IF;
         END LOOP;
      END LOOP;

      IF Type_Affichage=3                                                 ------------------------------------------------------------------------------------
          then Nombre_Case_Restante:=0;                                   -- Quand on utilise l'affichage avec les cubes et les C.Batonnets                   --
               Nombre_case_restante_bis:=0;                               -- On vérifie sur les C.Lignes pair le nombre de cubes et sur les C.Lignes impaire le --
               FOR I IN 1..Ligne LOOP                                     -- Nombre de C.Batonnets  et affecte ce résultat a une variable                     --
                  If (i mod 2)/=0                                         ------------------------------------------------------------------------------------
                     then FOR J IN 1..Batonnet LOOP
                             IF T(I,J)=1
                                THEN Nombre_Case_Restante:= Nombre_Case_Restante+1;
                             END IF;
                          END LOOP;
                  ELSIF (I mod 2)=0
                     then FOR J IN 1..Batonnet LOOP
                             IF T(I,J)=1
                                THEN Nombre_Case_Restante_bis:= Nombre_Case_Restante_bis+1;
                             END IF;
                          END LOOP;
                  END IF;
               END LOOP;
      end if;

      IF (Nombre_Case_Restante=0) or ((Nombre_case_restante_bis=0 or Nombre_case_restante=0) and type_affichage=3 and ligne>1) THEN
         Put("                           /|||||||||         /|\         |\          /|  ||||||||");New_Line;
         Delay 0.5;
         Put("                          /|/                // \\        ||\        //|  ||      ");New_Line;         --------------------------------------------------------------
         Delay 0.5;                                                                                                  -- Quand on observe que le nombre de case restante est de 0 --
         Put("                          ||                //   \\       ||\\      //||  ||      ");New_Line;         -- Alors on affiche ceci...                                 --
         Delay 0.5;                                                                                                  --------------------------------------------------------------
         Put("                          ||               //     \\      || \\    // ||  |||||   ");New_Line;
         DELAY 0.5;
         Put("                          ||    |||||     /////|\\\\\     ||  \\  //  ||  ||      ");New_Line;
         Delay 0.5;
         Put("                          \|\      ||    //         \\    ||   \\//   ||  ||      ");New_Line;
         Delay 0.5;
         Put("                           \|||||||||   //           \\   ||    ''    ||  ||||||||");New_Line;
         Delay 0.5;
         New_Line;
         New_line;
         Put("                           /|||||||\    \\            //     ||||||||     ||||||||\  ");New_Line;
         Delay 0.5;
         Put("                          /||     ||\    \\          //      ||           ||     ||  ");New_Line;
         Delay 0.5;
         Put("                          |||     |||     \\        //       ||           ||     ||  ");New_Line;
         Delay 0.5;
         Put("                          |||     |||      \\      //        |||||        ||||||||/  ");New_Line;
         Delay 0.5;
         Put("                          |||     |||       \\    //         ||           ||   \\    ");New_Line;
         Delay 0.5;
         Put("                          \||     ||/        \\  //          ||           ||    \\   ");New_Line;
         Delay 0.5;
         Put("                           \|||||||/          \\//           ||||||||     ||     \\  ");New_Line;
         Delay 0.5;
         New_line;

         Put("                                        Joueur "& Integer'Image(joueur)& " Vous avez Perdu");   -------------------------------------
         New_Line;                                                                                           -- Ainsi que le joueur qui a perdu --
                                                                                                             -------------------------------------
      END IF;
      Qui_Joue;
   END Qui_Perd;

end fin_de_jeu;


