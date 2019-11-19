USE `ww`;
DROP procedure IF EXISTS `terminalsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsSelectAll`()
BEGIN

	SELECT * FROM terminals;

END$$

DELIMITER ; 