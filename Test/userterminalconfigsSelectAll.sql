USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsSelectAll`()
BEGIN

	SELECT * FROM userterminalconfigs;

END$$
DELIMITER ;