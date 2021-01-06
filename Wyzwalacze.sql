CREATE TABLE dead_album (id_albumu int PRIMARY KEY, rodzaj varchar(10), nazwa varchar(64), ilosc_utworow int(2), data_anulowania date);

-- Wyzwalacz dodaje do tabeli 'dead_album' albumy, które zostały anulowane
CREATE TRIGGER anulowane_albumy BEFORE DELETE ON album
FOR EACH ROW
INSERT INTO dead_album VALUES (old.id_albumu, old.rodzaj, old.nazwa, old.ilosc_utworow, CURRENT_DATE());

CREATE TABLE dead_kariera (id_producenta int PRIMARY KEY, imie varchar(64), nazwisko varchar(64), pseudonim varchar(32), pochodzenie varchar(32), data_odejscia date);

-- Wyzwalacz dodaje do tabeli 'dead_kariera' producentów, którzy zrezygnowali ze swojej kariery
CREATE TRIGGER emerytura BEFORE DELETE ON producent
FOR EACH ROW
INSERT INTO dead_kariera VALUES (old.id_producenta, old.imie, old.nazwisko, old.pseudonim, old.pochodzenie, CURRENT_DATE());