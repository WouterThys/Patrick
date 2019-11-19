USE `ww`;
DROP procedure IF EXISTS `registrationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsSelectAll`()
BEGIN

	SELECT * FROM registrations;

END$$

DELIMITER ; 