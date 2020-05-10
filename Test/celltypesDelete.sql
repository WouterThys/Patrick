USE `ww`;
DROP procedure IF EXISTS `celltypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM celltypes WHERE id = deleteId;
END$$

DELIMITER ;