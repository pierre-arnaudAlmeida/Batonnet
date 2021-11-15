WITH Variables; USE Variables;
WITH Ada.Numerics.Discrete_Random;


PACKAGE Coup IS

   PACKAGE Ligne_Au_Hasard IS NEW Ada.Numerics.Discrete_Random (Ligne_Hasard);            ---------------------------------------------------------------------
   USE Ligne_au_Hasard;                                                                   -- Permet de généré une ligne au hasard pour que l'ia puisse jouer --
   G:Ligne_Au_Hasard.Generator;                                                           ---------------------------------------------------------------------

   FUNCTION genere_ligne (G: ligne_au_Hasard.Generator) RETURN ligne_hasard;



   PACKAGE Batonnet_au_Hasard IS NEW Ada.Numerics.Discrete_Random (Batonnet_hasard);      ---------------------------------------------------------------------------------------
   USE Batonnet_au_Hasard;                                                                -- Permet de générer un nombre de batonnets au hasard pour l'ia puisse les supprimer --
   G2:Batonnet_Au_Hasard.Generator;                                                       ---------------------------------------------------------------------------------------

   FUNCTION genere_Batonnet (G2: Batonnet_au_Hasard.Generator) RETURN Batonnet_hasard;

   TYPE Reserve IS ARRAY (1..Ligne) OF Integer;
   P:Reserve;

    TYPE Coup  IS                                                ----------------------------------------------------
       record                                                    -- Crétion d'un type record permettant de         --
         SelectLigne: Integer;                                   -- choisir le type de coup que l'on souhaite      --
         SelectNombre: Integer;                                  -- jouer, soit la ligne,et le nombre de batonnets --
       END RECORD;                                               ----------------------------------------------------
    C: Coup;


   Procedure tour;                                                           ---------------------------------------------------------------------
   Function Demande_Coup return coup;                                        -- Declaration des différentes procedures présente dans le package --
   Procedure Maxbatonnet(t: in tableau);                                     ---------------------------------------------------------------------
   PROCEDURE Suppression (T: IN OUT Tableau);
   PROCEDURE Ia_Invincible;
   PROCEDURE Ia_Strategique (T: IN Tableau; P: IN OUT Reserve);

end coup;

