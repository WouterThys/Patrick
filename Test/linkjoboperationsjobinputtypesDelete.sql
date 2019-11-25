USE `ww`;
DROP procedure IF EXISTS `linkjoboperationsjobinputtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkjoboperationsjobinputtypesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkjoboperationsjobinputtypes WHERE
		jobId = primaryKey AND
		jobOperationId = foreignKey;
END$$

DELIMITER ;