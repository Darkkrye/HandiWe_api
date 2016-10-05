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
  licenceNum varchar(45),
  clubName varchar(255),
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
-- Table structure for table `Lieux`
--

CREATE TABLE IF NOT EXISTS Lieux (
  idLIEUX int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  type varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  addressComplement1 varchar(255),
  addressComplement2 varchar(255),
  zipCode char(5),
  city varchar(45),
  telephone char(14),
  accountantName varchar(255),
  hasMaterial boolean,
  hasFreeAccess boolean,

  PRIMARY KEY (idLIEUX)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Disponibilite`
--

CREATE TABLE IF NOT EXISTS Disponibilite (
  idDISPONIBILITE int(11) NOT NULL AUTO_INCREMENT,
  jour ENUM('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'),

  PRIMARY KEY (idDISPONIBILITE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Heure`
--

CREATE TABLE IF NOT EXISTS Heure (
  idHOUR int(11) NOT NULL AUTO_INCREMENT,
  beginningHour int NOT NULL,
  endHour int NOT NULL,

  PRIMARY KEY (idHOUR)
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
  idLIEUX int(11) NOT NULL,
  idSPORT int(11) NOT NULL,

  PRIMARY KEY (idLIEUX, idSPORT)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `HAS_HOURS`
--

CREATE TABLE IF NOT EXISTS HAS_HOURS (
  idHOUR int(11) NOT NULL,
  idDISPONIBILITE int(11) NOT NULL,

  PRIMARY KEY (idHOUR, idDISPONIBILITE)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


--
-- Table structure for table `ORGANIZE`
--

CREATE TABLE IF NOT EXISTS ORGANIZE (
  idUSER int(11) NOT NULL,
  idSPORT int(11) NOT NULL,
  idDISPONIBILITE int(11) NOT NULL,
  zipCode char(5) NOT NULL,

  PRIMARY KEY (idUSER, idSPORT, idDISPONIBILITE)
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

ALTER TABLE CORRESPOND ADD CONSTRAINT fk_lieux_sport FOREIGN KEY (idLIEUX) REFERENCES Lieux(idLieux);
ALTER TABLE CORRESPOND ADD CONSTRAINT fk_sport_lieux FOREIGN KEY (idSPORT) REFERENCES Sport(idSport);

ALTER TABLE IS_INTERESTED_BY ADD CONSTRAINT fk_user_sport FOREIGN KEY (idUSER) REFERENCES User(idUSER);
ALTER TABLE IS_INTERESTED_BY ADD CONSTRAINT fk_sport_user FOREIGN KEY (idSPORT) REFERENCES Sport(idSPORT);

ALTER TABLE HAS_HOURS ADD CONSTRAINT fk_disponibilite_heure FOREIGN KEY (idDISPONIBILITE) REFERENCES Disponibilite(idDISPONIBILITE);
ALTER TABLE HAS_HOURS ADD CONSTRAINT fk_heure_disponibilite FOREIGN KEY (idHOUR) REFERENCES Heure(idHOUR);

ALTER TABLE ORGANIZE ADD CONSTRAINT fk_sport_user_disponibilite FOREIGN KEY (idSPORT) REFERENCES Sport(idSPORT);
ALTER TABLE ORGANIZE ADD CONSTRAINT fk_user_sport_disponibilite FOREIGN KEY (idUSER) REFERENCES User(idUSER);
ALTER TABLE ORGANIZE ADD CONSTRAINT fk_disponibilite_user_sport FOREIGN KEY (idDISPONIBILITE) REFERENCES Disponibilite(idDISPONIBILITE);
