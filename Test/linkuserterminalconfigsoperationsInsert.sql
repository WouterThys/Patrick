USE `ww`;
DROP procedure IF EXISTS `linkuserterminalconfigsoperationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkuserterminalconfigsoperationsInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkuserterminalconfigsoperations(
		configId,
		operationId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;