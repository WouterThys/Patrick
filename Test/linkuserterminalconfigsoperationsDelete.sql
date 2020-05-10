USE `ww`;
DROP procedure IF EXISTS `linkuserterminalconfigsoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkuserterminalconfigsoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkuserterminalconfigsoperations WHERE
		configId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;