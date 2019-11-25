USE `ww`;
DROP procedure IF EXISTS `linkterminalscellsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkterminalscellsInsert`(
	primaryKey int(11),
	foreignKey int(11),
	OUT lid int
)
BEGIN
	INSERT INTO linkterminalscells(
		terminalId,
		cellId)
	VALUES (
		primaryKey,
		foreignKey);
	SET lid = last_insert_id();
END$$

DELIMITER ;