USE `ww`;
DROP procedure IF EXISTS `operationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM operations WHERE id = deleteId;
END$$

DELIMITER ;