USE `ww`;
DROP procedure IF EXISTS `cellsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM cells WHERE id = deleteId;
END$$

DELIMITER ;