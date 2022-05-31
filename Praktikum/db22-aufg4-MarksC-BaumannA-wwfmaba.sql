#Christoph Marks und Antonia Baumann, 28.04.2022
DROP DATABASE IF EXISTS wwfmaba;

#Datenbank erstellen
CREATE DATABASE wwfmaba
    CHARACTER SET = latin1;

USE wwfmaba;


CREATE TABLE FlugzeugTyp
(
    flugzeugTyp    VARCHAR(45),
    hersteller     VARCHAR(45),
    maxFlugstunden FLOAT,
    PRIMARY KEY (flugzeugTyp)
);

CREATE TABLE Maschine
(
    kennzeichen                       VARCHAR(45),
    datumInbetriebnahme               DATE,
    betriebsStunden                   INT,
    betriebsStundenNachLetzterWartung INT,
    datumLetzteWartung                DATE,
    FlugzeugTyp_idFlugzeugTyp         VARCHAR(45),
    CONSTRAINT fk_Maschine_idFlugzeugTyp
        FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    PRIMARY KEY (kennzeichen)
);

CREATE TABLE Merkmal
(
    merkmalID  INT,
    bezeichner VARCHAR(45),
    PRIMARY KEY (merkmalID)
);

CREATE TABLE Maschine_has_Merkmal
(
    Maschine_kennzeichen VARCHAR(45),
    Merkmal_merkmalID    INT,
    CONSTRAINT fk_Maschine_has_Merkmal_kennzeichen
        FOREIGN KEY (Maschine_kennzeichen)
            REFERENCES Maschine (kennzeichen),
    FOREIGN KEY (Merkmal_merkmalID) REFERENCES Merkmal (merkmalID),
    PRIMARY KEY (Maschine_kennzeichen, Merkmal_merkmalID)
);

CREATE TABLE Buchungsklasse
(
    buchungsklasse            VARCHAR(45),
    anzahl                    INT,
    FlugzeugTyp_idFlugzeugTyp VARCHAR(45),
    CONSTRAINT fk_Buchungsklasse_idFlugzeugTyp
        FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    PRIMARY KEY (buchungsklasse, FlugzeugTyp_idFlugzeugTyp)
);

CREATE TABLE Flughafen
(
    flughafenKennung                            VARCHAR(3),
    flughafenAdresse                            VARCHAR(45),
    zeitzone                                    INT,
    sicherheitsgebür                            DECIMAL(6, 2),
    flughafenSteuer                             DECIMAL(6, 2),
    Flughafen_flughafenKennung_Nachbarflughafen VARCHAR(3),
    CONSTRAINT fk_Flughafen_Nachbarflughafen
        FOREIGN KEY (Flughafen_flughafenKennung_Nachbarflughafen)
            REFERENCES Flughafen (flughafenKennung),
    PRIMARY KEY (flughafenKennung)
);

CREATE TABLE Flugverbindung
(
    flugNummer                INT,
    startFlughafen            VARCHAR(45),
    endFlughafen              VARCHAR(45),
    startZeit                 DATETIME,
    endZeit                   DATETIME,
    längeStrecke              FLOAT,
    Kerosinzuschlag           DECIMAL(6, 2),
    FlugzeugTyp_idFlugzeugTyp VARCHAR(45),
    flugTagMontag             TINYINT,
    flugTagDienstag           TINYINT,
    flugTagMittwoch           TINYINT,
    flugTagDonnerstag         TINYINT,
    flugTagFreitag            TINYINT,
    flugTagSamstag            TINYINT,
    flugTagSonntag            TINYINT,
    CONSTRAINT fk_Flugverbindung_idFlugzeugTyp
        FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    CONSTRAINT fk_Flugverbindung_startFlughafen
        FOREIGN KEY (startFlughafen)
            REFERENCES Flughafen (flughafenKennung),
    CONSTRAINT fk_Flugverbindung_endFlughafen
        FOREIGN KEY (endFlughafen)
            REFERENCES Flughafen (flughafenKennung),
    PRIMARY KEY (flugNummer)
);

