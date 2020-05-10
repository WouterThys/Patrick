USE `ww`;
DROP procedure IF EXISTS `linkoperationsjobinputtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkoperationsjobinputtypesInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkoperationsjobinputtypes(
		operationId,
		jobInputTypeId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;