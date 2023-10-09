CREATE TABLE IF NOT EXISTS `diseases` (
  `charid` int(11) NOT NULL,
  `diseases` longtext DEFAULT '{}',
  PRIMARY KEY (`charid`),
  CONSTRAINT `charid_fk` FOREIGN KEY (`charid`) REFERENCES `characters` (`charidentifier`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `hospital` (
  `hospital` varchar(50) NOT NULL,
  PRIMARY KEY (`hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `hospital` (`hospital`) VALUES
	('Saint Denis Hospital');

CREATE TABLE IF NOT EXISTS `hospital_notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital` varchar(50) NOT NULL DEFAULT '',
  `written_by` int(11) NOT NULL DEFAULT 0,
  `date` bigint(20) NOT NULL DEFAULT 0,
  `note` longtext NOT NULL,
  `patient` int(11) DEFAULT NULL,
  PRIMARY KEY (`note_id`) USING BTREE,
  KEY `hospital` (`hospital`),
  CONSTRAINT `hospital` FOREIGN KEY (`hospital`) REFERENCES `hospital` (`hospital`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;