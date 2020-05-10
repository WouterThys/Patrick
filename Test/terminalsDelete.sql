USE `ww`;
DROP procedure IF EXISTS `terminalsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM terminals WHERE id = deleteId;
END$$

DELIMITER ;