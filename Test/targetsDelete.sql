USE `ww`;
DROP procedure IF EXISTS `targetsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM targets WHERE id = deleteId;
END$$

DELIMITER ;