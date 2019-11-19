USE `ww`;
DROP procedure IF EXISTS `registrationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM registrations WHERE id = deleteId;
END$$

DELIMITER ;