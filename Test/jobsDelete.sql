USE `ww`;
DROP procedure IF EXISTS `jobsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM jobs WHERE id = deleteId;
END$$

DELIMITER ;