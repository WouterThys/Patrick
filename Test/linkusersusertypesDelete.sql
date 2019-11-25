USE `ww`;
DROP procedure IF EXISTS `linkusersusertypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkusersusertypesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkusersusertypes WHERE
		userId = primaryKey AND
		userTypeId = foreignKey;
END$$

DELIMITER ;