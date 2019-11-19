USE `ww`;
DROP procedure IF EXISTS `sourcesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM sources WHERE id = deleteId;
END$$

DELIMITER ;