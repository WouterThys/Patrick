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