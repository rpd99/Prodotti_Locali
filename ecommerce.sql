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
VALUES ('a@gmail.com', 'mario', 'rossi', 'Mariorossi98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin) 
VALUES ('b@gmail.com', 'luca', 'gialli', 'Lucagialli98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin)
VALUES ('c@gmail.com', 'giacomo', 'verdi', 'Giacomoverdi98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin)
VALUES ('admin@gmail.com', 'marco', 'rossi', 'Marcorossi98', 1); 



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
VALUES ( 'acacia', 'Dal colore dorato chiaro, trasparente, e dal sapore delicato; è un dolcificate ideale da aggiungere a tutti i tipi di bevande calde, anche nel caffè.', 17.99, 0.7, 3, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ( 'millefiori', 'Il Miele di Millefiori ha un colore ambrato e il suo sapore è delicatamente aromatico, gradevole e pieno. È indicato in generale nelle situazioni di affaticamento, anemia, convalescenza, come sedativo per la tosse ed è anche utile per chi fa attività sportiva.', 8.5, 0.4, 8, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('tiglio', 'Il Miele di Tiglio ha un colore giallo chiaro, un sapore leggermente balsamico e un gusto dolce e delicato. È un consigliato antispasmodico, sedativo delle insonnie, diuretico e calmante della tosse.', 9.99, 0.4, 7, 'miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('castagno', 'Gli alveari della apicoltura di questo tipo di miele sono collocati in aree boschive, o nelle vicinanze di aziende agricole ad agricoltura biologica, lontano da intense emissioni inquinanti, come città, strade, fabbriche, discariche.', 14, 0.4, 20, 'miele');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('exstravergine', 'il nostro olio è di categoria fruttato leggero, si presenta con un colore giallo dorato con sfumature verdi. Ha un sentore di carciofo sotto il quale è avvertibile una mandorla dolce. Leggermente amaro e poco piccante, i sentori di verde percepiti all’olfatto si evidenziano durante l’assaggio.', 17.99, 1, 30, 'olio');
  
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('sfogliatelle', 'Sfogliatelle fatte a mano ripine di ricotta e spinaci', 11, 1, 10, 'pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('fusilli', 'Fusilli fatti a mano secondo la antica ricetta avellinese', 8, 1, 32, 'pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('ziti', 'Ziti fatti a mano secondo la antica ricetta avellinese', 8, 1, 12, 'pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('pasta mista', 'Pasta mista fatta a mano con differenti tipi di farina adatta per pasta con legumi', 10, 1, 8, 'pasta');

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
VALUES ('mandorlato', 'Torrone friabile alla mandorla. Ancora oggi prodotto secondo l’antica ricetta che gli dona un gusto straordinario', 4.99, 0.14, 23, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('golosino', 'Torrone tenero al cioccolato e nocciole. Creato nel 1950, oggi è uno dei torroni morbidi più apprezzati dalla clientela', 4.99, 0.14, 3, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('montigo', 'Torrone tenero al rhum. Il miglior rhum giamaicano per rendere ancora più dolce il torrone morbido.', 4.99, 0.14, 30, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('morbidello', 'Torrone tenero alle mandorle ricoperto di puro cioccolato fondente al 60% di cacao. Gusto delicato ed uno strato di cioccolato sono le sue caratteristiche principali', 4.99, 0.14, 8, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('sorrento', 'Torrone tenero alle noci. Torrone di altissima qualità, ricco di noci e miele italiano', 4.99, 0.14, 3, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('torroncini attimi', 'Deliziosi bocconcini di torrone al pan di spagna dal sapore inconfondibile', 4.99, 0.25, 33, 'torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('torroncini misti', 'Torroncini alla mandorla, pan di spagna e croccantino', 4.99, 0.5, 7, 'torrone');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('chianti', 'Spesso nel Chianti le colline più vocate alla coltivazione del Sangiovese sono caratterizzate da suoli ricchi di sassi, denominati alberesi e galestro, da qui il nome ISASSI.', 14.99, 0.75, 4, 'vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('falanghina', 'Giallo paglierino chiaro con riflessi verdognoli, al naso esprime un carattere fresco e fruttato, caratterizzato da spiccate note di agrumi, ananas e fiori bianchi. Al palato è piacevole e persistente, equilibrato da un piacevole retrogusto fruttato.', 19.99, 0.75, 10, 'vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('fiano', 'Giallo paglierino con leggeri riflessi dorati. Offre moltissimi toni olfattivi, tra cui profumi di fiori bianchi, mela e pera, oltre all’inconfondibile sentore di nocciola tostata. All’assaggio conferma l’olfattiva, con la nocciola che domina nuovamente, accompagnando verso una chiusura fresca e minerale.', 22, 0.75, 7, 'vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('aglianico', 'Rosso rubino scuro, al naso esprime note di grande eleganza che riportano subito la mente ai grandi Aglianico del Vulture. Sentori di frutta rossa si affiancano a note di tabacco e vaniglia prima di incedere in una affascinante mineralità vulcanica, addirittura impreziosita da un lontano ricordo agrumato. In bocca è secco, suadente, insospettabilmente fresco e di grande equilibrio. Un assaggio reattivo, vellutato, lunghissimo.', 14.99, 0.75, 3, 'vino');


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
  quantita INT NOT NULL,
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

INSERT INTO images (nome, img) 
VALUES ('benessere', NULL);

