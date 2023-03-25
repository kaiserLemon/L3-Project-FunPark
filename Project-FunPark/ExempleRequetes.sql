--ICI ON A --employe_role à L3_39 Quentin Hu
--client_classic_role à L3_51 Andy
--admin_role à L3_49 Quentin Herlem
	-- -- REQUETES A EXECUTER PAR LE CREATEUR DE LA BASE DE DONNEE -- --
--Trouver le nombre d'employés qui travaillent à chaque attraction :
	-- Utilise l'index PK_ATTRACTION
SELECT idAttraction, COUNT(*) AS nombreEmployes 
FROM Horaires 
GROUP BY idAttraction;


--Afficher les employés par ordre du nombre de jour où il a travaillé
	--Utilise l'index PK_EMPLOYES
SELECT idEmpl, COUNT(*) AS nombreJoursTravaille 
FROM Horaires WHERE jourSemaine = 'Lundi' OR jourSemaine = 'Mardi' OR jourSemaine = 'Mercredi' OR jourSemaine = 'Jeudi' OR jourSemaine = 'Vendredi' 
GROUP BY idEmpl 
ORDER BY nombreJoursTravaille DESC;


--Obtenir le nom et le prénom de tous les employés qui travaillent à une attraction donnée :
SELECT nomEmpl, prenomEmpl FROM Employes WHERE idEmpl IN 
(SELECT idEmpl FROM Horaires WHERE idAttraction = 'A1');

--------------------------------------------------------------------------------------

--APPELS DE FONCTIONS:

--Modifier le prix d'une attraction pour un jour et une categorie de client donnee
BEGIN
    dbms_output.put_line(MODIFIER_PRIX_ATTRACTION('A1','Enfant','Lundi',7));
END;
/

--Supprime une attraction à partir de son id:
BEGIN
    dbms_output.put_line(DELETE_ATTRACTION('A1'));
END;
/

-- APPEL AUX TRIGGERS: 

-- horaires_before_ins_upd_row
-- Verifie que la fermeture de l'attraction ce fait après son ouverture
INSERT INTO Horaires VALUES ('A3', 'Lundi', 'E1',INTERVAL '19:30' HOUR TO MINUTE, INTERVAL '12:30' HOUR TO MINUTE);

-----------CETTE REQUETE PEUT ETRE LANCE PAR UN CLIENT--------------
--clients_before_ins_upd_row
--Probleme: l'age ne correspond pas à la catégorie rentré
INSERT INTO L3_37.Clients VALUES (seq_idClient.nextval,34, 180, 'Enfant');


--attractions_before_ins_upd_rowup
--Probleme: date de maintenance dans le futur !
UPDATE ATTRACTIONS
SET datedernieremaintenance = '20-06-2022'
WHERE idattraction = 'A6';

---------------CETTE REQUETE PEUT ETRE LANCE PAR UN EMPLOYE------------------
--attractions nécessitant une maintenance
SELECT * FROM L3_37.vue_maintenance;

----------------CETTE REQUETE PEUT ETRE LANCE PAR UN CLIENT -----------------
--Horaires de l'attraction A2
SELECT * FROM L3_37.vue_horaires
WHERE nomAttraction = 'DuckLand';


----------------CETTE REQUETE PEUT ETRE LANCE PAR UN CLIENT -----------------
SELECT * FROM L3_37.vue_attractions 
WHERE catClient = 'Enfant' AND tailleMin > '120';
