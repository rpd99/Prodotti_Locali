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
VALUES ('a@gmail.com', 'Mario', 'Rossi', 'Mariorossi98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin) 
VALUES ('b@gmail.com', 'Luca', 'Gialli', 'Lucagialli98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin)
VALUES ('c@gmail.com', 'Giacomo', 'Verdi', 'Giacomoverdi98', 0); 

INSERT INTO utente (email,nome,cognome, password_utente,isAdmin)
VALUES ('admin@gmail.com', 'Marco', 'Rossi', 'Marcorossi98', 1); 

  CREATE TABLE categoria (
  nome VARCHAR(45) NOT NULL,
  descrizione VARCHAR(900) NOT NULL,
  img mediumblob,
  PRIMARY KEY (nome)
  );
  
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('Miele', 'Il miele è un alimento prodotto dalle api (ed in misura minore, da altri imenotteri). Viene prodotto a partire dal nettare o dalla melata. La melata, con un gusto molto dolce simile allo zucchero, è prodotta da vari omotteri, fitomizi, i cui escrementi zuccherini sono la base alimentare per numerosi insetti. Il nettare Ã¨ bottinato sui fiori di moltissime piante. Il miele in parte Ã¨ usato come nutrimento dalle api e in parte è trasformato in cera d api per costruire le celle esagonali', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('Olio', 'Scopri la fragranza vibrante dei piu pregiati extra-vergine locali, ottenuti da blend accuratamente combinati o da singole cultivar: estratte con metodi tradizionali entro poche ore dalla raccolta, le differenti varietÃ  di olio extra-vergine dâ€™oliva porteranno sulla tavola gli infiniti profumi e sapori della loro terra dâ€™origine. Entra nei piÃ¹ antichi frantoi e ordina i condimenti perfetti da abbinare alle tue pietanze: sarà  il produttore stesso a prepararli e spedirli direttamente a casa tua.', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('Pasta', 'La pasta o pasta alimentare è un alimento a base di farina di diversa estrazione, tipico delle varie cucine regionali d Italia, divisa in piccole forme regolari destinate alla cottura in acqua bollente e sale o con calore umido e salato.', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('Salumi', 'Scopri i salumi piu pregiati, preparati ancora oggi proprio come si faceva una volta: facendo tesoro degli antichi saperi contadini, selezionando scrupolosamente la materia prima e lavorando i prodotti manualmente e con cura. Entra nei migliori laboratori e ordina le loro specialitÃ : sarÃ  il produttore stesso a prepararle e spedirle direttamente a casa tua.', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('Conserve', 'Le conserve alimentari sono in grado di coniugare nel migliore dei modi la voglia di prodotti saporiti e di qualità  con la necessità  di praticità  tipica dei nostri tempi. Le conserve alimentari, infatti, permettono di gustare determinati alimenti anche molto tempo dopo il momento in cui sono stati invasettati, e quindi al di fuori dalla loro stagione tipica.', NULL);
INSERT INTO categoria (nome, descrizione, img)   
VALUES ('Tartufo', 'Tartufo è il nome comune con il quale sono indicati i corpi fruttiferi (sporocarpi) di funghi che compiono il loro intero ciclo vitale sotto terra (ipogei) appartenenti al genere Tuber. Devono obbligatoriamente vivere in simbiosi con piante arboree per produrre il prezioso sporocarpo. Sono formati da una parete esterna detta peridio, il quale puÃ² essere liscio o sculturato e di colore variabile dal chiaro allo scuro. La massa interna, detta gleba, di colore variabile dal bianco al nero, dal rosa al marrone è percorsa da venature più o meno ampie e ramificate che delimitano degli alveoli in cui sono immerse delle grosse cellule (gli aschi) contenenti le spore. Le caratteristiche morfologiche del peridio, della gleba, degli aschi e delle spore, sommati alla dimensione ed alle caratteristiche organolettiche, permettono la identificazione delle specie di tartufo.', NULL);
INSERT INTO categoria (nome, descrizione, img)  
VALUES ('Torrone', 'Il torrone è un dolce italiano principalmente natalizio. Esso è composto da albume d uovo, miele e zucchero, farcito con mandorle, noci, arachidi o nocciole tostate; spesso ricoperto da due strati d ostia. Il suo nome deriva dal verbo latino torrÄ“re che significa abbrustolire con riferimento alla tostatura delle nocciole che lo compongono.', NULL);
INSERT INTO categoria (nome, descrizione, img) 
VALUES ('Vino', 'Scopri i vitigni più raffinati e le loro migliori annate sorseggiando i vini che hanno fatto e continuano ancora oggi a scrivere la storia dell enologia italiana. Scoprirai le peculiarità  e la identità  che legano ogni vino al suo territorio, alle tecniche di coltivazione e ai processi di invecchiamento. Entra nelle migliori aziende vinicole e ordina le loro esclusive bottiglie: sarÃ  il produttore stesso a confezionarle e spedirle direttamente a casa tua.', NULL);
  
  CREATE TABLE prodotto (
  codice INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL unique,
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
VALUES ( 'Acacia', 'Dal colore dorato chiaro, trasparente, e dal sapore delicato; Esso è un dolcificate ideale da aggiungere a tutti i tipi di bevande calde, anche nel caffè.', 17.99, 0.7, 3, 'Miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ( 'Millefiori', 'Il Miele di Millefiori ha un colore ambrato e il suo sapore è delicatamente aromatico, gradevole e pieno. è indicato in generale nelle situazioni di affaticamento, anemia, convalescenza, come sedativo per la tosse ed è anche utile per chi fa attività sportiva.', 8.5, 0.4, 8, 'Miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tiglio', 'Il Miele di Tiglio ha un colore giallo chiaro, un sapore leggermente balsamico e un gusto dolce e delicato. è un consigliato antispasmodico, sedativo delle insonnie, diuretico e calmante della tosse.', 9.99, 0.4, 7, 'Miele');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Castagno', 'Gli alveari della apicoltura di questo tipo di miele sono collocati in aree boschive, o nelle vicinanze di aziende agricole ad agricoltura biologica, lontano da intense emissioni inquinanti, come cittÃ , strade, fabbriche, discariche.', 14, 0.4, 20, 'Miele');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Extravergine', 'Il nostro olio è di categoria fruttato leggero, si presenta con un colore giallo dorato con sfumature verdi. Ha un sentore di carciofo sotto il quale è avvertibile una mandorla dolce. Leggermente amaro e poco piccante, i sentori di verde percepiti all olfatto si evidenziano durante l assaggio.', 17.99, 1, 30, 'Olio');
  
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Sfogliatelle', 'Sfogliatelle fatte a mano ripine di ricotta e spinaci', 11, 1, 10, 'Pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Fusilli', 'Fusilli fatti a mano secondo la antica ricetta avellinese', 8, 1, 32, 'Pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tagliatelle', 'Pasta all uovo prodotta effettuando una meticolosa ricerca delle materie prime della più elevata qualità , utilizzando soltanto semola di grano duro e uova fresche', 8, 1, 12, 'Pasta');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tortelli', 'Da una ricetta tipica della tradizione leggermente rivisitata, Sapore Campano ha selezionato per voi i tortelloni con ripieno di ricotta e spinaci di Pasta Mario. Cuoceteli in pentola e scolateli leggermente al dente, per finire la cotture in padella con abbondante burro, salvia e parmigiano. Cosi buoni che sembrano fatti in casa!', 19.99, 1, 8, 'Pasta');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Capicollo', 'Parte anteriore del lombo salata a mano, in budello naturale. Stagionatura 4/6 mesi. Peso da 2.5 a 3.5 kg ca. Ingredienti: sale e pepe nero spezzato.', 24.99, 2.5, 10, 'Salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Filetto', 'Parte anteriore del lombo salataÂ  aÂ  mano, in budello naturale. Stagionatura: 3 / 4 mesi. Peso: da 1.2 a 4 kg ca. Ingredienti: sale e pepe nero spezzato.', 40, 3.5, 8, 'Salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Pancetta', 'Parte della pancia del suino squadrata, rifilata e salata a mano. Stagionatura: 2/4 mesi. Peso da:  3 a 4.5 kg ca. Ingredienti: sale e pepe nero spezzato.', 22, 3.5, 32, 'Salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Prosciutto', 'Coscia posteriore del suino rifilata, salata, massaggiata e sugnata a mano. Stagionatura: 16/20 mesi. Peso: da 10 a 14 kg c.a. Ingredienti: solo sale.', 56, 12, 15, 'Salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Salsiccia', 'Insaccato di carni scelte di prosciutto e spalla, macinatura media, in budello naturale. Stagionatura 30/40 gg. Peso 110 gr ca. Ingredienti sale e pepe.', 14.99, 0.110, 23, 'Salumi');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Soppressata', 'Insaccato di carni scelte di prosciutto e lombo, macinatura grossa, legata a mano, in budello naturale. Stagionatura: 50/60 giorni. Peso: 270gr circa. Ingredienti: sale e pepe.', 12, 0.3, 4, 'Salumi');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Carciofi', '', 14.99, 0.5, 3, 'Conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Friarielli', 'La ricetta dei cosidetti Friarielli prevede che broccoli di prima qualitÃ  siano soffritti in olio extravergine di oliva insieme ad uno spicchio di aglio (per dare profumo) e del peperoncino, subito dopo essere stati scottati nell olio bollente, questi vengono conditi con un filo di olio extravergine a crudo e gustati da soli o accompagnati a delle salsicce, famosissimo è il piatto tipico campano Salsicce e Friarielli. Ingredienti: Broccoli 65%, olio extra vergine di oliva cultivar Ravece, aceto di vino, sale, peperoncino.', 9.99, 1, 30, 'Conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Melanzane', 'Ingredienti: Melanzane, Olio extravergine dâ€™oliva, Aceto, Sale e Aromi naturali. Melanzane a filetto, una prelibata sinfonia di sapori della tradizione campana. Una volta aperto il vasetto, ricoprire di olio dopo ogni uso, e conservare possibilmente in frigorifero.', 5, 0.5, 9, 'Conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Olive', 'Queste olive hanno straordinaria polpositÃ  e pur restando croccanti, dolcissime e succulente, speciali negli antipasti e come snack, una vera goduria da spizzicare in ogni momento della giornata.', 6.99, 1, 10, 'Conserve');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Peperoni', 'Ingredienti: Peperoni ripieni, olio di semi di girasole, piante aromatiche, aceto di vino, sale, antiossidante E300-E330', 5, 0.5, 33, 'Conserve');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tartufo bianco', 'Considerato il tartufo più pregiato sia per le sue caratteristiche organolettiche che per la scarsità di esemplari che se ne reperiscono ogni anno. Ad oggi non è possibile coltivarlo. Ha un profumo intenso, lievemente formaggioso, e conferisce personalità ai piatti anche quando usato in piccole quantità. Essendo una specialità per intenditori, il Tartufo Bianco fresco è perfetto anche come idea regalo raffinata e originale. Le pezzature inviate sono miste.', 139.99, 1, 28, 'Tartufo');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tartufo estivo', 'Il tartufo estivo fresco è il prodotto ideale per chi vuole avvicinarsi al mondo del tartufo: aroma equilibrato, più economico del famoso tartufo nero pregiato e ingrediente ideale per dare un tocco in più alle tue ricette. In più, il gusto di un portare a tavola un tartufo appena raccolto e la bellezza del gesto di grattare, spolverare e litigare per l ultima lamella. Molti lo conoscono come scorzone, per la sua scorza ruvida e verrucosa. In realtà, il tartufo estivo prende il suo nome dalla sua caratteristica più evidente, la stagionalità.', 119.99, 1, 4, 'Tartufo');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tartufo nero', 'Il Tartufo Nero Pregiato fresco, detto anche Tartufo Nero di Norcia, si raccoglie dal 15 novembre al 15 marzo. Il profumo intenso ed aromatico del Tartufo Nero Pregiato ed il sapore deciso ma equilibrato lo hanno reso il re della tavola anche perchè può essere cotto senza che il suo aroma ne risenta. Prezioso e profumato, può costituire una idea regalo originale ed utile per i buongustai.', 144.99, 1, 15, 'Tartufo');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Tartufo uncinato', 'Il Tartufo Uncinato fresco, detto anche Scorzone Invernale, si raccoglie dal 1 Ottobre al 31 Dicembre. La selezione in vendita è di provenienza italiana, ha profumo e sapore delicati e ben delineati, con note di nocciola, porcino e grana. Perfetto per molteplici usi in cucina, sia cotto che crudo. Le pezzature inviate sono miste.', 129.99, 1, 5, 'Tartufo');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Mandorlato', 'Torrone friabile alla mandorla. Ancora oggi prodotto secondo la antica ricetta che gli dona un gusto straordinario', 4.99, 0.14, 23, 'Torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Golosino', 'Torrone tenero al cioccolato e nocciole. Creato nel 1950, oggi è uno dei torroni morbidi piÃ¹ apprezzati dalla clientela', 4.99, 0.14, 3, 'Torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Montigo', 'Torrone tenero al rhum. Il miglior rhum giamaicano per rendere ancora più dolce il torrone morbido.', 4.99, 0.14, 30, 'Torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Morbidello', 'Torrone tenero alle mandorle ricoperto di puro cioccolato fondente al 60% di cacao. Gusto delicato ed uno strato di cioccolato sono le sue caratteristiche principali', 4.99, 0.14, 8, 'Torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Sorrento', 'Torrone tenero alle noci. Torrone di altissima qualità, ricco di noci e miele italiano', 4.99, 0.14, 3, 'Torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Torroncini attimi', 'Deliziosi bocconcini di torrone al pan di spagna dal sapore inconfondibile', 4.99, 0.5, 33, 'Torrone');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Torroncini misti', 'Torroncini alla mandorla, pan di spagna e croccantino', 4.99, 0.5, 7, 'Torrone');

INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Greco di tufo', 'Il Greco di Tufo è una delle poche varietà bianche ad avere una alta propensione all invecchiamento.Questo antico e prestigioso vitigno è stato portato nella provincia di Avellino dai Pelagi, dalla Tessaglia in Grecia, nel primo secolo avanti Cristo', 11.90, 0.75, 7, 'Vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria) 
VALUES ('Falanghina', 'Giallo paglierino chiaro con riflessi verdognoli, al naso esprime un carattere fresco e fruttato, caratterizzato da spiccate note di agrumi, ananas e fiori bianchi. Al palato è piacevole e persistente, equilibrato da un piacevole retrogusto fruttato.', 13.90, 0.75, 10, 'Vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Fiano', 'Giallo paglierino con leggeri riflessi dorati. Offre moltissimi toni olfattivi, tra cui profumi di fiori bianchi, mela e pera, oltre alla inconfondibile sentore di nocciola tostata. All assaggio conferma l olfattiva, con la nocciola che domina nuovamente, accompagnando verso una chiusura fresca e minerale.', 11.90, 0.75, 7, 'Vino');
INSERT INTO prodotto ( nome, descrizione, prezzo, peso, pezzi_disponibili, categoria)  
VALUES ('Aglianico', 'Rosso rubino scuro, al naso esprime note di grande eleganza che riportano subito la mente ai grandi Aglianico del Vulture. Sentori di frutta rossa si affiancano a note di tabacco e vaniglia prima di incedere in una affascinante mineralità vulcanica, addirittura impreziosita da un lontano ricordo agrumato. In bocca è secco, suadente, insospettabilmente fresco e di grande equilibrio. Un assaggio reattivo, vellutato, lunghissimo.', 14.99, 0.75, 3, 'Vino');


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
