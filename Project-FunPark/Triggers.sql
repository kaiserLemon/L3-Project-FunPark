------------Idée triggers------------------------

--Triggers sur l'ouverture de l'attraction
--Verifie que la fermeture de l'attraction se fait après son ouverture 

CREATE OR REPLACE TRIGGER horaires_before_ins_upd_row
BEFORE INSERT OR UPDATE ON Horaires
FOR EACH ROW
WHEN 	(new.ouvertureAttraction > new.fermetureAttraction
OR	new.ouvertureAttraction > old.fermetureAttraction
OR	old.fermetureAttraction > new.fermetureAttraction)
DECLARE
	heure_error EXCEPTION;
BEGIN
	RAISE heure_error;
	EXCEPTION
		WHEN heure_error THEN RAISE_APPLICATION_ERROR(-20001,'Heure d ouverture supérieur à l heure de fermeture');
END;
/
	
	
--Triggers sur la cohérence âge <-> catégorie du client

CREATE OR REPLACE TRIGGER clients_before_ins_upd_row
BEFORE INSERT OR UPDATE ON Clients
FOR EACH ROW
-- Enfant: [0-15[
-- Jeune : [15-25[
-- Adulte: [25 - 60[
-- Senior: [60 - +inf[ )
WHEN (	((new.catClient = 'Enfant' OR old.catClient = 'Enfant') AND (new.ageClient >= 15 OR old.ageClient >= 15))
OR 	((new.catClient = 'Jeune' OR old.catClient = 'Jeune') AND (new.ageClient < 15 OR old.ageClient < 15 OR new.ageClient >=25 OR old.ageClient >=25))
OR	((new.catClient = 'Adulte' OR old.catClient = 'Adulte') AND (new.ageClient < 25 OR old.ageClient < 25 OR new.ageClient >=60 OR old.ageClient >=60))
OR	((new.catClient = 'Senior' OR old.catClient = 'Senior') AND (new.ageClient < 60 OR old.ageClient < 60)) )
DECLARE 
	age_cat_error EXCEPTION;
BEGIN 
	RAISE age_cat_error;
	EXCEPTION
		WHEN age_cat_error THEN RAISE_APPLICATION_ERROR(-20002,'Catégorie et age incohérents');
END;
/

--Triggers sur la date de maintenance (Vérifie qu'elle n'est pas antérieure à aujourd'hui)

CREATE OR REPLACE TRIGGER attractions_before_ins_upd
BEFORE INSERT OR UPDATE ON Attractions
FOR EACH ROW
DECLARE
	date_maintenance_error EXCEPTION;
BEGIN
    IF (:new.dateDerniereMaintenance > SYSDATE) THEN
	RAISE date_maintenance_error;
    END IF;
	EXCEPTION
		WHEN date_maintenance_error THEN RAISE_APPLICATION_ERROR(-20003, 'Date de dernière maintenance incorrecte');
END;
/

