USE `ww`;
DROP procedure IF EXISTS `targettypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesSelectAll`()
BEGIN

	SELECT * FROM targettypes;

END$$

DELIMITER ; 