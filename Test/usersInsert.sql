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