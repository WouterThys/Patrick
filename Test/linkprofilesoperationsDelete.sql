USE `ww`;
DROP procedure IF EXISTS `linkprofilesoperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkprofilesoperationsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkprofilesoperations WHERE
		profileId = primaryKey AND
		operationId = foreignKey;
END$$

DELIMITER ;