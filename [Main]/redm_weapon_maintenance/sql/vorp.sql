CREATE TABLE IF NOT EXISTS `loadout_props` (
  `id` int(11) NOT NULL,
  `permDegradation` double NOT NULL DEFAULT 0,
  `degradation` double NOT NULL DEFAULT 0,
  `damage` double NOT NULL DEFAULT 0,
  `dirt` double NOT NULL DEFAULT 0,
  `soot` double NOT NULL DEFAULT 0,
  `isJammed` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;