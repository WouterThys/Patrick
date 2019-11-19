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