DROP DATABASE trailerflix;
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
SELECT C.Id AS Id, C.titulo, C.resumen, C.temporadas, C.categoria, C.trailer, C.poster, T.Titulo as Genero, R.Reparto as Reparto
FROM Catalogo C 
JOIN Vista_Tags T ON T.IdTitulo = C.Id
JOIN Vista_Reparto R ON R.IdTitulo = C.Id;





