USE `ww`;
DROP procedure IF EXISTS `linkcellsoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkcellsoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkcellsoperations WHERE
		cellId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;