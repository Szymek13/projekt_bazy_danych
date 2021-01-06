CREATE TABLE album (id_albumu int PRIMARY KEY auto_increment, 
	rodzaj varchar(7), 
    autor int, 
    nazwa varchar(64), 
    gatunek int, 
    data_premiery date, 
    ilosc_utworow int(2));
    
CREATE TABLE festiwal (id_festiwalu int PRIMARY KEY auto_increment, 
	nazwa varchar(64), 
    gospodarz int, 
    kraj varchar(32));
    
CREATE TABLE gatunek (id_gatunku int PRIMARY KEY auto_increment, 
	gatunek varchar(32));
    
CREATE TABLE producent (id_producenta int PRIMARY KEY auto_increment, 
	imie varchar(32), 
    nazwisko varchar(64), 
    pseudonim varchar(64), 
    gatunek int, 
    pochodzenie varchar(64), 
    wytwornia int, 
    festiwal int);
    
CREATE TABLE wytwornia (id_wytworni int PRIMARY KEY auto_increment, 
	nazwa varchar(64), 
    gatunek int, 
    zalozyciel int, 
    siedziba varchar(64));