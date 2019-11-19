USE `ww`;
DROP procedure IF EXISTS `usertypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usertypesSelectAll`()
BEGIN

	SELECT * FROM usertypes;

END$$

DELIMITER ; 