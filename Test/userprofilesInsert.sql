USE `ww`;
DROP procedure IF EXISTS `userprofilesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofilesInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO userprofiles(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	canViewJobs,
	canViewData,
	canViewSettings,
	canOpenControlCenter,
	canOpenTerminal,
	canOpenMonitor,
	machineFeature,
	machineTypeFeature,
	cellFeature,
	cellTypeFeature,
	operationFeature,
	operationTypeFeature,
	terminalFeature,
	terminalTypeFeature,
	userFeature,
	userTypeFeature,
	userProfileFeature,
	objectDocumentTypeFeature,
	intermissionFeature,
	jobInputTypeFeature,
	sourceFeature,
	targetFeature,
	targetTypeFeature,
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
	canViewJobs,
	canViewData,
	canViewSettings,
	canOpenControlCenter,
	canOpenTerminal,
	canOpenMonitor,
	machineFeature,
	machineTypeFeature,
	cellFeature,
	cellTypeFeature,
	operationFeature,
	operationTypeFeature,
	terminalFeature,
	terminalTypeFeature,
	userFeature,
	userTypeFeature,
	userProfileFeature,
	objectDocumentTypeFeature,
	intermissionFeature,
	jobInputTypeFeature,
	sourceFeature,
	targetFeature,
	targetTypeFeature,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;