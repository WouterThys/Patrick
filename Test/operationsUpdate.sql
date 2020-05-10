USE `ww`;
DROP procedure IF EXISTS `operationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  isPricePerHour tinyint (4),
  isWorkingHours tinyint (4),
  isWorkWatch tinyint (4),
  isAllTerminals tinyint (4),
  isAskAmounts tinyint (4),
  isAskNextJobTime tinyint (4),
  isAskLocation tinyint (4),
  isMultiUser tinyint (4),
  isMultiMachine tinyint (4),
  nextActionAfter int (11),
  jobOption int (11),
  machineOption int (11),
  userOption int (11),
  subOperationId int (11),
  warningType int (11),
  warningValue double ,
  alarmType int (11),
  alarmValue double ,
  updateId int
)
BEGIN
  UPDATE
	operations
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	typeId = typeId,
	isPricePerHour = isPricePerHour,
	isWorkingHours = isWorkingHours,
	isWorkWatch = isWorkWatch,
	isAllTerminals = isAllTerminals,
	isAskAmounts = isAskAmounts,
	isAskNextJobTime = isAskNextJobTime,
	isAskLocation = isAskLocation,
	isMultiUser = isMultiUser,
	isMultiMachine = isMultiMachine,
	nextActionAfter = nextActionAfter,
	jobOption = jobOption,
	machineOption = machineOption,
	userOption = userOption,
	subOperationId = subOperationId,
	warningType = warningType,
	warningValue = warningValue,
	alarmType = alarmType,
	alarmValue = alarmValue,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;