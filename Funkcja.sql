-- Funkcja wyświetla rodzaj albumu w zależności od podanej ilości utworów
CREATE DEFINER=`root`@`localhost` FUNCTION `rodzaj_albumu`(ilosc_utworow int(2)) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE rodzaj varchar(10);

IF ilosc_utworow = 1 THEN
	SET rodzaj = 'Singiel';
ELSEIF (ilosc_utworow >= 2 AND ilosc_utworow <= 9) THEN
	SET rodzaj = 'EP';
ELSEIF ilosc_utworow >=10 THEN
	SET rodzaj = 'Album';
END IF;

RETURN rodzaj;
END