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