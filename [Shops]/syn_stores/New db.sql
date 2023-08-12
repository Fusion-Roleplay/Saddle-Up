ALTER TABLE `playershops` ADD COLUMN `taxledger` double DEFAULT 0;
ALTER TABLE `playershops` ADD COLUMN `repo` int(11) DEFAULT 0;
ALTER TABLE `playershops` ADD COLUMN `buyitems` longtext DEFAULT "{}";
ALTER TABLE `playershops` ADD COLUMN `webhook` longtext DEFAULT "";

ALTER TABLE `society_shops` ADD COLUMN `name` varchar(50) DEFAULT "";
ALTER TABLE `society_shops` ADD COLUMN `coords` longtext DEFAULT "{}";
ALTER TABLE `society_shops` ADD COLUMN `rank` int(11) DEFAULT 0;
ALTER TABLE `society_shops` ADD COLUMN `blip` int(11) DEFAULT 0;
ALTER TABLE `society_shops` ADD COLUMN `buyitems` longtext DEFAULT "{}";
ALTER TABLE `society_shops` ADD COLUMN `webhook` longtext DEFAULT "{}";



INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('shoptoken', 'Shop Creation License', 5, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('societytoken', 'Society Shop Creation License', 5, 1, 'item_standard', 1);

ALTER TABLE characters ADD COLUMN discordid VARCHAR(255) DEFAULT '0';

UPDATE playershops SET slots = 1000 WHERE level = 5;
