-- Zapytanie wyświetla ile rodzajów albumów znajduje się w bazie
CREATE VIEW widok1 AS 
	SELECT DISTINCT rodzaj FROM album;
    
-- Zapytanie wyświetla dane producenta, gdzie producent pochodzi z USA i id jest mniejsze lub równe 10
CREATE VIEW widok2 AS 
	SELECT * FROM producent WHERE pochodzenie = 'amerykańskie' AND id_producenta <= 10;
    
-- Zapytanie wyświetla producentów i ich pochodzenie, którzy nie należą do żadnej wytwórni
CREATE VIEW widok3 AS 
	SELECT pseudonim, pochodzenie, wytwornia FROM producent WHERE wytwornia IS NULL;
    
-- Zapytanie liczy łączną ilość utworów w bazie
CREATE VIEW widok4 AS 
	SELECT SUM(ilosc_utworow) AS 'lacznie_utworow_w_bazie' FROM album;
    
-- Zapytanie liczy średnią liczbę utworów w bazie
CREATE VIEW widok5 AS 
	SELECT AVG(ilosc_utworow) AS 'srednia_ilosc_utworow_w_bazie' FROM album;
    
-- Zapytanie wyświetla założycieli wytwórni; dane posortowane alfabetycznie według założyciela
CREATE VIEW widok6 AS 
	SELECT wytwornia.nazwa AS nazwa_wytworni, producent.pseudonim AS zalozyciel 
		FROM wytwornia INNER JOIN producent ON wytwornia.zalozyciel = producent.id_producenta
			 ORDER BY producent.pseudonim ASC;
             
-- Zapytanie wyświetla wytwórnie, do których należą producenci oraz ich gatunek
CREATE VIEW widok7 AS 
	SELECT producent.pseudonim, wytwornia.nazwa, gatunek.gatunek 
		FROM ((producent INNER JOIN wytwornia ON producent.wytwornia = wytwornia.id_wytworni) 
			INNER JOIN gatunek ON producent.gatunek = gatunek.id_gatunku);
            
-- Zapytanie wyświetla producentów, festiwal na którym grają własny set oraz kraj wydarzenia; dane posortowane 'malejąco' według nazwy festiwalu
CREATE VIEW widok8 AS 
	SELECT producent.pseudonim, festiwal.nazwa, festiwal.kraj 
		FROM festiwal LEFT OUTER JOIN producent ON festiwal.id_festiwalu = producent.festiwal;
        
-- Zapytanie wyświetla największy album w bazie oraz jego producenta
CREATE VIEW widok9 AS 
	SELECT producent.pseudonim, album.nazwa AS 'Najwieksza_plyta_w_bazie', ilosc_utworow 
		FROM album INNER JOIN producent ON album.autor = producent.id_producenta 
			WHERE ilosc_utworow = (SELECT MAX(ilosc_utworow) FROM album);
            
-- Zapytanie wyświetla producenta albumu oraz rodzaj i nazwę albumu, który został wyprodukowany w 2019 roku
CREATE VIEW widok10 AS 
	SELECT producent.pseudonim, album.rodzaj, album.nazwa 
		FROM producent INNER JOIN album ON album.autor = producent.id_producenta 
			WHERE YEAR(data_premiery) = 2019;