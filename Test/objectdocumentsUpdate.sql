USE `ww`;
DROP procedure IF EXISTS `objectdocumentsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  description varchar (255),
  objectName varchar (45),
  objectId int (11),
  documentPath varchar (255),
  originalPath varchar (255),
  androidPath varchar (255),
  updateId int
)
BEGIN
  UPDATE
	objectdocuments
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	description = description,
	objectName = objectName,
	objectId = objectId,
	documentPath = documentPath,
	originalPath = originalPath,
	androidPath = androidPath,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;