INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (40,1,0,11,ALTER TABLE %SCHEMA%.messages 
CHANGE COLUMN `code` `code` VARCHAR(45) NULL DEFAULT '' ,
DROP INDEX `code_UNIQUE` ;
;,Code not Unique for messages);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (41,1,0,11,ALTER TABLE %SCHEMA%.messages 
ADD COLUMN `body` BLOB NULL AFTER `state`;,Add body to messages);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (42,1,0,11,ALTER TABLE %SCHEMA%.messages 
ADD COLUMN `includeUser` TINYINT NULL DEFAULT '1' AFTER `body`,
ADD COLUMN `includeTerminal` TINYINT NULL DEFAULT '1' AFTER `includeUser`,
ADD COLUMN `includeSession` TINYINT NULL DEFAULT '1' AFTER `includeTerminal`,
ADD COLUMN `includeServer` TINYINT NULL DEFAULT '1' AFTER `includeSession`;
,Add message detail includes);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (43,1,0,11,CREATE TABLE %SCHEMA%.userterminalconfigs (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NULL DEFAULT '',
  `deleted` TINYINT(1) NULL DEFAULT '0',
  `enabled` TINYINT(1) NULL DEFAULT '1',
  `lastModified` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `iconPath` VARCHAR(255) NULL DEFAULT '',
  `description` VARCHAR(255) NULL DEFAULT '',
  `info` VARCHAR(1023) NULL DEFAULT '',
  `flagId` INT(11) NULL DEFAULT '0',
  `userId` INT(11) NOT NULL DEFAULT '1',
  `terminalId` INT(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`, `userId`, `terminalId`),
  INDEX `fk_utc_user_idx` (`userId` ASC) VISIBLE,
  INDEX `fk_utc_terminal_idx` (`terminalId` ASC) VISIBLE,
  CONSTRAINT `fk_utc_user`
    FOREIGN KEY (`userId`)
    REFERENCES %SCHEMA%.users (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_utc_terminal`
    FOREIGN KEY (`terminalId`)
    REFERENCES %SCHEMA%.terminals (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO %SCHEMA%.userterminalconfigs (`id`, `code`, `deleted`, `enabled`, `description`, `userId`, `terminalId`) VALUES ('1', 'UNKNOWN', '0', '1', 'Unknown', '1', '1');
,UserTerminalConfig table);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (44,1,0,11,CREATE TABLE %SCHEMA%.linkuserterminalconfigsoperations (
  `id` INT(11) NOT NULL,
  `configId` INT(11) NOT NULL DEFAULT '1',
  `operationId` INT(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`, `configId`, `operationId`),
  INDEX `fk_lutco_config_idx` (`configId` ASC) VISIBLE,
  INDEX `fk_lutco_operation_idx` (`operationId` ASC) VISIBLE,
  CONSTRAINT `fk_lutco_config`
    FOREIGN KEY (`configId`)
    REFERENCES %SCHEMA%.userterminalconfigs (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lutco_operation`
    FOREIGN KEY (`operationId`)
    REFERENCES %SCHEMA%.operations (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
	
	
CREATE TABLE %SCHEMA%.linkuserterminalconfigsmachines (
  `id` INT(11) NOT NULL,
  `configId` INT(11) NOT NULL DEFAULT '1',
  `machineId` INT(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`, `configId`, `machineId`),
  INDEX `fk_lutcm_config_idx` (`configId` ASC) VISIBLE,
  INDEX `fk_lutcm_machine_idx` (`machineId` ASC) VISIBLE,
  CONSTRAINT `fk_lutcm_config`
    FOREIGN KEY (`configId`)
    REFERENCES %SCHEMA%.userterminalconfigs (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lutcm_machine`
    FOREIGN KEY (`machineId`)
    REFERENCES %SCHEMA%.machines (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);,UserTerminalConfig link tables);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (45,1,0,11,ALTER TABLE %SCHEMA%.userterminalconfigs
ADD COLUMN `sourceId` INT(11) NULL AFTER `id`,
ADD COLUMN `sourceKey` VARCHAR(45) NULL AFTER `sourceId`;,Add source id and key to terminal config table);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (46,1,0,11,CREATE TABLE %SCHEMA%.userterminalconfigslog (
  `actionDate` datetime NOT NULL,
  `actionType` int(11) DEFAULT NULL,
  `actionBy` int(11) DEFAULT NULL,
  `actionOn` int(11) DEFAULT NULL,
  `objectId` int(11) NOT NULL,
  `objectCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`actionDate`,`objectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;,UserTerminalConfig logs table);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (47,1,0,11,ALTER TABLE %SCHEMA%.linkuserterminalconfigsmachines 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE %SCHEMA%.linkuserterminalconfigsoperations
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;,AutoIncrement on link config tables);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (48,1,0,11,ALTER TABLE %SCHEMA%.users 
ADD COLUMN `userTerminalConfigId` INT(11) NULL DEFAULT '1' AFTER `language`,
ADD INDEX `fk_u_terminalconfig_idx` (`userTerminalConfigId` ASC) VISIBLE;
;
ALTER TABLE %SCHEMA%.users
ADD CONSTRAINT `fk_u_terminalconfig`
  FOREIGN KEY (`userTerminalConfigId`)
  REFERENCES %SCHEMA%.userterminalconfigs (`id`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
,User link with terminal config);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (49,1,0,11,ALTER TABLE %SCHEMA%.users 
ADD COLUMN `state` INT NULL DEFAULT '0' AFTER `userTerminalConfigId`;
,User state);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (50,1,0,12,CREATE TABLE %SCHEMA%.linkjoboperationsjobinputtypes (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobId` int(11) NOT NULL DEFAULT '1',
  `jobOperationId` int(11) NOT NULL DEFAULT '1',
  `jobInputTypeId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`jobId`,`jobOperationId`,`jobInputTypeId`),
  KEY `pk_jojit_job_idx` (`jobId`),
  KEY `fk_jojit_joboperation_idx` (`jobOperationId`),
  KEY `fk_jojit_jobinputtype_idx` (`jobInputTypeId`),
  CONSTRAINT `fk_jojit_jobinputtype` FOREIGN KEY (`jobInputTypeId`) REFERENCES %SCHEMA%.jobinputtypes (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jojit_joboperation` FOREIGN KEY (`jobOperationId`) REFERENCES %SCHEMA%.joboperations (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_jojit_job` FOREIGN KEY (`jobId`) REFERENCES %SCHEMA%.jobs (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;,JobOperation JobInputTypes link);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (51,1,0,14,ALTER TABLE %SCHEMA%.jobs 
ADD COLUMN `state` INT NULL DEFAULT '0' AFTER `flagId`;,Add state to jobs table);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (52,1,0,20,ALTER TABLE %SCHEMA%.userprofiles 
ADD COLUMN `canOpenControlCenter` TINYINT(1) NULL AFTER `canViewSettings`,
ADD COLUMN `canOpenTerminal` TINYINT(1) NULL AFTER `canOpenControlCenter`,
ADD COLUMN `canOpenMonitor` TINYINT(1) NULL AFTER `canOpenTerminal`,
CHANGE COLUMN `canViewJobs` `canViewJobs` TINYINT(1) NULL DEFAULT NULL ,
CHANGE COLUMN `canViewData` `canViewData` TINYINT(1) NULL DEFAULT NULL ,
CHANGE COLUMN `canViewSettings` `canViewSettings` TINYINT(1) NULL DEFAULT NULL ;
,Can Open on UserProfiles);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (53,1,0,21,DROP TABLE %SCHEMA%.cells_customvalues;
DROP TABLE %SCHEMA%.celltypes_customvalues;
DROP TABLE %SCHEMA%.intermissions_customvalues;
DROP TABLE %SCHEMA%.jobinputtypes_customvalues;
DROP TABLE %SCHEMA%.jobinputvalues_customvalues;
DROP TABLE %SCHEMA%.joboperations_customvalues;
DROP TABLE %SCHEMA%.jobs_customvalues;
DROP TABLE %SCHEMA%.machines_customvalues;
DROP TABLE %SCHEMA%.machinetypes_customvalues;
DROP TABLE %SCHEMA%.objectdocuments_customvalues;
DROP TABLE %SCHEMA%.objectdocumenttypes_customvalues;
DROP TABLE %SCHEMA%.operations_customvalues;
DROP TABLE %SCHEMA%.operationtypes_customvalues;
DROP TABLE %SCHEMA%.registrations_customvalues;
DROP TABLE %SCHEMA%.sources_customvalues;
DROP TABLE %SCHEMA%.targets_customvalues;
DROP TABLE %SCHEMA%.targettypes_customvalues;
DROP TABLE %SCHEMA%.terminals_customvalues;
DROP TABLE %SCHEMA%.terminaltypes_customvalues;
DROP TABLE %SCHEMA%.users_customvalues;
DROP TABLE %SCHEMA%.usertypes_customvalues;,Drop custom value tables);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (54,1,0,21,ALTER TABLE %SCHEMA%.jobinputtypes 
ADD COLUMN `overwrite` TINYINT(1) NULL DEFAULT '0' AFTER `units`,
CHANGE COLUMN `deleted` `deleted` TINYINT(1) NULL DEFAULT NULL ,
CHANGE COLUMN `enabled` `enabled` TINYINT(1) NULL DEFAULT NULL ,
CHANGE COLUMN `required` `required` TINYINT(1) NULL DEFAULT NULL ;
,Add overwite to jobInputTypes);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (55,1,0,21,DROP TABLE `ww`.`jobinputvalues_customdata`;
DROP TABLE %SCHEMA%.jobinputvalues;,Remove JobInputValues);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (56,1,0,21,use %SCHEMA%;
CREATE TABLE `bomitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `sourceKey` varchar(45) DEFAULT NULL,
  `code` varchar(45) NOT NULL DEFAULT '',
  `deleted` tinyint(1) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `lastModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `iconPath` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `info` varchar(1023) DEFAULT '',
  `flagId` int(11) DEFAULT '0',
  `jobId` int(11) DEFAULT '1',
  `amount` int(11) DEFAULT '0',
  `units` varchar(45) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  CONSTRAINT `fk_bomitems_jobs` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `bomitems_customdata` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `group` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `bomitemslog` (
  `actionDate` datetime NOT NULL,
  `actionType` int(11) DEFAULT NULL,
  `actionBy` int(11) DEFAULT NULL,
  `actionOn` int(11) DEFAULT NULL,
  `objectId` int(11) NOT NULL,
  `objectCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`actionDate`,`objectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO bomitems (`id`, `code`) VALUES ('1', 'UNKNOWN');,Add bomitems table);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (57,1,0,21,ALTER TABLE %SCHEMA%.registrations 
ADD COLUMN `jobInputTypeId` INT(11) NULL DEFAULT '1' AFTER `amountRejected`,
ADD COLUMN `inputvalue` VARCHAR(1023) NULL DEFAULT '' AFTER `jobInputTypeId`,
ADD INDEX `fk_reg_inputtype_idx` (`jobInputTypeId` ASC) VISIBLE;
;
ALTER TABLE %SCHEMA%.registrations
ADD CONSTRAINT `fk_reg_inputtype`
  FOREIGN KEY (`jobInputTypeId`)
  REFERENCES %SCHEMA%.jobinputtypes (`id`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
,Update registrations with input types);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (58,1,0,21,ALTER TABLE  %SCHEMA%.registrations 
ADD COLUMN `state` INT(11) NULL DEFAULT '0' AFTER `inputvalue`;,Add state to registrations);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (59,1,0,21,ALTER TABLE %SCHEMA%.joboperations 
DROP COLUMN `amountRejected`,
DROP COLUMN `amountValidated`,
DROP COLUMN `totalTime`;
,Delete obsolete columns from jobopertions);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (60,1,0,21,ALTER TABLE %SCHEMA%.bomitems
ADD COLUMN `jobOperationId` INT(11) NULL DEFAULT '1' AFTER `jobId`,
ADD INDEX `fk_bomitems_joboperations_idx` (`jobOperationId` ASC) VISIBLE;
;
ALTER TABLE %SCHEMA%.bomitems
ADD CONSTRAINT `fk_bomitems_joboperations`
  FOREIGN KEY (`jobOperationId`)
  REFERENCES %SCHEMA%.joboperations (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;,Add JobOperationId to bomitems);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (61,1,0,21,ALTER TABLE %SCHEMA%.terminals 
ADD COLUMN `userId` INT(11) NULL DEFAULT '1' AFTER `typeId`,
ADD INDEX `fk_terminals_user_idx` (`userId` ASC) VISIBLE;
;
ALTER TABLE %SCHEMA%.terminals
ADD CONSTRAINT `fk_terminals_user`
  FOREIGN KEY (`userId`)
  REFERENCES %SCHEMA%.users (`id`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
,Add user to terminal);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (62,1,0,21,ALTER TABLE %SCHEMA%.bomitems 
ADD COLUMN `amountRejected` INT(11) NULL DEFAULT '0' AFTER `units`;
,BOMItems amount rejected);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (64,1,0,21,ALTER TABLE %SCHEMA%.registrations 
ADD COLUMN `inputType` INT(11) NULL DEFAULT '0' AFTER `inputvalue`;
,Registrations input type);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (65,1,0,22,ALTER TABLE %SCHEMA%.objectdocuments 
ADD COLUMN `externalPath` VARCHAR(255) NULL AFTER `documentPath`;,External Path for documents);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (66,1,0,22,CREATE TABLE %SCHEMA%.translations (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `enabled` TINYINT(1) NULL,
  `nl` VARCHAR(1023) NULL,
  `en` VARCHAR(1023) NULL,
  `fr` VARCHAR(1023) NULL,
  PRIMARY KEY (`id`));
,Languages);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (67,1,0,22,ALTER TABLE %SCHEMA%.objectdocuments 
ADD COLUMN `androidPath` VARCHAR(255) NULL AFTER `originalPath`,
CHANGE COLUMN `externalPath` `originalPath` VARCHAR(255) NULL DEFAULT NULL ;
,Objectdocuments paths);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (68,1,0,22,update %SCHEMA%.jobs set jobSheet = '1' where id > 0;

ALTER TABLE %SCHEMA%.jobs 
CHANGE COLUMN `jobSheet` `jobSheetId` INT(11) DEFAULT '1' ,
ADD INDEX `fk_jobs_ods_idx` (`jobSheetId` ASC) VISIBLE;
;
ALTER TABLE %SCHEMA%.jobs
ADD CONSTRAINT `fk_jobs_ods`
  FOREIGN KEY (`jobSheetId`)
  REFERENCES %SCHEMA%.objectdocuments (`id`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;
,Jobs and job sheets);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (69,1,0,22,ALTER TABLE %SCHEMA%.bomitems 
CHANGE COLUMN `code` `code` VARCHAR(45) NULL DEFAULT '' ,
DROP INDEX `code_UNIQUE` ;
;
,Bomitems code should not be unique);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (70,1,0,23,ALTER TABLE %SCHEMA%.registrations
ADD COLUMN `responseCode` INT(11) NULL DEFAULT '0' AFTER `jobId`,
ADD COLUMN `responseValue` VARCHAR(1023) NULL DEFAULT '' AFTER `responseCode`;
,Registrations responseCode and responseValue);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (71,1,0,23,ALTER TABLE %SCHEMA%.bomitems 
ADD COLUMN `amountValidated` INT(11) NULL DEFAULT '0' AFTER `units`;
,BOM Items amount validated);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (72,1,0,24,ALTER TABLE %SCHEMA%.linkusersusertypes 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE %SCHEMA%.linkusersoperations
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE %SCHEMA%.linkusersusertypes
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE %SCHEMA%.linkterminalsmachines
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;,Add AI to link tables);
INSERT INTO updatescripts (`id`,`majorVersion`,`minorVersion`,`buildVersion`,`script`,`description`) VALUES (73,1,0,24,DROP TABLE %SCHEMA%.linkjoboperationsjobinputtypes;

ALTER TABLE %SCHEMA%.`linkoperationsjobinputtypes` 
DROP FOREIGN KEY `pk_ojit_job`;
ALTER TABLE %SCHEMA%.`linkoperationsjobinputtypes` 
DROP COLUMN `jobId`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`, `operationId`, `jobInputTypeId`),
DROP INDEX `pk_ojit_job_idx` ;
;

,Drop and alter link tables);
