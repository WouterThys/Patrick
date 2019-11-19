USE `ww`;
DROP procedure IF EXISTS `objectflagsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  objectName varchar (45),
  iconIndex int (11),
  OUT lid int
)
BEGIN
  INSERT INTO objectflags(	
	sourceId,
	sourceKey,
	code,
	objectName,
	iconIndex,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	objectName,
	iconIndex,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;