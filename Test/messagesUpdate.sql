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