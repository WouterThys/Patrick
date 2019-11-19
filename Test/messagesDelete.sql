USE `ww`;
DROP procedure IF EXISTS `messagesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM messages WHERE id = deleteId;
END$$

DELIMITER ;