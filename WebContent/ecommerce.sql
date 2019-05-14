DROP database IF EXISTS ecommerce; 
CREATE database ecommerce; 
USE ecommerce; 

CREATE TABLE utente (
	email varchar(50) not null primary key, 
    telefono varchar(15) not null, 
    cap char(5) not null, 
    via varchar(30) not null, 
    n_civico int not null, 
    nazione varchar(25) not null,
    citta varchar(50) not null,
    password_utente varchar(30) not null
);

INSERT INTO utente (email, telefono, cap, via, n_civico, nazione, citta, password_utente) 
VALUES ('a@gmail.com', '3384255568', '83040', 'via piani', 22, 'italia', 'roma', 'aaa'); 

INSERT INTO utente (email, telefono, cap, via, n_civico, nazione, citta, password_utente) 
VALUES ('b@gmail.com', '3287244801', '82010', 'via alo moro', 12, 'italia', 'milano', 'bbb'); 

INSERT INTO utente (email, telefono, cap, via, n_civico, nazione, citta, password_utente) 
VALUES ('c@gmail.com', '3216239801', '83510', 'via rossi', 12, 'italia', 'napoli', 'ccc'); 

CREATE TABLE amministratore(
	utente varchar(50) not null primary key,
    FOREIGN KEY (utente) references utente(email)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO amministratore (utente) 
VALUES ('b@gmail.com');


CREATE TABLE cliente (
	utente varchar(50) not null primary key, 
	nome VARCHAR(20) NOT NULL,
	cognome VARCHAR(20) NOT NULL,
	FOREIGN KEY (utente) references utente(email)
    ON DELETE CASCADE ON UPDATE CASCADE
  );
  
  
INSERT INTO cliente (utente, nome, cognome) 
VALUES ('a@gmail.com', 'mario', 'rossi');

INSERT INTO cliente (utente, nome, cognome) 
VALUES ('c@gmail.com', 'giovanni', 'bianchi');

  CREATE TABLE categoria (
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(90) NOT NULL,
  img BLOB NOT NULL,
  PRIMARY KEY (nome)
  );
  
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('cereali', 'cereali', load_file('C:\\Users\\Raffaele\\git\\Prodotti_Locali\\img\\cereali.png'));
  
  CREATE TABLE prodotto (
  codice VARCHAR(20) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(90) NOT NULL,
  prezzo FLOAT NOT NULL,
  peso FLOAT NULL,
  pezzi_disponibili INT NOT NULL,
  categoria VARCHAR(45) NOT NULL,
  PRIMARY KEY (codice),  
  FOREIGN KEY (categoria) references categoria(nome)
  ON DELETE CASCADE ON UPDATE CASCADE
  );
  
  
INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00001', 'set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'cereali');
  
INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00002', 'oliera', 'per condire gli alimenti', 5.53, 0.999, 5, 'cereali');

INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00003', 'set piatti', 'set di sei piatti', 18.35, 2.320, 12, 'cereali');

INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00004', 'concime', 'concime organico liquido', 7.97, 1.460, 3, 'cereali');
  
INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00005', 'pattumiera', '100 litri con ruote', 32.60, 8.290, 14, 'cereali');

INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00006', 'telecamera sorveglianza', 'per esterni', 140.60, 0.222, 22, 'cereali');

INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00007', 'felpa adidas', 'felpa adidas colore rosso', 65.40, 0.312, 5, 'cereali');

INSERT INTO prodotto (codice, nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('00008', 'jeans', 'jeans colore blu', 51.40, 0.412, 15, 'cereali');

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
  FOREIGN KEY (cliente) REFERENCES cliente(utente)
  ON DELETE CASCADE ON UPDATE CASCADE
  ) AUTO_INCREMENT = 1;
  
INSERT INTO ordine (dataOrdine, ind_sped, stato, num_prodotti, data_spedizione, cliente, prezzo) 
VALUES ('2019-01-20', 'via Rossi', 'Pagato', 12, '2019-01-22', 'a@gmail.com', 10.5);

INSERT INTO ordine (dataOrdine, ind_sped, stato, num_prodotti, data_spedizione, cliente, prezzo) 
VALUES ('2019-01-15', 'via Verdi', 'Pagato', 12, '2019-01-30', 'c@gmail.com', 20.4);
  
  CREATE TABLE relativo (
  quantità INT NOT NULL,
  ordine INT NOT NULL,
  prodotto varchar(20) NOT NULL,
  PRIMARY KEY(ordine, prodotto),
  FOREIGN KEY (ordine) references ordine(codice)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (prodotto) references prodotto(codice)
  ON DELETE CASCADE ON UPDATE CASCADE
  );

INSERT INTO relativo (quantità, ordine, prodotto) 
VALUES (10, 1, '00007');

INSERT INTO relativo (quantità, ordine, prodotto) 
VALUES (2, 2, '00006');

INSERT INTO relativo (quantità, ordine, prodotto) 
VALUES (1, 2, '00008');

INSERT INTO relativo (quantità, ordine, prodotto) 
VALUES (6, 2, '00005');

INSERT INTO relativo (quantità, ordine, prodotto) 
VALUES (3, 1, '00005');
