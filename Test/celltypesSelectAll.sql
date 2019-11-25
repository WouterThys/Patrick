USE `ww`;
DROP procedure IF EXISTS `celltypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesSelectAll`()
BEGIN

	SELECT * FROM celltypes;

END$$
DELIMITER ;