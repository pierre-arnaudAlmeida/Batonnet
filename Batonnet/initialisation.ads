WITH Variables; USE Variables;
with Ada.Numerics.Discrete_Random;

PACKAGE Initialisation IS

      PACKAGE Ligne_Au_Hasard IS NEW Ada.Numerics.Discrete_Random (Ligne_Hasard);      ------------------------------------------------------
      USE Ligne_au_Hasard;                                                             -- D�finition du package permettant de g�n�rer une  --
      G:ligne_au_Hasard.Generator;                                                     -- valeur al�atoire ainsi que de la fonction qui va --
                                                                                       -- g�n�rer le nombre de ligne                       --
      FUNCTION genere_ligne (G: ligne_au_Hasard.Generator) RETURN ligne_hasard;        ------------------------------------------------------



      PACKAGE Batonnet_au_Hasard IS NEW Ada.Numerics.Discrete_Random (nb_Batonnet);    ------------------------------------------------------
      USE Batonnet_au_Hasard;                                                          -- D�finition du package permettant de g�n�rer une  --
      G2:Batonnet_Au_Hasard.Generator;                                                 -- valeur al�atoire ainsi que de la fonction qui va --
                                                                                       -- g�n�rer le nombre de ligne                       --
      FUNCTION genere_Batonnet (G2: Batonnet_au_Hasard.Generator) RETURN nb_Batonnet;  ------------------------------------------------------


      PROCEDURE InitTab (T: IN OUT Tableau);                                           -----------------------------------------
                                                                                       -- Procedure qui initialise le tableau --
end Initialisation;                                                                    -----------------------------------------

