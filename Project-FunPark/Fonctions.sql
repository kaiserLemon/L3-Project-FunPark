--Modifier le prix d'une attraction pour un jour donné et une catégorie de client donnée :

CREATE OR REPLACE FUNCTION modifier_prix_attraction(
    p_idAttraction  VARCHAR2,
    p_catClient  VARCHAR2,
    p_jourSemaine  VARCHAR2,
    p_nouveauPrix  NUMBER
) 
RETURN VARCHAR2
IS
BEGIN
    UPDATE Tarif
    SET prixAttraction = p_nouveauPrix
    WHERE idAttraction = p_idAttraction
    AND catClient = p_catClient
    AND jourSemaine = p_jourSemaine;
    
    RETURN 'Prix de l''attraction modifié avec succès.';
END;
/

--Une fonction pour supprimer une attraction, qui va également supprimer tous les tarifs associés à cette attraction ainsi que les horaires, et mettre à jour les liens des clients :

create or replace FUNCTION delete_attraction(p_idAttraction VARCHAR2)
RETURN NUMBER
IS
BEGIN
  DELETE FROM Tarif WHERE idAttraction = p_idAttraction;
  DELETE FROM Horaires WHERE idAttraction = p_idAttraction;
  DELETE FROM Attractions WHERE idAttraction = p_idAttraction;
  RETURN SQL%ROWCOUNT;
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'An error occurred while deleting the attraction.');
END;

