USE `ww`;
DROP procedure IF EXISTS `linkuserterminalconfigsmachinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkuserterminalconfigsmachinesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkuserterminalconfigsmachines WHERE
		configId = primaryKey AND
		machineId = foreignKey;
END$$

DELIMITER ;