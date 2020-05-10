USE `ww`;
DROP procedure IF EXISTS `targettypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM targettypes WHERE id = deleteId;
END$$

DELIMITER ;