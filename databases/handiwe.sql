--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS User (
  idUSER int(11) NOT NULL AUTO_INCREMENT,
  firstName varchar(45),
  lastName varchar(45),
  birthdayDate date NOT NULL,
  address varchar(255),
  addressComplement1 varchar(255),
  addressComplement2 varchar(255),
  zipCode char(5),
  city varchar(45),
  mail varchar(45) NOT NULL,
  telephone char(14),
  isProtected boolean,
  image varchar(500),

  PRIMARY KEY (idUSER)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Handicap`
--

CREATE TABLE IF NOT EXISTS Handicap (
  idHANDICAP int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255),
  type varchar(255),

  PRIMARY KEY (idHANDICAP)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sport`
--

CREATE TABLE IF NOT EXISTS Sport (
  idSPORT int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255),
  image varchar(255),

  PRIMARY KEY (idSPORT)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Place`
--

CREATE TABLE IF NOT EXISTS Place (
  idPLACE int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  type varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  addressComplement1 varchar(255),
  addressComplement2 varchar(255),
  zipCode char(5),
  city varchar(45),
  mail varchar(50),
  telephone char(14),
  accountantName varchar(255),
  hasMaterial boolean,
  hasFreeAccess boolean,

  PRIMARY KEY (idPLACE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Availability`
--

CREATE TABLE IF NOT EXISTS Availability (
  idAVAILABILITY int(11) NOT NULL AUTO_INCREMENT,
  jour ENUM('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'),

  PRIMARY KEY (idAVAILABILITY)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Hour`
--

CREATE TABLE IF NOT EXISTS Hour (
  idHOUR int(11) NOT NULL AUTO_INCREMENT,
  beginningHour int NOT NULL,
  endHour int NOT NULL,

  PRIMARY KEY (idHOUR)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Licence`
--

CREATE TABLE IF NOT EXISTS Licence (
  idLICENCE int(11) NOT NULL AUTO_INCREMENT,
  licenceNum varchar(45) NOT NULL,
  clubName varchar(255) NOT NULL,
  idUSER int(11) NOT NULL,

  PRIMARY KEY (idLICENCE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------



--
-- Table structure for table `Message`
--

CREATE TABLE IF NOT EXISTS Message (
  idMESSAGE int(11) NOT NULL AUTO_INCREMENT,
  message text NOT NULL,
  sendDate date NOT NULL,
  idCONVERSATIONUSERA int(11) NOT NULL,
  idCONVERSATIONUSERB int(11) NOT NULL,

  PRIMARY KEY (idMESSAGE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `CONVERSATION`
--

CREATE TABLE IF NOT EXISTS CONVERSATION (
  idUSERA int(11) NOT NULL,
  idUSERB int(11) NOT NULL,

  PRIMARY KEY (idUSERA, idUSERB)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HAS_FAVORITE`
--

CREATE TABLE IF NOT EXISTS HAS_FAVORITE (
  idUSER int(11) NOT NULL,
  idFAVORITE int(11) NOT NULL,

  PRIMARY KEY (idUSER, idFAVORITE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HAS_HANDICAP`
--

CREATE TABLE IF NOT EXISTS HAS_HANDICAP (
  idUSER int(11) NOT NULL,
  idHANDICAP int(11) NOT NULL,

  PRIMARY KEY (idUSER, idHANDICAP)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `IS_INTERESTED_BY`
--

CREATE TABLE IF NOT EXISTS IS_INTERESTED_BY (
  idUSER int(11) NOT NULL,
  idSPORT int(11) NOT NULL,

  PRIMARY KEY (idUSER, idSPORT)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `CORRESPOND`
--

CREATE TABLE IF NOT EXISTS CORRESPOND (
  idPLACE int(11) NOT NULL,
  idSPORT int(11) NOT NULL,

  PRIMARY KEY (idPLACE, idSPORT)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `HAS_HOURS`
--

CREATE TABLE IF NOT EXISTS HAS_HOURS (
  idHOUR int(11) NOT NULL,
  idAVAILABILITY int(11) NOT NULL,

  PRIMARY KEY (idHOUR, idAVAILABILITY)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `ORGANIZE`
--

CREATE TABLE IF NOT EXISTS ORGANIZE (
  idUSER int(11) NOT NULL,
  idSPORT int(11) NOT NULL,
  idAVAILABILITY int(11) NOT NULL,
  zipCode char(5) NOT NULL,

  PRIMARY KEY (idUSER, idSPORT, idAVAILABILITY)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Foreign Keys
--

ALTER TABLE HAS_FAVORITE ADD CONSTRAINT fk_user_user FOREIGN KEY (idUSER) REFERENCES User(idUSER);
ALTER TABLE HAS_FAVORITE ADD CONSTRAINT fk_user_favorite FOREIGN KEY (idFAVORITE) REFERENCES User(idUSER);

ALTER TABLE HAS_HANDICAP ADD CONSTRAINT fk_handicap_user FOREIGN KEY (idHANDICAP) REFERENCES Handicap(idHANDICAP);
ALTER TABLE HAS_HANDICAP ADD CONSTRAINT fk_user_handicap FOREIGN KEY (idUSER) REFERENCES User(idUSER);

ALTER TABLE CORRESPOND ADD CONSTRAINT fk_place_sport FOREIGN KEY (idPLACE) REFERENCES Place(idPlace);
ALTER TABLE CORRESPOND ADD CONSTRAINT fk_sport_place FOREIGN KEY (idSPORT) REFERENCES Sport(idSport);

ALTER TABLE IS_INTERESTED_BY ADD CONSTRAINT fk_user_sport FOREIGN KEY (idUSER) REFERENCES User(idUSER);
ALTER TABLE IS_INTERESTED_BY ADD CONSTRAINT fk_sport_user FOREIGN KEY (idSPORT) REFERENCES Sport(idSPORT);

ALTER TABLE HAS_HOURS ADD CONSTRAINT fk_availability_hour FOREIGN KEY (idAVAILABILITY) REFERENCES Availability(idAVAILABILITY);
ALTER TABLE HAS_HOURS ADD CONSTRAINT fk_hour_availability FOREIGN KEY (idHOUR) REFERENCES Hour(idHOUR);

ALTER TABLE Licence ADD CONSTRAINT fk_user_licence FOREIGN KEY (idUSER) REFERENCES Licence(idLICENCE);

ALTER TABLE ORGANIZE ADD CONSTRAINT fk_sport_user_availability FOREIGN KEY (idSPORT) REFERENCES Sport(idSPORT);
ALTER TABLE ORGANIZE ADD CONSTRAINT fk_user_sport_availability FOREIGN KEY (idUSER) REFERENCES User(idUSER);
ALTER TABLE ORGANIZE ADD CONSTRAINT fk_availability_user_sport FOREIGN KEY (idAVAILABILITY) REFERENCES Availability(idAVAILABILITY);

ALTER TABLE CONVERSATION ADD CONSTRAINT fk_user_user_conversation FOREIGN KEY (idUSERA) REFERENCES User(idUSER);
ALTER TABLE CONVERSATION ADD CONSTRAINT fk_user_conversation FOREIGN KEY (idUSERB) REFERENCES User(idUSER);

ALTER TABLE Message ADD CONSTRAINT fk_conversation_message FOREIGN KEY (idCONVERSATIONUSERA, idCONVERSATIONUSERB) REFERENCES CONVERSATION(idUSERA, idUSERB);


-- --------------------------------------------------------
-- --------------------------------------------------------
-- -----------------------CHALLENGE------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Table structure for table `Cars`
--

CREATE TABLE IF NOT EXISTS Cars (
  idCARS int(11) NOT NULL AUTO_INCREMENT,
  marque varchar(45) NOT NULL,
  modele varchar(45) NOT NULL,
  annee int(4) NOT NULL,
  wheelchairSeat int(1) NOT NULL,
  seat int(1) NOT NULL,
  ramp varchar(45) NOT NULL,
  image varchar(500) NOT NULL,
  city varchar(45) NOT NULL,
  county varchar(45) NOT NULL,
  ownerName varchar(45) NOT NULL,
  priceDay int NOT NULL,
  isReserved boolean NOT NULL DEFAULT FALSE,

  PRIMARY KEY (idCARS)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

INSERT INTO Cars (marque, modele, annee, wheelchairSeat, seat, ramp, image, city, county, ownerName, priceDay) VALUES
("Renault", "Trafic", 2004, 1, 6, "électrique", "https://www.wheeliz.com/media/cache/car__car_show__slide/23698/236aee1759a243f874bfd8a184b4a455a14ed8eb.jpeg", "Cugnaux", "31", "Jean-Claude", 44),
("Renault", "Kangoo", 2003, 1, 4, "électrique", "https://www.wheeliz.com/media/cache/car__car_show__slide/14918/d7b68561d6f4608d599ccdf70fefead9a64fdb3e.jpeg", "Vezins", "49", "Adrien", 52),
("Renault", "Kangoo", 2003, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/10010/aa66822a9e47f96a41bbf6c2a65b442ae78257bc.jpeg", "Paris", "75", "Charlotte", 37),
("Renault", "Kangoo", 2013, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/23612/5573626627f5f429f1adbe1d0e4e025239c053a7.jpeg", "Tomblaine", "54", "Bernadette", 58),
("Fiat", "Scudo", 2010, 1, 6, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/36468/dec7df5381f78fca45fd7eea331a1f0519f9fe3c.png", "Anglet", "64", "Serge", 55),
("Fiat", "Dobblo", 2005, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/12348/e93965dcecf4b92e58b31a3603d72bf6a55dc4b9.jpeg", "Nanterre", "92", "Thamoures", 99),
("Renault", "Kangoo", 2008, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/33054/d3db820854bc3f01bebbd99a1f5cc6d80cc82e3a.jpeg", "Montauban", "82", "Camille", 39),
("Fiat", "Dobblo", 2014, 4, 3, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/11599/e7f8ed182790113ff97e8c67876715c976be5c1f.jpeg", "Molsheim", "67", "Dominique", 52),
("Renault", "Kangoo", 2007, 1, 4, "électrique", "https://www.wheeliz.com/media/cache/car__car_show__slide/10932/d5ab47e61ee39402b4021ee91c26223db22223cd.jpeg", "Anglet", "64", "Stéphane", 52),
("Renault", "Kangoo", 2009, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/12187/c3d61341dceefeb1f65e3fde716c57245a6da6a4.jpeg", "Bessenay", "69", "Alain", 52),
("Ford", "Transit", 2010, 3, 8, "électrique", "https://www.wheeliz.com/media/cache/car__car_show__slide/12000/d9cbba7062dc5becb002c5c426cb0f090fded881.jpeg", "Labège", "31", "Umen", 52),
("Peugeot", "Expert", 2005, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/22747/24ca65467cb3ae57a8e386e0a48c29b415ca7f22.jpeg", "Bagnolet", "93", "Aminah", 66),
("Volkswagen", "Caddy", 2016, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/41379/9cafce1ca9708c46d00fda0515194ff07d77b83f.jpeg", "Villejuif", "94", "SARL Gak Location", 99),
("Opel", "Movano", 2015, 4, 3, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/41379/d14a2e08ccd2675c4cdafe96b7e60250bc860b2b.jpeg", "Villejuif", "94", "SARL Gak Location", 154),
("Opel", "Vivaro", 2015, 2, 3, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/41379/65e86f1450227b4da83bc98fa1413f41d0eec77c.jpeg", "Villejuif", "94", "SARL Gak Location", 127),
("Renault", "Express", 1996, 1, 2, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/26237/8b71346212b61361580d6bfebdb9139e1fa686a0.jpeg", "Châtillon", "92", "Mourad", 61),
("Ford", "Transit", 2008, 3, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/38813/21fc75f12848ea594a37a08c05589e92f35e5ff8.jpeg", "Boulogne-Billancourt", "92", "Gilles", 66),
("Renault", "Express", 1996, 1, 5, "électrique", "https://www.wheeliz.com/media/cache/car__car_show__slide/41038/87ce9b79f4ff59e956fa8f1e1f326286776ccd4d.jpeg", "Versailles", "78", "Jean-Marie", 77),
("Renault", "Master", 2011, 3, 8, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/78954/90a5bbb99fb46e409d376cfe22bba37825d81aa5.jpeg", "Roissy-en-France", "95", "Fast & Serious Services", 110),
("Renault", "Master", 2008, 3, 6, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/95846/b4a452ebfcc7626213345d9ccca5fc5ff07bf525.jpeg", "Saulx-Les-Chartreux", "91", "Joel", 66),
("Renault", "Master", 2007, 3, 6, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/95846/381a9399a945f2eb31d45a276b47b7ac99d63900.jpeg", "Saulx-Les-Chartreux", "91", "Joel", 66),
("Citroën", "Berlingot", 2005, 1, 4, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/44082/bb118db0473f3d5ab807b526337e0f80253338f6.jpeg", "Cergy", "95", "Marc", 66),
("Fiat", "Scudo", 2009, 1, 6, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/93119/a1f660dd913f5a54c78d6f0c003f0153b84a5c56.jpeg", "Plaisir", "78", "Kita", 66),
("Volkswagen", "Transporter", 2010, 1, 5, "électrique", "https://www.wheeliz.com/media/cache/car__car_show__slide/10218/f4cc123fcaccd11d5c9d8da522d578e640eb63c9.jpeg", "Ballancourt-sur-Essone", "91", "Xavier", 66),
("Renault", "Master", 2012, 3, 3, "manuelle", "https://www.wheeliz.com/media/cache/car__car_show__slide/48508/ab5c3c6e1e25daa79bb7697cb5a5df40115f4929.png", "Ablis", "78", "Bel Air Automobile", 66)

-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Jeu d'essai
--

INSERT INTO User(firstName, lastName, birthdayDate, address, addressComplement1, addressComplement2, zipCode, city, mail, telephone, isProtected, image) VALUES
("Pierre", "BOUDON", '1994-06-07', '101 Route de Dieppe', NULL, NULL, 27140, "Gisors", "pierre.boudon.27@gmail.com", '02.32.32.32.32', TRUE, "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/733784_10200903689818732_815511767_n.jpg?oh=8f5001c777e60d6637ec1363bfe2db85&oe=58A64F54"),
("User", "TEST", '1980-01-10', '10 Rue de Test', NULL, NULL, 75001, "Paris", "test@test.fr", '02.32.32.32.32', FALSE, "https://success.salesforce.com/resource/1470700800000/sharedlayout/img/new-user-image-default.png")
