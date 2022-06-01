#Aufgabe 5
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
CREATE FUNCTION aufgabe5(ID INT) RETURNS INT
BEGIN
    DECLARE minuten INT;
    SELECT MAX(TIMESTAMPDIFF(MINUTE, DATE_SUB(FV.Ankunftszeit, INTERVAL FH1.Zeitzone HOUR),
                             DATE_SUB(FV.Abflugzeit, INTERVAL FH.Zeitzone HOUR)) * (-1))
    INTO minuten
    FROM Flugverbindung FV
             LEFT JOIN Flughafen FH ON FV.Kürzel = FH.Kürzel
             LEFT JOIN Flughafen FH1 ON FV.Kürzel1 = FH1.Kürzel
    WHERE FV.VerbindungsID = ID;
    RETURN minuten;
END // DELIMITER ;















