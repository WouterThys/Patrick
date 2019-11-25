USE `ww`;
DROP procedure IF EXISTS `linkcellsmachinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkcellsmachinesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkcellsmachines WHERE
		cellId = primaryKey AND
		machineId = foreignKey;
END$$

DELIMITER ;