USE `ww`;
DROP procedure IF EXISTS `joboperationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsSelectAll`()
BEGIN

	SELECT * FROM joboperations;

END$$
DELIMITER ;