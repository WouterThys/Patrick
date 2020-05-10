USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO userterminalconfigs(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;