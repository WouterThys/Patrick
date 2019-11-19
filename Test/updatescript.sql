USE `ww`;
DROP procedure IF EXISTS `bomitemsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM bomitems WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `bomitemsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  jobId int (11),
  jobOperationId int (11),
  amount int (11),
  units varchar (45),
  amountValidated int (11),
  amountRejected int (11),
  OUT lid int
)
BEGIN
  INSERT INTO bomitems(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	jobId,
	jobOperationId,
	amount,
	units,
	amountValidated,
	amountRejected,
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
	jobId,
	jobOperationId,
	amount,
	units,
	amountValidated,
	amountRejected,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `bomitemsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsSelectAll`()
BEGIN

	SELECT * FROM bomitems;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `bomitemsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  jobId int (11),
  jobOperationId int (11),
  amount int (11),
  units varchar (45),
  amountValidated int (11),
  amountRejected int (11),
  updateId int
)
BEGIN
  UPDATE
	bomitems
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	jobId = jobId,
	jobOperationId = jobOperationId,
	amount = amount,
	units = units,
	amountValidated = amountValidated,
	amountRejected = amountRejected,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `cellsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM cells WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `cellsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  typeId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO cells(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	typeId,
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
	color,
	typeId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `cellsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsSelectAll`()
BEGIN

	SELECT * FROM cells;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `cellsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  typeId int (11),
  updateId int
)
BEGIN
  UPDATE
	cells
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	typeId = typeId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `celltypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM celltypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `celltypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO celltypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `celltypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesSelectAll`()
BEGIN

	SELECT * FROM celltypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `celltypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	celltypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `intermissionsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM intermissions WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `intermissionsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  warningType int (11),
  warningValue double ,
  alarmType int (11),
  alarmValue double ,
  OUT lid int
)
BEGIN
  INSERT INTO intermissions(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
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
	warningType,
	warningValue,
	alarmType,
	alarmValue,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `intermissionsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsSelectAll`()
BEGIN

	SELECT * FROM intermissions;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `intermissionsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  warningType int (11),
  warningValue double ,
  alarmType int (11),
  alarmValue double ,
  updateId int
)
BEGIN
  UPDATE
	intermissions
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	warningType = warningType,
	warningValue = warningValue,
	alarmType = alarmType,
	alarmValue = alarmValue,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM jobinputtypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  valueType int (11),
  inputType int (11),
  valueOptions varchar (2048),
  required tinyint (4),
  units varchar (45),
  overwrite tinyint (4),
  OUT lid int
)
BEGIN
  INSERT INTO jobinputtypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	valueType,
	inputType,
	valueOptions,
	required,
	units,
	overwrite,
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
	valueType,
	inputType,
	valueOptions,
	required,
	units,
	overwrite,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesSelectAll`()
BEGIN

	SELECT * FROM jobinputtypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  valueType int (11),
  inputType int (11),
  valueOptions varchar (2048),
  required tinyint (4),
  units varchar (45),
  overwrite tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	jobinputtypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	valueType = valueType,
	inputType = inputType,
	valueOptions = valueOptions,
	required = required,
	units = units,
	overwrite = overwrite,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `joboperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM joboperations WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `joboperationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsSelectAll`()
