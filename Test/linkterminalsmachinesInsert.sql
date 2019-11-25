USE `ww`;
DROP procedure IF EXISTS `linkterminalsmachinesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkterminalsmachinesInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkterminalsmachines(
		terminalId,
		machineId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;