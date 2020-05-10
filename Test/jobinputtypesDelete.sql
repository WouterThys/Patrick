USE `ww`;
DROP procedure IF EXISTS `jobinputtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM jobinputtypes WHERE id = deleteId;
END$$

DELIMITER ;