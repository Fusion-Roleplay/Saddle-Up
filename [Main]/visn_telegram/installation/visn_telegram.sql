CREATE TABLE `visn_telegram_characters` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `telegram_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `visn_telegram_contacts` (
  `id` int(11) NOT NULL,
  `telegram_id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `number` varchar(32) NOT NULL,
  `note` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `visn_telegram_telegrams` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sender` varchar(32) NOT NULL,
  `sender_location` varchar(32) NOT NULL,
  `sender_area` varchar(32) NOT NULL,
  `receiver` varchar(32) NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT 0,
  `retrieved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `visn_telegram_characters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `character_id` (`character_id`,`telegram_id`);

ALTER TABLE `visn_telegram_contacts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visn_telegram_telegrams`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visn_telegram_characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `visn_telegram_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `visn_telegram_telegrams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `visn_telegram_characters`
  ADD CONSTRAINT `FK_CharacterId` FOREIGN KEY (`character_id`) REFERENCES `characters` (`charidentifier`);

INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `metadata`, `desc`) VALUES
('telegram', 'Telegram', 5, 1, 'item_standard', 1, '{}', 'A retrieved telegram from a post office.');