USE `ww`;
DROP procedure IF EXISTS `linkusersusertypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkusersusertypesInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkusersusertypes(
		userId,
		userTypeId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;