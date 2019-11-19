USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  color int (11),
  flagId int (11),
  updateId int
)
BEGIN
  UPDATE
	objectdocumenttypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	color = color,
	flagId = flagId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;