USE `ww`;
DROP procedure IF EXISTS `translationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsSelectAll`()
BEGIN

	SELECT * FROM translations;

END$$
DELIMITER ;