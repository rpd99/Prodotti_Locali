DROP database IF EXISTS ecommerce; 
CREATE database ecommerce; 
USE ecommerce; 

CREATE TABLE utente (
    email varchar(50) not null primary key, 
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    password_utente varchar(30) not null,
    isAdmin tinyint(1)
);

INSERT INTO utente (email, nome, cognome, password_utente,isAdmin) 
VALUES ('a@gmail.com', 'mario', 'inglese', 'Marioinglese98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin) 
VALUES ('b@gmail.com', 'luca', 'rossi', 'Lucarossi98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin)
VALUES ('c@gmail.com', 'giacomo', 'verdi', 'Giacomoverdi98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin)
VALUES ('admin@gmail.com', 'marco', 'bruno', 'Marcobruno98', 1); 



  CREATE TABLE categoria (
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(256) NOT NULL,
  img mediumblob,
  PRIMARY KEY (nome)
  );
  
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('miele', 'miele', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('olio', 'olio', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('pasta', 'pasta', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('salumi', 'salumi', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('sottoli', 'sottoli', NULL);
INSERT INTO categoria (nome, descrizione, img)   
VALUES ('tartufo', 'tartufo', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('torrone', 'torrone', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('vino', 'vino', NULL);
  
  CREATE TABLE prodotto (
  codice INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(800) NOT NULL,
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
VALUES ( 'zucchine sottolio', 'sei bicchieri', 1.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ( 'set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'miele');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'olio');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'olio');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'olio');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'olio');
  
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'pasta');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('capicollo', 'Parte anteriore del lombo salata a mano, in budello naturale. Stagionatura 4/6 mesi. Peso da 2.5 a 3.5 kg ca. Ingredienti: sale e pepe nero spezzato.', 24.99, 2.5, 10, 'salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('filetto', 'Parte anteriore del lombo salata  a  mano, in budello naturale. Stagionatura: 3 / 4 mesi. Peso: da 1.2 a 4 kg ca. Ingredienti: sale e pepe nero spezzato.', 40, 3.5, 8, 'salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('pancetta', 'Parte della pancia del suino squadrata, rifilata e salata a mano. Stagionatura: 2/4 mesi. Peso da:  3 a 4.5 kg ca. Ingredienti: sale e pepe nero spezzato.', 22, 3.5, 32, 'salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('prosciutto', 'Coscia posteriore del suino rifilata, salata, massaggiata e sugnata a mano. Stagionatura: 16/20 mesi. Peso: da 10 a 14 kg c.a. Ingredienti: solo sale.', 56, 12, 15, 'salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('salsiccia', 'Insaccato di carni scelte di prosciutto e spalla, macinatura media, in budello naturale. Stagionatura 30/40 gg. Peso 110 gr ca. Ingredienti sale e pepe.', 14.99, 0.110, 23, 'salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('soppressata', 'Insaccato di carni scelte di prosciutto e lombo, macinatura grossa, legata a mano, in budello naturale. Stagionatura: 50/60 giorni. Peso: 270gr circa. Ingredienti: sale e pepe.', 12, 0.3, 4, 'salumi');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('carciofi', 'Ingredienti: Peperoni ripieni, olio di semi di girasole, piante aromatiche, aceto di vino, sale, antiossidante E300-E330', 14.99, 0.5, 3, 'sottoli');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('friarielli', 'La ricetta dei cosidetti Friarielli prevede che broccoli di prima qualità siano soffritti in olio extravergine di oliva insieme ad uno spicchio di aglio (per dare profumo) e del peperoncino, subito dopo essere stati scottati nell olio bollente, questi vengono conditi con un filo di olio extravergine a crudo e gustati da soli o accompagnati a delle salsicce, famosissimo è il piatto tipico campano Salsicce e Friarielli. Ingredienti: Broccoli 65%, olio extra vergine di oliva cultivar Ravece, aceto di vino, sale, peperoncino.', 9.99, 1, 30, 'sottoli');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('melanzane', 'Ingredienti: Melanzane, Olio extravergine d’oliva, Aceto, Sale e Aromi naturali. Melanzane a filetto, una prelibata sinfonia di sapori della tradizione campana. Una volta aperto il vasetto, ricoprire di olio dopo ogni uso, e conservare possibilmente in frigorifero.', 5, 0.5, 9, 'sottoli');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('olive', 'Queste olive hanno straordinaria polposità e pur restando croccanti, dolcissime e succulente, speciali negli antipasti e come snack, una vera goduria da spizzicare in ogni momento della giornata.', 6.99, 1, 10, 'sottoli');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('peperoni', 'Ingredienti: Peperoni ripieni, olio di semi di girasole, piante aromatiche, aceto di vino, sale, antiossidante E300-E330', 5, 0.5, 33, 'sottoli');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('tartufo bianco', 'Considerato il tartufo più pregiato sia per le sue caratteristiche organolettiche che per la scarsità di esemplari che se ne reperiscono ogni anno. Ad oggi non è possibile coltivarlo. Ha un profumo intenso, lievemente formaggioso, e conferisce personalità ai piatti anche quando usato in piccole quantità. Essendo una specialità per intenditori, il Tartufo Bianco fresco è perfetto anche come idea regalo raffinata e originale. Le pezzature inviate sono miste.', 139.99, 1, 28, 'tartufo');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('tartufo estivo', 'Il tartufo estivo fresco è il prodotto ideale per chi vuole avvicinarsi al mondo del tartufo: aroma equilibrato, più economico del famoso tartufo nero pregiato e ingrediente ideale per dare un tocco in più alle tue ricette. In più, il gusto di un portare a tavola un tartufo appena raccolto e la bellezza del gesto di grattare, spolverare e litigare per l’ultima lamella. Molti lo conoscono come scorzone, per la sua scorza ruvida e verrucosa. In realtà, il tartufo estivo prende il suo nome dalla sua caratteristica più evidente, la stagionalità.', 119.99, 1, 4, 'tartufo');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('tartufo nero', 'Il Tartufo Nero Pregiato fresco, detto anche Tartufo Nero di Norcia, si raccoglie dal 15 novembre al 15 marzo. Il profumo intenso ed aromatico del Tartufo Nero Pregiato ed il sapore deciso ma equilibrato lo hanno reso il re della tavola anche perché può essere cotto senza che il suo aroma ne risenta. Prezioso e profumato, può costituire una idea regalo originale ed utile per i buongustai.', 144.99, 1, 15, 'tartufo');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('tartufo uncinato', 'Il Tartufo Uncinato fresco, detto anche Scorzone Invernale, si raccoglie dal 1 Ottobre al 31 Dicembre. La selezione in vendita è di provenienza italiana, ha profumo e sapore delicati e ben delineati, con note di nocciola, porcino e grana. Perfetto per molteplici usi in cucina, sia cotto che crudo. Le pezzature inviate sono miste.', 129.99, 1, 5, 'tartufo');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'torrone');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('set bicchieri', 'sei bicchieri', 4.99, 0.435, 3, 'vino');


  CREATE TABLE ordine (
  codice INT NOT NULL AUTO_INCREMENT,
  dataOrdine DATE NOT NULL,
  ind_sped VARCHAR(45) NOT NULL,
  stato VARCHAR(45) NOT NULL,
  data_spedizione DATE NOT NULL,
  cliente VARCHAR(50) NOT NULL,
  prezzo FLOAT NOT NULL,
  PRIMARY KEY (codice),
  FOREIGN KEY (cliente) REFERENCES utente(email)
  ON DELETE CASCADE ON UPDATE CASCADE
  ) AUTO_INCREMENT = 1;
  
  
  CREATE TABLE relativo (
  quantita  INT NOT NULL,
  ordine INT NOT NULL,
  prodotto INT NOT NULL,
  PRIMARY KEY(ordine, prodotto),
  FOREIGN KEY (ordine) references ordine(codice)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (prodotto) references prodotto(codice)
  ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE carrello (
 cliente varchar(50) NOT NULL PRIMARY KEY,
 FOREIGN KEY (cliente) REFERENCES utente(email)
 ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE relativo_a(
 carrello varchar(50) NOT NULL ,
 prodotto int NOT NULL ,
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
