USE `ww`;
DROP procedure IF EXISTS `objectdocumentsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  description varchar (255),
  objectName varchar (45),
  objectId int (11),
  documentPath varchar (255),
  originalPath varchar (255),
  androidPath varchar (255),
  OUT lid int
)
BEGIN
  INSERT INTO objectdocuments(	
	sourceId,
	sourceKey,
	code,
	description,
	objectName,
	objectId,
	documentPath,
	originalPath,
	androidPath,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	description,
	objectName,
	objectId,
	documentPath,
	originalPath,
	androidPath,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;