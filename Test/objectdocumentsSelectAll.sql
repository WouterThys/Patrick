USE `ww`;
DROP procedure IF EXISTS `objectdocumentsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsSelectAll`()
BEGIN

	SELECT * FROM objectdocuments;

END$$
DELIMITER ;