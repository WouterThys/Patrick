USE `ww`;
DROP procedure IF EXISTS `cellsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsSelectAll`()
BEGIN

	SELECT * FROM cells;

END$$

DELIMITER ; 