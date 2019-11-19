USE `ww`;
DROP procedure IF EXISTS `translationsUpdate`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsUpdate`(
  code varchar (45),
  description varchar (45),
  type varchar (45),
  enabled tinyint (4),
  nl varchar (1023),
  en varchar (1023),
  fr varchar (1023),
  updateId int
)
BEGIN
  UPDATE
	translations
  SET	
	code = code,
	description = description,
	type = type,
	enabled = enabled,
	nl = nl,
	en = en,
	fr = fr,
	lastModified = current_timestamp()
  WHERE
	id = updateId;
END$$

DELIMITER ;