CREATE VIEW Vista_Catalogo AS
SELECT C.Id AS IdCatalogo, C.titulo, C.resumen, C.temporadas, C.categoria, C.trailer, C.poster, T.Titulo as Genero, R.Reparto as Reparto
FROM Catalogo C 
JOIN Vista_Tags T ON T.IdTitulo = C.Id
JOIN Vista_Reparto R ON R.IdTitulo = C.Id;

CREATE VIEW Vista_ActricesyActores AS
SELECT IdTitulo, A.Actor  
FROM Actricesyactores A
JOIN Catalogo_Reparto R ON A.Id = R.IdActor;

CREATE VIEW Vista_Reparto AS
SELECT IdTitulo, GROUP_CONCAT( Actor ORDER BY IdTitulo DESC SEPARATOR ', ') AS Reparto
FROM Vista_ActricesyActores
GROUP BY IdTitulo;

CREATE VIEW Vista_Generos AS 
SELECTgenero, T.IdTitulo AS
FROM Generos G 
JOIN Catalogo_Tags T ON T.Idgen = G.ID;

CREATE VIEW Vista_Tags AS 
SELECT IdTitulo, GROUP_CONCAT( genero ORDER BY IdTitulo DESC SEPARATOR ', ') AS Titulo
FROM Vista_Generos 
GROUP BY IdTitulo;