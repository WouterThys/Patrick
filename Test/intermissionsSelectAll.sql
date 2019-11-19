USE `ww`;
DROP procedure IF EXISTS `intermissionsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsSelectAll`()
BEGIN

	SELECT * FROM intermissions;

END$$

DELIMITER ; 