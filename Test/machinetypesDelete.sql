USE `ww`;
DROP procedure IF EXISTS `machinetypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM machinetypes WHERE id = deleteId;
END$$

DELIMITER ;