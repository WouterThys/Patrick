USE `ww`;
DROP procedure IF EXISTS `userprofilesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofilesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM userprofiles WHERE id = deleteId;
END$$

DELIMITER ;