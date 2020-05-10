USE `ww`;
DROP procedure IF EXISTS `linkuserscellsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `linkuserscellsDelete`(
	primaryKey int,
	foreignKey int
)
BEGIN
	DELETE FROM linkuserscells WHERE
		userId = primaryKey AND
		cellId = foreignKey;
END$$

DELIMITER ;