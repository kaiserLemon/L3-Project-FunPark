-- @create_tables_funpark.sql
spool create_tables_funpark.log

prompt *************************************************************
prompt ******************** DROP TABLE *****************************
prompt *************************************************************


DROP TABLE Attractions CASCADE CONSTRAINTS ;
DROP TABLE Clients CASCADE CONSTRAINTS ;
DROP TABLE Employes CASCADE CONSTRAINTS ;
DROP TABLE Horaires CASCADE CONSTRAINTS ;
DROP TABLE Tarif CASCADE CONSTRAINTS ;
DROP TABLE Lien CASCADE CONSTRAINTS ;
prompt ******************** DROP INDEX ET SEQUENCE*****************************
DROP INDEX idx_Clients_catClient;
DROP SEQUENCE seq_idClient;

prompt *************************************************************
prompt ******************** CREATE TABLE ***************************
prompt *************************************************************


CREATE TABLE Attractions (
        idAttraction                   VARCHAR2(4),
        dateDerniereMaintenance        DATE,
        idEmplDerniereMaintenance      VARCHAR2(4),
        nomAttraction                  VARCHAR2(30),
        ageMin                         NUMBER(3),
        tailleMin                      NUMBER(3),
        CONSTRAINT pk_Attraction PRIMARY KEY(idAttraction),
        CONSTRAINT check_age_min
                 CHECK ((ageMin >= 0) AND (tailleMin >=0))
);

CREATE SEQUENCE seq_idClient START WITH 1;

CREATE TABLE Clients (
        idClient                       VARCHAR2(4),
        ageClient                      NUMBER,
        tailleClient                   NUMBER,
        catClient                      VARCHAR2(10),
        CONSTRAINT pk_Clients PRIMARY KEY(idClient),
        CONSTRAINT check_cat_client
            CHECK ((ageClient >= 0) AND (tailleClient >=0) AND ((catClient =
'Enfant') OR (catClient = 'Jeune') OR (CatClient = 'Adulte') OR
(CatClient = 'Senior')  ))
);

CREATE BITMAP INDEX idx_Clients_catClient
ON Clients(catClient);

/*
On CHECK que l'on rentre des valeurs avec un sens dans la table, les
triggers verifiront la coherence entre les attributs (ex: catClient
coherent a l'age...)
*/

CREATE TABLE Employes (
        idEmpl                         VARCHAR2(4),
        nomEmpl                	       VARCHAR2(30),
        prenomEmpl                     VARCHAR2(30),
        CONSTRAINT pk_Employes PRIMARY KEY(idEmpl)
);

CREATE TABLE Horaires (
        idAttraction               VARCHAR2(4),
        jourSemaine                VARCHAR2(10),
        idEmpl                     VARCHAR2(4),
        ouvertureAttraction        INTERVAL DAY(0) TO SECOND(0),
         fermetureAttraction       INTERVAL DAY(0) TO SECOND(0),
        CONSTRAINT spk_Employes PRIMARY KEY(idAttraction,jourSemaine, idEmpl),
        CONSTRAINT sfk_Horaires_idAttraction FOREIGN KEY(idAttraction) REFERENCES Attractions(idAttraction),
        CONSTRAINT sfk_Horaires_idEmpl FOREIGN KEY(idEmpl) REFERENCES Employes(idEmpl),
        CONSTRAINT check_jour_semaine_horaires
               CHECK (jourSemaine IN ('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'))

);

CREATE TABLE Tarif (
        idAttraction             VARCHAR2(4),
        catClient                VARCHAR2(10),
        jourSemaine              VARCHAR2(10),
        prixAttraction           NUMBER,

        CONSTRAINT spk_Tarif PRIMARY KEY(idAttraction,catClient, jourSemaine),
        CONSTRAINT sfk_Tarif_idAttraction FOREIGN KEY(idAttraction) REFERENCES Attractions(idAttraction),
        CONSTRAINT check_prix
                CHECK ((prixAttraction > 0) AND (jourSemaine IN ('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche')))
);

CREATE TABLE Lien (
        idClient                VARCHAR2(4),
        jourSemaine             VARCHAR2(10),
        idEmpl                  VARCHAR2(4),

        CONSTRAINT spk_Lien PRIMARY KEY(idClient, jourSemaine, idEmpl),
        CONSTRAINT sfk_Lien_idClient FOREIGN KEY(idClient) REFERENCES Clients(idClient),
        CONSTRAINT sfk_Lien_idEmpl FOREIGN KEY(idEmpl) REFERENCES Employes(idEmpl),
        CONSTRAINT check_jour_semaine_lien
                CHECK (jourSemaine IN ('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'))
);

spool off

