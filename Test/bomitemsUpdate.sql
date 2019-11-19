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