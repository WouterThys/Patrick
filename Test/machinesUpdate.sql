USE `ww`;
DROP procedure IF EXISTS `machinesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  isStationary tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	machines
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
	costPricePerHour = costPricePerHour,
	sellPricePerHour = sellPricePerHour,
	isStationary = isStationary,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;