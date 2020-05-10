USE `ww`;
DROP procedure IF EXISTS `linkusertypesmachinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkusertypesmachinesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkusertypesmachines WHERE
		userTypeId = primaryKey AND
		machineId = foreignKey;
END$$

DELIMITER ;