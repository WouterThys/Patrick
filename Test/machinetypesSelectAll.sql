USE `ww`;
DROP procedure IF EXISTS `machinetypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesSelectAll`()
BEGIN

	SELECT * FROM machinetypes;

END$$

DELIMITER ; 