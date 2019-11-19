USE `ww`;
DROP procedure IF EXISTS `terminalsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  userId int (11),
  color int (11),
  serverUpdateInterval bigint (20),
  registrationInterval bigint (20),
  closeAfterInterval bigint (20),
  clearMemoryAfterStart tinyint (4),
  exitCode varchar (4),
  OUT lid int
)
BEGIN
  INSERT INTO terminals(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	userId,
	color,
	serverUpdateInterval,
	registrationInterval,
	closeAfterInterval,
	clearMemoryAfterStart,
	exitCode,
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
	userId,
	color,
	serverUpdateInterval,
	registrationInterval,
	closeAfterInterval,
	clearMemoryAfterStart,
	exitCode,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;