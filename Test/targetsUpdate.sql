USE `ww`;
DROP procedure IF EXISTS `targetsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  email varchar (128),
  fixedPhone varchar (128),
  mobilePhone varchar (128),
  updateId int
)
BEGIN
  UPDATE
	targets
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
	email = email,
	fixedPhone = fixedPhone,
	mobilePhone = mobilePhone,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;