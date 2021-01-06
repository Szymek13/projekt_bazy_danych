-- Procedura wyświetla wszystkie dane producenta w zależności od jego pochodzenia
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedura_pochodzenie`(IN pochodzenie_producenta VARCHAR(32))
BEGIN
SELECT * FROM producent
WHERE pochodzenie = pochodzenie_producenta;
END

-- Procedura wyświetla wszystkie dane albumu w zależności od jego rodzaju
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedura_rodzaj`(IN rodzaj_albumu VARCHAR(10))
BEGIN
SELECT * FROM album
WHERE rodzaj = rodzaj_albumu;
END