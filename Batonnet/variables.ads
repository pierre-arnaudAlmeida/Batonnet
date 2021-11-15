PACKAGE Variables IS


    Ligne: integer:=7;                                              --------------------------------------------------------------------------
    Batonnet: Integer:=29;                                          -- Variables permettant de contraindre et de d�finir le type du tableau --
                                                                    --------------------------------------------------------------------------



    TYPE Tableau IS ARRAY (1..Ligne,1..Batonnet) OF Integer;
    T : Tableau;


    Nombre_Case_Pleine: Integer:=0;                                  ---------------------------------------------------------------------------
    Valeur_Supprimer: Integer:=0;                                    -- Variables permettant de v�rifier le nombre de case pleine et restante --
    Nombre_Case_Restante,Nombre_case_restante_bis:Integer :=0;       ---------------------------------------------------------------------------


    SUBTYPE Ligne_hasard IS Integer RANGE 1..Ligne;                  -----------------------------------------------------------
    SUBTYPE Batonnet_Hasard IS Integer RANGE 1..3;                   -- Sous type permettant de g�n�rer des valeurs al�atoire --
    SUBTYPE Nb_Batonnet IS Integer RANGE 1..17;                      -----------------------------------------------------------


    Mode_De_Jeu: Integer;                                            ------------------------------------------------------------------------
    Type_Ia:Integer;                                                 -- Variable permettant de d�finir le mode de jeu, l'ia et l'affichage --
    Type_Affichage: Integer;                                         ------------------------------------------------------------------------
    Choix_De_Ia: Integer:= 17;


    Max_Batonnet: Integer;                                           -----------------------------------------------------------------------------------------
    Nb_joueurs:integer:=2;                                           -- Variables qui permettent le bon d�roulement du jeu, la limite de batonnet a retirer --
    Joueur: Integer:=1;                                              -- et le nombre de joueurs pr�sent dans le jeu                                         --
                                                                     -----------------------------------------------------------------------------------------

    a,b,e,d,r,s,u,v,w,x,y,Z,nb_ligne1: Integer:=0;                   ---------------------------------------------------
    Batonnet_Restant: Integer:=0;                                    -- Variables utilis� dans la r�alisation de l'ia --
    Ligne_Restante: Integer:=Ligne;                                  ---------------------------------------------------



   end variables;



