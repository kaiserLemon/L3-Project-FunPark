-- @insert_tuples.sql
spool insert_tuples.log

prompt *************************************************************
prompt ******************** DELETE TABLE *****************************
prompt *************************************************************
--PENSER A DELETE SEPAREMENT, AVANT DE INSERT
DELETE FROM LIEN;
DELETE FROM TARIF;
DELETE FROM ATTRACTIONS;
DELETE FROM CLIENTS;
DELETE FROM EMPLOYES;
DELETE FROM HORAIRES;

--On recréer la sequence ici pour qu'on reprenne de 0 à chaque fois qu'on recommence à 0 les inserts
DROP SEQUENCE seq_idClient;
CREATE SEQUENCE seq_idClient START WITH 1;

prompt *************************************************************
prompt ******************** INSERT TUPLES **************************
prompt *************************************************************


prompt **************INSERT IN EMPLOYES***********************************************
INSERT INTO Employes VALUES ('E1', 'Ferrer', 'Michel');
INSERT INTO Employes VALUES ('E2', 'Duchet', 'Leo');
INSERT INTO Employes VALUES ('E3', 'Marchand', 'Ibrahim'); 
INSERT INTO Employes VALUES ('E4', 'Leboison', 'Gabriel'); 
INSERT INTO Employes VALUES ('E5', 'Hugo', 'Gaspard');
INSERT INTO Employes VALUES ('E6', 'Dupont', 'Adam');
INSERT INTO Employes VALUES ('E7', 'Martin', 'Sohan'); 
INSERT INTO Employes VALUES ('E8', 'Petit', 'Liam');
INSERT INTO Employes VALUES ('E9', 'Roux', 'Jade');
INSERT INTO Employes VALUES ('E10', 'Louis', 'Yasmine');


prompt **************INSERT IN ATTRACTIONS***********************************************
INSERT INTO Attractions VALUES ('A1', '20-01-2023', 'E2', 'Luge', 4, 100);
INSERT INTO Attractions VALUES('A2', '24-01-23', 'E5', 'Canard', 3, 0);
INSERT INTO Attractions VALUES('A3', '20-01-23', 'E2', 'Freezomachine', 5, 120);
INSERT INTO Attractions VALUES('A4', '03-01-23', 'E2', 'WesternTour', 15, 160);
INSERT INTO Attractions VALUES('A5', '14-11-22', 'E7', 'DuckLand', 6, 130);
INSERT INTO Attractions VALUES('A6', '27-01-23', 'E1', 'Safari', 4, 100);
INSERT INTO Attractions VALUES('A7', '15-12-22', 'E4', 'Super8', 12, 140);


prompt **************INSERT IN HORAIRES***********************************************
INSERT INTO Horaires VALUES ('A2', 'Mercredi', 'E2', INTERVAL '12:20' HOUR TO MINUTE, INTERVAL '22:00' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A1', 'Lundi', 'E1',INTERVAL '9:30' HOUR TO MINUTE, INTERVAL '18:30' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A1', 'Samedi', 'E4', INTERVAL '9:00' HOUR TO MINUTE, INTERVAL '18:00' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A2', 'Lundi', 'E2', INTERVAL '9:30' HOUR TO MINUTE, INTERVAL '18:00' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A2', 'Mardi', 'E2', INTERVAL '9:30' HOUR TO MINUTE, INTERVAL '18:30' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A2', 'Dimanche', 'E2', INTERVAL '10:00' HOUR TO MINUTE, INTERVAL '18:00' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A4', 'Jeudi', 'E1', INTERVAL '9:30' HOUR TO MINUTE, INTERVAL '18:00' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A5', 'Jeudi', 'E9',INTERVAL '11:30' HOUR TO MINUTE, INTERVAL '22:00' HOUR TO MINUTE);
INSERT INTO Horaires VALUES ('A5', 'Vendredi', 'E10', INTERVAL '9:00' HOUR TO MINUTE, INTERVAL '14:00' HOUR TO MINUTE);

prompt **************INSERT IN TARIF***********************************************
INSERT INTO Tarif VALUES ('A1', 'Enfant', 'Lundi', 5.00);
INSERT INTO Tarif VALUES ('A2', 'Adulte', 'Mardi', 8.50);
INSERT INTO Tarif VALUES ('A3', 'Jeune', 'Mercredi', 6.00);
INSERT INTO Tarif VALUES ('A4', 'Senior', 'Jeudi', 4.00);
INSERT INTO Tarif VALUES ('A5', 'Enfant', 'Vendredi', 6.50);
INSERT INTO Tarif VALUES ('A1', 'Adulte', 'Samedi', 9.00);
INSERT INTO Tarif VALUES ('A2', 'Jeune', 'Dimanche', 7.00);
INSERT INTO Tarif VALUES ('A3', 'Senior', 'Lundi', 3.50);
INSERT INTO Tarif VALUES ('A4', 'Enfant', 'Mardi', 5.50);
INSERT INTO Tarif VALUES ('A5', 'Adulte', 'Mercredi', 7.50);

prompt **************INSERT IN CLIENTS***********************************************
INSERT INTO Clients VALUES (seq_idClient.nextval,24, 170, 'Jeune');
INSERT INTO Clients VALUES (seq_idClient.nextval,35, 180, 'Adulte');
INSERT INTO Clients VALUES (seq_idClient.nextval,60, 165, 'Senior');
INSERT INTO Clients VALUES (seq_idClient.nextval,10, 130, 'Enfant');
INSERT INTO Clients VALUES (seq_idClient.nextval,45, 175, 'Adulte');
INSERT INTO Clients VALUES (seq_idClient.nextval,20, 165, 'Jeune');
INSERT INTO Clients VALUES (seq_idClient.nextval,55, 170, 'Adulte');
INSERT INTO Clients VALUES (seq_idClient.nextval,12, 140, 'Enfant');
INSERT INTO Clients VALUES (seq_idClient.nextval,68, 175, 'Senior');
INSERT INTO Clients VALUES (seq_idClient.nextval,30, 180, 'Adulte');
INSERT INTO Clients VALUES (seq_idClient.nextval,22, 160, 'Jeune');
INSERT INTO Clients VALUES (seq_idClient.nextval,58, 165, 'Adulte');
INSERT INTO Clients VALUES (seq_idClient.nextval,9, 125, 'Enfant');
INSERT INTO Clients VALUES (seq_idClient.nextval,75, 160, 'Senior');
INSERT INTO Clients VALUES (seq_idClient.nextval,19, 170, 'Jeune');

prompt **************INSERT IN LIEN***********************************************
INSERT INTO Lien VALUES ('1', 'Lundi', 'E1');
INSERT INTO Lien VALUES ('2', 'Mardi', 'E3');
INSERT INTO Lien VALUES ('3', 'Mercredi', 'E2');
INSERT INTO Lien VALUES ('4', 'Jeudi', 'E4');
INSERT INTO Lien VALUES ('5', 'Vendredi', 'E5');
INSERT INTO Lien VALUES ('1', 'Samedi', 'E2');
INSERT INTO Lien VALUES ('2', 'Dimanche', 'E1');
INSERT INTO Lien VALUES ('3', 'Lundi', 'E3');
INSERT INTO Lien VALUES ('4', 'Mardi', 'E4');
INSERT INTO Lien VALUES ('5', 'Mercredi', 'E5');

spool off

