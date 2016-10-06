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
-- Table structure for table `Voiture`
--

CREATE TABLE IF NOT EXISTS Voiture (
  idVOITURE int(11) NOT NULL AUTO_INCREMENT,
  modele varchar(45) NOT NULL,
  annee int(4) NOT NULL,
  wheelchairSeat int(1) NOT NULL,
  seat int(1) NOT NULL,
  ramp varchar(45) NOT NULL,
  image varchar(500) NOT NULL,
  city varchar(45) NOT NULL,
  departement varchar(45) NOT NULL,
  ownerName varchar(45) NOT NULL,
  priceDay int NOT NULL,
  isReserved boolean NOT NULL DEFAULT FALSE,

  PRIMARY KEY (idVOITURE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

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
