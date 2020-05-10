USE `ww`;
DROP procedure IF EXISTS `jobinputtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO jobinputtypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	valueType,
	inputType,
	valueOptions,
	required,
	units,
	overwrite,
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
	valueType,
	inputType,
	valueOptions,
	required,
	units,
	overwrite,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;