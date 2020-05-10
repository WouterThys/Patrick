USE `ww`;
DROP procedure IF EXISTS `translationsInsert`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `translationsInsert`(
  code varchar (45),
  description varchar (45),
  type varchar (45),
  enabled tinyint (4),
  nl varchar (1023),
  en varchar (1023),
  fr varchar (1023),
  OUT lid int
)
BEGIN
  INSERT INTO translations(	
	code,
	description,
	type,
	enabled,
	nl,
	en,
	fr,
	lastModified)
  VALUES(	
	code,
	description,
	type,
	enabled,
	nl,
	en,
	fr,
	now());
  SET lid = last_insert_id();
END$$

DELIMITER ;