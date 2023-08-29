CREATE TABLE IF NOT EXISTS `underground_ranches` (
  `ranchid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ownercharid` int(11) NOT NULL,
  `ownersteamid` varchar(255) NOT NULL,
  PRIMARY KEY (`ranchid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `underground_employees` (
  `ranchid` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL,
  `tasksperformed` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`ranchid`,`position`,`steamid`,`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `underground_animals` (
  `ranchid` int(11) NOT NULL,
  `animalid` int(11) NOT NULL,
  `animaltype` varchar(255) NOT NULL,
  `animalmodel` varchar(255) NOT NULL,
  `animalcolor` varchar(255) NOT NULL,
  `animalname` varchar(255) NOT NULL,
  `animalgender` varchar(255) NOT NULL,
  `animalage` int(11) NOT NULL,
  `collectAmount` int(11) NOT NULL,
  `lastProductTime` int(11) NOT NULL,
  `animalhunger` int(11) NOT NULL,
  `animalthirst` int(11) NOT NULL,
  `animalHealth` int(11) NOT NULL,
  `breedingState` int(11) NOT NULL,
  `breedingTime` int(11) NOT NULL,
  `animalPosStatus` int(11) NOT NULL,
  PRIMARY KEY (`ranchid`,`animalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `underground_objects` (
  `ranchid` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `h` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownersteamid` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `lastupdated` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
