USE `ww`;
DROP procedure IF EXISTS `translationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM translations WHERE id = deleteId;
END$$

DELIMITER ;