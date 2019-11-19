USE `ww`;
DROP procedure IF EXISTS `targetsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsSelectAll`()
BEGIN

	SELECT * FROM targets;

END$$

DELIMITER ; 