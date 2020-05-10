USE `ww`;
DROP procedure IF EXISTS `intermissionsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM intermissions WHERE id = deleteId;
END$$

DELIMITER ;