USE `ww`;
DROP procedure IF EXISTS `usersDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM users WHERE id = deleteId;
END$$

DELIMITER ;