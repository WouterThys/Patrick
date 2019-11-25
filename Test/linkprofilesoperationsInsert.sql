USE `ww`;
DROP procedure IF EXISTS `linkprofilesoperationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkprofilesoperationsInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkprofilesoperations(
		profileId,
		operationId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;