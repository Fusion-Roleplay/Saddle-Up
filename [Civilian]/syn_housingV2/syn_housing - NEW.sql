
ALTER TABLE `playerhousing` ADD COLUMN `taxledger` int(11) DEFAULT '0';
ALTER TABLE `playerhousing` ADD COLUMN `motel` longtext DEFAULT '0';


INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('wood_chair', 'Wood Chair', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('leather_chair', 'Leather Chair', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('round_table', 'Round Table', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('standard_table', 'Table', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('rectangle_table', 'Rectangle Table', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('timber_table', 'Timber Table', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('crafting_fire', 'Crafting Fire', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('pota', 'House Pot', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('water_pump', 'Water Pump', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('flowerboxes', 'Flower Boxes', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('coffindecor', 'Coffin Decor', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('deer_pelt', 'Deer Pelt', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('coyote_pelt', 'Coyote Pelt', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('blanket_box', 'Blanket Box', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('gun_barrel', 'Gun Barrel', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('apple_barrel', 'Apple Barrel', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('apple_basket', 'Apple Basket', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('food_barrel', 'Food Barrel', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('washtub', 'Wash Tub', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('clothes_line', 'Clothes Line', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tool_barrel', 'Tool Barrel', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('coyote_taxidermy', 'Coyote Taxidermy', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('pheasant_taxidermy', 'Pheasant Taxidermy', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('deer_taxidermy', 'Deer Taxidermy', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('cougar_taxidermy', 'Cougar Taxidermy', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('vulture_taxidermy', 'Vulture Taxidermy', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bear_bench', 'Bear Bench', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('log_bencha', 'Log Bench 1', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('log_benchb', 'Log Bench 2', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('cloth_bench', 'Cloth Bench', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('wooden_bench', 'Wooden Bench', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('wicker_bench', 'Wicker Bench', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bwdresser', 'brown wood dresser', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bmdresser', 'brown mirror dresser', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nightstand', 'night stand', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('side_table', 'side table 1', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('side_tablea', 'side table 2', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('side_tableb', 'side table 3', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('chesta', 'chest 1', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('chestb', 'chest 2', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('lanterna', 'Lantern', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('dbcandle', 'Dbl Candle', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('candlea', 'Candle', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('smallmcandle', 'Small Melted Candle', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bcandle', 'Bottle Candle', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('obed', 'Old bed', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bunkbed', 'bunk bed', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('singlebed', 'single bed', 20, 1, 'item_standard', 1);
INSERT INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('fancydouble', 'fancy double', 20, 1, 'item_standard', 1);


ALTER TABLE `characters` ADD COLUMN `motel` longtext DEFAULT '0';

