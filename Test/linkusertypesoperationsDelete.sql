USE `ww`;
DROP procedure IF EXISTS `linkusertypesoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkusertypesoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkusertypesoperations WHERE
		userTypeId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;