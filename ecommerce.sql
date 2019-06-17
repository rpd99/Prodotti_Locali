DROP database IF EXISTS ecommerce; 
CREATE database ecommerce; 
USE ecommerce; 

CREATE TABLE utente (
    email varchar(50) not null primary key, 
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    telefono varchar(15) not null, 
    cap char(5) not null, 
    via varchar(30) not null, 
    n_civico int not null, 
    nazione varchar(25) not null,
    citta varchar(50) not null,
    password_utente varchar(30) not null,
    isAdmin tinyint(1)
);

INSERT INTO utente (email,nome,cognome, telefono, cap, via, n_civico, nazione, citta, password_utente,isAdmin) 
VALUES ('a@gmail.com',mario,inglese, '3384255568', '83040', 'via piani', 22, 'italia', 'roma', 'aaa',0); 

INSERT INTO utente (email,nome,cognome, telefono, cap, via, n_civico, nazione, citta, password_utente,isAdmin) 
VALUES ('b@gmail.com',luca, rossi, '3287244801', '82010', 'via alo moro', 12, 'italia', 'milano', 'bbb',0); 

INSERT INTO utente (email,nome,cognome, telefono, cap, via, n_civico, nazione, citta, password_utente,isAdmin)  
VALUES ('c@gmail.com',giacomo,verdi, '3216239801', '83510', 'via rossi', 12, 'italia', 'napoli', 'ccc',0); 

INSERT INTO utente (email,nome,cognome, telefono, cap, via, n_civico, nazione, citta, password_utente,isAdmin)  
VALUES ('admin@gmail.com',marco,bruno, '3216239801', '83510', 'via rossi', 12, 'italia', 'napoli', 'ccc',1); 




  CREATE TABLE categoria (
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(100) NOT NULL,
  img mediumblob,
  PRIMARY KEY (nome)
  );
  
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('legumi', 'legumi', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('fruttaSecca', 'fruttaSecca', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('cereali', 'cereali', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('aromi', 'aromi', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('frutta', 'frutta', NULL);
INSERT INTO categoria (nome, descrizione, img)   
VALUES ('semi', 'semi', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('conserve', 'conserve', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('miele', 'miele', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('farine', 'farine', NULL);
  
  CREATE TABLE prodotto (
  codice INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(90) NOT NULL,
  prezzo FLOAT NOT NULL,
  peso FLOAT NULL,
  pezzi_disponibili INT NOT NULL,
  categoria VARCHAR(45) NOT NULL,
  img mediumblob,
  PRIMARY KEY (codice),  
  FOREIGN KEY (categoria) references categoria(nome)
  ON DELETE CASCADE ON UPDATE CASCADE
  ) AUTO_INCREMENT = 1;
  
  
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ( 'zucchine sottolio', 'sei bicchieri', 1.99, 0.435, 3, 'conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ( 'set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'conserve');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'cereali');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'cereali');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'cereali');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'cereali');
  
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'farine');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'farine');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'farine');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'farine');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'farine');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'farine');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'legumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'legumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'legumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'legumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'legumi');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'semi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'semi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'semi');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'aromi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'aromi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'aromi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'aromi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'aromi');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'frutta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'frutta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'frutta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'frutta');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'fruttaSecca');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'fruttaSecca');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'fruttaSecca');

  CREATE TABLE ordine (
  codice INT NOT NULL AUTO_INCREMENT,
  dataOrdine DATETIME NOT NULL,
  ind_sped VARCHAR(45) NOT NULL,
  stato VARCHAR(45) NOT NULL,
  num_prodotti INT NOT NULL,
  data_spedizione DATETIME NOT NULL,
  cliente VARCHAR(50) NOT NULL,
  prezzo FLOAT NOT NULL,
  PRIMARY KEY (codice),
  FOREIGN KEY (cliente) REFERENCES utente(email)
  ON DELETE CASCADE ON UPDATE CASCADE
  ) AUTO_INCREMENT = 1;
  
INSERT INTO ordine (dataOrdine, ind_sped, stato, num_prodotti, data_spedizione, cliente, prezzo) 
VALUES ('2019-01-20', 'via Rossi', 'Pagato', 12, '2019-01-22', 'a@gmail.com', 10.5);

INSERT INTO ordine (dataOrdine, ind_sped, stato, num_prodotti, data_spedizione, cliente, prezzo) 
VALUES ('2019-01-15', 'via Verdi', 'Pagato', 12, '2019-01-30', 'c@gmail.com', 20.4);
  
  CREATE TABLE relativo (
  quantita  INT NOT NULL,
  ordine INT NOT NULL,
  prodotto varchar(20) NOT NULL,
  PRIMARY KEY(ordine, prodotto),
  FOREIGN KEY (ordine) references ordine(codice)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (prodotto) references prodotto(codice)
  ON DELETE CASCADE ON UPDATE CASCADE
  );

INSERT INTO relativo (quantita , ordine, prodotto) 
VALUES (10, 1, '00007');

INSERT INTO relativo (quantita , ordine, prodotto) 
VALUES (2, 2, '00006');

INSERT INTO relativo (quantita , ordine, prodotto) 
VALUES (1, 2, '00008');

INSERT INTO relativo (quantita , ordine, prodotto) 
VALUES (6, 2, '00005');

INSERT INTO relativo (quantita , ordine, prodotto) 
VALUES (3, 1, '00005');

CREATE TABLE carrello (
 cliente varchar(50) NOT NULL PRIMARY KEY,
 FOREIGN KEY (cliente) REFERENCES utente(email)
 ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE relativo_a(
 carrello varchar(50) NOT NULL ,
 prodotto varchar(50) NOT NULL ,
 quantita int,
     PRIMARY KEY(carrello,prodotto), 
 FOREIGN KEY (carrello) REFERENCES carrello(cliente)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (prodotto) REFERENCES prodotto(codice)
 ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE images(
	nome varchar(30) NOT NULL,
	img mediumblob,
	PRIMARY KEY(nome)
);
