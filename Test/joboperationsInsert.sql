USE `ww`;
DROP procedure IF EXISTS `joboperationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO joboperations(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	sequence,
	jobId,
	operationId,
	state,
	plannedStart,
	plannedEnd,
	actualStart,
	actualEnd,
	amount,
	leadTime,
	productionTime,
	isTimePerPiece,
	createdByRegistration,
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
	sequence,
	jobId,
	operationId,
	state,
	plannedStart,
	plannedEnd,
	actualStart,
	actualEnd,
	amount,
	leadTime,
	productionTime,
	isTimePerPiece,
	createdByRegistration,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;