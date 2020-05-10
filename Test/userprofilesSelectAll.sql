USE `ww`;
DROP procedure IF EXISTS `userprofilesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofilesSelectAll`()
BEGIN

	SELECT * FROM userprofiles;

END$$
DELIMITER ;