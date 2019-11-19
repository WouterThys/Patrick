USE `ww`;
DROP procedure IF EXISTS `terminaltypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM terminaltypes WHERE id = deleteId;
END$$

DELIMITER ;