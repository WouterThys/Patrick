USE `ww`;
DROP procedure IF EXISTS `operationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsSelectAll`()
BEGIN

	SELECT * FROM operations;

END$$
DELIMITER ;