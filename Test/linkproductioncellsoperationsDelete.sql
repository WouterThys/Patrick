USE `ww`;
DROP procedure IF EXISTS `linkproductioncellsoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkproductioncellsoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkproductioncellsoperations WHERE
		productionCellId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;