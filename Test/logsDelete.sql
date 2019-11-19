USE `ww`;
DROP procedure IF EXISTS `logsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM logs WHERE id = deleteId;
END$$

DELIMITER ;