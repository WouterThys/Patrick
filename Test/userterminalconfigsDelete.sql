USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM userterminalconfigs WHERE id = deleteId;
END$$

DELIMITER ;