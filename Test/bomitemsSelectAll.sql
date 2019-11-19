USE `ww`;
DROP procedure IF EXISTS `bomitemsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsSelectAll`()
BEGIN

	SELECT * FROM bomitems;

END$$

DELIMITER ; 