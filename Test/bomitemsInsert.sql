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