BEGIN

	SELECT * FROM joboperations;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `jobsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM jobs WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `jobsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsSelectAll`()
BEGIN

	SELECT * FROM jobs;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `logsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM logs WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `logsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsInsert`(
  tag varchar (45),
  message blob ,
  type int (11),
  date datetime ,
  OUT lid int
)
BEGIN
  INSERT INTO logs(	
	tag,
	message,
	type,
	date,
	lastModified)
  VALUES(	
	tag,
	message,
	type,
	date,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `logsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsSelectAll`()
BEGIN

	SELECT * FROM logs;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `logsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsUpdate`(
  tag varchar (45),
  message blob ,
  type int (11),
  date datetime ,
  updateId int
)
BEGIN
  UPDATE
	logs
  SET	
	tag = tag,
	message = message,
	type = type,
	date = date,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM machines WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  isStationary tinyint (4),
  OUT lid int
)
BEGIN
  INSERT INTO machines(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	costPricePerHour,
	sellPricePerHour,
	isStationary,
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
	typeId,
	costPricePerHour,
	sellPricePerHour,
	isStationary,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesSelectAll`()
BEGIN

	SELECT * FROM machines;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `machinesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  isStationary tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	machines
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
	costPricePerHour = costPricePerHour,
	sellPricePerHour = sellPricePerHour,
	isStationary = isStationary,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinetypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM machinetypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinetypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO machinetypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinetypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesSelectAll`()
BEGIN

	SELECT * FROM machinetypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `machinetypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	machinetypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `messagesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM messages WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `messagesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesInsert`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  targetId int (11),
  type int (11),
  state int (11),
  body blob ,
  includeUser tinyint (4),
  includeTerminal tinyint (4),
  includeSession tinyint (4),
  includeServer tinyint (4),
  OUT lid int
)
BEGIN
  INSERT INTO messages(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
	targetId,
	type,
	state,
	body,
	includeUser,
	includeTerminal,
	includeSession,
	includeServer,
	lastModified)
  VALUES(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
	targetId,
	type,
	state,
	body,
	includeUser,
	includeTerminal,
	includeSession,
	includeServer,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `messagesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesSelectAll`()
BEGIN

	SELECT * FROM messages;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `messagesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesUpdate`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  targetId int (11),
  type int (11),
  state int (11),
  body blob ,
  includeUser tinyint (4),
  includeTerminal tinyint (4),
  includeSession tinyint (4),
  includeServer tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	messages
  SET	
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	userId = userId,
	terminalId = terminalId,
	targetId = targetId,
	type = type,
	state = state,
	body = body,
	includeUser = includeUser,
	includeTerminal = includeTerminal,
	includeSession = includeSession,
	includeServer = includeServer,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectdocumentsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectdocuments WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `objectdocumentsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsSelectAll`()
BEGIN

	SELECT * FROM objectdocuments;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectdocumenttypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  color int (11),
  flagId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO objectdocumenttypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	color,
	flagId,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	color,
	flagId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesSelectAll`()
BEGIN

	SELECT * FROM objectdocumenttypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  color int (11),
  flagId int (11),
  updateId int
)
BEGIN
  UPDATE
	objectdocumenttypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	color = color,
	flagId = flagId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectflagsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectflags WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectflagsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  objectName varchar (45),
  iconIndex int (11),
  OUT lid int
)
BEGIN
  INSERT INTO objectflags(	
	sourceId,
	sourceKey,
	code,
	objectName,
	iconIndex,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	objectName,
	iconIndex,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectflagsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsSelectAll`()
BEGIN

	SELECT * FROM objectflags;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `operationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM operations WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO operations(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	isPricePerHour,
	isWorkingHours,
	isWorkWatch,
	isAllTerminals,
	isAskAmounts,
	isAskNextJobTime,
	isAskLocation,
	isMultiUser,
	isMultiMachine,
	nextActionAfter,
	jobOption,
	machineOption,
	userOption,
	subOperationId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
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
	typeId,
	isPricePerHour,
	isWorkingHours,
	isWorkWatch,
	isAllTerminals,
	isAskAmounts,
	isAskNextJobTime,
	isAskLocation,
	isMultiUser,
	isMultiMachine,
	nextActionAfter,
	jobOption,
	machineOption,
	userOption,
	subOperationId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsSelectAll`()
BEGIN

	SELECT * FROM operations;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `operationtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM operationtypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO operationtypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationtypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesSelectAll`()
BEGIN

	SELECT * FROM operationtypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `operationtypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	operationtypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `registrationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM registrations WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `registrationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsInsert`(
  date datetime ,
  type int (11),
  info varchar (1023),
  userId int (11),
  machineId int (11),
  jobOperationId int (11),
  terminalId int (11),
  intermissionId int (11),
  jobId int (11),
  responseCode int (11),
  responseValue varchar (1023),
  amountValidated int (11),
  amountRejected int (11),
  jobInputTypeId int (11),
  inputvalue varchar (1023),
  inputType int (11),
  state int (11),
  OUT lid int
)
BEGIN
  INSERT INTO registrations(	
	date,
	type,
	info,
	userId,
	machineId,
	jobOperationId,
	terminalId,
	intermissionId,
	jobId,
	responseCode,
	responseValue,
	amountValidated,
	amountRejected,
	jobInputTypeId,
	inputvalue,
	inputType,
	state,
	lastModified)
  VALUES(	
	date,
	type,
	info,
	userId,
	machineId,
	jobOperationId,
	terminalId,
	intermissionId,
	jobId,
	responseCode,
	responseValue,
	amountValidated,
	amountRejected,
	jobInputTypeId,
	inputvalue,
	inputType,
	state,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `registrationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsSelectAll`()
BEGIN

	SELECT * FROM registrations;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `registrationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsUpdate`(
  date datetime ,
  type int (11),
  info varchar (1023),
  userId int (11),
  machineId int (11),
  jobOperationId int (11),
  terminalId int (11),
  intermissionId int (11),
  jobId int (11),
  responseCode int (11),
  responseValue varchar (1023),
  amountValidated int (11),
  amountRejected int (11),
  jobInputTypeId int (11),
  inputvalue varchar (1023),
  inputType int (11),
  state int (11),
  updateId int
)
BEGIN
  UPDATE
	registrations
  SET	
	date = date,
	type = type,
	info = info,
	userId = userId,
	machineId = machineId,
	jobOperationId = jobOperationId,
	terminalId = terminalId,
	intermissionId = intermissionId,
	jobId = jobId,
	responseCode = responseCode,
	responseValue = responseValue,
	amountValidated = amountValidated,
	amountRejected = amountRejected,
	jobInputTypeId = jobInputTypeId,
	inputvalue = inputvalue,
	inputType = inputType,
	state = state,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `sourcesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM sources WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `sourcesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesInsert`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO sources(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	lastModified)
  VALUES(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `sourcesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesSelectAll`()
BEGIN

	SELECT * FROM sources;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `sourcesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesUpdate`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	sources
  SET	
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targetsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM targets WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targetsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  email varchar (128),
  fixedPhone varchar (128),
  mobilePhone varchar (128),
  OUT lid int
)
BEGIN
  INSERT INTO targets(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	email,
	fixedPhone,
	mobilePhone,
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
	typeId,
	email,
	fixedPhone,
	mobilePhone,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targetsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsSelectAll`()
BEGIN

	SELECT * FROM targets;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `targetsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  email varchar (128),
  fixedPhone varchar (128),
  mobilePhone varchar (128),
  updateId int
)
BEGIN
  UPDATE
	targets
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
	email = email,
	fixedPhone = fixedPhone,
	mobilePhone = mobilePhone,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targettypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM targettypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targettypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO targettypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targettypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesSelectAll`()
BEGIN

	SELECT * FROM targettypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `targettypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	targettypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminalsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM terminals WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminalsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  userId int (11),
  color int (11),
  serverUpdateInterval bigint (20),
  registrationInterval bigint (20),
  closeAfterInterval bigint (20),
  clearMemoryAfterStart tinyint (4),
  exitCode varchar (4),
  OUT lid int
)
BEGIN
  INSERT INTO terminals(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	userId,
	color,
	serverUpdateInterval,
	registrationInterval,
	closeAfterInterval,
	clearMemoryAfterStart,
	exitCode,
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
	typeId,
	userId,
	color,
	serverUpdateInterval,
	registrationInterval,
	closeAfterInterval,
	clearMemoryAfterStart,
	exitCode,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminalsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsSelectAll`()
BEGIN

	SELECT * FROM terminals;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `terminalsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  userId int (11),
  color int (11),
  serverUpdateInterval bigint (20),
  registrationInterval bigint (20),
  closeAfterInterval bigint (20),
  clearMemoryAfterStart tinyint (4),
  exitCode varchar (4),
  updateId int
)
BEGIN
  UPDATE
	terminals
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
	userId = userId,
	color = color,
	serverUpdateInterval = serverUpdateInterval,
	registrationInterval = registrationInterval,
	closeAfterInterval = closeAfterInterval,
	clearMemoryAfterStart = clearMemoryAfterStart,
	exitCode = exitCode,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminaltypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM terminaltypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminaltypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO terminaltypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminaltypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesSelectAll`()
BEGIN

	SELECT * FROM terminaltypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `terminaltypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	terminaltypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `translationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM translations WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `translationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsInsert`(
  code varchar (45),
  description varchar (45),
  type varchar (45),
  enabled tinyint (4),
  nl varchar (1023),
  en varchar (1023),
  fr varchar (1023),
  OUT lid int
)
BEGIN
  INSERT INTO translations(	
	code,
	description,
	type,
	enabled,
	nl,
	en,
	fr,
	lastModified)
  VALUES(	
	code,
	description,
	type,
	enabled,
	nl,
	en,
	fr,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `translationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsSelectAll`()
BEGIN

	SELECT * FROM translations;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `translationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsUpdate`(
  code varchar (45),
  description varchar (45),
  type varchar (45),
  enabled tinyint (4),
  nl varchar (1023),
  en varchar (1023),
  fr varchar (1023),
  updateId int
)
BEGIN
  UPDATE
	translations
  SET	
	code = code,
	description = description,
	type = type,
	enabled = enabled,
	nl = nl,
	en = en,
	fr = fr,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `bomitemsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM bomitems WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `bomitemsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  jobId int (11),
  jobOperationId int (11),
  amount int (11),
  units varchar (45),
  amountValidated int (11),
  amountRejected int (11),
  OUT lid int
)
BEGIN
  INSERT INTO bomitems(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	jobId,
	jobOperationId,
	amount,
	units,
	amountValidated,
	amountRejected,
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
	jobId,
	jobOperationId,
	amount,
	units,
	amountValidated,
	amountRejected,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `bomitemsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsSelectAll`()
BEGIN

	SELECT * FROM bomitems;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `bomitemsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `bomitemsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  jobId int (11),
  jobOperationId int (11),
  amount int (11),
  units varchar (45),
  amountValidated int (11),
  amountRejected int (11),
  updateId int
)
BEGIN
  UPDATE
	bomitems
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	jobId = jobId,
	jobOperationId = jobOperationId,
	amount = amount,
	units = units,
	amountValidated = amountValidated,
	amountRejected = amountRejected,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `cellsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM cells WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `cellsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  typeId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO cells(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	typeId,
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
	color,
	typeId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `cellsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsSelectAll`()
BEGIN

	SELECT * FROM cells;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `cellsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cellsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  typeId int (11),
  updateId int
)
BEGIN
  UPDATE
	cells
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	typeId = typeId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `celltypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM celltypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `celltypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO celltypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `celltypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesSelectAll`()
BEGIN

	SELECT * FROM celltypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `celltypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `celltypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	celltypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `intermissionsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM intermissions WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `intermissionsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  warningType int (11),
  warningValue double ,
  alarmType int (11),
  alarmValue double ,
  OUT lid int
)
BEGIN
  INSERT INTO intermissions(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
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
	warningType,
	warningValue,
	alarmType,
	alarmValue,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `intermissionsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsSelectAll`()
BEGIN

	SELECT * FROM intermissions;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `intermissionsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `intermissionsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  warningType int (11),
  warningValue double ,
  alarmType int (11),
  alarmValue double ,
  updateId int
)
BEGIN
  UPDATE
	intermissions
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	warningType = warningType,
	warningValue = warningValue,
	alarmType = alarmType,
	alarmValue = alarmValue,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM jobinputtypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  valueType int (11),
  inputType int (11),
  valueOptions varchar (2048),
  required tinyint (4),
  units varchar (45),
  overwrite tinyint (4),
  OUT lid int
)
BEGIN
  INSERT INTO jobinputtypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	valueType,
	inputType,
	valueOptions,
	required,
	units,
	overwrite,
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
	valueType,
	inputType,
	valueOptions,
	required,
	units,
	overwrite,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesSelectAll`()
BEGIN

	SELECT * FROM jobinputtypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `jobinputtypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobinputtypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  valueType int (11),
  inputType int (11),
  valueOptions varchar (2048),
  required tinyint (4),
  units varchar (45),
  overwrite tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	jobinputtypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	valueType = valueType,
	inputType = inputType,
	valueOptions = valueOptions,
	required = required,
	units = units,
	overwrite = overwrite,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `joboperationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM joboperations WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `joboperationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `joboperationsSelectAll`()
