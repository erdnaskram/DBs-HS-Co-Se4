DROP DATABASE IF EXISTS auftragsverwaltung;

CREATE DATABASE auftragsverwaltung
   CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE auftragsverwaltung;

CREATE TABLE abteilung(
	abteilungsnr int NOT NULL PRIMARY KEY,
	bezeichnung varchar(50) NULL
);

INSERT abteilung (abteilungsnr, bezeichnung) VALUES (1, 'Geschäftsführung');
INSERT abteilung (abteilungsnr, bezeichnung) VALUES (2, 'Support');
INSERT abteilung (abteilungsnr, bezeichnung) VALUES (3, 'Rechnungswese');
INSERT abteilung (abteilungsnr, bezeichnung) VALUES (4, 'Einkauf');
INSERT abteilung (abteilungsnr, bezeichnung) VALUES (5, 'Vertrieb');
INSERT abteilung (abteilungsnr, bezeichnung) VALUES (6, 'Verwaltung');
commit;

CREATE TABLE adresse(
	plz varchar(5) NOT NULL
);

INSERT adresse (plz) VALUES ('12345');
INSERT adresse (plz) VALUES ('99998');


CREATE TABLE artikel (
    artikelnr INT NOT NULL,
    bezeichnung VARCHAR(50) NULL,
    hersteller INT NULL,
    nettopreis DECIMAL(10 , 2 ) NULL,
    mwst INT NULL,
    bestand INT NULL,
    mindestbestand INT NULL,
    kategorie INT NULL,
    bestellvorschlag CHAR(1) NULL,
    PRIMARY KEY (artikelnr ASC)
);
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (1, '106075', 1, CAST(137.93 AS Decimal(10, 2)), 2, 100, 10, 1, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (2, '106055', 1, CAST(172.14 AS Decimal(10, 2)), 2, 100, 10, 1, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (3, '753S', 2, CAST(111.21 AS Decimal(10, 2)), 2, 100, 10, 1, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (4, '757P', 2, CAST(145.69 AS Decimal(10, 2)), 2, 100, 10, 1, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (5, '1200NF', 2, CAST(602.59 AS Decimal(10, 2)), 2, 100, 10, 1, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (6, 'CanoScan LidE 20', 7, CAST(47.41 AS Decimal(10, 2)), 2, 100, 10, 2, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (7, 'CanoScan 5000F', 7, CAST(132.76 AS Decimal(10, 2)), 2, 100, 10, 2, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (8, 'Perfection1670', 8, CAST(81.03 AS Decimal(10, 2)), 2, 100, 10, 2, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (9, 'ScanJet 2400', 4, CAST(63.79 AS Decimal(10, 2)), 2, 100, 10, 2, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (10, 'ScanJet 8290', 4, CAST(1507.76 AS Decimal(10, 2)), 2, 100, 10, 2, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (11, 'Millenium G450', 5, CAST(81.03 AS Decimal(10, 2)), 2, 100, 10, 3, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (12, 'Millenium G550', 5, CAST(85.34 AS Decimal(10, 2)), 2, 100, 10, 3, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (13, 'Millenium G650', 5, CAST(137.07 AS Decimal(10, 2)), 2, 100, 10, 3, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (14, 'Millenium P750', 5, CAST(197.41 AS Decimal(10, 2)), 2, 5, 10, 3, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (15, 'Parhelia 512', 5, CAST(309.48 AS Decimal(10, 2)), 2, 100, 10, 3, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (16, 'SV0802', 2, CAST(55.17 AS Decimal(10, 2)), 2, 100, 10, 4, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (17, 'SP0802', 2, CAST(63.79 AS Decimal(10, 2)), 2, 100, 10, 4, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (18, 'SV1203', 2, CAST(72.41 AS Decimal(10, 2)), 2, 100, 10, 4, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (19, 'SP1604', 2, CAST(93.97 AS Decimal(10, 2)), 2, 100, 10, 4, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (20, 'MHT2060AH', 9, CAST(197.41 AS Decimal(10, 2)), 2, 100, 10, 4, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (21, 'Aureon 5.1 Fu', 6, CAST(33.62 AS Decimal(10, 2)), 2, 100, 10, 5, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (22, 'Aureon 5.1 Fun Games', 6, CAST(42.24 AS Decimal(10, 2)), 2, 100, 10, 5, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (23, 'Aureon 5.1 Sky', 6, CAST(68.10 AS Decimal(10, 2)), 2, 100, 10, 5, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (24, 'Aureon 5.1 USB', 6, CAST(85.34 AS Decimal(10, 2)), 2, 100, 10, 5, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (25, 'Aureon 5.1 Universe', 6, CAST(206.03 AS Decimal(10, 2)), 2, 100, 10, 5, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (26, 'Internet Keyboard', 10, CAST(17.23 AS Decimal(10, 2)), 2, 100, 10, 6, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (27, 'Office Keyboard', 10, CAST(25.85 AS Decimal(10, 2)), 2, 100, 10, 6, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (28, 'Natural MultiMedia', 10, CAST(23.28 AS Decimal(10, 2)), 2, 100, 10, 6, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (29, 'MultiMedia Keyboard refresh', 10, CAST(27.59 AS Decimal(10, 2)), 2, 100, 10, 6, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (30, 'WL Optical Desctop for Bluetooth', 10, CAST(128.45 AS Decimal(10, 2)), 2, 100, 10, 6, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (31, 'DeskJet 3520', 4, CAST(33.62 AS Decimal(10, 2)), 2, 100, 10, 7, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (32, 'OfficeJet 7140xi', 4, CAST(539.97 AS Decimal(10, 2)), 2, 100, 10, 7, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (33, 'LaserJet 1150', 4, CAST(240.51 AS Decimal(10, 2)), 2, 100, 10, 7, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (34, 'i250', 7, CAST(46.55 AS Decimal(10, 2)), 2, 100, 10, 7, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (35, 'BJC-5500', 7, CAST(645.69 AS Decimal(10, 2)), 2, 100, 10, 7, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (36, 'Stylus C44 Plus', 8, CAST(46.55 AS Decimal(10, 2)), 2, 100, 10, 7, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (37, 'Stylus Photo R300', 8, CAST(150.00 AS Decimal(10, 2)), 2, 100, 10, 7, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (38, 'Basic Optical Mouse SB', 10, CAST(12.07 AS Decimal(10, 2)), 2, 100, 10, 10, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (39, 'Mouse Blue', 10, CAST(25.00 AS Decimal(10, 2)), 2, 100, 10, 10, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (40, 'Wireless InteliMouse Explorer BT', 10, CAST(72.41 AS Decimal(10, 2)), 2, 100, 10, 10, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (41, 'Windows 2000 Professional', 10, CAST(124.14 AS Decimal(10, 2)), 2, 100, 10, 8, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (42, 'Windows XP Home Editio', 10, CAST(101.97 AS Decimal(10, 2)), 2, 100, 10, 8, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (43, 'Office XP Pro', 10, CAST(516.38 AS Decimal(10, 2)), 2, 100, 10, 8, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (44, 'Visual Studio.NET 2003', 10, CAST(1766.38 AS Decimal(10, 2)), 2, 100, 10, 8, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (45, 'Works Suite 2004', 10, CAST(93.97 AS Decimal(10, 2)), 2, 100, 10, 8, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (46, 'SC-152A', 2, CAST(13.79 AS Decimal(10, 2)), 2, 100, 10, 9, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (47, 'SW252', 2, CAST(33.62 AS Decimal(10, 2)), 2, 100, 10, 9, '0');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (48, 'SM-352', 2, CAST(59.48 AS Decimal(10, 2)), 2, 100, 10, 9, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (49, 'SD-616', 2, CAST(25.00 AS Decimal(10, 2)), 2, 100, 10, 9, '1');
INSERT artikel (artikelnr, bezeichnung, hersteller, nettopreis, mwst, bestand, mindestbestand, kategorie, bestellvorschlag) VALUES (50, 'SC-152A schwarz', 2, CAST(14.66 AS Decimal(10, 2)), 2, 100, 10, 9, '1');


CREATE TABLE bestellung(
	bestellnr int NOT NULL,
	kundenr int NULL,
	bestelldatum date NULL,
	lieferdatum date NULL,
	rechnungsbetrag decimal(10, 2) NULL,
    PRIMARY KEY (bestellnr ASC)
) ;

INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (1, 1, '20100201', '20101101', CAST(368.98 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (2, 2, '20100201', '20101101', CAST(110.79 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (3, 3, '20100201', '20101101', CAST(331.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (4, 4, '20100201', '20101101', CAST(111.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (5, 5, '20100201', '20101201', CAST(111.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (6, 6, '20100103', '20100113', CAST(32.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (7, 7, '20100103', '20100111', CAST(274.93 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (8, 8, '20100103', '20100112', CAST(101.55 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (9, 9, '20100104', '20100110', CAST(29.75 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (10, 10, '20100104', '20100111', CAST(398.03 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (11, 11, '20100104', '20100116', CAST(234.92 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (12, 12, '20100104', '20100114', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (13, 13, '20100104', '20100114', CAST(177.48 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (14, 14, '20100104', '20100115', CAST(169.25 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (15, 15, '20100105', '20100113', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (16, 16, '20100105', '20100112', CAST(160.03 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (17, 17, '20100106', '20100113', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (18, 18, '20100107', '20100118', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (19, 19, '20100107', '20100111', CAST(147.73 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (20, 20, '20100108', '20100112', CAST(75.91 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (21, 21, '20100108', '20100111', CAST(614.54 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (22, 22, '20100108', '20100112', CAST(111.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (23, 23, '20100110', '20100115', CAST(642.56 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (24, 24, '20100110', '20100114', CAST(469.84 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (25, 25, '20100110', '20100115', CAST(27.70 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (26, 9, '20100110', '20100114', CAST(176.44 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (27, 26, '20100111', '20100117', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (28, 27, '20100111', '20100119', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (29, 28, '20100111', '20100115', CAST(818.62 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (30, 29, '20100111', '20100116', CAST(83.11 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (31, 30, '20100112', '20100118', CAST(368.28 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (32, 31, '20100112', '20100117', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (33, 15, '20100112', '20100118', CAST(28.73 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (34, 32, '20100112', '20100118', CAST(173.37 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (35, 33, '20100114', '20100119', CAST(245.18 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (36, 4, '20100115', '20100119', CAST(755.40 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (37, 34, '20100115', '20100120', CAST(111.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (38, 35, '20100115', '20100119', CAST(121.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (39, 36, '20100116', '20100119', CAST(152.84 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (40, 37, '20100116', '20100120', CAST(75.91 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (41, 38, '20100116', '20100121', CAST(192.86 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (42, 39, '20100117', '20100121', CAST(61.52 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (43, 40, '20100117', '20100122', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (44, 41, '20100117', '20100122', CAST(101.55 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (45, 42, '20100117', '20100121', CAST(157.98 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (46, 23, '20100118', '20100123', CAST(14.36 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (47, 43, '20100118', '20100124', CAST(40.01 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (48, 44, '20100119', '20100124', CAST(0.00 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (49, 45, '20100119', '20100122', CAST(642.56 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (50, 46, '20100119', '20100124', CAST(131.30 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (51, 47, '20100120', '20100123', CAST(203.12 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (52, 7, '20100120', '20100124', CAST(83.11 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (53, 48, '20100121', '20100125', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (54, 49, '20100121', '20100126', CAST(147.73 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (55, 50, '20100122', '20100126', CAST(469.84 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (56, 51, '20100122', '20100125', CAST(32.83 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (57, 42, '20100123', '20100130', CAST(164.14 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (58, 52, '20100123', '20100127', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (59, 53, '20100123', '20100128', CAST(1285.13 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (60, 54, '20100123', '20100127', CAST(101.55 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (61, 55, '20100123', '20100128', CAST(264.68 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (62, 56, '20100123', '20100128', CAST(207.21 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (63, 57, '20100124', '20100127', CAST(173.37 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (64, 58, '20100124', '20100128', CAST(407.55 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (65, 2, '20100124', '20100127', CAST(3896.23 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (66, 59, '20100124', '20100128', CAST(135.40 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (67, 60, '20100124', '20100127', CAST(316.97 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (68, 29, '20100124', '20100129', CAST(163.11 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (69, 61, '20100124', '20100128', CAST(473.95 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (70, 62, '20100124', '20100130', CAST(153.88 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (71, 36, '20100125', '20100128', CAST(84.12 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (72, 63, '20100125', '20100130', CAST(4345.52 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (73, 64, '20100125', '20100130', CAST(787.86 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (74, 17, '20100125', '20100129', CAST(2505.43 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (75, 43, '20100125', '20100130', CAST(1545.22 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (76, 65, '20100126', '20100130', CAST(1466.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (77, 66, '20100126', '20100131', CAST(1743.95 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (78, 67, '20100126', '20100129', CAST(861.71 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (79, 68, '20100126', '20100131', CAST(203.12 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (80, 58, '20100126', '20100201', CAST(156.95 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (81, 69, '20100126', '20100130', CAST(1061.74 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (82, 70, '20100126', '20100131', CAST(1079.58 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (83, 5, '20100126', '20100131', CAST(105.66 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (84, 72, '20100126', '20100201', CAST(81.04 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (85, 73, '20100127', '20100130', CAST(2101.99 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (86, 28, '20100127', '20100201', CAST(2287.68 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (87, 74, '20100127', '20100201', CAST(717.08 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (88, 75, '20100127', '20100202', CAST(40.01 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (89, 63, '20100127', '20100201', CAST(178.50 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (90, 76, '20100127', '20100201', CAST(368.28 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (91, 77, '20100127', '20100202', CAST(333.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (92, 47, '20100128', '20100201', CAST(286.21 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (93, 78, '20100128', '20100202', CAST(469.84 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (94, 79, '20100128', '20100201', CAST(32.83 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (95, 55, '20100128', '20100203', CAST(121.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (96, 80, '20100128', '20100201', CAST(1957.35 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (97, 81, '20100128', '20100203', CAST(81.04 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (98, 83, '20100128', '20100205', CAST(173.37 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (99, 73, '20100128', '20100204', CAST(1228.98 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (100, 84, '20100128', '20100203', CAST(768.37 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (101, 85, '20100128', '20100205', CAST(520.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (102, 39, '20100128', '20100204', CAST(121.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (103, 86, '20100129', '20100205', CAST(286.21 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (104, 23, '20100129', '20100204', CAST(131.30 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (105, 87, '20100129', '20100206', CAST(81.04 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (106, 88, '20100129', '20100204', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (107, 62, '20100129', '20100204', CAST(164.10 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (108, 89, '20100129', '20100204', CAST(766.69 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (109, 90, '20100131', '20100211', CAST(545.75 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (110, 91, '20100201', '20100211', CAST(111.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (111, 92, '20100201', '20100209', CAST(86.16 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (112, 88, '20100201', '20100207', CAST(301.59 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (113, 35, '20100201', '20100209', CAST(464.71 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (114, 8, '20100201', '20100208', CAST(199.00 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (115, 82, '20100201', '20100205', CAST(192.85 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (116, 93, '20100202', '20100211', CAST(101.55 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (117, 72, '20100202', '20100210', CAST(31.81 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (118, 61, '20100202', '20100206', CAST(631.94 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (119, 4, '20100202', '20100209', CAST(285.18 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (120, 94, '20100202', '20100208', CAST(490.35 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (121, 95, '20100203', '20100210', CAST(40.01 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (122, 48, '20100203', '20100211', CAST(717.08 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (123, 29, '20100203', '20100210', CAST(3212.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (124, 96, '20100203', '20100209', CAST(546.77 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (125, 82, '20100203', '20100211', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (126, 63, '20100203', '20100210', CAST(29.75 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (127, 72, '20100203', '20100211', CAST(111.82 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (128, 39, '20100203', '20100211', CAST(140.54 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (129, 51, '20100204', '20100211', CAST(121.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (130, 13, '20100204', '20100211', CAST(326.23 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (131, 47, '20100204', '20100211', CAST(14.36 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (132, 97, '20100204', '20100210', CAST(75.91 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (133, 64, '20100204', '20100211', CAST(80.02 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (134, 9, '20100204', '20100210', CAST(286.21 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (135, 98, '20100204', '20100211', CAST(1947.09 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (136, 99, '20100204', '20100212', CAST(16.41 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (137, 14, '20100205', '20100210', CAST(1489.56 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (138, 71, '20100205', '20100211', CAST(101.55 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (139, 44, '20100205', '20100212', CAST(178.50 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (140, 57, '20100205', '20100209', CAST(86.17 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (141, 6, '20100205', '20100210', CAST(398.03 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (142, 12, '20100205', '20100211', CAST(70.78 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (143, 100, '20100206', '20100211', CAST(173.37 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (144, 17, '20100206', '20100211', CAST(286.21 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (145, 73, '20100206', '20100212', CAST(747.69 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (146, 38, '20100206', '20100211', CAST(132.34 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (147, 25, '20100206', '20100212', CAST(55.39 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (148, 83, '20100207', '20100213', CAST(20.50 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (149, 69, '20100207', '20100212', CAST(187.73 AS Decimal(10, 2)));
INSERT bestellung (bestellnr, kundenr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (150, 46, '20100207', '20100213', CAST(328.27 AS Decimal(10, 2)));

CREATE TABLE hersteller(
	herstellernr int NOT NULL,
	name varchar(50) NULL,
    PRIMARY KEY (herstellernr ASC)
);

INSERT hersteller (herstellernr, name) VALUES (1, 'Belinea');
INSERT hersteller (herstellernr, name) VALUES (2, 'Samsung');
INSERT hersteller (herstellernr, name) VALUES (3, 'Sony');
INSERT hersteller (herstellernr, name) VALUES (4, 'HP');
INSERT hersteller (herstellernr, name) VALUES (5, 'Matrox');
INSERT hersteller (herstellernr, name) VALUES (6, 'Terratec');
INSERT hersteller (herstellernr, name) VALUES (7, 'Cano');
INSERT hersteller (herstellernr, name) VALUES (8, 'Epso');
INSERT hersteller (herstellernr, name) VALUES (9, 'Fujitsu');
INSERT hersteller (herstellernr, name) VALUES (10, 'Microsoft');
INSERT hersteller (herstellernr, name) VALUES (11, 'Asus');
INSERT hersteller (herstellernr, name) VALUES (12, 'Acer');
INSERT hersteller (herstellernr, name) VALUES (13, 'Dell');

CREATE TABLE jobticket(
	id int NOT NULL,
	mitarbeiternr int NULL,
	gueltig_bis date NULL
);

INSERT jobticket (id, mitarbeiternr, gueltig_bis) VALUES (1, 1, '20120101');
INSERT jobticket (id, mitarbeiternr, gueltig_bis) VALUES (2, 3, '20120101');

CREATE TABLE kategorie(
	kategorienr int NOT NULL,
	bezeichnung varchar(50) NULL,
    PRIMARY KEY (kategorienr ASC)
);

INSERT kategorie (kategorienr, bezeichnung) VALUES (1, 'Monitore');
INSERT kategorie (kategorienr, bezeichnung) VALUES (2, 'Scanner');
INSERT kategorie (kategorienr, bezeichnung) VALUES (3, 'Grafikkarte');
INSERT kategorie (kategorienr, bezeichnung) VALUES (4, 'Festplatte');
INSERT kategorie (kategorienr, bezeichnung) VALUES (5, 'Soundkarte');
INSERT kategorie (kategorienr, bezeichnung) VALUES (6, 'Keyboards');
INSERT kategorie (kategorienr, bezeichnung) VALUES (7, 'Drucker');
INSERT kategorie (kategorienr, bezeichnung) VALUES (8, 'Software');
INSERT kategorie (kategorienr, bezeichnung) VALUES (9, 'Laufwerke');
INSERT kategorie (kategorienr, bezeichnung) VALUES (10, 'Mäuse');
INSERT kategorie (kategorienr, bezeichnung) VALUES (11, '3,5-Zoll-Diskette');


CREATE TABLE kunde(
	kundenr int NOT NULL,
	name varchar(50) NULL,
	vorname varchar(50) NULL,
	strasse varchar(50) NULL,
	plz char(14) NULL,
	ort varchar(50) NULL,
	telefon_gesch varchar(25) NULL,
	telefon_privat varchar(25) NULL,
	email varchar(50) NULL,
	zahlungsart char(1) NULL,
	kreditrating tinyint NULL,
    PRIMARY KEY (kundenr ASC)
);


INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (1, 'Loewe', 'Arthur', 'Sebastianstrasse 134', '50737         ', 'Köl', NULL, '19467383', NULL, 'B', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (2, 'Adler', 'Felix', 'Goethestrasse 4', '30453         ', 'Hannover', '9856023452', '10562382', 'adler@on-line.de', 'R', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (3, 'Stei', 'Johannes', 'Elisabethenstr. 23', '53111         ', 'Bon', '99746227', '99746228', 'johnny@hip.de', '', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (4, 'Falkner', 'Michael', 'Querfeldstrasse 21', '65187         ', 'Wiesbade', '13726583', '48892768', 'mischa24@wysiwyg.com', 'V', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (5, 'Lederer', 'Helene', 'Rennbahnstrasse 6', '50733         ', 'Köl', '87126534', '32675491', 'lele@lederer-world.de', 'K', 8);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (6, 'Koge', 'Arnold', 'Clara-Viebig-strasse 17', '53179         ', 'Bon', NULL, '55819269', NULL, 'B', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (7, 'Schneider', 'Benedikt', 'Vahrendorfer Stadtweg 61', '21075         ', 'Hamburg', NULL, '93728815', 'benni@postfach-online.de', 'B', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (8, 'Dietrich', 'Diana', 'Kastanienallee 675', '65199         ', 'Wiesbade', NULL, '56112894', 'diedietrich@on-line.de', 'V', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (9, 'Vogli', 'Jakob', 'Engeldamm 34', '12487         ', 'Berli', '999657324', '12432673', 'voglin@berliner-tagblatt.de', 'K', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (10, 'Ster', 'Marti', 'Knaufstrasse 453', '50858         ', 'Köl', '72891174', '17582964', 'martin.stern@on-line.de', 'B', 7);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (11, 'Marsch', 'Ronald', 'Große Telegraphenstrasse 95', '50769         ', 'Köl', '16547326', '99234713', 'ronnie@on-line.de', 'B', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (12, 'Fromkess', 'Leo', 'Schmittgasser Kirchweg 44', '53129         ', 'Bon', '67346248', '19684375', 'leon.fromkess@lola.com', 'R', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (13, 'Badel', 'Sarah', 'Am Ginsterpfad 74', '51147         ', 'Köl', '17483763', '82675271', 's.badel@on-line.de', 'R', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (14, 'Schäfer', 'Willi', 'Bei der blauen Brücke 119', '22083         ', 'Hamburg', '02857204', '86756251', 'schaefer32@lola.com', 'R', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (15, 'Front', 'Jeremias', 'Reichskanzlerstrasse 71', '22525         ', 'Hamburg', '5685710', '86957248', 'jerry@gartenlaubenfreunde.de', 'B', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (16, 'Wilhelms', 'Simo', 'Gustav-Freytag-strasse 22', '51069         ', 'Köl', '19785737', '98760438', NULL, '', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (17, 'Grunpeter', 'Sascha', 'Pascalstrasse 64', '52121         ', 'Bon', '918574736', '11768462', 'sagrun@lola.com', 'R', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (18, 'Marx', 'Alfred', 'Gabriele-Muenter-strasse 102', '51371         ', 'Leverkuse', '02759285', '849647286', 'alfred_marx@on-line.de', 'R', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (19, 'Kops', 'Bernhard', 'Gunther-Plüschow-strasse 47', '50739         ', 'Köl', '10675849', '61969285', 'berniekops@lola.com', 'B', 7);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (20, 'Elso', 'Andrea', 'Herzog-Alf-Weg 13', '20459         ', 'Hamburg', '28795823', '967584483', 'elson@elsons-laedchen.de', 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (21, 'Kapla', 'Marvi', 'Oskar-Schlemmer-strasse 72', '50933         ', 'Köl', NULL, '96857385', 'marvin@marc-aurel-jg-2001.de', 'K', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (22, 'Glaister', 'Gabrielle', 'Simrockallee 2', '53227         ', 'Bon', '97857358', '304760583', 'gabyglaister@on-line.de', '', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (23, 'Knutt', 'Robert', 'Metzgerstrasse 81', '52076         ', 'Aache', '29786682', '10684937', 'robert@robert-knutt.de', 'B', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (24, 'Reiner', 'Robert', 'Pattscheider Weg 7', '51147         ', 'Köl', '19587238', '017589375', 'meathead@lola.com', 'B', 7);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (25, 'Grunert', 'Paul', 'Jütländer Allee 236', '22415         ', 'Hamburg', '19473825', '47294978', 'paul@briefmarken-hamburg.de', 'R', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (26, 'Free', 'Oliver', 'Pferdmengesstrasse 58', '50672         ', 'Köl', '19473067', '94728395', 'ollifree@fc-koelle-for-ever.de', 'K', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (27, 'Frankau', 'Nicholas', 'Rennbahnstrasse 83', '65207         ', 'Wiesbade', '10264738', '91650376', 'nick.frank@on-line.de', 'R', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (28, 'Weinberger', 'Eduard', 'Modersohnstrasse 112', '10965         ', 'Berli', '57480399', '10275748', 'weinberger@lola.com', 'K', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (29, 'Man', 'Miriam', 'Wielandplatz 8', '99425         ', 'Weimar', '19786854', '19786743', 'miriam-mann@on-line.de', '', 7);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (30, 'Waring', 'Georg', 'Merkenicher Ringstrasse 313', '51103         ', 'Köl', '01896748', '71835738', 'waring@polstermoebel-schmidt.de', 'R', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (31, 'Locke', 'Albert', 'Bundesgrenzschutzplatz 32', '53177         ', 'Bon', '47382765', '19684758', 'Bertie@Wooster.de', 'K', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (32, 'Mills', 'Michael', 'Im Grund 4', '51063         ', 'Köl', '86758685', '10894519', 'michael@mills-and-more.de', 'R', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (33, 'Brisebois', 'Danielle', 'Bismarckstrasse 9', '53721         ', 'Siegburg', '91856748', '27685710', 'danielle@tricatel.fr', 'R', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (34, 'Dorning', 'Robert', 'Hunnebeckweg 21', '48147         ', 'Münster', '57483910', '153424352', 'dorne@hip.de', '', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (35, 'Sperber', 'Milo', 'Zypressenweg 3', '22457         ', 'Hamburg', '67582978', '564736540', 'milo@lola.com', 'B', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (36, 'Fabrizi', 'Mario', 'Auf dem Hunnenrücken 19', '50999         ', 'Köl', '142398079', '09978699', 'mario.fabrizi@on-line.de', 'K', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (37, 'Anderso', 'Margarete', 'Machabäerstrasse 34', '50735         ', 'Köl', '27685741', '09987890', 'gretel.anderson@on-line.de', 'V', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (38, 'May', 'Jakob', 'In der Dasladen 9', '51373         ', 'Leverkuse', '197869504', '19785673', 'mayday@pc-helfer-leverkusen.de', '', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (39, 'Palk', 'Anna', 'Winston-Churchill-strasse 80', '53129         ', 'Bon', '197867513', '154635241', 'anpal@on-line.de', 'R', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (40, 'Kaufman', 'Andreas', 'Am Alten Brauhaus 11', '51105         ', 'Köl', '0796835460', '01758362', 'andy@koelner-taxis.de', 'V', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (41, 'Bussell', 'Mark', 'Hanfgartenstrasse 63', '81475         ', 'Münche', '473829201', '13246359', 'bussell@bavaria-bank.de', 'R', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (42, 'Clement', 'Richard', 'Fröbelstrasse 26', '12161         ', 'Berli', NULL, '57297867', 'clem@on-line.de', 'B', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (43, 'Handl', 'Irene', 'Berberitzenweg 7', '50678         ', 'Köl', '84736291', '98675842', 'irenehandl@lola.com', 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (44, 'Landesberg', 'Stefa', 'Kleiner Griechenmarkt 19', '51107         ', 'Köl', '08978569', '186759472', 'Steve@metal-rules.de', '', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (45, 'Lenhart', 'Heidi', 'Mozartstrasse 73', '51371         ', 'Leverkuse', '19705832', '879685740', 'heidi@montana-dreaming.de', 'R', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (46, 'Wendt', 'Georg', 'Froschkönigweg 32', '50767         ', 'Köl', '23142312', '06905964', 'Georg@on-line.de', 'R', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (47, 'Masur', 'Richard', 'Up den Wiemen 46', '22609         ', 'Hamburg', '29671323', '29685749', 'masur@on-line.de', 'R', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (48, 'Gross', 'Michael', 'Neptunstrasse 33', '12621         ', 'Berli', '37685940', '197867580', 'm.gross@lola.com', 'B', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (49, 'Hirsch', 'Andreas', 'Waidmarkt 16', '50735         ', 'Köl', '19783060', '57483657', 'andreas.hirsch@on-line.de', '', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (50, 'Hecht', 'Jessica', 'Im Teich 42', '51105         ', 'Köl', '26453756', '98786029', 'jessie.hecht@lola.com', 'R', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (51, 'Kaminski', 'Melvi', 'Neue ABC-strasse 504', '22607         ', 'Hamburg', '97860169', '57192060', 'mel@bancroft-and-brooks.com', 'B', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (52, 'Schäfer', 'Natalie', 'Mittelstrasse 50', '53225         ', 'Bon', '58672901', '91254341', 'nati@on-line.de', '', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (53, 'Persky', 'Lisa', 'Keplerstrasse 48', '40489         ', 'Düsseldorf', '19562109', '38295647', 'lisa.persky@kunsthaus-persky.de', '', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (54, 'Steuer', 'Paul', 'Langweidenstrasse 67', '60386         ', 'Frankfurt Mai', '01867493', '19887960', 'paul.steuer@on-line.de', 'R', 8);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (55, 'Kar', 'Richard', 'Jan-Wellem-strasse 34', '50668         ', 'Köl', '97860927', '37681936', 'karn.koeln@on-line.de', 'V', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (56, 'Barro', 'Mario', 'Im Fuldchen 7', '60435         ', 'Frankfurt Mai', '13241735', '91703275', 'barron.marion@lola.com', 'B', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (57, 'Mull', 'Marti', 'Rautendeleinweg 29', '40593         ', 'Düsseldorf', '10923874', '57463524', 'mamu@on-line.de', '', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (58, 'Kay', 'Sylvia', 'Gutzkowstrasse 58', '21079         ', 'Hamburg', '95847772', '17584637', 'kay@web-postfaecher.de', 'R', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (59, 'Singer', 'Alex', 'Neumoorstück 15', '20459         ', 'Hamburg', '96857682', '19685733', 'alex@lola.com', '', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (60, 'Zagorsky', 'Annette', 'Isarstrasse 75', '30559         ', 'Hannover', '286957483', '10395738', 'annette@zagorsky-verlag-und-druck.de', 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (61, 'Hecht', 'Gina', 'Schulgasse 28', '65207         ', 'Wiesbade', '195748372', '83746293', 'gina.hecht@on-line.de', 'R', 3);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (62, 'Penner', 'Jonatha', 'Von-Lapp-strasse 66', '53125         ', 'Bon', '17581253', '28547639', 'penner@lola.com', 'B', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (63, 'Kampman', 'Stefa', 'Gustav-Mahler-strasse 64', '50733         ', 'Köl', '19463827', '12647366', 'kampmann@computer-kampmann.de', 'R', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (64, 'Rasche', 'David', 'Boxgraben 9', '52078         ', 'Aache', '18675943', '19574838', 'dave@com-cafe.de', '', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (65, 'Wolf', 'Susanne', 'Veilchenstieg 26', '22297         ', 'Hamburg', '96857486', '768574676', 'susi.wolf@on-line.de', 'R', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (66, 'Barber', 'Paul', 'Mühlenweg 19', '10405         ', 'Berli', NULL, '46375483', NULL, 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (67, 'Marti', 'Melanie', 'Löwengasse 17', '51105         ', 'Köl', '57465748', '97867586', 'melanie.martin@on-line.de', 'R', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (68, 'Lukas', 'Karl', 'Max-Hartig-Weg 20', '60386         ', 'Frankfurt Mai', '91657438', '35462817', 'k.lukas@lola.com', '', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (69, 'Zucker', 'David', 'Abbestrasse 38', '09114         ', 'Chemnitz', '97860231', '16453271', 'd.zucker@zucker-suess.de', 'R', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (70, 'Sim', 'Gerald', 'Lobositzstrasse 63', '51103         ', 'Köl', '57463892', '18675290', 'gerald.s@on-line.de', 'R', 8);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (71, 'Arnold', 'Thomas', 'Industriestrasse 543', '21109         ', 'Hamburg', '18796851', '57481503', 'tom@mayim-bialik-fans.de', 'B', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (72, 'Hart', 'Melissa', 'Gurkenweg 4', '30655         ', 'Hannover', '94768592', '37685749', 'lisa.hart@lola.com', 'R', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (73, 'Ure', 'Gudru', 'Lochumer Weg 23', '50668         ', 'Köl', NULL, '28675942', 'gudrun.ure@on-line.de', '', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (74, 'Anwar', 'Mina', 'Putzdelle 86', '51379         ', 'Leverkuse', '19675849', '16574638', 'm.anwar@on-line.de', '', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (75, 'Kerr', 'Annette', 'Brander Heide 37', '52066         ', 'Aache', '19786758', '97867592', 'anette.kerr@modehaus-kerr-aachen.de', 'R', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (76, 'Lembeck', 'Helene', 'Fuldaer strasse 73', '60486         ', 'Frankfurt Mai', '67581930', '19786024', 'lele39@on-line.de', 'V', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (77, 'Fleischer', 'Karl', 'Kriemhildstrasse 38', '21109         ', 'Hamburg', '18695783', '97867261', 'fleischer@web-postfaecher.de', 'R', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (78, 'Kaufman', 'Andreas', 'Fabriciusstieg 47', '20257         ', 'Hamburg', '96847392', '53427164', 'andreas.kaufmann@zmuda.de', 'K', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (79, 'Eles', 'Sandor', 'Diedenhofer strasse 63', '22419         ', 'Hamburg', '98362781', '87926715', 'sandor.eles@on-line.de', 'R', 6);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (80, 'Voland', 'Herbert', 'Düsseldorfer strasse 90', '50939         ', 'Köl', '86932710', '83756493', 'herbert.voland@on-line.de', 'R', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (81, 'Stoller', 'Alfred', 'Voltastrasse 53', '60388         ', 'Frankfurt Mai', '00418673', '65884192', 'alfi.stoller@lola.com', '', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (82, 'Marti', 'Georg', 'Hermesgasse 17', '51145         ', 'Köl', '29675813', '16475855', 'g.martin@web-postfaecher.de', 'B', 7);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (83, 'Durda', 'Richard', 'Görlitzer strasse 41', '60313         ', 'Frankfurt Mai', '96815376', '27681930', 'dickdurdan@lola.com', 'K', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (84, 'Bonner', 'Frank', 'Shakespeareplatz 35', '14055         ', 'Berli', '36277361', '17564832', 'frank.bonner2@on-line.de', 'R', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (85, 'Baden-Semper', 'Nina', 'Brookdamm 68', '20457         ', 'Hamburg', '27564932', '04437193', 'nina@web-postfaecher.de', 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (86, 'Manda', 'Robert', 'Kösener Weg 8', '40489         ', 'Düsseldorf', '56473329', '17564932', 'robert.mandan@on-line.de', '', 0);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (87, 'Fenacolini', 'Anna', 'Josef-Hirn-Platz 4', '50597         ', 'Stuttgart', '19685493', '57463829', 'anna.fenacolini@stuttgart-uni.de', 'R', 8);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (88, 'Horder', 'Michael', 'Schwengelkamp 44', '20255         ', 'Hamburg', '19685723', '375847650', 'michael.hordern@on-line.de', 'R', 10);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (89, 'Dane', 'Alexandra', 'Langeler Kreuzweg 92', '51063         ', 'Köl', '195647382', '95768323', 'xandra@fc-koelle-for-ever.de', '', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (90, 'Scolari', 'Peter', 'Ella-Kay-strasse 85', '13357         ', 'Berli', '18574639', '26574619', 'peter.scolari@on-line.de', 'R', 7);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (91, 'Herbert', 'Philipp', 'Am Pulverhof 52', '22045         ', 'Hamburg', '28576462', '82868584', 'philipp.herbert@lola.com', 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (92, 'Kraft', 'Robert', 'Hohenzollernring 103', '14129         ', 'Berli', '18463728', '07869237', 'kraft@tierhaus-kraft.de', '', 8);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (93, 'Donner', 'Robert', 'Bebelplatz 12', '51149         ', 'Köl', '18679684', '37586472', 'donner@donner-und-blitz-medien.de', 'R', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (94, 'Sadowsky', 'Adam', 'Colmarer strasse 73', '28327         ', 'Breme', '96857328', '17564834', 'adam.sadowsky@on-line.de', 'R', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (95, 'Hartma', 'Philipp', 'Hamburger Hochstrasse 19', '22767         ', 'Hamburg', '29371826', '85647291', 'philipp@radio-bill.de', '', 2);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (96, 'Piekarsky', 'Julia', 'Quinxer strasse 6', '52074         ', 'Aache', '28574639', '17685743', 'piekarsky@web-postfaecher.de', 'R', 1);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (97, 'Eiding', 'Paul', 'Goerdelerstrasse 37', '65195         ', 'Wiesbade', NULL, '27564832', NULL, '', 9);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (98, 'Ritter', 'Hannes', 'Emschertalstrasse 73', '44149         ', 'Dortmund', '27584637', NULL, 'hannes.ritter@lola.com', 'R', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (99, 'Adria', 'Iris', 'Vulkanstrasse 46', '50677         ', 'Köl', '18675943', '27564839', 'iris.adrian@on-line.de', '', 4);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (100, 'Slotky', 'Anna', 'Anita-Ree-strasse 61', '22087         ', 'Hamburg', '28574635', '29186753', 'slotky@zzzorro.de', 'K', 5);
INSERT kunde (kundenr, name, vorname, strasse, plz, ort, telefon_gesch, telefon_privat, email, zahlungsart, kreditrating) VALUES (300, 'Loewe', 'Gaby', 'Sebastianstrasse 134', '50737         ', 'Köl', NULL, '19467383', NULL, NULL, 5);

CREATE TABLE mitarbeiter(
	mitarbeiternr int NOT NULL AUTO_INCREMENT,
	name varchar(50) NULL,
	vorname varchar(50) NULL,
	strasse varchar(50) NULL,
	plz char(14) NULL,
	ort varchar(50) NULL,
	gehalt decimal(10, 2) NULL,
	abteilung int NULL,
	telefonnummer varchar(25) NULL,
	email varchar(50) NULL,
	eintrittsdatum date NULL,
    CONSTRAINT pk_mitarbeiter PRIMARY KEY (mitarbeiternr ASC)
);

INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (1, 'Ross', 'Hage', 'Hauptstrasse 67', '53123         ', 'Bon', CAST(7500.00 AS Decimal(10, 2)), 1, '43567890', 'hagen.ross@beispielfirma.de', '19860218');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (2, 'Roberts', 'Patrick', 'Schillerstrasse 154', '53229         ', 'Bon', CAST(7000.00 AS Decimal(10, 2)), 1, '98761462', 'p.roberts@beispielfirma.de', '19881020');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (3, 'Hummer', 'Stefa', 'Sonnenhag 74', '53175         ', 'Bon', CAST(7000.00 AS Decimal(10, 2)), 1, '98120421', 'stefanhummer@beispielfirma.de', '19920801');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (4, 'Reiman', 'David', 'Nibelungenstrasse 21', '52115         ', 'Bon', CAST(2500.00 AS Decimal(10, 2)), 2, '67294738', 'dave.g@beispielfirma.de', '19870713');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (5, 'Weinert', 'Eduard', 'Quellenweg 57', '53177         ', 'Bon', CAST(2000.00 AS Decimal(10, 2)), 2, '78646193', 'eduard.weinert@beispielfirma.de', '20080119');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (6, 'Michaels', 'Connie', 'Benedek strasse 5', '53756         ', 'St. Augusti', CAST(2500.00 AS Decimal(10, 2)), 3, '12345655', 'connie.michaels@beispielfirma.de', '19880421');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (7, 'Osser', 'Bernd', 'Usambaraweg 28', '50732         ', 'Köl', CAST(2200.00 AS Decimal(10, 2)), 3, '27913020', 'b.osser@beispielfirma.de', '19950605');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (8, 'Koppes', 'Kari', 'Kopenhagener strasse 34', '53177         ', 'Bon', CAST(2400.00 AS Decimal(10, 2)), 4, '98766754', 'karin.koppes@beispielfirma.de', '19980510');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (9, 'Wilding', 'Alexander', 'Sedanstrasse 172', '53229         ', 'Bon', CAST(2300.00 AS Decimal(10, 2)), 4, '28652947', 'alex.wilding@beispielfirma.de', '20060630');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (10, 'Schmidt', 'Peter', 'Konrad-Adenauer-strasse 49', '50997         ', 'Köl', CAST(2500.00 AS Decimal(10, 2)), 5, '68371020', 'p.schmidt@beispielfirma.de', '20011104');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (11, 'Müller', 'Ole', 'Lutherstrasse 4', '50823         ', 'Köl', CAST(2600.00 AS Decimal(10, 2)), 5, '682037741', 'o.mueller@beispielfirma.de', '10090302');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (12, 'Meier', 'Wilhelm', 'Römerstrasse 53', '53229         ', 'Bon', CAST(2400.00 AS Decimal(10, 2)), 5, '91821573', 'willi.meier@beispielfirma.de', '19940802');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (13, 'Schiff', 'Marti', 'Truchseßstrasse 74', '53127         ', 'Bon', CAST(2500.00 AS Decimal(10, 2)), 5, '65744583', 'martin.schiff@beispielfirma.de', '20020928');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (14, 'Lehne', 'Luise', 'Lyngsbergstrasse 93', '53113         ', 'Bon', CAST(2000.00 AS Decimal(10, 2)), 6, '12341756', 'luise.lehne@beispielfirma.de', '20010722');
INSERT mitarbeiter (mitarbeiternr, name, vorname, strasse, plz, ort, gehalt, abteilung, telefonnummer, email, eintrittsdatum) VALUES (15, 'Remse', 'Kevi', 'Nonnenstrombergstrasse 22', '50672         ', 'Köl', CAST(1800.00 AS Decimal(10, 2)), 6, '94128882', 'kevin.remsen@beispielfirma.de', '20040102');

CREATE TABLE mwstsatz(
	mwstnr int NOT NULL,
	prozent decimal(4, 2) NULL,
    PRIMARY KEY (mwstnr ASC)
);

INSERT mwstsatz (mwstnr, prozent) VALUES (1, CAST(7.00 AS Decimal(4, 2)));
INSERT mwstsatz (mwstnr, prozent) VALUES (2, CAST(19.00 AS Decimal(4, 2)));

CREATE TABLE posten(
	bestellnr int NOT NULL,
	artikelnr int NULL,
	bestellmenge int NULL,
	liefermenge int NULL
);

ALTER TABLE posten ADD CONSTRAINT pk_bestnr_artnr PRIMARY KEY (bestellnr, artikelnr);

INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (1, 1, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (1, 2, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (2, 34, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (3, 20, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (3, 11, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (4, 45, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (5, 19, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (6, 46, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (7, 8, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (7, 37, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (8, 12, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (9, 39, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (10, 30, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (10, 25, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (11, 20, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (12, 36, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (13, 41, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (13, 49, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (14, 6, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (15, 36, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (16, 21, 4, 4);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (17, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (18, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (19, 41, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (20, 17, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (21, 2, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (22, 19, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (23, 32, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (24, 14, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (25, 28, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (26, 8, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (26, 21, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (27, 36, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (28, 40, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (29, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (29, 27, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (29, 43, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (30, 28, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (31, 15, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (32, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (33, 38, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (34, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (35, 25, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (36, 6, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (36, 32, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (37, 19, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (38, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (39, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (39, 3, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (40, 17, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (41, 23, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (41, 45, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (42, 27, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (43, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (44, 24, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (45, 7, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (46, 38, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (47, 21, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (49, 32, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (50, 16, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (51, 47, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (51, 13, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (52, 28, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (53, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (54, 41, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (55, 14, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (56, 29, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (57, 1, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (58, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (59, 32, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (60, 24, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (61, 30, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (61, 45, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (62, 11, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (62, 38, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (63, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (64, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (64, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (65, 10, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (65, 44, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (66, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (66, 36, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (66, 49, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (67, 27, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (67, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (68, 13, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (69, 7, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (70, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (70, 22, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (70, 50, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (71, 6, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (71, 28, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (72, 1, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (72, 6, 4, 4);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (72, 10, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (72, 12, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (73, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (73, 43, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 3, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 7, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 9, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 11, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 14, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 17, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 20, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 22, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 29, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 37, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 38, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 41, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 43, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 48, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (74, 50, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 5, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 8, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 13, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 23, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 39, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (75, 49, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (76, 32, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (76, 12, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (76, 24, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (76, 3, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (76, 45, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (77, 46, 10, 10);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (77, 47, 10, 10);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (77, 48, 10, 10);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (77, 49, 10, 10);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (77, 50, 10, 10);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (78, 9, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (78, 16, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (78, 22, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (78, 36, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (78, 43, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (79, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (79, 41, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (80, 12, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (80, 36, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 7, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 11, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 24, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 28, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 39, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 40, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (81, 46, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (82, 9, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (82, 32, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (82, 29, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (82, 1, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (83, 17, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (83, 39, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (84, 23, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (85, 44, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (86, 7, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (86, 28, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (86, 44, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (87, 5, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (88, 21, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (89, 37, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (90, 15, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (91, 22, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (91, 48, 4, 4);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (92, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (93, 14, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (94, 29, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (95, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (96, 10, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (96, 13, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (97, 23, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (98, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (99, 43, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (100, 35, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (101, 2, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (101, 7, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (102, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (103, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (104, 16, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (105, 23, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (106, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (107, 46, 10, 10);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (108, 11, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (108, 28, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (108, 32, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (109, 17, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (109, 20, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (110, 19, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (111, 27, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (111, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (112, 22, 6, 6);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (113, 15, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (113, 8, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (114, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (114, 37, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (115, 11, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (116, 24, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (117, 38, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (117, 50, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (118, 7, 4, 4);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (119, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (119, 3, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (120, 25, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (121, 47, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (122, 5, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (123, 32, 5, 5);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (124, 25, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (124, 6, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (125, 40, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (126, 39, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (127, 19, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (128, 28, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (128, 6, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (129, 42, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (130, 13, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (131, 38, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (132, 17, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (133, 21, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (134, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (135, 10, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (135, 30, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (136, 46, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (137, 5, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (137, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (138, 24, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (139, 37, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (140, 18, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (141, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (141, 19, 2, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (142, 48, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (143, 4, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (144, 33, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (145, 17, 4, 4);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (145, 31, 2, 2);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (145, 42, 3, 3);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (146, 3, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (147, 34, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (148, 26, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (149, 7, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (149, 49, 1, 1);
INSERT posten (bestellnr, artikelnr, bestellmenge, liefermenge) VALUES (150, 1, 2, 2);

ALTER TABLE artikel ALTER COLUMN bestand SET DEFAULT 0;

ALTER TABLE artikel ALTER COLUMN bestellvorschlag SET DEFAULT 0;

ALTER TABLE artikel ADD CONSTRAINT fk_art_herst FOREIGN KEY(hersteller)
REFERENCES hersteller (herstellernr);

ALTER TABLE artikel ADD CONSTRAINT fk_art_kat FOREIGN KEY(kategorie)
REFERENCES kategorie (kategorienr);

ALTER TABLE artikel ADD CONSTRAINT fk_art_mwst FOREIGN KEY(mwst)
REFERENCES mwstsatz (mwstnr);

ALTER TABLE bestellung ADD CONSTRAINT fk_best_kdnr FOREIGN KEY(kundenr)
REFERENCES kunde (kundenr);

ALTER TABLE bestellung ADD CONSTRAINT fk_best_kd FOREIGN KEY(kundenr)
REFERENCES kunde (kundenr);

ALTER TABLE jobticket  ADD CONSTRAINT fk_jobt_manr FOREIGN KEY(mitarbeiternr)
REFERENCES mitarbeiter (mitarbeiternr);

ALTER TABLE mitarbeiter ADD CONSTRAINT fk_mit_abt FOREIGN KEY(abteilung)
REFERENCES abteilung (abteilungsnr);

ALTER TABLE posten ADD CONSTRAINT fk_post_art FOREIGN KEY(artikelnr)
REFERENCES artikel (artikelnr);

ALTER TABLE posten ADD CONSTRAINT fk_post_best FOREIGN KEY(bestellnr)
REFERENCES bestellung (bestellnr);

ALTER TABLE adresse ADD CONSTRAINT ck_plz CHECK  (plz<>'00000' AND plz<=(99999));

ALTER TABLE posten  ADD  CONSTRAINT CON_bestellmenge CHECK  ((bestellmenge>(0)));

