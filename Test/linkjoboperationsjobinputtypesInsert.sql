USE `ww`;
DROP procedure IF EXISTS `linkjoboperationsjobinputtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkjoboperationsjobinputtypesInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkjoboperationsjobinputtypes(
		jobId,
		jobOperationId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;