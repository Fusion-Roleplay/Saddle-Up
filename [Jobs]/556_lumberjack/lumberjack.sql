
ALTER TABLE `characters`
	ADD COLUMN `treexp` INT(11) NULL DEFAULT '0' AFTER `LastLogin`,
	ADD COLUMN `chopxp` INT(11) NULL DEFAULT '0' AFTER `treexp`,
	ADD COLUMN `planexp` INT(11) NULL DEFAULT '0' AFTER `chopxp`,
	ADD COLUMN `sawxp` INT(11) NULL DEFAULT '0' AFTER `planexp`,
	ADD COLUMN `delxp` INT(11) NULL DEFAULT '0' AFTER `sawxp`;

CREATE TABLE IF NOT EXISTS `lumberjackjob` (
  `toolprice` int(50) DEFAULT 2,
  `licenceprice` int(50) DEFAULT 2,
  `owner` int(50) DEFAULT NULL,
  `cash` int(50) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `lumberjackjob` (`toolprice`, `licenceprice`, `owner`, `cash`) VALUES (0, 0, NULL, 0);