USE `ww`;
DROP procedure IF EXISTS `logsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsSelectAll`()
BEGIN

	SELECT * FROM logs;

END$$

DELIMITER ; 