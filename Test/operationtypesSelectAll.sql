USE `ww`;
DROP procedure IF EXISTS `operationtypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesSelectAll`()
BEGIN

	SELECT * FROM operationtypes;

END$$

DELIMITER ; 