USE `ww`;
DROP procedure IF EXISTS `bomitemsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM bomitems WHERE id = deleteId;
END$$

DELIMITER ;