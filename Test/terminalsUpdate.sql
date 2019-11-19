USE `ww`;
DROP procedure IF EXISTS `terminalsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  userId int (11),
  color int (11),
  serverUpdateInterval bigint (20),
  registrationInterval bigint (20),
  closeAfterInterval bigint (20),
  clearMemoryAfterStart tinyint (4),
  exitCode varchar (4),
  updateId int
)
BEGIN
  UPDATE
	terminals
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	typeId = typeId,
	userId = userId,
	color = color,
	serverUpdateInterval = serverUpdateInterval,
	registrationInterval = registrationInterval,
	closeAfterInterval = closeAfterInterval,
	clearMemoryAfterStart = clearMemoryAfterStart,
	exitCode = exitCode,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;