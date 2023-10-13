CREATE DATABASE trailerflix
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE trailerflix;
CREATE TABLE `Actricesyactores` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Actor` varchar(40) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Catalogo_Reparto` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`IdTitulo` INT NOT NULL,
	`IdActor` INT NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Categorias` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Categoria` char(10) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Catalogo` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Titulo` varchar(80) NOT NULL,
	`Categoria` varchar(20) NOT NULL,
	`Resumen` text NOT NULL,
	`Temporadas` varchar(10) NOT NULL DEFAULT '1',
	`Trailer` varchar(50),
	`Poster` varchar(50) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Generos` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Genero` char(20) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Catalogo_Tags` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`IdTitulo` INT NOT NULL,
	`IdGen` INT NOT NULL,
	PRIMARY KEY (`Id`)
);
USE trailerflix;
CREATE VIEW Vista_ActricesyActores AS
SELECT IdTitulo, A.Actor  
FROM Actricesyactores A
JOIN Catalogo_Reparto R ON A.Id = R.IdActor;

CREATE VIEW Vista_Reparto AS
SELECT IdTitulo, GROUP_CONCAT( Actor ORDER BY IdTitulo DESC SEPARATOR ', ') AS Reparto
FROM Vista_ActricesyActores
GROUP BY IdTitulo;

CREATE VIEW Vista_Generos AS 
SELECT G.Genero, T.IdTitulo 
FROM Generos G 
JOIN Catalogo_Tags T ON T.IdGen = G.Id;

CREATE VIEW Vista_Tags AS 
SELECT IdTitulo, GROUP_CONCAT( genero ORDER BY IdTitulo DESC SEPARATOR ', ') AS Titulo
FROM Vista_Generos 
GROUP BY IdTitulo;

CREATE VIEW Vista_Catalogo AS
SELECT C.Id AS Id, C.titulo, C.resumen, C.temporadas, C.categoria, C.trailer, C.poster, T.Titulo as genero, R.Reparto as reparto
FROM Catalogo C 
JOIN Vista_Tags T ON T.IdTitulo = C.Id
JOIN Vista_Reparto R ON R.IdTitulo = C.Id;

INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (1,'Pedro Pascal');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (2,'Carl Weathers');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (3,'Misty Rosas');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (4,'Chris Bartlett');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (5,'Rio Hackford');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (6,'Giancarlo Esposito');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (7,'Tom Hopper');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (8,'David Castañeda');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (9,'Emmy Raver-Lampman');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (10,'Robert Sheehan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (11,'Aidan Gallagher');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (12,'Elliot Page');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (13,'Anya Taylor-Joy');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (14,'Thomas Brodie-Sangster');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (15,'Harry Melling');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (16,'Moses Ingram');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (17,'Chloe Pirrie');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (18,'Janina Elkin');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (19,'Lili Reinhart');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (20,'Casey Cott');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (21,'Camila Mendes');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (22,'Marisol Nichols');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (23,'Madelaine Petsch');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (24,'Mädchen Amick');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (25,'Claire Fox');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (26,'Olivia Colman');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (27,'Matt Smith');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (28,'Tobias Menzies');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (29,'Vanesa Kirby');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (30,'Helena Bonham Carter');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (31,'Millie Bobby Brown');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (32,'Henry Cavill');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (33,'Sam Claflin');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (34,'Helena Bonham Carter');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (35,'Louis Partridge');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (36,'Adeel Akhtar');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (37,'Joaquin Phoenix');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (38,'Robert De Niro');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (39,'Zazie Beetz');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (40,'Frances Conroy');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (41,'Brett Cullen');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (42,'Shea Whigham');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (43,'Robert Downey Jr.');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (44,'Chris Evans');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (45,'Mark Ruffalo');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (46,'Chris Hemsworth');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (47,'Scarlett Johansson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (48,'Jeremy Renner');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (49,'Emilia Clarke');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (50,'Lena Headey');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (51,'Sophie Turner');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (52,'Kit Harington');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (53,'Peter Dinklage');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (54,'Nikolaj Coster-Waldau');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (55,'Grant Gustin');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (56,'Carlos Valdes');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (57,'Danielle Panabaker');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (58,'Candice Patton');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (59,'Jesse L. Martin');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (60,'Tom Cavanagh');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (61,'Jim Parsons');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (62,'Johnny Galecki');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (63,'Kaley Cuoco');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (64,'Simon Helberg');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (65,'Kunal Nayyar');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (66,'Melissa Rauch');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (67,'Mayim Bialik');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (68,'Jennifer Aniston');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (69,'Courteney Cox');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (70,'Lisa Kudrow');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (71,'David Schwimmer');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (72,'Matthew Perry');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (73,'Matt LeBlanc');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (74,'Amybeth McNulty');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (75,'Geraldine James');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (76,'R. H. Thomson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (77,'Corrine Koslo');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (78,'Dalila Bela');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (79,'Lucas Jade Zumann');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (80,'Gillian Anderson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (81,'David Duchovny');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (82,'Mitch Pileggi');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (83,'Robert Patrick');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (84,'Tom Braidwood');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (85,'Bruce Harwood');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (86,'Jared Harris');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (87,'Stellan Skarsgård');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (88,'Emily Watson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (89,'Paul Ritter');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (90,'Jessie Buckley');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (91,'Adam Nagaitis');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (92,'Evan Rachel Wood');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (93,'Thandie Newton');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (94,'Jeffrey Wright');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (95,'Tessa Thompson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (96,'Ed Harris');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (97,'Luke Hemsworth');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (98,'Lee Pace');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (99,'Scoot McNairy');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (100,'Mackenzie Davis');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (101,'Kerry Bishé');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (102,'Toby Huss');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (103,'Alana Cavanaugh');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (104,'Jessica Chastain');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (105,'John Malkovich');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (106,'Colin Farrell');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (107,'Common');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (108,'Geena Davis');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (109,'Ioan Gruffudd');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (110,'Margot Robbie');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (111,'Ewan McGregor');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (112,'Mary Elizabeth Winstead');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (113,'Jurnee Smollett');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (114,'Rosie Perez');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (115,'Chris Messina');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (116,'Stacy Martin');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (117,'Rhona Mitra');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (118,'Theo James');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (119,'Peter Ferdinando');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (120,'Lia Williams');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (121,'Toby Jones');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (122,'Dwayne Johnson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (123,'Kevin Hart');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (124,'Jack Black');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (125,'Karen Gillan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (126,'Awkwafina');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (127,'Nick Jonas');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (128,'Miranda Cosgrove');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (129,'Kate Walsh');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (130,'Omar Epps');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (131,'Angus Macfadyen');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (132,'Jorja Fox');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (133,'Enver Gjokaj');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (134,'Bill Skarsgård');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (135,'Jessica Chastain');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (136,'Bill Hader');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (137,'James McAvoy');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (138,'Isaiah Mustafa');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (139,'Jay Ryan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (140,'Chadwick Boseman');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (141,'Michael B. Jordan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (142,'Lupita Nyong\'o');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (143,'Danai Gurira');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (144,'Martin Freeman');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (145,'Daniel Kaluuya');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (146,'Christian Bale');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (147,'Matt Damon');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (148,'Caitriona Balfe');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (149,'Josh Lucas');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (150,'Noah Jupe');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (151,'Jon Bernthal');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (152,'Génesis Rodríguez');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (153,'Vincent Piazza');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (154,'Benjamin Sokolow');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (155,'Emily Bayiokos');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (156,'Amy Manson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (157,'Luke Allen-Gale');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (158,'Nina Bergman');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (159,'Dominic Mafham');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (160,'James Weber Brown');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (161,'Lorina Kamburova');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (162,'Marion Cotillard');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (163,'Matt Damon');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (164,'Laurence Fishburne');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (165,'Jude Law');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (166,'Kate Winslet');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (167,'Jennifer Ehle');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (168,'Gwyneth Paltrow');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (169,'Scarlett Johansson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (170,'Florence Pugh');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (171,'David Harbour');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (172,'O.T. Fagbenle');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (173,'Rachel Weisz');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (174,'William Hurt');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (175,'Ray Winstone');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (176,'Matt Damon');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (177,'Jessica Chastain');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (178,'Kristen Wiig');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (179,'Jeff Daniels');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (180,'Michael Peña');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (181,'Sean Bean');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (182,'Kate Mara');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (183,'Alicia Vikander');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (184,'Domhnall Gleeson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (185,'Oscar Isaac');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (186,'Sonoya Mizuno');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (187,'Corey Johnson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (188,'Claire Selby');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (189,'Gana Bayarsaikhan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (190,'Bryce Dallas Howard');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (191,'Chris Pratt');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (192,'Irrfan Khan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (193,'Vincent D\'Onofrio');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (194,'Omar Sy');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (195,'Nick Robinson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (196,'Judy Greer');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (197,'Will Smith');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (198,'Alice Braga');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (199,'Charlie Tahan');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (200,'Dash Mihok');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (201,'Salli Richardson-Whitfield');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (202,'Willow Smith');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (203,'Emma Thompson');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (204,'Ryan Gosling');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (205,'Claire Foy');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (206,'Jason Clarke');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (207,'Kyle Chandler');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (208,'Corey Stoll');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (209,'Patrick Fugit');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (210,'John Boyega');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (211,'Scott Eastwood');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (212,'Cailee Spaeny');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (213,'Jing Tian');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (214,'Rinko Kikuchi');
INSERT INTO actricesyactores (`Id`,`Actor`) VALUES (215,'Burn Gorman');

INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (1,3,1);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (2,3,2);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (3,3,3);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (4,3,4);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (5,3,5);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (6,3,6);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (7,4,7);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (8,4,8);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (9,4,9);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (10,4,10);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (11,4,11);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (12,4,12);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (13,5,13);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (14,5,14);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (15,5,15);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (16,5,16);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (17,5,17);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (18,5,18);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (19,2,19);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (20,2,20);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (21,2,21);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (22,2,22);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (23,2,23);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (24,2,24);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (25,1,25);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (26,1,26);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (27,1,27);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (28,1,28);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (29,1,29);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (30,1,30);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (31,6,31);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (32,6,32);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (33,6,33);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (34,6,30);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (35,6,35);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (36,6,36);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (37,7,37);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (38,7,38);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (39,7,39);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (40,7,40);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (41,7,41);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (42,7,42);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (43,8,43);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (44,8,44);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (45,8,45);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (46,8,46);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (47,8,47);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (48,8,48);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (49,9,49);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (50,9,50);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (51,9,51);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (52,9,52);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (53,9,53);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (54,9,54);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (55,10,55);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (56,10,56);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (57,10,57);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (58,10,58);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (59,10,59);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (60,10,60);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (61,11,61);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (62,11,62);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (63,11,63);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (64,11,64);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (65,11,65);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (66,11,66);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (67,11,67);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (68,12,68);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (69,12,69);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (70,12,70);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (71,12,71);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (72,12,72);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (73,12,73);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (74,13,74);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (75,13,75);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (76,13,76);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (77,13,77);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (78,13,78);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (79,13,79);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (80,14,80);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (81,14,81);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (82,14,82);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (83,14,83);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (84,14,84);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (85,14,85);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (86,15,86);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (87,15,87);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (88,15,88);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (89,15,89);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (90,15,90);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (91,15,91);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (92,16,92);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (93,16,93);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (94,16,94);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (95,16,95);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (96,16,96);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (97,16,97);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (98,17,98);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (99,17,99);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (100,17,100);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (101,17,101);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (102,17,102);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (103,17,103);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (104,18,104);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (105,18,105);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (106,18,106);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (107,18,107);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (108,18,108);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (109,18,109);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (110,19,110);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (111,19,111);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (112,19,112);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (113,19,113);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (114,19,114);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (115,19,115);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (116,20,116);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (117,20,117);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (118,20,118);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (119,20,119);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (120,20,120);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (121,20,121);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (122,21,122);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (123,21,123);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (124,21,124);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (125,21,125);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (126,21,126);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (127,21,127);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (128,22,128);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (129,22,129);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (130,22,130);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (131,22,131);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (132,22,132);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (133,22,133);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (134,23,134);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (135,23,104);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (136,23,136);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (137,23,137);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (138,23,138);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (139,23,139);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (140,24,140);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (141,24,141);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (142,24,142);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (143,24,143);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (144,24,144);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (145,24,145);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (146,25,146);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (147,25,147);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (148,25,148);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (149,25,149);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (150,25,150);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (151,25,151);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (152,26,152);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (153,26,153);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (154,26,154);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (155,26,155);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (156,27,156);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (157,27,157);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (158,27,158);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (159,27,159);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (160,27,160);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (161,27,161);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (162,28,162);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (163,28,147);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (164,28,164);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (165,28,165);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (166,28,166);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (167,28,167);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (168,28,168);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (169,29,47);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (170,29,170);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (171,29,171);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (172,29,172);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (173,29,173);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (174,29,174);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (175,29,175);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (176,30,147);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (177,30,104);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (178,30,178);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (179,30,179);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (180,30,180);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (181,30,181);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (182,30,182);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (183,31,183);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (184,31,184);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (185,31,185);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (186,31,186);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (187,31,187);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (188,31,188);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (189,31,189);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (190,32,190);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (191,32,191);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (192,32,192);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (193,32,193);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (194,32,194);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (195,32,195);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (196,32,196);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (197,33,197);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (198,33,198);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (199,33,199);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (200,33,200);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (201,33,201);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (202,33,202);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (203,33,203);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (204,34,204);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (205,34,205);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (206,34,206);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (207,34,207);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (208,34,208);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (209,34,209);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (210,35,210);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (211,35,211);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (212,35,212);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (213,35,213);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (214,35,214);
INSERT INTO catalogo_reparto (`Id`,`IdTitulo`,`IdActor`) VALUES (215,35,215);

INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (1,3,1);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (2,3,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (3,4,1);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (4,4,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (5,5,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (6,5,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (7,5,5);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (8,2,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (9,2,6);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (10,2,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (11,1,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (12,1,7);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (13,6,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (14,6,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (15,6,6);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (16,7,8);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (17,7,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (18,7,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (19,8,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (20,8,11);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (21,8,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (22,9,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (23,9,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (24,9,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (25,10,1);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (26,10,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (27,11,13);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (28,11,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (29,11,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (30,12,13);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (31,12,14);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (32,12,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (33,13,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (34,13,14);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (35,13,15);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (36,14,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (37,14,1);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (38,15,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (39,15,7);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (40,16,15);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (41,16,1);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (42,17,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (43,17,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (44,17,16);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (45,18,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (46,18,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (47,18,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (48,19,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (49,19,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (50,19,13);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (51,20,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (52,20,11);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (53,20,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (54,21,13);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (55,21,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (56,21,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (57,22,1);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (58,22,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (59,23,17);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (60,23,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (61,23,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (62,24,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (63,24,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (64,24,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (65,25,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (66,25,18);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (67,25,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (68,26,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (69,26,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (70,26,19);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (71,27,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (72,27,11);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (73,27,17);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (74,28,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (75,28,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (76,28,20);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (77,29,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (78,29,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (79,29,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (80,30,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (81,30,11);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (82,30,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (83,31,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (84,31,11);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (85,31,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (86,32,9);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (87,32,10);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (88,32,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (89,33,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (90,33,17);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (91,33,4);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (92,34,3);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (93,34,21);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (94,35,12);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (95,35,2);
INSERT INTO catalogo_tags (`Id`,`IdTitulo`,`IdGen`) VALUES (96,35,11);

SERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (1,'The Crown','Serie','Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.','4',NULL,'http://127.0.0.1:8080/posters/1.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (2,'Riverdale','Serie','El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.','5',NULL,'http://127.0.0.1:8080/posters/2.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (3,'The Mandalorian','Serie','Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.','2','https://www.youtube.com/embed/aOC8E8z_ifw','http://127.0.0.1:8080/posters/3.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (4,'The Umbrella Academy','Serie','La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.','1',NULL,'http://127.0.0.1:8080/posters/4.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (5,'Gambito de Dama','Serie','En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.','1',NULL,'http://127.0.0.1:8080/posters/5.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (6,'Enola Holmes','Película','La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.','N/A',NULL,'http://127.0.0.1:8080/posters/6.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (7,'Guasón','Película','Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.','N/A','https://www.youtube.com/embed/zAGVQLHvwOY','http://127.0.0.1:8080/posters/7.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (8,'Avengers: End Game','Película','Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.','N/A',NULL,'http://127.0.0.1:8080/posters/8.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (9,'Juego de tronos','Serie','En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.','8',NULL,'http://127.0.0.1:8080/posters/9.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (10,'The Flash','Serie','Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.','6',NULL,'http://127.0.0.1:8080/posters/10.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (11,'The Big Bang Theory','Serie','Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.','12','https://www.youtube.com/embed/WBb3fojgW0Q','http://127.0.0.1:8080/posters/11.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (12,'Friends','Serie','\'Friends\' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.','10',NULL,'http://127.0.0.1:8080/posters/12.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (13,'Anne with an \'E\'','Serie','Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.','2',NULL,'http://127.0.0.1:8080/posters/13.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (14,'Expedientes Secretos \'X\'','Serie','Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de \'siniestro\'','11','https://www.youtube.com/embed/KKziOmsJxzE','http://127.0.0.1:8080/posters/14.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (15,'Chernobyl','Serie','Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.','1','https://www.youtube.com/embed/s9APLXM9Ei8','http://127.0.0.1:8080/posters/15.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (16,'Westworld','Serie','\'Westworld\' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.','3','https://www.youtube.com/embed/qLFBcdd6Qw0','http://127.0.0.1:8080/posters/16.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (17,'Halt and Catch Fire','Serie','Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).','4','https://www.youtube.com/embed/pWrioRji60A','http://127.0.0.1:8080/posters/17.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (18,'Ava','Película','Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.','N/A','','http://127.0.0.1:8080/posters/18.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (19,'Aves de presa y la fantabulosa emancipación de una Harley Quinn','Película','Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.','N/A','','http://127.0.0.1:8080/posters/19.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (20,'Archivo','Película','2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.','N/A','https://www.youtube.com/embed/VHSoCnDioAo','http://127.0.0.1:8080/posters/20.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (21,'Jumanji - The next level','Película','Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?','N/A','https://www.youtube.com/embed/rBxcF-r9Ibs','http://127.0.0.1:8080/posters/21.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (22,'3022','Película','La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.','N/A','https://www.youtube.com/embed/AGQ7OkmIx4Q','http://127.0.0.1:8080/posters/22.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (23,'IT - Capítulo 2','Película','En este segundo capitulo Han pasado 27 años desde que el \'Club de los Perdedores\', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.','N/A','https://www.youtube.com/embed/hZeFeYSmBcg','http://127.0.0.1:8080/posters/23.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (24,'Pantera Negra','Película','T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.','N/A','https://www.youtube.com/embed/BE6inv8Xh4A','http://127.0.0.1:8080/posters/24.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (25,'Contra lo imposible (Ford versus Ferrari)','Película','Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.','N/A','https://www.youtube.com/embed/SOVb0-2g1Q0','http://127.0.0.1:8080/posters/25.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (26,'Centígrados','Película','Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.','N/A','','http://127.0.0.1:8080/posters/26.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (27,'DOOM: Aniquilación','Película','Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.','N/A','https://www.youtube.com/embed/nat3u3gAVLE','http://127.0.0.1:8080/posters/27.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (28,'Contagio','Película','De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.','N/A','https://www.youtube.com/embed/4sYSyuuLk5g','http://127.0.0.1:8080/posters/28.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (29,'Viuda Negra','Película','Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.','N/A','https://www.youtube.com/embed/BIn8iANwEog','http://127.0.0.1:8080/posters/29.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (30,'The Martian','Película','Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.','N/A','https://www.youtube.com/embed/XvB58bCVfng','http://127.0.0.1:8080/posters/30.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (31,'Ex-Machina','Película','Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.','N/A','https://www.youtube.com/embed/XRYL5spvEcI','http://127.0.0.1:8080/posters/31.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (32,'Jurassic World','Película','Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.','N/A','','http://127.0.0.1:8080/posters/32.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (33,'Soy leyenda','Película','Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.','N/A','https://www.youtube.com/embed/dtKMEAXyPkg','http://127.0.0.1:8080/posters/33.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (34,'El primer hombre en la luna','Película','Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.','N/A','','http://127.0.0.1:8080/posters/34.jpg');
INSERT INTO catalogo (`Id`,`Titulo`,`Categoria`,`Resumen`,`Temporadas`,`Trailer`,`Poster`) VALUES (35,'Titanes del pacífico - La insurrección','Película','Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.','N/A','','http://127.0.0.1:8080/posters/35.jpg');

INSERT INTO categorias (`Id`,`Categoria`) VALUES (1,'Serie');
INSERT INTO categorias (`Id`,`Categoria`) VALUES (2,'Película');

INSERT INTO generos (`Id`,`Genero`) VALUES (1,'Ciencia Ficción');
INSERT INTO generos (`Id`,`Genero`) VALUES (2,'Fantasía');
INSERT INTO generos (`Id`,`Genero`) VALUES (3,'Drama');
INSERT INTO generos (`Id`,`Genero`) VALUES (4,'Ficción');
INSERT INTO generos (`Id`,`Genero`) VALUES (5,'Sucesos');
INSERT INTO generos (`Id`,`Genero`) VALUES (6,'Misterio');
INSERT INTO generos (`Id`,`Genero`) VALUES (7,'Hechos verídicos');
INSERT INTO generos (`Id`,`Genero`) VALUES (8,'Crimen');
INSERT INTO generos (`Id`,`Genero`) VALUES (9,'Suspenso');
INSERT INTO generos (`Id`,`Genero`) VALUES (10,'Aventura');
INSERT INTO generos (`Id`,`Genero`) VALUES (11,'Sci-Fi');
INSERT INTO generos (`Id`,`Genero`) VALUES (12,'Acción');
INSERT INTO generos (`Id`,`Genero`) VALUES (13,'Comedia');
INSERT INTO generos (`Id`,`Genero`) VALUES (14,'Familia');
INSERT INTO generos (`Id`,`Genero`) VALUES (15,'Western');
INSERT INTO generos (`Id`,`Genero`) VALUES (16,'Tecnología');
INSERT INTO generos (`Id`,`Genero`) VALUES (17,'Terror');
INSERT INTO generos (`Id`,`Genero`) VALUES (18,'Historia');
INSERT INTO generos (`Id`,`Genero`) VALUES (19,'Intriga');
INSERT INTO generos (`Id`,`Genero`) VALUES (20,'¿Ficción?');
INSERT INTO generos (`Id`,`Genero`) VALUES (21,'Hechos veríficos');









