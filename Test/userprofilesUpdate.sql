USE `ww`;
DROP procedure IF EXISTS `userprofilesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofilesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  canViewJobs tinyint (4),
  canViewData tinyint (4),
  canViewSettings tinyint (4),
  canOpenControlCenter tinyint (4),
  canOpenTerminal tinyint (4),
  canOpenMonitor tinyint (4),
  machineFeature int (11),
  machineTypeFeature int (11),
  cellFeature int (11),
  cellTypeFeature int (11),
  operationFeature int (11),
  operationTypeFeature int (11),
  terminalFeature int (11),
  terminalTypeFeature int (11),
  userFeature int (11),
  userTypeFeature int (11),
  userProfileFeature int (11),
  objectDocumentTypeFeature int (11),
  intermissionFeature int (11),
  jobInputTypeFeature int (11),
  sourceFeature int (11),
  targetFeature int (11),
  targetTypeFeature int (11),
  updateId int
)
BEGIN
  UPDATE
	userprofiles
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	canViewJobs = canViewJobs,
	canViewData = canViewData,
	canViewSettings = canViewSettings,
	canOpenControlCenter = canOpenControlCenter,
	canOpenTerminal = canOpenTerminal,
	canOpenMonitor = canOpenMonitor,
	machineFeature = machineFeature,
	machineTypeFeature = machineTypeFeature,
	cellFeature = cellFeature,
	cellTypeFeature = cellTypeFeature,
	operationFeature = operationFeature,
	operationTypeFeature = operationTypeFeature,
	terminalFeature = terminalFeature,
	terminalTypeFeature = terminalTypeFeature,
	userFeature = userFeature,
	userTypeFeature = userTypeFeature,
	userProfileFeature = userProfileFeature,
	objectDocumentTypeFeature = objectDocumentTypeFeature,
	intermissionFeature = intermissionFeature,
	jobInputTypeFeature = jobInputTypeFeature,
	sourceFeature = sourceFeature,
	targetFeature = targetFeature,
	targetTypeFeature = targetTypeFeature,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;