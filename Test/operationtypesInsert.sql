USE `ww`;
DROP procedure IF EXISTS `operationtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO operationtypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;