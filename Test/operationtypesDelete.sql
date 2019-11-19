USE `ww`;
DROP procedure IF EXISTS `operationtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM operationtypes WHERE id = deleteId;
END$$

DELIMITER ;