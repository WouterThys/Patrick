USE `ww`;
DROP procedure IF EXISTS `jobinputtypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  valueType int (11),
  inputType int (11),
  valueOptions varchar (2048),
  required tinyint (4),
  units varchar (45),
  overwrite tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	jobinputtypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	valueType = valueType,
	inputType = inputType,
	valueOptions = valueOptions,
	required = required,
	units = units,
	overwrite = overwrite,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;