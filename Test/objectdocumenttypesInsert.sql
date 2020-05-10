USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  color int (11),
  flagId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO objectdocumenttypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	color,
	flagId,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	color,
	flagId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;