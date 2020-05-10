USE `ww`;
DROP procedure IF EXISTS `sourcesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesUpdate`(
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
	sources
  SET	
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