CREATE TABLE Tarif
(
    tarifTyp                        VARCHAR(45),
    Preis                           DECIMAL(6, 2),
    Buchungsklasse_idBuchungsklasse VARCHAR(45),
    FlugVerbindung_flugNummer       INT,
#     FlugzeugTyp_idFlugzeugTyp       VARCHAR(45),
    CONSTRAINT fk_Tarif_flugNummer
        FOREIGN KEY (FlugVerbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    CONSTRAINT fk_Tarif_idBuchungsklasse
        FOREIGN KEY (Buchungsklasse_idBuchungsklasse)
            REFERENCES Buchungsklasse (buchungsklasse),
#     CONSTRAINT fk_Tarif_idFlugzeugTyp
#         FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
#             REFERENCES FlugzeugTyp (flugzeugTyp),
    CONSTRAINT PK_Tarif
        PRIMARY KEY (tarifTyp, Buchungsklasse_idBuchungsklasse, FlugVerbindung_flugNummer)
);

CREATE TABLE Flug
(
    flugDatum                 DATE,
    FlugVerbindung_flugNummer INT,
    Maschine_kennzeichen      VARCHAR(45),
    CONSTRAINT fk_Flug_flugNummer
        FOREIGN KEY (FlugVerbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    PRIMARY KEY (flugDatum, FlugVerbindung_flugNummer)
);

CREATE TABLE Buchung
(
    Kunde                           VARCHAR(45),
    platzNR                         INT,
    Flug_flugDatum                  DATE,
    Flug_Flugverbindung_flugNummer  INT,
    Tarif_tarifTyp                  VARCHAR(45),
    Buchungsklasse_buchungsklasseID VARCHAR(45),
    Flugzeugtyp_idFlugzeugTyp       VARCHAR(45),
    CONSTRAINT fk_Buchung_flugDatum
        FOREIGN KEY (Flug_flugDatum)
            REFERENCES Flug (flugDatum),
    CONSTRAINT fk_Buchung_flugNummer
        FOREIGN KEY (Flug_Flugverbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    CONSTRAINT fk_Buchung_tarifTyp
        FOREIGN KEY (Tarif_tarifTyp)
            REFERENCES Tarif (tarifTyp),
    CONSTRAINT fk_Buchung_buchungsklasse
        FOREIGN KEY (Buchungsklasse_buchungsklasseID)
            REFERENCES Buchungsklasse (buchungsklasse),
    CONSTRAINT fk_Buchung_flugzeugTyp
        FOREIGN KEY (Flugzeugtyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    PRIMARY KEY (Kunde, Flug_flugDatum, Flug_Flugverbindung_flugNummer)
);

CREATE TABLE Flug_has_Buchungsklasse
(
    Flug_flugDatum                DATE,
    Flugverbindung_flugNummer     INT,
    Buchungsklasse_buchungsklasse VARCHAR(45),
    FlugzuegTyp_idFlugzeugTyp     VARCHAR(45),
    verfügbarePlätze              INT,
    CONSTRAINT fk_Flug_has_Buchungsklasse_flugDatum
        FOREIGN KEY (Flug_flugDatum)
            REFERENCES Flug (flugDatum),
    CONSTRAINT fk_Flug_has_Buchungsklasse_flugNummer
        FOREIGN KEY (Flugverbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    CONSTRAINT fk_Flug_has_Buchungsklasse_buchungsklasse
        FOREIGN KEY (Buchungsklasse_buchungsklasse)
            REFERENCES Buchungsklasse (buchungsklasse),
    CONSTRAINT fk_Flug_has_Buchungsklasse_idFlugzeugTyp
        FOREIGN KEY (FlugzuegTyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    PRIMARY KEY (Flug_flugDatum, Flugverbindung_flugNummer)
);


/* Dateneingabe */

INSERT INTO Flughafen
VALUES ('NUE', null, +1, 20, 30, null),
       ('MUC', null, +1, 25, 30, 'NUE'),
       ('STR', null, +1, 20, 30, null),
       ('FRA', null, +1, 20, 30, 'STR'),
       ('TXL', null, +1, 20, 30, null),
       ('CDG', null, +1, 25, 35, null),
       ('LHR', null, 0, 30, 40, null),
       ('LCY', null, +1, 20, 30, 'LHR'),
       ('SFO', null, -8, 50, 30, null);

#Bestimmte Nachbarflughäfen können erst im Nachhinein gesetzt werden da davor ihre Nachbarn als Flughäfen in der Tabelle Flughafen existieren müssen
UPDATE Flughafen
SET Flughafen_flughafenKennung_Nachbarflughafen = 'MUC'
WHERE flughafenKennung = 'NUE';
UPDATE Flughafen
SET Flughafen_flughafenKennung_Nachbarflughafen = 'FRA'
WHERE flughafenKennung = 'STR';
UPDATE Flughafen
SET Flughafen_flughafenKennung_Nachbarflughafen = 'LCY'
WHERE flughafenKennung = 'LHR';

INSERT INTO FlugzeugTyp
VALUES ('A321', 'Airbus', 50000),
       ('A340-600', 'Airbus', 60000),
       ('747-400', 'Boeing', 50000),
       ('737-300', 'Boeing', 45000),
       ('CRJ900', 'Bombardier', 55000);

INSERT INTO Maschine
VALUES ('D-ABYZ', DATE('09.04.2005'), 12345, 643, null, 'A321'),
       ('D-CDUX', DATE('09.04.2005'), 15223, 804, null, 'A321'),
       ('D-BAXY', DATE('27.03.2001'), 45632, 231, null, 'A321'),
       ('D-EFST', DATE('02.02.2007'), 4102, 998, null, 'A340-600'),
       ('D-GHQR', DATE('05.10.2009'), 2023, 654, null, 'A340-600'),
       ('D-IKOP', DATE('04.03.2002'), 45632, 821, null, '747-400'),
       ('D-BORD', DATE('10.08.2003'), 9854, 678, null, '737-300'),
       ('D-LMNA', DATE('08.03.2007'), 1432, 70, null, 'CRJ900');

INSERT INTO Buchungsklasse
VALUES ('Economy', 190, 'A321'),

       ('Economy', 238, 'A340-600'),
       ('Business', 60, 'A340-600'),
       ('First', 8, 'A340-600'),

       ('Economy', 238, '747-400'),
       ('Business', 60, '747-400'),
       ('First', 8, '747-400'),

       ('Economy', 190, '737-300'),

       ('Economy', 190, 'CRJ900');

INSERT INTO Flugverbindung
VALUES (925, 'NUE', 'FRA', TIME('09:40'), TIME('10:30'), NULL, 10.00, 'A321', 1, 1, 1, 1, 1, 0, 0),
       (926, 'FRA', 'NUE', TIME('12:00'), TIME('13:10'), NULL, 10.00, 'A321', 1, 1, 1, 1, 1, 0, 0),
       (929, 'NUE', 'FRA', TIME('09:40'), TIME('10:30'), NULL, 10.00, 'CRJ900', 0, 0, 0, 0, 0, 1, 1),
       (310, 'NUE', 'TXL', TIME('06:45'), TIME('08:00'), NULL, 10.00, 'A321', 1, 1, 1, 1, 1, 0, 0),
       (312, 'NUE', 'TXL', TIME('09:15'), TIME('10:30'), NULL, 10.00, 'A321', 0, 0, 0, 0, 0, 1, 1),
       (4756, 'MUC', 'LHR', TIME('13:05'), TIME('14:05'), NULL, 20.00, 'A340-600', 1, 1, 1, 1, 1, 1, 1),
       (9488, 'MUC', 'LCY', TIME('16:00'), TIME('17:20'), NULL, 20.00, '737-300', 1, 1, 1, 1, 1, 0, 0),
       (4210, 'MUC', 'CDG', TIME('16:00'), TIME('17:20'), NULL, 20.00, 'A340-600', 1, 0, 1, 0, 1, 0, 0),
       (5210, 'CDG', 'SFO', TIME('17:50'), TIME('21:00'), NULL, 40.00, 'A340-600', 1, 0, 1, 0, 1, 0, 0),
       (4711, 'MUC', 'SFO', TIME('10:00'), TIME('13:50'), NULL, 40.00, '747-400', 0, 1, 0, 1, 0, 0, 0);

INSERT INTO Tarif
VALUES ('Normaltarif', 190, 'Economy', 925),
       ('Normaltarif', 190, 'Economy', 926),
       ('Normaltarif', 192, 'Economy', 929),
       ('Frühbucher', 140, 'Economy', 925),
       ('Frühbucher', 140, 'Economy', 926),
       ('Frühbucher', 140, 'Economy', 929),
       ('Last Minute', 100, 'Economy', 925),
       ('Last Minute', 100, 'Economy', 926),
       ('Last Minute', 100, 'Economy', 929),

       ('Normaltarif', 210, 'Economy', 310),
       ('Normaltarif', 210, 'Economy', 312),
       ('Frühbucher', 165, 'Economy', 310),
       ('Frühbucher', 165, 'Economy', 312),
       ('Last Minute', 120, 'Economy', 310),
       ('Last Minute', 120, 'Economy', 312),

       ('Normaltarif', 240, 'Economy', 4756),
       ('Normaltarif', 470, 'Business', 4756),
       ('Normaltarif', 690, 'First', 4756),
       ('Frühbucher', 210, 'Economy', 4756),
       ('Frühbucher', 390, 'Business', 4756),
       ('Frühbucher', 590, 'First', 4756),
       ('Last Minute', 160, 'Economy', 4756),

       ('Normaltarif', 240, 'Economy', 4210),
       ('Normaltarif', 490, 'Business', 4210),
       ('Normaltarif', 700, 'First', 4210),
       ('Frühbucher', 210, 'Economy', 4210),
       ('Frühbucher', 400, 'Business', 4210),
       ('Frühbucher', 600, 'First', 4210),
       ('Last Minute', 160, 'Economy', 4210),

       ('Normaltarif', 350, 'Economy', 5210),
       ('Normaltarif', 690, 'Business', 5210),
       ('Normaltarif', 810, 'First', 5210),
       ('Frühbucher', 300, 'Economy', 5210),
       ('Frühbucher', 630, 'Business', 5210),
       ('Frühbucher', 750, 'First', 5210),
       ('Last Minute', 290, 'Economy', 5210),

       ('Normaltarif', 610, 'Economy', 4711),
       ('Normaltarif', 1050, 'Business', 4711),
       ('Normaltarif', 1820, 'First', 4711),
       ('Frühbucher', 540, 'Economy', 4711),
       ('Frühbucher', 890, 'Business', 4711),
       ('Frühbucher', 1500, 'First', 4711),
       ('Last Minute', 480, 'Economy', 4711),
       ('Last Minute', 950, 'Business', 4711),

       ('Normaltarif', 240, 'Economy', 9488),
       ('Frühbucher', 210, 'Economy', 9488),
       ('Last Minute', 160, 'Economy', 9488);

INSERT INTO Merkmal
    VALUES (1, 'Internetanbindung'),
           (2, 'Satellitentelefon');

INSERT INTO Maschine_has_Merkmal
    VALUES ('D-EFST', 1),
           ('D-GHQR', 1),
           ('D-IKOP', 1),
           ('D-EFST', 2),
           ('D-IKOP', 2);

INSERT INTO Flug
    VALUES ('2022-07-22', 310, 'D-ABYZ');


INSERT INTO Flug_has_Buchungsklasse
    VALUES ('2022-07-22', 310, 'Economy', 'A321', 42);
# INSERT INTO Flug_has_Buchungsklasse
#     VALUES('2022-07-23', 312, 'Economy', 'A321', 190);

/* BEGINN Bearbeitung der Aufgaben 4 ------------------------------------*/

#TEILAUFGABE (01)
#alten Constraint löschen
ALTER TABLE Maschine_has_Merkmal
    DROP CONSTRAINT fk_Maschine_has_Merkmal_kennzeichen
#neuer Constraint
ALTER TABLE Maschine_has_Merkmal
    ADD CONSTRAINT fk_Maschine_has_Merkmal_kennzeichen
        FOREIGN KEY (Maschine_kennzeichen)
            REFERENCES Maschine (kennzeichen)
        ON DELETE CASCADE ;
#Test (01)
DELETE FROM Maschine
    WHERE kennzeichen = 'D-EFST';


#TEILAUFGABE (02)

DROP TRIGGER IF EXISTS check_flug_insert;
DROP TRIGGER IF EXISTS check_flug_update;
DROP PROCEDURE IF EXISTS check_FlugzeugTyp;

DELIMITER //
CREATE TRIGGER check_flug_insert
BEFORE INSERT
ON flug
FOR EACH ROW
BEGIN
	CALL check_FlugzeugTyp(NEW.Maschine_kennzeichen, NEW.Flugverbindung_Flugnummer);
END//

CREATE TRIGGER check_flug_update
BEFORE UPDATE
ON flug
FOR EACH ROW
BEGIN
	CALL check_FlugzeugTyp(NEW.Maschine_kennzeichen, NEW.Flugverbindung_Flugnummer);
END//

CREATE PROCEDURE check_FlugzeugTyp (IN kennzeichen VARCHAR(20), IN flugnummer INT)
BEGIN
	IF NOT (SELECT FlugzeugTyp_idFlugzeugTyp
            FROM Maschine M
            WHERE M.kennzeichen = kennzeichen)
        = (SELECT FlugzeugTyp_idFlugzeugTyp
           FROM Flugverbindung F
           WHERE F.flugNummer = flugnummer)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Falsche Maschine, bitte wählen Sie den korrekten MaschinenTyp';
    END IF;
END//
#Test (02)
INSERT INTO Flug
    VALUES ('2022-07-16', 312, 'D-BORD');
UPDATE Flug
    SET Maschine_kennzeichen = 'D-BORD'
    WHERE Maschine_kennzeichen = 'D-ABYZ';


#TEILAUFGABE (03)
DROP TRIGGER IF EXISTS erzeuge_flug_z_plaetze;
DELIMITER //
CREATE TRIGGER erzeuge_flug_z_plaetze
    AFTER INSERT
    ON Flug
    FOR EACH ROW
BEGIN
    INSERT INTO Flug_has_Buchungsklasse
        SELECT NEW.flugDatum, NEW.FlugVerbindung_flugNummer,
               B.buchungsklasse, M.FlugzeugTyp_idFlugzeugTyp,
                B.anzahl
            FROM Maschine M
                JOIN Buchungsklasse B on M.FlugzeugTyp_idFlugzeugTyp = B.FlugzeugTyp_idFlugzeugTyp
            WHERE M.kennzeichen = NEW.Maschine_kennzeichen;
END //
DELIMITER ;
#Test (03)
INSERT INTO Flug
    VALUES ('2022-07-24', 312, 'D-ABYZ');


#TEILAUFGABE (04)
DROP PROCEDURE IF EXISTS gebe_verbindungen;
CREATE PROCEDURE gebe_verbindungen(
    IN startFlughafen VARCHAR(3),
    IN zielFlughafen VARCHAR(3),
    IN flugdatum DATE
)
BEGIN
    SELECT flugNummer, startZeit, endZeit, verfügbarePlätze
    FROM Flug F
            LEFT JOIN Flugverbindung FV on FV.flugNummer = F.FlugVerbindung_flugNummer
            LEFT JOIN Flug_has_Buchungsklasse FhB on F.FlugVerbindung_flugNummer = FhB.Flugverbindung_flugNummer
                    AND F.flugDatum = FhB.Flug_flugDatum
    WHERE FV.startFlughafen = startFlughafen
      AND FV.endFlughafen = zielFlughafen
      AND F.flugDatum = flugDatum
      AND FhB.Buchungsklasse_buchungsklasse = 'Economy';
END;

CALL gebe_verbindungen('NUE', 'TXL', 20220722);


#TEILAUIFGABE (05)
DROP FUNCTION IF EXISTS gebe_flugdauer;
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
CREATE FUNCTION gebe_flugdauer(flugnummer INT) RETURNS INT
BEGIN
    DECLARE flugminuten INT;
    SELECT MINUTE(TIMEDIFF(DATE_ADD(endZeit, INTERVAL FHE.Zeitzone * -1 HOUR),
                           DATE_ADD(startZeit, INTERVAL FHS.Zeitzone * -1 HOUR)))
               + 60 * HOUR(TIMEDIFF(DATE_ADD(endZeit, INTERVAL FHE.Zeitzone * -1 HOUR),
                                    DATE_ADD(startZeit, INTERVAL FHS.Zeitzone * -1 HOUR)))
    INTO flugminuten
    FROM Flugverbindung f
             LEFT JOIN Flughafen FHS ON f.startFlughafen = FHS.flughafenKennung
             LEFT JOIN Flughafen FHE ON f.endFlughafen = FHE.flughafenKennung
    WHERE f.flugNummer = flugnummer;

    RETURN flugminuten;
END//
DELIMITER ;

SELECT gebe_flugdauer(310);





