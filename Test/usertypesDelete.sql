USE `ww`;
DROP procedure IF EXISTS `usertypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usertypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM usertypes WHERE id = deleteId;
END$$

DELIMITER ;