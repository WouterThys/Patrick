USE `ww`;
DROP procedure IF EXISTS `linkterminalscellsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkterminalscellsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkterminalscells WHERE
		terminalId = primaryKey AND
		cellId = foreignKey;
END$$

DELIMITER ;