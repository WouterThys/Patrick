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