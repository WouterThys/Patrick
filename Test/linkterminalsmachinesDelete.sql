USE `ww`;
DROP procedure IF EXISTS `linkterminalsmachinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkterminalsmachinesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkterminalsmachines WHERE
		terminalId = primaryKey AND
		machineId = foreignKey;
END$$

DELIMITER ;