BEGIN

	SELECT * FROM joboperations;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `jobsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM jobs WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `jobsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsSelectAll`()
BEGIN

	SELECT * FROM jobs;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `logsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM logs WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `logsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsInsert`(
  tag varchar (45),
  message blob ,
  type int (11),
  date datetime ,
  OUT lid int
)
BEGIN
  INSERT INTO logs(	
	tag,
	message,
	type,
	date,
	lastModified)
  VALUES(	
	tag,
	message,
	type,
	date,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `logsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsSelectAll`()
BEGIN

	SELECT * FROM logs;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `logsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logsUpdate`(
  tag varchar (45),
  message blob ,
  type int (11),
  date datetime ,
  updateId int
)
BEGIN
  UPDATE
	logs
  SET	
	tag = tag,
	message = message,
	type = type,
	date = date,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM machines WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  isStationary tinyint (4),
  OUT lid int
)
BEGIN
  INSERT INTO machines(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	costPricePerHour,
	sellPricePerHour,
	isStationary,
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
	typeId,
	costPricePerHour,
	sellPricePerHour,
	isStationary,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesSelectAll`()
BEGIN

	SELECT * FROM machines;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `machinesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  isStationary tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	machines
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
	costPricePerHour = costPricePerHour,
	sellPricePerHour = sellPricePerHour,
	isStationary = isStationary,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinetypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM machinetypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinetypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO machinetypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `machinetypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesSelectAll`()
BEGIN

	SELECT * FROM machinetypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `machinetypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `machinetypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	machinetypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `messagesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM messages WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `messagesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesInsert`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  targetId int (11),
  type int (11),
  state int (11),
  body blob ,
  includeUser tinyint (4),
  includeTerminal tinyint (4),
  includeSession tinyint (4),
  includeServer tinyint (4),
  OUT lid int
)
BEGIN
  INSERT INTO messages(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
	targetId,
	type,
	state,
	body,
	includeUser,
	includeTerminal,
	includeSession,
	includeServer,
	lastModified)
  VALUES(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
	targetId,
	type,
	state,
	body,
	includeUser,
	includeTerminal,
	includeSession,
	includeServer,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `messagesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesSelectAll`()
BEGIN

	SELECT * FROM messages;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `messagesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `messagesUpdate`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  targetId int (11),
  type int (11),
  state int (11),
  body blob ,
  includeUser tinyint (4),
  includeTerminal tinyint (4),
  includeSession tinyint (4),
  includeServer tinyint (4),
  updateId int
)
BEGIN
  UPDATE
	messages
  SET	
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	userId = userId,
	terminalId = terminalId,
	targetId = targetId,
	type = type,
	state = state,
	body = body,
	includeUser = includeUser,
	includeTerminal = includeTerminal,
	includeSession = includeSession,
	includeServer = includeServer,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectdocumentsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectdocuments WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `objectdocumentsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumentsSelectAll`()
