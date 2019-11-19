USE `ww`;
DROP procedure IF EXISTS `intermissionsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  warningType int (11),
  warningValue double ,
  alarmType int (11),
  alarmValue double ,
  updateId int
)
BEGIN
  UPDATE
	intermissions
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	warningType = warningType,
	warningValue = warningValue,
	alarmType = alarmType,
	alarmValue = alarmValue,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;