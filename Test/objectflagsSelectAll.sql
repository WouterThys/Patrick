USE `ww`;
DROP procedure IF EXISTS `objectflagsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsSelectAll`()
BEGIN

	SELECT * FROM objectflags;

END$$

DELIMITER ; 