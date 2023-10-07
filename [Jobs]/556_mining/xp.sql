ALTER TABLE `characters`
	ADD COLUMN `minexp` INT(11) NULL DEFAULT '0' AFTER `LastLogin`,
	ADD COLUMN `stonecutxp` INT(11) NULL DEFAULT '0' AFTER `minexp`;