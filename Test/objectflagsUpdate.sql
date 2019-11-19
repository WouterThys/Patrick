USE `ww`;
DROP procedure IF EXISTS `objectflagsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  objectName varchar (45),
  iconIndex int (11),
  updateId int
)
BEGIN
  UPDATE
	objectflags
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	objectName = objectName,
	iconIndex = iconIndex,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;