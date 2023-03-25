-- Suppression des rôles (lancer si ils existent déja)
DROP ROLE employe_role;
DROP ROLE client_classic_role;
DROP ROLE admin_role;


-- Création des rôles
CREATE ROLE employe_role;
CREATE ROLE client_classic_role;
CREATE ROLE admin_role;

-- Attribution des droits pour le rôle employe_role
GRANT SELECT, INSERT, UPDATE ON Employes TO employe_role;
GRANT SELECT, INSERT, UPDATE ON Attractions TO employe_role;
GRANT SELECT ON Horaires TO employe_role;
GRANT SELECT ON Tarif TO employe_role;
GRANT SELECT ON Clients TO employe_role;
GRANT SELECT ON Lien TO employe_role;
GRANT SELECT ON vue_maintenance TO employe_role;


-- Attribution des droits pour le rôle client_role
GRANT SELECT, INSERT ON Clients TO client_classic_role;
GRANT SELECT ON vue_horaires TO client_classic_role;
GRANT SELECT ON vue_attractions TO client_classic_role;

-- Attribution des droits pour le rôle admin_role
GRANT ALL PRIVILEGES ON Employes TO admin_role;
GRANT ALL PRIVILEGES ON Attractions TO admin_role;
GRANT ALL PRIVILEGES ON Horaires TO admin_role;
GRANT ALL PRIVILEGES ON Tarif TO admin_role;
GRANT ALL PRIVILEGES ON Clients TO admin_role;
GRANT ALL PRIVILEGES ON Lien TO admin_role;


-- Attribution des rôles aux utilisateurs
GRANT employe_role TO L3_39;-- Quentin Hu
GRANT client_classic_role TO L3_51;--Andy
GRANT admin_role TO L3_49;--Quentin Herlem
--Réalisé sur la session de Nicolas
