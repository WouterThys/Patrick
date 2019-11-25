USE `ww`;
DROP procedure IF EXISTS `usersSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersSelectAll`()
BEGIN

	SELECT * FROM users;

END$$
DELIMITER ;