BEGIN

	SELECT * FROM objectdocuments;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectdocumenttypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  color int (11),
  flagId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO objectdocumenttypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	color,
	flagId,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	color,
	flagId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesSelectAll`()
BEGIN

	SELECT * FROM objectdocumenttypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `objectdocumenttypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectdocumenttypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  color int (11),
  flagId int (11),
  updateId int
)
BEGIN
  UPDATE
	objectdocumenttypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	color = color,
	flagId = flagId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectflagsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM objectflags WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectflagsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  objectName varchar (45),
  iconIndex int (11),
  OUT lid int
)
BEGIN
  INSERT INTO objectflags(	
	sourceId,
	sourceKey,
	code,
	objectName,
	iconIndex,
	lastModified)
  VALUES(	
	sourceId,
	sourceKey,
	code,
	objectName,
	iconIndex,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `objectflagsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `objectflagsSelectAll`()
BEGIN

	SELECT * FROM objectflags;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `operationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM operations WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsInsert`(
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
  OUT lid int
)
BEGIN
  INSERT INTO operations(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	isPricePerHour,
	isWorkingHours,
	isWorkWatch,
	isAllTerminals,
	isAskAmounts,
	isAskNextJobTime,
	isAskLocation,
	isMultiUser,
	isMultiMachine,
	nextActionAfter,
	jobOption,
	machineOption,
	userOption,
	subOperationId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
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
	typeId,
	isPricePerHour,
	isWorkingHours,
	isWorkWatch,
	isAllTerminals,
	isAskAmounts,
	isAskNextJobTime,
	isAskLocation,
	isMultiUser,
	isMultiMachine,
	nextActionAfter,
	jobOption,
	machineOption,
	userOption,
	subOperationId,
	warningType,
	warningValue,
	alarmType,
	alarmValue,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationsSelectAll`()
BEGIN

	SELECT * FROM operations;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `operationtypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM operationtypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationtypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO operationtypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `operationtypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesSelectAll`()
BEGIN

	SELECT * FROM operationtypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `operationtypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `operationtypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	operationtypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `registrationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM registrations WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `registrationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsInsert`(
  date datetime ,
  type int (11),
  info varchar (1023),
  userId int (11),
  machineId int (11),
  jobOperationId int (11),
  terminalId int (11),
  intermissionId int (11),
  jobId int (11),
  responseCode int (11),
  responseValue varchar (1023),
  amountValidated int (11),
  amountRejected int (11),
  jobInputTypeId int (11),
  inputvalue varchar (1023),
  inputType int (11),
  state int (11),
  OUT lid int
)
BEGIN
  INSERT INTO registrations(	
	date,
	type,
	info,
	userId,
	machineId,
	jobOperationId,
	terminalId,
	intermissionId,
	jobId,
	responseCode,
	responseValue,
	amountValidated,
	amountRejected,
	jobInputTypeId,
	inputvalue,
	inputType,
	state,
	lastModified)
  VALUES(	
	date,
	type,
	info,
	userId,
	machineId,
	jobOperationId,
	terminalId,
	intermissionId,
	jobId,
	responseCode,
	responseValue,
	amountValidated,
	amountRejected,
	jobInputTypeId,
	inputvalue,
	inputType,
	state,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `registrationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsSelectAll`()
BEGIN

	SELECT * FROM registrations;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `registrationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrationsUpdate`(
  date datetime ,
  type int (11),
  info varchar (1023),
  userId int (11),
  machineId int (11),
  jobOperationId int (11),
  terminalId int (11),
  intermissionId int (11),
  jobId int (11),
  responseCode int (11),
  responseValue varchar (1023),
  amountValidated int (11),
  amountRejected int (11),
  jobInputTypeId int (11),
  inputvalue varchar (1023),
  inputType int (11),
  state int (11),
  updateId int
)
BEGIN
  UPDATE
	registrations
  SET	
	date = date,
	type = type,
	info = info,
	userId = userId,
	machineId = machineId,
	jobOperationId = jobOperationId,
	terminalId = terminalId,
	intermissionId = intermissionId,
	jobId = jobId,
	responseCode = responseCode,
	responseValue = responseValue,
	amountValidated = amountValidated,
	amountRejected = amountRejected,
	jobInputTypeId = jobInputTypeId,
	inputvalue = inputvalue,
	inputType = inputType,
	state = state,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `sourcesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM sources WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `sourcesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesInsert`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO sources(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	lastModified)
  VALUES(	
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `sourcesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesSelectAll`()
BEGIN

	SELECT * FROM sources;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `sourcesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sourcesUpdate`(
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	sources
  SET	
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targetsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM targets WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targetsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  email varchar (128),
  fixedPhone varchar (128),
  mobilePhone varchar (128),
  OUT lid int
)
BEGIN
  INSERT INTO targets(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	email,
	fixedPhone,
	mobilePhone,
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
	typeId,
	email,
	fixedPhone,
	mobilePhone,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targetsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsSelectAll`()
BEGIN

	SELECT * FROM targets;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `targetsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targetsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  email varchar (128),
  fixedPhone varchar (128),
  mobilePhone varchar (128),
  updateId int
)
BEGIN
  UPDATE
	targets
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
	email = email,
	fixedPhone = fixedPhone,
	mobilePhone = mobilePhone,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targettypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM targettypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targettypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO targettypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `targettypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesSelectAll`()
BEGIN

	SELECT * FROM targettypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `targettypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `targettypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	targettypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminalsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM terminals WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminalsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  userId int (11),
  color int (11),
  serverUpdateInterval bigint (20),
  registrationInterval bigint (20),
  closeAfterInterval bigint (20),
  clearMemoryAfterStart tinyint (4),
  exitCode varchar (4),
  OUT lid int
)
BEGIN
  INSERT INTO terminals(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	typeId,
	userId,
	color,
	serverUpdateInterval,
	registrationInterval,
	closeAfterInterval,
	clearMemoryAfterStart,
	exitCode,
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
	typeId,
	userId,
	color,
	serverUpdateInterval,
	registrationInterval,
	closeAfterInterval,
	clearMemoryAfterStart,
	exitCode,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminalsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsSelectAll`()
BEGIN

	SELECT * FROM terminals;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `terminalsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminalsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  typeId int (11),
  userId int (11),
  color int (11),
  serverUpdateInterval bigint (20),
  registrationInterval bigint (20),
  closeAfterInterval bigint (20),
  clearMemoryAfterStart tinyint (4),
  exitCode varchar (4),
  updateId int
)
BEGIN
  UPDATE
	terminals
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
	userId = userId,
	color = color,
	serverUpdateInterval = serverUpdateInterval,
	registrationInterval = registrationInterval,
	closeAfterInterval = closeAfterInterval,
	clearMemoryAfterStart = clearMemoryAfterStart,
	exitCode = exitCode,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminaltypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM terminaltypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminaltypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  OUT lid int
)
BEGIN
  INSERT INTO terminaltypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
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
	color,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `terminaltypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesSelectAll`()
BEGIN

	SELECT * FROM terminaltypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `terminaltypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `terminaltypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  updateId int
)
BEGIN
  UPDATE
	terminaltypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `translationsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM translations WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `translationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsInsert`(
  code varchar (45),
  description varchar (45),
  type varchar (45),
  enabled tinyint (4),
  nl varchar (1023),
  en varchar (1023),
  fr varchar (1023),
  OUT lid int
)
BEGIN
  INSERT INTO translations(	
	code,
	description,
	type,
	enabled,
	nl,
	en,
	fr,
	lastModified)
  VALUES(	
	code,
	description,
	type,
	enabled,
	nl,
	en,
	fr,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `translationsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsSelectAll`()
BEGIN

	SELECT * FROM translations;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `translationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsUpdate`(
  code varchar (45),
  description varchar (45),
  type varchar (45),
  enabled tinyint (4),
  nl varchar (1023),
  en varchar (1023),
  fr varchar (1023),
  updateId int
)
BEGIN
  UPDATE
	translations
  SET	
	code = code,
	description = description,
	type = type,
	enabled = enabled,
	nl = nl,
	en = en,
	fr = fr,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `userprofilesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofilesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM userprofiles WHERE id = deleteId;
END$$

DELIMITER ;
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
USE `ww`;
DROP procedure IF EXISTS `userprofilesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofilesSelectAll`()
BEGIN

	SELECT * FROM userprofiles;

END$$

DELIMITER ; 
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
USE `ww`;
DROP procedure IF EXISTS `usersDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM users WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `usersInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (1023),
  info varchar (1023),
  flagId int (11),
  passWord varchar (128),
  firstName varchar (45),
  lastName varchar (45),
  gsmNumber varchar (45),
  birthDay datetime ,
  profileId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  canProvideAssistance tinyint (4),
  isInTraining tinyint (4),
  language int (11),
  userTerminalConfigId int (11),
  state int (11),
  OUT lid int
)
BEGIN
  INSERT INTO users(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	passWord,
	firstName,
	lastName,
	gsmNumber,
	birthDay,
	profileId,
	costPricePerHour,
	sellPricePerHour,
	canProvideAssistance,
	isInTraining,
	language,
	userTerminalConfigId,
	state,
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
	passWord,
	firstName,
	lastName,
	gsmNumber,
	birthDay,
	profileId,
	costPricePerHour,
	sellPricePerHour,
	canProvideAssistance,
	isInTraining,
	language,
	userTerminalConfigId,
	state,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `usersSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersSelectAll`()
BEGIN

	SELECT * FROM users;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `usersUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (1023),
  info varchar (1023),
  flagId int (11),
  passWord varchar (128),
  firstName varchar (45),
  lastName varchar (45),
  gsmNumber varchar (45),
  birthDay datetime ,
  profileId int (11),
  costPricePerHour decimal ,
  sellPricePerHour decimal ,
  canProvideAssistance tinyint (4),
  isInTraining tinyint (4),
  language int (11),
  userTerminalConfigId int (11),
  state int (11),
  updateId int
)
BEGIN
  UPDATE
	users
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	passWord = passWord,
	firstName = firstName,
	lastName = lastName,
	gsmNumber = gsmNumber,
	birthDay = birthDay,
	profileId = profileId,
	costPricePerHour = costPricePerHour,
	sellPricePerHour = sellPricePerHour,
	canProvideAssistance = canProvideAssistance,
	isInTraining = isInTraining,
	language = language,
	userTerminalConfigId = userTerminalConfigId,
	state = state,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM userterminalconfigs WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO userterminalconfigs(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	userId,
	terminalId,
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
	userId,
	terminalId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsSelectAll`()
BEGIN

	SELECT * FROM userterminalconfigs;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `userterminalconfigsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userterminalconfigsUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  userId int (11),
  terminalId int (11),
  updateId int
)
BEGIN
  UPDATE
	userterminalconfigs
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	userId = userId,
	terminalId = terminalId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `usertypesDelete`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usertypesDelete`(
  deleteId int(11)
)
BEGIN
 DELETE FROM usertypes WHERE id = deleteId;
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `usertypesInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usertypesInsert`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  profileId int (11),
  OUT lid int
)
BEGIN
  INSERT INTO usertypes(	
	sourceId,
	sourceKey,
	code,
	enabled,
	iconPath,
	description,
	info,
	flagId,
	color,
	profileId,
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
	color,
	profileId,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;
USE `ww`;
DROP procedure IF EXISTS `usertypesSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usertypesSelectAll`()
BEGIN

	SELECT * FROM usertypes;

END$$

DELIMITER ; 
USE `ww`;
DROP procedure IF EXISTS `usertypesUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usertypesUpdate`(
  sourceId int (11),
  sourceKey varchar (45),
  code varchar (45),
  enabled tinyint (4),
  iconPath varchar (255),
  description varchar (255),
  info varchar (1023),
  flagId int (11),
  color int (11),
  profileId int (11),
  updateId int
)
BEGIN
  UPDATE
	usertypes
  SET	
	sourceId = sourceId,
	sourceKey = sourceKey,
	code = code,
	enabled = enabled,
	iconPath = iconPath,
	description = description,
	info = info,
	flagId = flagId,
	color = color,
	profileId = profileId,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;
