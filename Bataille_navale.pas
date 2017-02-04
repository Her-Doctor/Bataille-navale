program Bataille_navale;

uses crt;

{Bataille navale

INSTRUCTIONS

Pas utiliser de tableau à 2 dimensions pour représenter la grille du jeu.
Utiliser un enregistrement cell pour décrire les cellules occupées par des bateaux.
De même, un bateau sera décrit par un ensemble de cellules.
La flotte de bateaux à couler sera représentée par un ensemble de bateaux

travail à faire : 
1. Ecrire la structure cell composée de 2 champs ligne et colonne de type entier
2. Ecrire la structure bateau composée de n cell
3. Ecrire le type enregistrement flotte composée d'un ensemble de bateau
4. Ecrire une fonction de création d'une cell, elle prend en paramètre la ligne et la colonne associées à la cellule
5. Ecrire une fonction de comparaison de 2 cell, cette fonction renverra vrai ou faux
6. Ecrire une fonction de création de bateau, elle renverra un type enregistrement bateau correctement rempli
7. Ecrire une fonction qui vérifie qu'une cell appartient  à un bateau, cette fonction renverra vrai ou faux selon le cas /!\ Cette fonction devra utiliser la fonction de comparaison de cell
8. Ecrire une fonction qui vérifie une cell apparatient à une flotte de bateau /!\ Cette fonction devra utiliser votre fonction de vérification de bateau
9. Ecrire la bataille navale complète
}
//ALGO bataile navalle
//BUT voir au dessus
//ENTREE euh
//SORTIE euh 
{
CONST
	MAX = 3
	Max2 = 4 
	CASES = 50

	Type <cell> = Enregistrement
			ligne,colonne: entier 	// type qui permet de donner une position au bateau
	Finenregistrement

	Type <Tabcell> = Enregistrement
			Tbat_taille:Tableau de cell 	//permet de donner un tableau a un enregistrement ( des cellules a un bateau)
	Finenregistrement

	Type <bateau> = Enregistrement
			Tbat_taille:Tabcell 	//permet de donner au bateau une certaine longueur
	Finenregistrement
	
	Type <TabBateau> = Enregistrement
			Tbat_taille:Tableau de bateau 	//permet de donner un tableau a un enregistrement (des bateaux a une armada)
	Finenregistrement

	Type <armada> = Enregistrement
			TArmada:TabBateau 	//permet de donner un certain nombre de bateau a une armada
	Finenregisement

VAR
	i,j,k,l,X,Y,rep: ENTIER
	TArmada:armada
	Tabimpossible : Tableau d entier
DEBUT
	POUR k DE 1 A Max2 FAIRE
		ECRIRE "bateau "&k&" :"
			REPETER
				ECRIRE "Donnez la ligne ou vous voulez placer votre navire."
				LIRE X
			JUSQUA X < CASES ET X > 0

			REPETER
				ECRIRE "Donnez la colonne ou vous voulez placer votre navire."
				LIRE Y
			JUSQUA Y < CASES ET Y > 0

			REPETER
				ECRIRE "Horizontal (1) Ou Vertical (2)?"
				LIRE rep
			JUSQUA rep = 1 OU rep =2
				SI rep =2 ALORS
					//INSTRUCTIONS DE PLACEMENT des cellules (verticale)
				SINON
					// INSTRUCTIONS DE PLACEMENT DES CELLULES (horizontale)
				FINSI
			POUR i DE 1 A MAX DO // affichage
				ECRIRE "Cellule "&i&" a la ligne "&TArmada_A.TArmada[1].Tbat_taille[i].ligne&" et a la colonne"&TArmada_A.TArmada[1].Tbat_taille[i].colonne&
			FINPOUR
	FINPOUR
FIN
}
CONST
	MAX=3;
	Max2=4;
	CASES = 50;

Type
	cell= record
		ligne,colonne:INTEGER;
// type qui permet de donner une position au bateau
end;

Type
	Yamato= record
		Tbat_taille:array[1..MAX] OF cell;
//permet de donner au bateau une certaine longueur
end;

Type
	armada= record
	TArmada:array[1..Max2] OF Yamato;
//permet de donner un certain nombre de bateau a une armada
end;

VAR // VARIABLES
	i,j,k,l,X,Y,rep:INTEGER;
	TArmada_A:armada;
	Tabimpossible:array[1..CASES,1..CASES] OF INTEGER;

BEGIN
	clrscr;
	writeln('Armada 1');
	FOR k:=1 TO Max2 DO // boucle pour entrer les donées pour les 4 navires de l'armada 1
		begin
			writeln('Bateau n',k,' :'); // sert a identifier le bateau
			REPEAT
				begin //boucle pour éviter qu'il ne donne un négatif ou un supérieur a CASES
					writeln('Donnez la ligne ou vous voulez placer votre navire.');
					readln(X);
				end;
			UNTIL (X < CASES) AND (X > 0);
			REPEAT
				begin //boucle pour éviter qu'il ne donne un négatif ou un supérieur a CASES
					writeln('Donnez la colonne ou vous voulez placer votre navire.');
					readln(Y);
				end;
			UNTIL  (Y < CASES) AND (Y > 0);

				REPEAT 	// La boucle repeat sert a eviter qu'un user ne donne autre chose que 1 ou 2
					begin
						writeln('Horizontal (1) Ou Vertical (2)?'); 
						readln(rep); // sert à déterminer si on veut le bateau a l'horizontal ou a la verticale
					end;
				UNTIL (rep=1) OR (rep=2);
					IF rep=2 THEN
						begin 	// Pour mettre les bateau a la verticale
							TArmada_A.TArmada[k].Tbat_taille[1].ligne:= X;
							TArmada_A.TArmada[k].Tbat_taille[1].colonne:= Y;
							TArmada_A.TArmada[k].Tbat_taille[2].ligne:= X+1;
							TArmada_A.TArmada[k].Tbat_taille[2].colonne:= Y;
							TArmada_A.TArmada[k].Tbat_taille[3].ligne:= X+2;
							TArmada_A.TArmada[k].Tbat_taille[3].colonne:= Y;
						end
					ELSE
						begin 	// pour positionner le bateau a l'horizontale
							TArmada_A.TArmada[k].Tbat_taille[1].ligne:= X;
							TArmada_A.TArmada[k].Tbat_taille[1].colonne:= Y;
							TArmada_A.TArmada[k].Tbat_taille[2].ligne:= X;
							TArmada_A.TArmada[k].Tbat_taille[2].colonne:= Y+1;
							TArmada_A.TArmada[k].Tbat_taille[3].ligne:= X;
							TArmada_A.TArmada[k].Tbat_taille[3].colonne:= Y+2;
						end;
						FOR i := 1 to MAX DO //Affichage
							begin
								writeln('Cellule n',i,',a la ligne ',TArmada_A.TArmada[1].Tbat_taille[i].ligne,' ,colonne ',TArmada_A.TArmada[1].Tbat_taille[i].colonne);
							end;
		end;
	readln;
END.

