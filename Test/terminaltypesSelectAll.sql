USE `ww`;
DROP procedure IF EXISTS `terminaltypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesSelectAll`()
BEGIN

	SELECT * FROM terminaltypes;

END$$
DELIMITER ;