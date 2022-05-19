#Christoph Marks und Antonia Baumann, 28.04.2022
DROP DATABASE IF EXISTS wwfmaba;

#Datenbank erstellen
CREATE DATABASE IF NOT EXISTS wwfmaba
    CHARACTER SET = latin1;

USE wwfmaba;


CREATE TABLE FlugzeugTyp
(
    flugzeugTyp    VARCHAR(45) NOT NULL,
    hersteller     VARCHAR(45) NOT NULL,
    maxFlugstunden FLOAT       NOT NULL,
    PRIMARY KEY (flugzeugTyp)
);

CREATE TABLE Maschine
(
    kennzeichen                       INT,
    datumInbetriebnahme               DATE,
    betriebsStunden                   INT,
    betriebsStundenNachLetzterWartung INT,
    datumLetzteWartung                DATE,
    ausstattungsMerkmale              JSON,
    FlugzeugTyp_idFlugzeugTyp         VARCHAR(45),
    CONSTRAINT fk_Maschine_idFlugzeugTyp
        FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    PRIMARY KEY (kennzeichen)
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


CREATE TABLE Flugverbindung
(
    flugNummer                INT,
    startFlughafen            VARCHAR(45),
    endFlughafen              VARCHAR(45),
    startZeit                 DATETIME,
    endZeit                   DATETIME,
    startZeitZone             INT,
    endZeitZone               INT,
    längeStrecke              FLOAT,
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
    PRIMARY KEY (flugNummer)
);

CREATE TABLE Tarif
(
    tarifTyp                        VARCHAR(45),
    tarifFaktor                     INT,
    Buchungsklasse_idBuchungsklasse VARCHAR(45),
    FlugVerbindung_flugNummer       INT,
    CONSTRAINT fk_Tarif_flugNummer
        FOREIGN KEY (FlugVerbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    CONSTRAINT fk_Tarif_idBuchungsklasse
        FOREIGN KEY (Buchungsklasse_idBuchungsklasse)
            REFERENCES Buchungsklasse (buchungsklasse),
    CONSTRAINT PK_Tarif
        PRIMARY KEY (tarifTyp, Buchungsklasse_idBuchungsklasse, FlugVerbindung_flugNummer)
);

CREATE TABLE Flughafen
(
    flughafenKennung VARCHAR(3),
    flughafenAdresse VARCHAR(45),
    PRIMARY KEY (flughafenKennung)
);

CREATE TABLE Flughafen_has_Flugverbindung
(
    Flughafen_flughafenKennung VARCHAR(45),
    Flugverbindung_flugNummer  INT,
    CONSTRAINT fk_FhF_flughafenKennung
        FOREIGN KEY (Flughafen_flughafenKennung)
            REFERENCES Flughafen (flughafenKennung),
    CONSTRAINT fk_FhF_flugNummer
        FOREIGN KEY (Flugverbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    PRIMARY KEY (Flughafen_flughafenKennung, Flugverbindung_flugNummer)
);

CREATE TABLE Flug
(
    flugDatum                 DATE,
    FlugVerbindung_flugNummer INT,
    Maschine_kennzeichen      INT,
    Kosten_idKosten           INT,
    CONSTRAINT fk_Flug_flugNummer
        FOREIGN KEY (FlugVerbindung_flugNummer)
            REFERENCES Flugverbindung (flugNummer),
    PRIMARY KEY (flugDatum, FlugVerbindung_flugNummer)
);

CREATE TABLE Kosten
(
    idKosten                  INT NOT NULL,
    flugKosten                FLOAT,
    flughafenSteuer           FLOAT,
    sicherheitsGebührenAbflug FLOAT,
    kerosinZuschlag           FLOAT,
    PRIMARY KEY (idKosten)
);

CREATE TABLE Buchung
(
    Kunde                                          VARCHAR(45),
    platzNR                                        INT,
    Flug_flugDatum                                 DATE,
    Flug_Flugverbindung_flugNummer                 INT,
    Tarif_tarifTyp                                 VARCHAR(45),
    Tarif_Buchungsklasse_buchungsklasseID          VARCHAR(45),
    Tarif_Buchungsklasse_Flugzeugtyp_idFlugzeugTyp VARCHAR(45),
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
        FOREIGN KEY (Tarif_Buchungsklasse_buchungsklasseID)
            REFERENCES Buchungsklasse (buchungsklasse),
    CONSTRAINT fk_Buchung_flugzeugTyp
        FOREIGN KEY (Tarif_Buchungsklasse_Flugzeugtyp_idFlugzeugTyp)
            REFERENCES FlugzeugTyp (flugzeugTyp),
    PRIMARY KEY (Kunde, Flug_flugDatum, Flug_Flugverbindung_flugNummer)
);


/* ENDE Deklaration wie in Praktikum 1 */

/* Korrektur der Datenbank */

ALTER TABLE Flughafen
    ADD Flughafen_flughafenKennung_Nachbarflughafen VARCHAR(3),
    ADD CONSTRAINT fk_Flughafen_Nachbarflughafen
        FOREIGN KEY (Flughafen_flughafenKennung_Nachbarflughafen)
            REFERENCES Flughafen (flughafenKennung),
    ADD zeitzone                                    INT,
    ADD sicherheitsgebür                            DECIMAL(5, 2),
    ADD flughafenSteuer                             DECIMAL(5, 2);

ALTER TABLE Flugverbindung
    ADD Kerosinzuschlag DECIMAL(5, 2),
    ADD CONSTRAINT fk_Flugverbindung_startFlughafen
        FOREIGN KEY (startFlughafen)
            REFERENCES Flughafen (flughafenKennung),
    ADD CONSTRAINT fk_Flugverbindung_endFlughafen
        FOREIGN KEY (endFlughafen)
            REFERENCES Flughafen (flughafenKennung),
    DROP COLUMN startZeitZone,
    DROP COLUMN endZeitZone;

ALTER TABLE Tarif
    MODIFY COLUMN tarifFaktor FLOAT;

DROP TABLE Flughafen_has_Flugverbindung;

ALTER TABLE Maschine
    MODIFY COLUMN kennzeichen VARCHAR(45),
    DROP COLUMN ausstattungsMerkmale;

ALTER TABLE Buchungsklasse
    ADD Preis DECIMAL(5, 2);

DROP TABLE kosten;

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
    PRIMARY KEY (Maschine_kennzeichen, Merkmal_merkmalID),
    FOREIGN KEY (Maschine_kennzeichen) REFERENCES Maschine (kennzeichen),
    FOREIGN KEY (Merkmal_merkmalID) REFERENCES Merkmal (merkmalID)
);

/* ENDE Korrektur der Datenbank */

/* Dateneingabe */

INSERT INTO Flughafen
VALUES ('NUE', null, null, +1, 20, 30),
       ('MUC', null, 'NUE', +1, 25, 30),
       ('STR', null, null, +1, 20, 30),
       ('FRA', null, 'STR', +1, 20, 30),
       ('TXL', null, null, +1, 20, 30),
       ('CDG', null, null, +1, 25, 35),
       ('LHR', null, null, 0, 30, 40),
       ('LCY', null, 'LHR', +1, 20, 30),
       ('SFO', null, null, -8, 50, 30);

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
VALUES ('Economy', 190, 'A321', 210),

       ('Economy', 238, 'A340-600', 240),
       ('Business', 60, 'A340-600', 490),
       ('First', 8, 'A340-600', 700),

       ('Economy', 238, '747-400', 350),
       ('Business', 60, '747-400', 690),
       ('First', 8, '747-400', 810),

       ('Economy', 190, '737-300', 127),

       ('Economy', 190, 'CRJ900', 86);

INSERT INTO Flugverbindung
VALUES (925, 'NUE', 'FRA', TIME('09:40'), TIME('10:30'), NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 10.00),
       (926, 'FRA', 'NUE', TIME('12:00'), TIME('13:10'), NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 10.00),
       (929, 'NUE', 'FRA', TIME('09:40'), TIME('10:30'), NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 10.00),
       (310, 'NUE', 'TXL', TIME('06:45'), TIME('08:00'), NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 10.00),
       (312, 'NUE', 'TXL', TIME('09:15'), TIME('10:30'), NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 10.00),
       (4756, 'MUC', 'LHR', TIME('13:05'), TIME('14:05'), NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 20.00),
       (9488, 'MUC', 'LCY', TIME('16:00'), TIME('17:20'), NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 20.00),
       (4210, 'MUC', 'CDG', TIME('16:00'), TIME('17:20'), NULL, NULL, 1, 0, 1, 0, 1, 0, 0, 20.00),
       (5210, 'CDG', 'SFO', TIME('17:50'), TIME('21:00'), NULL, NULL, 1, 0, 1, 0, 1, 0, 0, 40.00),
       (4711, 'MUC', 'SFO', TIME('10:00'), TIME('13:50'), NULL, NULL, 0, 1, 0, 1, 0, 0, 0, 40.00);

INSERT INTO Tarif
VALUES ('Normaltarif', 1.00, 'Economy', 925),
       ('Normaltarif', 1.00, 'Economy', 926),
       ('Normaltarif', 1.00, 'Economy', 929),
       ('Frühbucher', 0.736842105, 'Economy', 925),
       ('Frühbucher', 0.736842105, 'Economy', 926),
       ('Frühbucher', 0.736842105, 'Economy', 929),
       ('Last Minute', 0.526315789, 'Economy', 925),
       ('Last Minute', 0.526315789, 'Economy', 926),
       ('Last Minute', 0.526315789, 'Economy', 929),
       ('Normaltarif', 1.00, 'Economy', 310),
       ('Normaltarif', 1.00, 'Economy', 312),
       ('Frühbucher', 0.785714286, 'Economy', 310),
       ('Frühbucher', 0.785714286, 'Economy', 312),
       ('Last Minute', 0.571428571, 'Economy', 310),
       ('Last Minute', 0.571428571, 'Economy', 312),

       ('Normaltarif', 1.00, 'Economy', 4756),
       ('Normaltarif', 1.00, 'Business', 4756),
       ('Normaltarif', 1.00, 'First', 4756),
       ('Frühbucher', 0.875, 'Economy', 4756),
       ('Frühbucher', 0.829787234, 'Business', 4756),
       ('Frühbucher', 0.855072463, 'First', 4756),
       ('Last Minute', 0.666666666, 'Economy', 4756),

       ('Normaltarif', 1.00, 'Economy', 4210),
       ('Normaltarif', 1.00, 'Business', 4210),
       ('Normaltarif', 1.00, 'First', 4210),
       ('Frühbucher', 0.875, 'Economy', 4210),
       ('Frühbucher', 0.81632953, 'Business', 4210),
       ('Frühbucher', 0.857142857, 'First', 4210),
       ('Last Minute', 0.666666666, 'Economy', 4210),

       ('Normaltarif', 1.00, 'Economy', 5210),
       ('Normaltarif', 1.00, 'Business', 5210),
       ('Normaltarif', 1.00, 'First', 5210),
       ('Frühbucher', 0.857142857, 'Economy', 5210),
       ('Frühbucher', 0.913043478, 'Business', 5210),
       ('Frühbucher', 0.882352941, 'First', 5210),
       ('Last Minute', 0.828571429, 'Economy', 5210),

       ('Normaltarif', 1.00, 'Economy', 4711),
       ('Normaltarif', 1.00, 'Business', 4711),
       ('Normaltarif', 1.00, 'First', 4711),
       ('Frühbucher', 0.885245902, 'Economy', 4711),
       ('Frühbucher', 0.847619048, 'Business', 4711),
       ('Frühbucher', 0.824175824, 'First', 4711),
       ('Last Minute', 0.786885246, 'Economy', 4711),
       ('Last Minute', 0.904761905, 'Business', 4711),

       ('Normaltarif', 1.00, 'Economy', 9488),
       ('Frühbucher', 0.875, 'Economy', 9488),
       ('Last Minute', 0.666666666, 'Economy', 9488);



/* AUFGABE 3 =========================================================================================================*/

/* Korrektur der Datenbank-----------------------------------------------*/

#Flughafenbezeichner Hinzufügen
ALTER TABLE Flughafen
    ADD beschreibung VARCHAR(45);

UPDATE Flughafen
SET beschreibung = 'Stuttgart'
WHERE flughafenKennung LIKE 'STR' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'Frankfurt'
WHERE flughafenKennung LIKE 'FRA' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'London-Heathrow'
WHERE flughafenKennung LIKE 'LHR' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'Berlin-Tegel'
WHERE flughafenKennung LIKE 'TXL' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'München'
WHERE flughafenKennung LIKE 'MUC' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'Paris-Charles De Gaulle'
WHERE flughafenKennung LIKE 'CDG' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'London-City'
WHERE flughafenKennung LIKE 'LCY' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'San Francisco'
WHERE flughafenKennung LIKE 'SFO' ESCAPE '#';

UPDATE Flughafen
SET beschreibung = 'Nürnberg'
WHERE flughafenKennung LIKE 'NUE' ESCAPE '#';

#Flugzeugtypen zu Flugverbindung hinzufügen
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = 'A340-600'
WHERE t.flugNummer = 312;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = '747-400'
WHERE t.flugNummer = 929;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = 'A321'
WHERE t.flugNummer = 926;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = 'A321'
WHERE t.flugNummer = 925;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = 'CRJ900'
WHERE t.flugNummer = 310;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = '737-300'
WHERE t.flugNummer = 9488;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = '737-300'
WHERE t.flugNummer = 5210;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = '747-400'
WHERE t.flugNummer = 4210;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = '747-400'
WHERE t.flugNummer = 4711;
UPDATE wwfmaba.Flugverbindung t
SET t.FlugzeugTyp_idFlugzeugTyp = '737-300'
WHERE t.flugNummer = 4756;

#Satelitentelefon einer Maschiene Geben
INSERT INTO Merkmal (merkmalID, bezeichner)
VALUES (1, 'Satellitentelefon');
INSERT INTO Maschine_has_Merkmal (Maschine_kennzeichen, Merkmal_merkmalID)
VALUES ('D-ABYZ', 1);

#Eine Maschiene definieren die zw 5-10Jahren alt ist
UPDATE wwfmaba.Maschine t
SET t.datumInbetriebnahme = '2015-04-20'
WHERE t.kennzeichen LIKE 'D-ABYZ' ESCAPE '#';

Alter TABLE Tarif
    ADD preis DECIMAL(5, 2);

# UPDATE Tarif
#     LEFT JOIN Buchungsklasse B on Tarif.Buchungsklasse_idBuchungsklasse = B.buchungsklasse
#     SET Tarif.preis = tarifFaktor * B.Preis
#     WHERE Tarif.preis IS NULL;

/* ENDE Korrektur der Datenbank------------------------------------------*/

/* Bearbeitung der Aufgaben----------------------------------------------*/

#TEILAUFGABE (1)
SELECT flughafenKennung, beschreibung, zeitzone
FROM Flughafen
ORDER BY beschreibung;

#TEILAUFGABE (2)
SELECT kennzeichen
FROM Maschine,
     FlugzeugTyp
WHERE NOT hersteller = 'Boeing'
  AND flugzeugTyp = FlugzeugTyp_idFlugzeugTyp;

#TEILAUFGABE (3)
SELECT hersteller, flugzeugTyp, kennzeichen
FROM FlugzeugTyp t
         INNER JOIN Maschine ma ON t.flugzeugTyp = ma.FlugzeugTyp_idFlugzeugTyp
         INNER JOIN Maschine_has_Merkmal h ON ma.kennzeichen = h.Maschine_kennzeichen
         INNER JOIN Merkmal me ON h.Merkmal_merkmalID = me.merkmalID
ORDER BY hersteller, flugzeugTyp, kennzeichen;

#TEILAUFGABE (4)
SELECT COUNT(kennzeichen) AS Satellitentelefone
FROM FlugzeugTyp t
         INNER JOIN Maschine ma ON t.flugzeugTyp = ma.FlugzeugTyp_idFlugzeugTyp
         INNER JOIN Maschine_has_Merkmal h ON ma.kennzeichen = h.Maschine_kennzeichen
         INNER JOIN Merkmal me ON h.Merkmal_merkmalID = me.merkmalID
WHERE bezeichner = 'Satellitentelefon';

#TEILAUFGABE (5)
SELECT hersteller, COUNT(kennzeichen) AS Anzahl
FROM FlugzeugTyp t
         INNER JOIN Maschine ma ON t.flugzeugTyp = ma.FlugzeugTyp_idFlugzeugTyp
GROUP BY hersteller
ORDER BY hersteller;

#TEILAUFGABE (6)
SELECT hersteller, flugzeugTyp
FROM FlugzeugTyp
         LEFT JOIN Flugverbindung F on FlugzeugTyp.flugzeugTyp = F.FlugzeugTyp_idFlugzeugTyp
GROUP BY hersteller, flugzeugTyp
HAVING count(hersteller) = 1
order by hersteller, flugzeugTyp;

#TEILAUFGABE (7)
SELECT hersteller, flugzeugTyp, SUM(B.anzahl) AS Sitzplätze
FROM FlugzeugTyp f
         LEFT JOIN Buchungsklasse B on f.flugzeugTyp = B.FlugzeugTyp_idFlugzeugTyp
GROUP BY hersteller, flugzeugTyp
HAVING Sitzplätze > 150
ORDER BY hersteller, flugzeugTyp;

#TEILAUFGABE (8)
SELECT flugNummer, startFlughafen, endFlughafen, MIN(Preis) AS Mindestpreis
FROM Flugverbindung fv
         left JOIN FlugzeugTyp ft ON fv.FlugzeugTyp_idFlugzeugTyp = ft.flugzeugTyp
         left JOIN Buchungsklasse b ON ft.flugzeugTyp = b.FlugzeugTyp_idFlugzeugTyp
GROUP BY flugNummer, startFlughafen, endFlughafen
# 	HAVING MIN(Preis) > 250
ORDER BY startFlughafen, endFlughafen, flugNummer, Mindestpreis;


#TEILAUFGABE (9)
SELECT hersteller, flugzeugTyp, kennzeichen
FROM Maschine
         LEFT JOIN FlugzeugTyp FT on FT.flugzeugTyp = Maschine.FlugzeugTyp_idFlugzeugTyp
WHERE YEAR(CURDATE()) - YEAR(datumInbetriebnahme) >= 5
  AND YEAR(CURDATE()) - YEAR(datumInbetriebnahme) <= 10
ORDER BY kennzeichen;


#TEILAUFGABE (10)
SELECT flughafenKennung, beschreibung, SUM(sicherheitsgebür + flughafenSteuer) AS Zusatzkosten
FROM Flughafen
WHERE sicherheitsgebür + flughafenSteuer =
      (SELECT MIN(sicherheitsgebür) FROM Flughafen) +
      (SELECT MIN(flughafenSteuer) FROM Flughafen)
GROUP BY flughafenKennung;

#TEILAUFGABE (11)
SELECT hersteller, flugzeugTyp, kennzeichen
FROM Maschine M
         LEFT JOIN FlugzeugTyp FT on FT.flugzeugTyp = M.FlugzeugTyp_idFlugzeugTyp
         LEFT JOIN Maschine_has_Merkmal MhM on M.kennzeichen = MhM.Maschine_kennzeichen
WHERE MhM.Maschine_kennzeichen IS NULL
GROUP BY hersteller, flugzeugTyp, kennzeichen;


#TEILAUFGABE (12)
SELECT flugNummer,
       SUM(FHS.flughafenSteuer + FHS.sicherheitsgebür + FV.Kerosinzuschlag +
           T.tarifFaktor * B.Preis) AS Gesamtpreis,
       buchungsklasse,
       tarifTyp
FROM Flugverbindung FV
         LEFT JOIN Flughafen FHS ON FV.startFlughafen = FHS.flughafenKennung
         LEFT JOIN Flughafen FHE ON FV.startFlughafen = FHE.flughafenKennung
         LEFT JOIN Tarif T ON FV.flugNummer = T.FlugVerbindung_flugNummer
         LEFT JOIN Buchungsklasse B on T.Buchungsklasse_idBuchungsklasse = B.buchungsklasse
WHERE (FHS.beschreibung = 'Frankfurt' OR FHS.beschreibung = 'München')
  AND B.buchungsklasse = 'Economy'
  AND T.tarifTyp = 'Normaltarif'
GROUP BY flugNummer, buchungsklasse, tarifTyp;



#TEILAUFGABE (13)
/*
Sämtliche Flughäfen mit der Anzahl der dort beginnenden und der Anzahl der dort en-
denden Flugverbindungen, geordnet nach Flughafen-Kürzel (Achtung: Die Zahl 0 muss
auch als „0“ angezeigt werden und nicht als „NULL“).
*/
SELECT flughafenKennung, COUNT(fStart.startFlughafen) AS Abflug, COUNT(fEnd.endFlughafen) AS Ankunft
FROM Flughafen f
         LEFT JOIN Flugverbindung fStart ON fStart.startFlughafen = f.flughafenKennung
         LEFT JOIN Flugverbindung fEnd ON fEnd.endFlughafen = f.flughafenKennung
GROUP BY flughafenKennung;

#TEILAUFGABE (14)
/*
Hersteller, Modell und Kennzeichen der Maschine(-n) mit den wenigsten noch verblei-
benden Betriebsstunden bis zur maximal zulässigen Zahl von Betriebsstunden des zu-
gehörigen Flugzeugtyps.
*/
SELECT hersteller, flugzeugTyp, kennzeichen
FROM Maschine
         LEFT JOIN FlugzeugTyp FT on Maschine.FlugzeugTyp_idFlugzeugTyp = FT.flugzeugTyp
WHERE maxFlugstunden - betriebsStunden =
      (SELECT MIN(maxFlugstunden - betriebsStunden)
       FROM Maschine
                LEFT JOIN FlugzeugTyp FT on Maschine.FlugzeugTyp_idFlugzeugTyp = FT.flugzeugTyp);

#TEILAUFGABE (15)
/*
Die günstigsten reinen Flugkosten (ohne Steuern, Gebühren und Zuschläge) zwischen
allen Paaren von Flughäfen mit mindestens einer Direktverbindung (Spalten: von, nach,
günstigster Preis; von bzw. nach sind die Bezeichnung der Flughäfen, nicht die Kürzel),
sortiert zunächst nach von (Bezeichnung), nach (Bezeichnung).
*/
SELECT FHS.beschreibung AS von, FHE.beschreibung AS nach, Preis, f.FlugzeugTyp_idFlugzeugTyp
FROM Flugverbindung f
         LEFT JOIN Buchungsklasse B on f.FlugzeugTyp_idFlugzeugTyp = B.FlugzeugTyp_idFlugzeugTyp
         LEFT JOIN Flughafen FHS ON f.startFlughafen = FHS.flughafenKennung
         LEFT JOIN Flughafen FHE ON f.endFlughafen = FHE.flughafenKennung
WHERE Preis = (SELECT MIN(Preis)
               FROM Flugverbindung
                        LEFT JOIN Buchungsklasse B
                                  on Flugverbindung.FlugzeugTyp_idFlugzeugTyp = B.FlugzeugTyp_idFlugzeugTyp)
GROUP BY startFlughafen, endFlughafen, Preis, f.FlugzeugTyp_idFlugzeugTyp;

#TEILAUFGABE (16)
/*
Die Gesamtflugzeit für jede Flugverbindung mit Flugnummer [a], Bezeichnung Abflug-
flughafen [b], Bezeichnung Ankunftsflughafen [c], Dauer (in Stunden : Minuten : Sekun-
den) [d] geordnet nach b, c (Achtung: Zeitzone ist zu beachten!); recherchieren Sie bzgl.
Berechnungsmethoden und hilfreichen Funktionen des MySQL-Servers im Internet.
*/
SELECT flugNummer,
       FHS.beschreibung                                               AS StartFlughafen,
       FHE.beschreibung                                               AS EndFlughafen,
       TIMEDIFF(DATE_ADD(endZeit, INTERVAL FHE.Zeitzone * -1 HOUR),
                DATE_ADD(startZeit, INTERVAL FHS.Zeitzone * -1 HOUR)) AS Dauer
FROM Flugverbindung f
         LEFT JOIN Flughafen FHS ON f.startFlughafen = FHS.flughafenKennung
         LEFT JOIN Flughafen FHE ON f.endFlughafen = FHE.flughafenKennung
ORDER BY startFlughafen, endFlughafen;


#TEILAUFGABE (17)
/*
Alle Flugverbindungen mit Abflug- und Ankunftszeit von München nach entweder Lon-
don-City oder einem dazu benachbarten Flughafen mit Flugnummer [a], Bezeichnung
Abflugflughafen [b], Bezeichnung Ankunftsflughafen [c], Abflugzeit [d] und Ankunftszeit [e].
*/
SELECT Flugnummer, FHS.beschreibung as Startflughafen, FHE.beschreibung as Zielflughafen, F.startZeit, F.endZeit
FROM Flugverbindung F
         LEFT JOIN Flughafen FHS ON F.startFlughafen = FHS.flughafenKennung
         LEFT JOIN Flughafen FHE ON F.endFlughafen = FHE.flughafenKennung
WHERE FHS.beschreibung = 'München'
  AND (FHE.beschreibung = 'London-City'
    OR (FHE.flughafenKennung IN (
        SELECT FH.Flughafen_flughafenKennung_Nachbarflughafen
        FROM Flughafen FH
        WHERE FH.beschreibung = 'London-City')
           )
    );

#TEILAUFGABE (18)
/*
Alle Reisemöglichkeiten von München nach San Francisco mit höchstens einmaligem
Umsteigen. Eine Abfrage muss Direktflüge und Flüge mit Zwischenstopp gemäß nach-
folgender Tabelle anzeigen. Die Spalten „Abflug“ und „Ankunft“ beinhalten die zugehöri-
gen Ankunfts- bzw. Abflugzeiten (Tipp: Über den SQL-Befehl „UNION“ können Sie die
Ergebnisse von zwei SELECT-Befehlen in einer Tabelle zusammenfasse
*/
SELECT FV1.Flugnummer    AS Flugnummer1,
       FHS1.beschreibung as von,
       FV1.startZeit     as Abflug,
       null              as nach_Zwischenstopp,
       null              as Ankunft_Zwischenstopp,
       null              AS Flugnummer2,
       null              as von_Zwischenstopp,
       null              as Abflug_Zwischenstopp,
       FHE1.beschreibung as nach,
       FV1.endZeit       as Ankunft
FROM Flugverbindung FV1
         LEFT JOIN Flughafen FHS1 ON FV1.startFlughafen = FHS1.flughafenKennung
         LEFT JOIN Flughafen FHE1 ON FV1.endFlughafen = FHE1.flughafenKennung
WHERE FHS1.beschreibung = 'München'
  AND FHE1.beschreibung = 'San Francisco'
UNION
SELECT FV1.Flugnummer    AS Flugnummer1,
       FHS1.beschreibung as von,
       FV1.startZeit     as Abflug,
       FHE1.beschreibung as nach_Zwischenstopp,
       FV1.endZeit       as Ankunft_Zwischenstopp,
       FV2.Flugnummer    AS Flugnummer2,
       FHS2.beschreibung as von_Zwischenstopp,
       FV2.startZeit     as Abflug_Zwischenstopp,
       FHE2.beschreibung as nach,
       FV2.endZeit       as Ankunft
FROM Flugverbindung FV1
         INNER JOIN Flugverbindung FV2 ON FV1.endFlughafen = FV2.startFlughafen
         LEFT JOIN Flughafen FHS1 ON FV1.startFlughafen = FHS1.flughafenKennung
         LEFT JOIN Flughafen FHE1 ON FV1.endFlughafen = FHE1.flughafenKennung
         LEFT JOIN Flughafen FHS2 ON FV2.startFlughafen = FHS2.flughafenKennung
         LEFT JOIN Flughafen FHE2 ON FV2.endFlughafen = FHE2.flughafenKennung
WHERE FHS1.beschreibung = 'München'
  AND FHE2.beschreibung = 'San Francisco';


/* ENDE Bearbeitung der Aufgaben ----------------------------------------*/


/* BEGINN Bearbeitung der Aufgaben 4 ------------------------------------*/

#TEILAUFGABE (01)
CREATE TRIGGER loesche_maschine
    AFTER UPDATE
    ON Maschine
    FOR EACH ROW
    DELETE FROM Maschine_has_Merkmal MhM
        WHERE MhM.Maschine_kennzeichen = OLD.kennzeichen;


#TEILAUFGABE (02)
CREATE TRIGGER erzeuge_flug_p_maschienentyp
    AFTER UPDATE
    ON Flug
    FOR EACH ROW
        IF NOT (SELECT FlugzeugTyp_idFlugzeugTyp
                FROM Maschine M
                WHERE M.kennzeichen = NEW.Maschine_kennzeichen)
            = (SELECT FlugzeugTyp_idFlugzeugTyp
                FROM Flugverbindung F
                WHERE F.flugNummer = NEW.FlugVerbindung_flugNummer)
        THEN
            SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Falsche Maschiene';
        END IF;


#TEILAUFGABE (03)
# CREATE TRIGGER erzeuge_flug_z_plaetze
#     AFTER INSERT
#     ON Flug
#     FOR EACH ROW
#     UPDATE Flug
#         SET NEW.-freie plätze- =


#TEILAUFGABE (04)
CREATE PROCEDURE gebe_verbindungen(
    IN startFlughafen VARCHAR(3),
    IN zielFlughafen VARCHAR(3),
    IN flugdatum DATE
)
BEGIN
    SELECT flugNummer, startZeit, endZeit
        FROM Flug F
            LEFT JOIN Flugverbindung FV on FV.flugNummer = F.FlugVerbindung_flugNummer
    WHERE FV.startFlughafen = startFlughafen
        AND FV.endFlughafen = zielFlughafen
        AND F.flugDatum = flugDatum;
END;


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





