USE `ww`;
DROP procedure IF EXISTS `messagesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesSelectAll`()
BEGIN

	SELECT * FROM messages;

END$$
DELIMITER ;