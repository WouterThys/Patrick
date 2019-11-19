USE `ww`;
DROP procedure IF EXISTS `targetsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO targets(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	email,
	fixedPhone,
	mobilePhone,
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
	email,
	fixedPhone,
	mobilePhone,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;