USE `ww`;
DROP procedure IF EXISTS `linkmachinesoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkmachinesoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkmachinesoperations WHERE
		machineId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;