USE `ww`;
DROP procedure IF EXISTS `machinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM machines WHERE id = deleteId;
END$$

DELIMITER ;