USE `ww`;
DROP procedure IF EXISTS `machinesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO machines(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	costPricePerHour,
	sellPricePerHour,
	isStationary,
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
	typeId,
	costPricePerHour,
	sellPricePerHour,
	isStationary,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;