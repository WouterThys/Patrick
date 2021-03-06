USE `ww`;
DROP procedure IF EXISTS `operationtypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	operationtypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;