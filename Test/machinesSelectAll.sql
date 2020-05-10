USE `ww`;
DROP procedure IF EXISTS `machinesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesSelectAll`()
BEGIN

	SELECT * FROM machines;

END$$
DELIMITER ;