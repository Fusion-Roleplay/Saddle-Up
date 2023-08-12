
CREATE TABLE IF NOT EXISTS `playershops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `charidentifier` int(11) NOT NULL DEFAULT 0,
  `items` longtext NOT NULL DEFAULT '[]',
  `weapons` longtext NOT NULL DEFAULT '[]',
  `price` float NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `slots` int(11) NOT NULL DEFAULT 0,
  `coords` longtext NOT NULL DEFAULT '[]',
  `owned` int(11) DEFAULT 0,
  `blip` int(11) DEFAULT 1,
  `ledger` double DEFAULT 0,
  `level` int(255) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `items` (`items`(768)),
  KEY `weapons` (`weapons`(768))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `society_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society` varchar(50) NOT NULL DEFAULT '0',
  `items` longtext NOT NULL DEFAULT '[]',
  `weapons` longtext NOT NULL DEFAULT '[]',
  `slots` int(11) NOT NULL DEFAULT 50,
  `level` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

