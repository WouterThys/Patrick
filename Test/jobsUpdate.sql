USE `ww`;
DROP procedure IF EXISTS `jobsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsUpdate`(
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
  updateId int
)
BEGIN
  UPDATE
	jobs
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	state = state,
	plannedStart = plannedStart,
	plannedEnd = plannedEnd,
	actualStart = actualStart,
	actualEnd = actualEnd,
	jobSheetId = jobSheetId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;