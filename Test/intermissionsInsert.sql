USE `ww`;
DROP procedure IF EXISTS `intermissionsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO intermissions(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
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
	warningType,
	warningValue,
	alarmType,
	alarmValue,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;