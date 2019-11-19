USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesSelectAll`()
BEGIN

	SELECT * FROM objectdocumenttypes;

END$$

DELIMITER ; 