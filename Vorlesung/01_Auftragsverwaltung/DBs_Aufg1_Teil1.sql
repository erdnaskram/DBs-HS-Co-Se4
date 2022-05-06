#DBs_Aufg1_Teil1

#01. Vorname und Name aller Kunden
SELECT vorname, name
    FROM kunde
    GROUP BY name, vorname;

#02. Vorname, Name und Ort aller Kunden aus Hannover
SELECT vorname, name, ort
    FROM kunde
    WHERE ort ='Hannover';

#03. PLZ und Ort aller Kunden, nach PLZ absteigend sortiert
SELECT plz, ort
    FROM kunde
    ORDER BY plz;

#04. Wie (3), jedoch ohne doppelte Zeilen
SELECT DISTINCT plz, ort
    FROM kunde
    ORDER BY plz;

#05. Gesamtzahl aller Kunden
SELECT COUNT(*)
    FROM kunde;

#06. Zu allen Kunden den Namen ausgeben, wobei die zugehörige Spalte der Ergebnis-
#       Tabelle „Nachname“ heißen soll
SELECT name AS Nachname
    FROM kunde;

#07. Name, Vorname, PLZ und Ort aller Kunden, die in Hannover oder Hamburg wohnen
SELECT name, vorname, plz, ort
    FROM kunde
    WHERE ort = 'Hannover' OR ort = 'Hamburg'
    ORDER BY ort, plz, name, vorname;

#08. Wie (7) für alle Kunden, deren PLZ mit 50 beginnt

#09. Alle verfügbaren Daten zu allen Mitarbeitern, deren Gehalt über 3.000 Euro liegt
SELECT *
    FROM mitarbeiter
        LEFT JOIN abteilung a on a.abteilungsnr = mitarbeiter.abteilung
    WHERE gehalt > 3000;




