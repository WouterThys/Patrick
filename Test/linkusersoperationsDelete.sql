USE `ww`;
DROP procedure IF EXISTS `linkusersoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkusersoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkusersoperations WHERE
		userId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;