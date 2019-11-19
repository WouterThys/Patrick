USE `ww`;
DROP procedure IF EXISTS `joboperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM joboperations WHERE id = deleteId;
END$$

DELIMITER ;