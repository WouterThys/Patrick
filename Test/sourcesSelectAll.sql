USE `ww`;
DROP procedure IF EXISTS `sourcesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesSelectAll`()
BEGIN

	SELECT * FROM sources;

END$$

DELIMITER ; 