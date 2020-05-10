USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectdocumenttypes WHERE id = deleteId;
END$$

DELIMITER ;