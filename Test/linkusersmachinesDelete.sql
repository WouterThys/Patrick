USE `ww`;
DROP procedure IF EXISTS `linkusersmachinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkusersmachinesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkusersmachines WHERE
		userId = primaryKey AND
		machineId = foreignKey;
END$$

DELIMITER ;