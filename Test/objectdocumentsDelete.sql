USE `ww`;
DROP procedure IF EXISTS `objectdocumentsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectdocuments WHERE id = deleteId;
END$$

DELIMITER ;