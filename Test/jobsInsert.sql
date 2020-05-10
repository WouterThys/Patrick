USE `ww`;
DROP procedure IF EXISTS `jobsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  state int (11),
  plannedStart datetime ,
  plannedEnd datetime ,
  actualStart datetime ,
  actualEnd datetime ,
  jobSheetId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO jobs(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	state,
	plannedStart,
	plannedEnd,
	actualStart,
	actualEnd,
	jobSheetId,
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
	state,
	plannedStart,
	plannedEnd,
	actualStart,
	actualEnd,
	jobSheetId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;