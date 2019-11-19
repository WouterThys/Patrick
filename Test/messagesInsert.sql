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