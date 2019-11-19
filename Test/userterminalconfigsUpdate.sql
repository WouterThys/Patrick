USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsUpdate`(
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
  updateId int
)
BEGIN
  UPDATE
	userterminalconfigs
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	userId = userId,
	terminalId = terminalId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;