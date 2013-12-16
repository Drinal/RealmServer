CREATE DATABASE  IF NOT EXISTS `rotmg` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rotmg`;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(64) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `namechosen` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `guild` int(11) NOT NULL DEFAULT '0',
  `guildRank` int(11) NOT NULL DEFAULT '0',
  `vaultCount` int(11) NOT NULL DEFAULT '1',
  `maxCharSlot` int(11) NOT NULL DEFAULT '0',
  `regTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `guest` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('4', 'admin@hotmail.fr', '7c222fb2927d828af22f592134e8932480637c0d', 'Dushy', '1', '1', '0', '0', '0', '25', '14', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accId` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `charType` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `fame` int(11) NOT NULL,
  `items` varchar(128) NOT NULL,
  `hp` int(11) NOT NULL,
  `mp` int(11) NOT NULL,
  `stats` varchar(64) NOT NULL DEFAULT '"1,2,3,4,5,6,7,8"',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `tex1` int(11) NOT NULL DEFAULT '0',
  `tex2` int(11) NOT NULL DEFAULT '0',
  `pet` int(11) NOT NULL DEFAULT '0',
  `fameStats` varchar(128) NOT NULL DEFAULT 'eNoVytkRgCAMRdGH4IIbgmsPdmNVNmZf5n7kzM0kksLjJN2V4b30vcHK1YYam9hCxxqh5zpQI0wwQ4IFMhRYYeNjpw444YIfA3kDIA',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deathTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalFame` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of characters
-- ----------------------------
INSERT INTO `characters` VALUES ('6', '4', '1', '768', '20', '122430', '122', '3106, 2650, 2811, 2878, 3082, -1, -1, -1, 3113, 2817, -1, -1', '760', '292', '720, 252, 50, 25, 75, 40, 50, 75', '0', '0', '0', '-1', 'eNpjYGASz2JkYLDpZWJgYHzKzMB9qoyFAQhYQQQbA4NYADuI4GBgYNrECSK4gOq8uYGSxjxAwpIXpI4PRPCDCAEQIQgihECEMIgQAeLpoiCWGIgQBxESIAIAq68ILQ==', '2013-04-04 03:18:41', '2013-04-12 17:53:28', '0');
INSERT INTO `characters` VALUES ('5', '4', '2', '775', '20', '129771', '129', '3099, 3863, 2811, 2878, 2820, 3079, -1, -1, 3088, 3074, -1, -1', '740', '292', '700, 252, 75, 25, 50, 40, 50, 50', '0', '0', '0', '-1', 'eNoVyjkOgEAMA0BvuFnuc__CtlQ0dHyJlpdQ8jNKRGzJo0gxIOtnAH8KYO4A9j1CaCISA25LSArIk5Fcd7vV51IovuSuIjVpSEs60pNBe428JjITR374HQjP', '2013-04-04 03:18:41', '2013-04-04 03:18:41', '0');
INSERT INTO `characters` VALUES ('4', '4', '3', '782', '20', '194743', '194', '2826, 3864, 2823, 2878, 3075, -1, -1, -1, -1, -1, -1, -1', '710', '490', '670, 385, 75, 25, 50, 40, 60, 75', '0', '0', '0', '-1', 'eNoVykkNgFAQA9D-hf2z7wLwwI0TCggy8IEILCCMBAWcmE7SlyYdQO-XArZXA-ozcM9pIecRHxiXgISAmSISA3ZNZJydcKT8y0hOClKSitSkkdwtW0d6MpAf44QIcg==', '2013-04-04 03:18:41', '2013-04-13 01:25:12', '0');
INSERT INTO `characters` VALUES ('3', '4', '4', '784', '20', '150048', '150', '-1, -1, -1, 2878, -1, -1, -1, -1, -1, -1, -1, -1', '740', '292', '700, 252, 75, 25, 50, 40, 50, 50', '0', '0', '0', '-1', 'eNoVyssNgDAMA1C34U-hfAuzcOJSDqzHIkzAJszACsSW_BQpBmy8DHDuFjCfwG0xgSYlGRDenBSASEkq3T21PqNTjoa7lnjSkZ4MZCST9p55BbKQlfyNPgf4', '2013-04-04 03:18:41', '2013-04-12 17:22:00', '0');
INSERT INTO `characters` VALUES ('2', '4', '5', '797', '20', '211896', '211', '2880, 3867, 2814, 2878, 3077, 3087, 2805, -1, 3073, 2563, -1, -1', '810', '292', '770, 252, 50, 40, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrsNgDAQA1CThD8hQPhNwCI0dNS0FCyQmaFmASTOJ_nJkg_Q4YmA81OA8RrO7gZyMUmAZU1JBugtJwWg3lLGoxIuy7-aONKQlnTEk15yD2wjmchMfqpPCGg=', '2013-04-04 03:18:41', '2013-04-12 18:04:41', '0');
INSERT INTO `characters` VALUES ('1', '4', '6', '798', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('7', '4', '7', '799', '20', '180675', '180', '3077, 3870, 2814, 3845, 3073, 3078, -1, -1, 2805, 2563, -1, -1', '2770', '2252', '770, 252, 50, 25, 50, 40, 75, 50', '0', '0', '0', '-1', 'eNoVyrkNgFAMA1B_wn197qOkpmAQhNiIjWho2IARWAdiS36KFAOyfAZYZwcwr8BOtwuNR3xgfAISAnJFJNbdkehzS5U94y4nlhSkJBWpSaM9W14d6clAfhgyCYI=', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('8', '4', '8', '800', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('9', '4', '9', '801', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('10', '4', '10', '802', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('11', '4', '11', '803', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('12', '4', '12', '804', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');
INSERT INTO `characters` VALUES ('13', '4', '13', '805', '20', '178952', '178', '3077, 3866, 2814, 3845, 3073, 3080, -1, -1, 3840, 2805, 2563, -1', '2770', '1615', '770, 252, 75, 25, 50, 75, 50, 50', '0', '0', '0', '-1', 'eNoVyrkNgEAQA0Afy_8c_1cEMT0gREm0Q0BARhv0cJWwtuTRSmtAltcA2-oB5hNY53xoAhIC8xORGJArIanuzkyfe64cBXeWlKQiNWlISzrt3fMayEgm8gNBbQne', '2013-04-04 03:18:41', '2013-04-12 18:24:03', '0');

-- ----------------------------
-- Table structure for `classstats`
-- ----------------------------
DROP TABLE IF EXISTS `classstats`;
CREATE TABLE `classstats` (
  `accId` int(11) NOT NULL,
  `objType` int(11) NOT NULL,
  `bestLv` int(11) NOT NULL,
  `bestFame` int(11) NOT NULL,
  PRIMARY KEY (`accId`,`objType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classstats
-- ----------------------------
INSERT INTO `classstats` VALUES ('4', '782', '20', '100005');
INSERT INTO `classstats` VALUES ('4', '768', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '775', '24', '2001');
INSERT INTO `classstats` VALUES ('4', '784', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '797', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '798', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '799', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '800', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '801', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '802', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '803', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '804', '20', '2001');
INSERT INTO `classstats` VALUES ('4', '805', '20', '12231');
INSERT INTO `classstats` VALUES ('0', '782', '1', '0');

-- ----------------------------
-- Table structure for `death`
-- ----------------------------
DROP TABLE IF EXISTS `death`;
CREATE TABLE `death` (
  `accId` int(11) NOT NULL,
  `chrId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `charType` int(11) NOT NULL,
  `tex1` int(11) NOT NULL,
  `tex2` int(11) NOT NULL,
  `items` varchar(128) NOT NULL,
  `fame` int(11) NOT NULL,
  `fameStats` varchar(128) NOT NULL,
  `totalFame` int(11) NOT NULL,
  `firstBorn` tinyint(1) NOT NULL,
  `killer` varchar(128) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`accId`,`chrId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of death
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(16) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` varchar(128) NOT NULL,
  `link` varchar(256) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `stats`
-- ----------------------------
DROP TABLE IF EXISTS `stats`;
CREATE TABLE `stats` (
  `accId` int(11) NOT NULL,
  `fame` int(11) NOT NULL,
  `totalFame` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `totalCredits` int(11) NOT NULL,
  PRIMARY KEY (`accId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stats
-- ----------------------------
INSERT INTO `stats` VALUES ('4', '1667023', '1667023', '66666', '1000');

-- ----------------------------
-- Table structure for `vaults`
-- ----------------------------
DROP TABLE IF EXISTS `vaults`;
CREATE TABLE `vaults` (
  `accId` int(11) NOT NULL,
  `chestId` int(11) NOT NULL AUTO_INCREMENT,
  `items` varchar(128) NOT NULL,
  PRIMARY KEY (`accId`,`chestId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vaults
-- ----------------------------
INSERT INTO `vaults` VALUES ('3', '1', '-1, -1, -1, -1, -1, -1, -1, -1');
INSERT INTO `vaults` VALUES ('4', '1', '-1, -1, -1, -1, -1, -1, -1, -1');