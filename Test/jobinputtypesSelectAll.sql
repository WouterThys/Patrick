USE `ww`;
DROP procedure IF EXISTS `jobinputtypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesSelectAll`()
BEGIN

	SELECT * FROM jobinputtypes;

END$$
DELIMITER ;