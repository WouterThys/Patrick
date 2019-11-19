USE `ww`;
DROP procedure IF EXISTS `jobsSelectAll`;

DELIMITER $$
USE `ww`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsSelectAll`()
BEGIN

	SELECT * FROM jobs;

END$$

DELIMITER ; 