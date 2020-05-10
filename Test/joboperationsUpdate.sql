USE `ww`;
DROP procedure IF EXISTS `joboperationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (1023),
  info varchar (1023),
  flagId int (11),
  sequence int (11),
  jobId int (11),
  operationId int (11),
  state int (11),
  plannedStart datetime ,
  plannedEnd datetime ,
  actualStart datetime ,
  actualEnd datetime ,
  amount int (11),
  leadTime int (11),
  productionTime bigint (20),
  isTimePerPiece tinyint (4),
  createdByRegistration int (11),
  updateId int
)
BEGIN
  UPDATE
	joboperations
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	sequence = sequence,
	jobId = jobId,
	operationId = operationId,
	state = state,
	plannedStart = plannedStart,
	plannedEnd = plannedEnd,
	actualStart = actualStart,
	actualEnd = actualEnd,
	amount = amount,
	leadTime = leadTime,
	productionTime = productionTime,
	isTimePerPiece = isTimePerPiece,
	createdByRegistration = createdByRegistration,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;