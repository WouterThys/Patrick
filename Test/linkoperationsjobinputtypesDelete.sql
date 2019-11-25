USE `ww`;
DROP procedure IF EXISTS `linkoperationsjobinputtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkoperationsjobinputtypesDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkoperationsjobinputtypes WHERE
		operationId = primaryKey AND
		jobInputTypeId = foreignKey;
END$$

DELIMITER ;