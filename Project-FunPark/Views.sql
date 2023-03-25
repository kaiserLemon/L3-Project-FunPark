DROP VIEW vue_maintenance;
DROP VIEW vue_horaires;
DROP VIEW vue_prix;

--Une vue qui affiche les attractions nécessitant une maintenance car aucune maintenance n' a ete faites dans les 60 derniers jours, avec la date de la dernière maintenance effectuée et le nom de l'employé ayant effectué cette maintenance :

CREATE VIEW vue_maintenance AS
SELECT idAttraction, nomAttraction, dateDerniereMaintenance, nomEmpl || ' ' || prenomEmpl AS nom_employe
FROM Attractions
INNER JOIN Employes ON Employes.idEmpl = Attractions.idEmplDerniereMaintenance
WHERE dateDerniereMaintenance < (SYSDATE - 60);


--Une vue qui affiche les horaires d'ouverture et de fermeture de chaque attraction pour chaque jour de la semaine :

CREATE VIEW vue_horaires AS
SELECT nomAttraction, jourSemaine, ouvertureAttraction, fermetureAttraction
FROM Horaires NATURAL JOIN Attractions;

--Une vue qui affiche les tarifs et les conditions de chaque attraction:

CREATE VIEW vue_attractions AS
SELECT nomAttraction, ageMin, tailleMin, catClient, jourSemaine, prixAttraction
FROM Attractions NATURAL JOIN Tarif;
