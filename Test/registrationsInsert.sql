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