USE `ww`;
DROP procedure IF EXISTS `objectflagsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectflags WHERE id = deleteId;
END$$

DELIMITER ;