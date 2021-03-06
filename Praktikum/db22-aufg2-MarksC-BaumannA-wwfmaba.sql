    #Christoph Marks und Antonia Baumann, 28.04.2022
    DROP DATABASE IF EXISTS wwfmaba;

    #Datenbank erstellen
    CREATE DATABASE IF NOT EXISTS wwfmaba
        CHARACTER SET = latin1;

    USE wwfmaba;


    CREATE TABLE FlugzeugTyp (
                                 flugzeugTyp VARCHAR(45) NOT NULL,
                                 hersteller VARCHAR(45) NOT NULL,
                                 maxFlugstunden FLOAT NOT NULL,
                                 PRIMARY KEY (flugzeugTyp)
    );

    CREATE TABLE Maschine (
                              kennzeichen INT,
                              datumInbetriebnahme DATE,
                              betriebsStunden INT,
                              betriebsStundenNachLetzterWartung INT,
                              datumLetzteWartung DATE,
                              ausstattungsMerkmale JSON,
                              FlugzeugTyp_idFlugzeugTyp VARCHAR(45),
                              CONSTRAINT fk_Maschine_idFlugzeugTyp
                                  FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
                                      REFERENCES FlugzeugTyp(flugzeugTyp),
                              PRIMARY KEY (kennzeichen)
    );

    CREATE TABLE Buchungsklasse (
                                    buchungsklasse VARCHAR(45),
                                    anzahl INT,
                                    FlugzeugTyp_idFlugzeugTyp VARCHAR(45),
                                    CONSTRAINT fk_Buchungsklasse_idFlugzeugTyp
                                        FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
                                            REFERENCES FlugzeugTyp(flugzeugTyp),
                                    PRIMARY KEY (buchungsklasse, FlugzeugTyp_idFlugzeugTyp)
    );


    CREATE TABLE Flugverbindung (
                                    flugNummer INT,
                                    startFlughafen VARCHAR(45),
                                    endFlughafen VARCHAR(45),
                                    startZeit DATETIME,
                                    endZeit DATETIME,
                                    startZeitZone INT,
                                    endZeitZone INT,
                                    l??ngeStrecke FLOAT,
                                    FlugzeugTyp_idFlugzeugTyp VARCHAR(45),
                                    flugTagMontag TINYINT,
                                    flugTagDienstag TINYINT,
                                    flugTagMittwoch TINYINT,
                                    flugTagDonnerstag TINYINT,
                                    flugTagFreitag TINYINT,
                                    flugTagSamstag TINYINT,
                                    flugTagSonntag TINYINT,
                                    CONSTRAINT fk_Flugverbindung_idFlugzeugTyp
                                        FOREIGN KEY (FlugzeugTyp_idFlugzeugTyp)
                                            REFERENCES FlugzeugTyp(flugzeugTyp),
                                    PRIMARY KEY (flugNummer)
    );

    CREATE TABLE Tarif (
                           tarifTyp VARCHAR(45),
                           tarifFaktor INT,
                           Buchungsklasse_idBuchungsklasse VARCHAR(45),
                           FlugVerbindung_flugNummer INT,
                           CONSTRAINT fk_Tarif_flugNummer
                               FOREIGN KEY (FlugVerbindung_flugNummer)
                                   REFERENCES Flugverbindung(flugNummer),
                           CONSTRAINT fk_Tarif_idBuchungsklasse
                               FOREIGN KEY (Buchungsklasse_idBuchungsklasse)
                                   REFERENCES Buchungsklasse(buchungsklasse),
                           CONSTRAINT PK_Tarif
                               PRIMARY KEY (tarifTyp, Buchungsklasse_idBuchungsklasse, FlugVerbindung_flugNummer)
    );

    CREATE TABLE Flughafen(
                              flughafenKennung VARCHAR(3),
                              flughafenAdresse VARCHAR(45),
                              PRIMARY KEY (flughafenKennung)
    );

    CREATE TABLE Flughafen_has_Flugverbindung(
                                                 Flughafen_flughafenKennung VARCHAR(45),
                                                 Flugverbindung_flugNummer INT,
                                                 CONSTRAINT fk_FhF_flughafenKennung
                                                     FOREIGN KEY (Flughafen_flughafenKennung)
                                                         REFERENCES Flughafen(flughafenKennung),
                                                 CONSTRAINT fk_FhF_flugNummer
                                                     FOREIGN KEY (Flugverbindung_flugNummer)
                                                         REFERENCES Flugverbindung(flugNummer),
                                                 PRIMARY KEY (Flughafen_flughafenKennung, Flugverbindung_flugNummer)
    );

    CREATE TABLE Flug (
                          flugDatum DATE,
                          FlugVerbindung_flugNummer INT,
                          Maschine_kennzeichen INT,
                          Kosten_idKosten INT,
                          CONSTRAINT fk_Flug_flugNummer
                              FOREIGN KEY (FlugVerbindung_flugNummer)
                                  REFERENCES Flugverbindung(flugNummer),
                          PRIMARY KEY (flugDatum, FlugVerbindung_flugNummer)
    );

    CREATE TABLE Kosten (
                            idKosten INT NOT NULL,
                            flugKosten FLOAT,
                            flughafenSteuer FLOAT,
                            sicherheitsGeb??hrenAbflug FLOAT,
                            kerosinZuschlag FLOAT,
                            PRIMARY KEY (idKosten)
    );

    CREATE TABLE Buchung (
                             Kunde VARCHAR(45),
                             platzNR INT,
                             Flug_flugDatum DATE,
                             Flug_Flugverbindung_flugNummer INT,
                             Tarif_tarifTyp VARCHAR(45),
                             Tarif_Buchungsklasse_buchungsklasseID VARCHAR(45),
                             Tarif_Buchungsklasse_Flugzeugtyp_idFlugzeugTyp VARCHAR(45),
                             CONSTRAINT fk_Buchung_flugDatum
                                 FOREIGN KEY (Flug_flugDatum)
                                     REFERENCES Flug(flugDatum),
                             CONSTRAINT fk_Buchung_flugNummer
                                 FOREIGN KEY (Flug_Flugverbindung_flugNummer)
                                     REFERENCES Flugverbindung(flugNummer),
                             CONSTRAINT fk_Buchung_tarifTyp
                                 FOREIGN KEY (Tarif_tarifTyp)
                                     REFERENCES Tarif(tarifTyp),
                             CONSTRAINT fk_Buchung_buchungsklasse
                                 FOREIGN KEY (Tarif_Buchungsklasse_buchungsklasseID)
                                     REFERENCES Buchungsklasse(buchungsklasse),
                             CONSTRAINT fk_Buchung_flugzeugTyp
                                 FOREIGN KEY (Tarif_Buchungsklasse_Flugzeugtyp_idFlugzeugTyp)
                                     REFERENCES FlugzeugTyp(flugzeugTyp),
                             PRIMARY KEY (Kunde, Flug_flugDatum, Flug_Flugverbindung_flugNummer)
    );


    /* ENDE Deklaration wie in Praktikum 1 */

    /* Korrektur der Datenbank */

    ALTER TABLE Flughafen
        ADD Flughafen_flughafenKennung_Nachbarflughafen VARCHAR(3),
        ADD CONSTRAINT fk_Flughafen_Nachbarflughafen
            FOREIGN KEY (Flughafen_flughafenKennung_Nachbarflughafen)
            REFERENCES Flughafen(flughafenKennung),
        ADD zeitzone INT,
        ADD sicherheitsgeb??r DECIMAL(5,2),
        ADD flughafenSteuer DECIMAL(5,2);

    ALTER TABLE Flugverbindung
        ADD Kerosinzuschlag DECIMAL(5,2),
    DROP COLUMN startZeitZone,
        DROP COLUMN endZeitZone;

    ALTER TABLE Tarif
        MODIFY COLUMN tarifFaktor FLOAT;

    DROP TABLE Flughafen_has_Flugverbindung;

    ALTER TABLE Maschine
        MODIFY COLUMN kennzeichen VARCHAR(45),
    DROP COLUMN ausstattungsMerkmale;

    ALTER TABLE Buchungsklasse
        ADD Preis DECIMAL(5,2);

    DROP TABLE kosten;

    CREATE TABLE Merkmal (
                             merkmalID INT,
                             bezeichner VARCHAR(45),
                             PRIMARY KEY (merkmalID)
    );

    CREATE TABLE Maschine_has_Merkmal(
                                         Maschine_kennzeichen VARCHAR(45),
                                         Merkmal_merkmalID INT,
                                         PRIMARY KEY (Maschine_kennzeichen, Merkmal_merkmalID),
                                         FOREIGN KEY (Maschine_kennzeichen) REFERENCES Maschine(kennzeichen),
                                         FOREIGN KEY (Merkmal_merkmalID) REFERENCES Merkmal(merkmalID)
    );

    /* ENDE Korrektur der Datenbank */

    /* Dateneingabe */

    INSERT INTO Flughafen
    VALUES ("NUE", null, null, +1, 20, 30),
           ("MUC", null, "NUE", +1, 25, 30),
           ("STR", null, null, +1, 20, 30),
           ("FRA", null, "STR", +1, 20, 30),
           ("TXL", null, null, +1, 20, 30),
           ("CDG", null, null, +1, 25, 35),
           ("LHR", null, null, 0, 30, 40),
           ("LCY", null, "LHR", +1, 20, 30),
           ("SFO", null, null, -8, 50, 30);

    #Bestimmte Nachbarflugh??fen k??nnen erst im Nachhinein gesetzt werden da davor ihre Nachbarn als Flugh??fen in der Tabelle Flughafen existieren m??ssen
    UPDATE Flughafen SET Flughafen_flughafenKennung_Nachbarflughafen = "MUC" WHERE flughafenKennung = "NUE";
    UPDATE Flughafen SET Flughafen_flughafenKennung_Nachbarflughafen = "FRA" WHERE flughafenKennung = "STR";
    UPDATE Flughafen SET Flughafen_flughafenKennung_Nachbarflughafen = "LCY" WHERE flughafenKennung = "LHR";

    INSERT INTO FlugzeugTyp
    VALUES ("A321", "Airbus", 50000),
           ("A340-600", "Airbus", 60000),
           ("747-400", "Boeing", 50000),
           ("737-300", "Boeing", 45000),
           ("CRJ900", "Bombardier", 55000);

    INSERT INTO Maschine
    VALUES ("D-ABYZ", DATE ("09.04.2005"), 12345, 643, null, "A321"),
           ("D-CDUX", DATE ("09.04.2005"), 15223, 804, null, "A321"),
           ("D-BAXY", DATE ("27.03.2001"), 45632, 231, null, "A321"),
           ("D-EFST", DATE ("02.02.2007"), 4102, 998, null, "A340-600"),
           ("D-GHQR", DATE ("05.10.2009"), 2023, 654, null, "A340-600"),
           ("D-IKOP", DATE ("04.03.2002"), 45632, 821, null, "747-400"),
           ("D-BORD", DATE ("10.08.2003"), 9854, 678, null, "737-300"),
           ("D-LMNA", DATE ("08.03.2007"), 1432, 70, null, "CRJ900");

    INSERT INTO Buchungsklasse
        VALUES ("Economy", 190, "A321", 210),

               ("Economy", 238, "A340-600", 240),
               ("Business", 60, "A340-600", 490),
               ("First", 8, "A340-600", 700),

               ("Economy", 238, "747-400", 350),
               ("Business", 60, "747-400", 690),
               ("First", 8, "747-400", 810),

               ("Economy", 190, "737-300", 127),

               ("Economy", 190, "CRJ900", 86);

    INSERT INTO Flugverbindung
        VALUES  (925, "NUE","FRA", TIME ("09:40"),  TIME ("10:30"), NULL, NULL, 1,1,1,1,1,0,0, 10.00),
                (926, "FRA","NUE", TIME ("12:00"),  TIME ("13:10"), NULL, NULL, 1,1,1,1,1,0,0, 10.00),
                (929, "NUE","FRA", TIME ("09:40"),  TIME ("10:30"), NULL, NULL, 0,0,0,0,0,1,1, 10.00),
                (310, "NUE","TXL", TIME ("06:45"),  TIME ("08:00"), NULL, NULL, 1,1,1,1,1,0,0, 10.00),
                (312, "NUE","TXL", TIME ("09:15"),  TIME ("10:30"), NULL, NULL, 0,0,0,0,0,1,1, 10.00),
                (4756, "MUC","LHR", TIME ("13:05"),  TIME ("14:05"), NULL, NULL, 1,1,1,1,1,1,1, 20.00),
                (9488, "MUC","LCY", TIME ("16:00"),  TIME ("17:20"), NULL, NULL, 1,1,1,1,1,0,0, 20.00),
                (4210, "MUC","CDG", TIME ("16:00"),  TIME ("17:20"), NULL, NULL, 1,0,1,0,1,0,0, 20.00),
                (5210, "CDG","SFO", TIME ("17:50"),  TIME ("21:00"), NULL, NULL, 1,0,1,0,1,0,0, 40.00),
                (4711, "MUC","SFO", TIME ("10:00"),  TIME ("13:50"), NULL, NULL, 0,1,0,1,0,0,0, 40.00);

    INSERT INTO Tarif
        VALUES ("Normaltarif", 1.00, "Economy", 925),
               ("Normaltarif", 1.00, "Economy", 926),
               ("Normaltarif", 1.00, "Economy", 929),
               ("Fr??hbucher", 0.736842105, "Economy", 925),
               ("Fr??hbucher", 0.736842105, "Economy", 926),
               ("Fr??hbucher", 0.736842105, "Economy", 929),
               ("Last Minute", 0.526315789, "Economy", 925),
               ("Last Minute", 0.526315789, "Economy", 926),
               ("Last Minute", 0.526315789, "Economy", 929),
               ("Normaltarif", 1.00, "Economy", 310),
               ("Normaltarif", 1.00, "Economy", 312),
               ("Fr??hbucher", 0.785714286, "Economy", 310),
               ("Fr??hbucher", 0.785714286, "Economy", 312),
               ("Last Minute", 0.571428571, "Economy", 310),
               ("Last Minute",0.571428571, "Economy", 312),

               ("Normaltarif", 1.00, "Economy", 4756),
                ("Normaltarif", 1.00, "Business", 4756),
                ("Normaltarif", 1.00, "First", 4756),
               ("Fr??hbucher", 0.875, "Economy", 4756),
               ("Fr??hbucher", 0.829787234, "Business", 4756),
               ("Fr??hbucher", 0.855072463, "First", 4756),
               ("Last Minute", 0.666666666, "Economy", 4756),

               ("Normaltarif", 1.00, "Economy", 4210),
               ("Normaltarif", 1.00, "Business", 4210),
               ("Normaltarif", 1.00, "First", 4210),
               ("Fr??hbucher", 0.875, "Economy", 4210),
               ("Fr??hbucher", 0.81632953, "Business", 4210),
               ("Fr??hbucher", 0.857142857, "First", 4210),
               ("Last Minute", 0.666666666, "Economy", 4210),

               ("Normaltarif", 1.00, "Economy", 5210),
               ("Normaltarif", 1.00, "Business", 5210),
               ("Normaltarif", 1.00, "First", 5210),
               ("Fr??hbucher", 0.857142857, "Economy", 5210),
               ("Fr??hbucher", 0.913043478, "Business", 5210),
               ("Fr??hbucher", 0.882352941, "First", 5210),
               ("Last Minute", 0.828571429, "Economy", 5210),

               ("Normaltarif", 1.00, "Economy", 4711),
               ("Normaltarif", 1.00, "Business", 4711),
               ("Normaltarif", 1.00, "First", 4711),
               ("Fr??hbucher", 0.885245902, "Economy", 4711),
               ("Fr??hbucher", 0.847619048, "Business", 4711),
               ("Fr??hbucher", 0.824175824, "First", 4711),
               ("Last Minute", 0.786885246, "Economy", 4711),
               ("Last Minute", 0.904761905, "Business", 4711),

               ("Normaltarif", 1.00, "Economy", 9488),
               ("Fr??hbucher", 0.875, "Economy", 9488),
               ("Last Minute", 0.666666666, "Economy", 9488);





