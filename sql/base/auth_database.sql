-- MySQL dump 10.16  Distrib 10.1.6-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: auth
-- ------------------------------------------------------
-- Server version	10.1.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `battlenet_account` int(10) unsigned DEFAULT NULL,
  `battlenet_index` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `uk_bnet_acc` (`battlenet_account`,`battlenet_index`),
  CONSTRAINT `fk_bnet_acc` FOREIGN KEY (`battlenet_account`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_access`
--

DROP TABLE IF EXISTS `account_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_access`
--

LOCK TABLES `account_access` WRITE;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_last_played_character`
--

DROP TABLE IF EXISTS `account_last_played_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_last_played_character` (
  `accountId` int(10) unsigned NOT NULL,
  `region` tinyint(3) unsigned NOT NULL,
  `battlegroup` tinyint(3) unsigned NOT NULL,
  `realmId` int(10) unsigned DEFAULT NULL,
  `characterName` varchar(12) DEFAULT NULL,
  `characterGUID` bigint(20) unsigned DEFAULT NULL,
  `lastPlayedTime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`accountId`,`region`,`battlegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_last_played_character`
--

LOCK TABLES `account_last_played_character` WRITE;
/*!40000 ALTER TABLE `account_last_played_character` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_last_played_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_muted`
--

DROP TABLE IF EXISTS `account_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_muted` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT '0',
  `mutetime` int(10) unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mute List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_muted`
--

LOCK TABLES `account_muted` WRITE;
/*!40000 ALTER TABLE `account_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobroadcast`
--

DROP TABLE IF EXISTS `autobroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobroadcast`
--

LOCK TABLES `autobroadcast` WRITE;
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle_pet_slots`
--

DROP TABLE IF EXISTS `battle_pet_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_pet_slots` (
  `id` tinyint(3) NOT NULL,
  `battlenetAccountId` int(10) NOT NULL,
  `battlePetGuid` bigint(20) NOT NULL,
  `locked` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`battlenetAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_pet_slots`
--

LOCK TABLES `battle_pet_slots` WRITE;
/*!40000 ALTER TABLE `battle_pet_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `battle_pet_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle_pets`
--

DROP TABLE IF EXISTS `battle_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_pets` (
  `guid` bigint(20) NOT NULL,
  `battlenetAccountId` int(10) NOT NULL,
  `species` int(10) NOT NULL,
  `breed` smallint(5) NOT NULL,
  `level` smallint(5) NOT NULL DEFAULT '1',
  `exp` smallint(5) NOT NULL DEFAULT '0',
  `health` int(10) NOT NULL DEFAULT '1',
  `quality` tinyint(3) NOT NULL DEFAULT '0',
  `flags` smallint(5) NOT NULL DEFAULT '0',
  `name` varchar(12) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_pets`
--

LOCK TABLES `battle_pets` WRITE;
/*!40000 ALTER TABLE `battle_pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `battle_pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_account_bans`
--

DROP TABLE IF EXISTS `battlenet_account_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_account_bans` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_account_bans`
--

LOCK TABLES `battlenet_account_bans` WRITE;
/*!40000 ALTER TABLE `battlenet_account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_account_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_account_heirlooms`
--

DROP TABLE IF EXISTS `battlenet_account_heirlooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_account_heirlooms` (
  `accountId` int(10) unsigned NOT NULL,
  `itemId` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_account_heirlooms`
--

LOCK TABLES `battlenet_account_heirlooms` WRITE;
/*!40000 ALTER TABLE `battlenet_account_heirlooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_account_heirlooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_account_mounts`
--

DROP TABLE IF EXISTS `battlenet_account_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_account_mounts` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `mountSpellId` int(10) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`mountSpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_account_mounts`
--

LOCK TABLES `battlenet_account_mounts` WRITE;
/*!40000 ALTER TABLE `battlenet_account_mounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_account_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_account_toys`
--

DROP TABLE IF EXISTS `battlenet_account_toys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_account_toys` (
  `accountId` int(10) unsigned NOT NULL,
  `itemId` int(11) NOT NULL DEFAULT '0',
  `isFavourite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_account_toys`
--

LOCK TABLES `battlenet_account_toys` WRITE;
/*!40000 ALTER TABLE `battlenet_account_toys` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_account_toys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_accounts`
--

DROP TABLE IF EXISTS `battlenet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(320) NOT NULL,
  `sha_pass_hash` varchar(64) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `LastCharacterUndelete` int(10) unsigned NOT NULL DEFAULT '0',
  `LoginTicket` varchar(64) DEFAULT NULL,
  `LoginTicketExpiry` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_accounts`
--

LOCK TABLES `battlenet_accounts` WRITE;
/*!40000 ALTER TABLE `battlenet_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_item_appearances`
--

DROP TABLE IF EXISTS `battlenet_item_appearances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_item_appearances` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `blobIndex` smallint(5) unsigned NOT NULL,
  `appearanceMask` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_item_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_item_appearances`
--

LOCK TABLES `battlenet_item_appearances` WRITE;
/*!40000 ALTER TABLE `battlenet_item_appearances` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_item_appearances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlenet_item_favorite_appearances`
--

DROP TABLE IF EXISTS `battlenet_item_favorite_appearances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlenet_item_favorite_appearances` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `itemModifiedAppearanceId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`itemModifiedAppearanceId`),
  CONSTRAINT `fk_battlenet_item_favorite_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlenet_item_favorite_appearances`
--

LOCK TABLES `battlenet_item_favorite_appearances` WRITE;
/*!40000 ALTER TABLE `battlenet_item_favorite_appearances` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_item_favorite_appearances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip2nation`
--

DROP TABLE IF EXISTS `ip2nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip2nation`
--

LOCK TABLES `ip2nation` WRITE;
/*!40000 ALTER TABLE `ip2nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip2nationCountries`
--

DROP TABLE IF EXISTS `ip2nationCountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip2nationCountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip2nationCountries`
--

LOCK TABLES `ip2nationCountries` WRITE;
/*!40000 ALTER TABLE `ip2nationCountries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nationCountries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_ip_actions`
--

DROP TABLE IF EXISTS `logs_ip_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_ip_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` bigint(20) unsigned NOT NULL COMMENT 'Character Guid',
  `type` tinyint(3) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text COMMENT 'Notes inserted by system',
  `unixtime` int(10) unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to log ips of individual actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_ip_actions`
--

LOCK TABLES `logs_ip_actions` WRITE;
/*!40000 ALTER TABLE `logs_ip_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_ip_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_account_permissions`
--

DROP TABLE IF EXISTS `rbac_account_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_account_permissions`
--

LOCK TABLES `rbac_account_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_account_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_account_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_default_permissions`
--

DROP TABLE IF EXISTS `rbac_default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_default_permissions` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'permission id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default permission to assign to different account security levels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_default_permissions`
--

LOCK TABLES `rbac_default_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_default_permissions` DISABLE KEYS */;
INSERT INTO `rbac_default_permissions` VALUES
(0,195,-1),
(1,194,-1),
(2,193,-1),
(3,192,-1);
/*!40000 ALTER TABLE `rbac_default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_linked_permissions`
--

DROP TABLE IF EXISTS `rbac_linked_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_linked_permissions` (
  `id` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int(10) unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission - Linked Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_linked_permissions`
--

LOCK TABLES `rbac_linked_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_linked_permissions` DISABLE KEYS */;
INSERT INTO `rbac_linked_permissions` VALUES
(192,21),
(192,42),
(192,43),
(192,193),
(192,196),
(192,776),
(192,778),
(192,779),
(192,780),
(192,781),
(192,782),
(192,783),
(192,784),
(192,785),
(192,786),
(192,787),
(192,788),
(192,789),
(192,790),
(192,791),
(192,792),
(192,793),
(192,794),
(192,835),
(192,844),
(192,845),
(192,846),
(192,847),
(192,848),
(192,849),
(192,850),
(192,851),
(192,853),
(192,854),
(193,48),
(193,194),
(193,197),
(194,1),
(194,2),
(194,11),
(194,12),
(194,13),
(194,14),
(194,15),
(194,16),
(194,17),
(194,18),
(194,19),
(194,20),
(194,22),
(194,23),
(194,25),
(194,26),
(194,27),
(194,28),
(194,29),
(194,30),
(194,31),
(194,32),
(194,33),
(194,34),
(194,35),
(194,36),
(194,37),
(194,38),
(194,39),
(194,40),
(194,41),
(194,44),
(194,46),
(194,47),
(194,51),
(194,195),
(194,198),
(194,632),
(194,798),
(195,3),
(195,4),
(195,5),
(195,6),
(195,24),
(195,49),
(195,199),
(196,10),
(196,200),
(196,201),
(196,208),
(196,212),
(196,213),
(196,214),
(196,215),
(196,216),
(196,226),
(196,227),
(196,230),
(196,231),
(196,233),
(196,234),
(196,235),
(196,238),
(196,239),
(196,240),
(196,241),
(196,242),
(196,243),
(196,244),
(196,245),
(196,246),
(196,247),
(196,248),
(196,249),
(196,250),
(196,251),
(196,252),
(196,253),
(196,254),
(196,255),
(196,256),
(196,257),
(196,258),
(196,259),
(196,260),
(196,261),
(196,262),
(196,264),
(196,265),
(196,266),
(196,267),
(196,268),
(196,269),
(196,270),
(196,271),
(196,272),
(196,279),
(196,280),
(196,283),
(196,287),
(196,288),
(196,289),
(196,290),
(196,291),
(196,292),
(196,293),
(196,294),
(196,295),
(196,296),
(196,297),
(196,298),
(196,299),
(196,302),
(196,303),
(196,304),
(196,305),
(196,306),
(196,307),
(196,308),
(196,309),
(196,310),
(196,313),
(196,314),
(196,319),
(196,320),
(196,321),
(196,322),
(196,323),
(196,324),
(196,325),
(196,326),
(196,327),
(196,328),
(196,329),
(196,330),
(196,331),
(196,332),
(196,333),
(196,334),
(196,335),
(196,336),
(196,337),
(196,338),
(196,339),
(196,340),
(196,341),
(196,342),
(196,343),
(196,344),
(196,345),
(196,346),
(196,347),
(196,348),
(196,349),
(196,350),
(196,351),
(196,352),
(196,353),
(196,354),
(196,355),
(196,356),
(196,357),
(196,358),
(196,359),
(196,360),
(196,361),
(196,362),
(196,363),
(196,364),
(196,365),
(196,366),
(196,373),
(196,375),
(196,400),
(196,401),
(196,402),
(196,403),
(196,404),
(196,405),
(196,406),
(196,407),
(196,417),
(196,418),
(196,419),
(196,420),
(196,421),
(196,422),
(196,423),
(196,424),
(196,425),
(196,426),
(196,427),
(196,428),
(196,429),
(196,434),
(196,435),
(196,436),
(196,437),
(196,438),
(196,439),
(196,440),
(196,441),
(196,442),
(196,443),
(196,444),
(196,445),
(196,446),
(196,447),
(196,448),
(196,449),
(196,450),
(196,451),
(196,452),
(196,453),
(196,454),
(196,455),
(196,456),
(196,457),
(196,458),
(196,459),
(196,461),
(196,463),
(196,464),
(196,465),
(196,472),
(196,473),
(196,474),
(196,475),
(196,476),
(196,477),
(196,478),
(196,488),
(196,489),
(196,491),
(196,492),
(196,493),
(196,495),
(196,497),
(196,498),
(196,499),
(196,500),
(196,502),
(196,503),
(196,505),
(196,508),
(196,511),
(196,513),
(196,514),
(196,516),
(196,519),
(196,522),
(196,523),
(196,526),
(196,527),
(196,529),
(196,530),
(196,533),
(196,535),
(196,536),
(196,537),
(196,538),
(196,539),
(196,540),
(196,541),
(196,556),
(196,581),
(196,582),
(196,592),
(196,593),
(196,596),
(196,602),
(196,603),
(196,604),
(196,605),
(196,606),
(196,607),
(196,608),
(196,609),
(196,610),
(196,611),
(196,612),
(196,613),
(196,615),
(196,616),
(196,617),
(196,618),
(196,619),
(196,620),
(196,621),
(196,623),
(196,624),
(196,625),
(196,626),
(196,627),
(196,628),
(196,629),
(196,630),
(196,631),
(196,633),
(196,634),
(196,635),
(196,636),
(196,637),
(196,638),
(196,639),
(196,640),
(196,641),
(196,642),
(196,643),
(196,644),
(196,645),
(196,646),
(196,647),
(196,648),
(196,649),
(196,650),
(196,651),
(196,652),
(196,653),
(196,654),
(196,655),
(196,656),
(196,657),
(196,658),
(196,659),
(196,660),
(196,661),
(196,663),
(196,665),
(196,666),
(196,667),
(196,668),
(196,669),
(196,670),
(196,671),
(196,672),
(196,673),
(196,674),
(196,675),
(196,676),
(196,677),
(196,678),
(196,679),
(196,680),
(196,681),
(196,682),
(196,683),
(196,684),
(196,685),
(196,686),
(196,687),
(196,688),
(196,689),
(196,690),
(196,691),
(196,693),
(196,694),
(196,695),
(196,696),
(196,697),
(196,698),
(196,699),
(196,700),
(196,701),
(196,702),
(196,703),
(196,704),
(196,705),
(196,706),
(196,707),
(196,708),
(196,709),
(196,710),
(196,711),
(196,712),
(196,713),
(196,714),
(196,715),
(196,716),
(196,717),
(196,718),
(196,719),
(196,721),
(196,722),
(196,723),
(196,724),
(196,725),
(196,726),
(196,727),
(196,728),
(196,729),
(196,730),
(196,733),
(196,734),
(196,735),
(196,736),
(196,738),
(196,739),
(196,753),
(196,757),
(196,773),
(196,777),
(196,809),
(196,817),
(196,825),
(196,829),
(196,830),
(196,831),
(196,832),
(196,833),
(196,836),
(196,837),
(196,838),
(196,839),
(196,840),
(196,842),
(196,843),
(196,869),
(197,232),
(197,236),
(197,237),
(197,273),
(197,274),
(197,275),
(197,276),
(197,277),
(197,284),
(197,285),
(197,286),
(197,301),
(197,311),
(197,387),
(197,388),
(197,389),
(197,390),
(197,391),
(197,392),
(197,393),
(197,394),
(197,395),
(197,396),
(197,397),
(197,398),
(197,399),
(197,479),
(197,480),
(197,481),
(197,482),
(197,485),
(197,486),
(197,487),
(197,494),
(197,506),
(197,509),
(197,510),
(197,517),
(197,518),
(197,521),
(197,542),
(197,543),
(197,550),
(197,558),
(197,568),
(197,571),
(197,572),
(197,573),
(197,574),
(197,575),
(197,576),
(197,577),
(197,578),
(197,579),
(197,580),
(197,583),
(197,584),
(197,585),
(197,586),
(197,587),
(197,588),
(197,589),
(197,590),
(197,591),
(197,594),
(197,595),
(197,601),
(197,761),
(197,762),
(197,763),
(197,764),
(197,765),
(197,766),
(197,767),
(197,768),
(197,769),
(197,770),
(197,771),
(197,772),
(197,774),
(197,805),
(197,811),
(197,813),
(197,819),
(197,821),
(197,827),
(198,218),
(198,300),
(198,312),
(198,315),
(198,316),
(198,317),
(198,318),
(198,367),
(198,368),
(198,369),
(198,370),
(198,371),
(198,372),
(198,374),
(198,376),
(198,377),
(198,378),
(198,379),
(198,380),
(198,381),
(198,382),
(198,384),
(198,385),
(198,386),
(198,408),
(198,409),
(198,410),
(198,411),
(198,412),
(198,413),
(198,414),
(198,415),
(198,416),
(198,430),
(198,431),
(198,432),
(198,433),
(198,462),
(198,466),
(198,467),
(198,468),
(198,469),
(198,470),
(198,471),
(198,483),
(198,484),
(198,490),
(198,504),
(198,512),
(198,515),
(198,520),
(198,524),
(198,528),
(198,531),
(198,532),
(198,544),
(198,545),
(198,546),
(198,547),
(198,548),
(198,549),
(198,551),
(198,552),
(198,553),
(198,554),
(198,555),
(198,557),
(198,559),
(198,560),
(198,561),
(198,562),
(198,563),
(198,564),
(198,565),
(198,566),
(198,567),
(198,569),
(198,570),
(198,597),
(198,598),
(198,599),
(198,600),
(198,737),
(198,740),
(198,741),
(198,742),
(198,799),
(198,800),
(198,801),
(198,802),
(198,803),
(198,804),
(198,806),
(198,807),
(198,808),
(198,810),
(198,812),
(198,814),
(198,815),
(198,816),
(198,818),
(198,820),
(198,822),
(198,823),
(198,824),
(198,826),
(198,828),
(198,834),
(198,852),
(198,868),
(199,207),
(199,209),
(199,210),
(199,211),
(199,217),
(199,221),
(199,222),
(199,223),
(199,225),
(199,263),
(199,496),
(199,501),
(199,507),
(199,525),
(199,534),
(199,797);
/*!40000 ALTER TABLE `rbac_linked_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permissions`
--

DROP TABLE IF EXISTS `rbac_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permissions`
--

LOCK TABLES `rbac_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_permissions` DISABLE KEYS */;
INSERT INTO `rbac_permissions` VALUES
(1,'Instant logout'),
(2,'Skip Queue'),
(3,'Join Normal Battleground'),
(4,'Join Random Battleground'),
(5,'Join Arenas'),
(6,'Join Dungeon Finder'),
(10,'Use character templates'),
(11,'Log GM trades'),
(12,'Skip character creation demon hunter min level check'),
(13,'Skip Instance required bosses check'),
(14,'Skip character creation team mask check'),
(15,'Skip character creation class mask check'),
(16,'Skip character creation race mask check'),
(17,'Skip character creation reserved name check'),
(18,'Skip character creation death knight min level check'),
(19,'Skip needed requirements to use channel check'),
(20,'Skip disable map check'),
(21,'Skip reset talents when used more than allowed check'),
(22,'Skip spam chat check'),
(23,'Skip over-speed ping check'),
(24,'Two side faction characters on the same account'),
(25,'Allow say chat between factions'),
(26,'Allow channel chat between factions'),
(27,'Two side mail interaction'),
(28,'See two side who list'),
(29,'Add friends of other faction'),
(30,'Save character without delay with .save command'),
(31,'Use params with .unstuck command'),
(32,'Can be assigned tickets with .assign ticket command'),
(33,'Notify if a command was not found'),
(34,'Check if should appear in list using .gm ingame command'),
(35,'See all security levels with who command'),
(36,'Filter whispers'),
(37,'Use staff badge in chat'),
(38,'Resurrect with full Health Points'),
(39,'Restore saved gm setting states'),
(40,'Allows to add a gm to friend list'),
(41,'Use Config option START_GM_LEVEL to assign new character level'),
(42,'Allows to use CMSG_WORLD_TELEPORT opcode'),
(43,'Allows to use CMSG_WHOIS opcode'),
(44,'Receive global GM messages/texts'),
(45,'Join channels without announce'),
(46,'Change channel settings without being channel moderator'),
(47,'Enables lower security than target check'),
(48,'Enable IP, Last Login and EMail output in pinfo'),
(49,'Forces to enter the email for confirmation on password change'),
(50,'Allow user to check his own email with .account'),
(51,'Allow trading between factions'),
(192,'Role: Sec Level Administrator'),
(193,'Role: Sec Level Gamemaster'),
(194,'Role: Sec Level Moderator'),
(195,'Role: Sec Level Player'),
(196,'Role: Administrator Commands'),
(197,'Role: Gamemaster Commands'),
(198,'Role: Moderator Commands'),
(199,'Role: Player Commands'),
(200,'Command: rbac'),
(201,'Command: rbac account'),
(202,'Command: rbac account list'),
(203,'Command: rbac account grant'),
(204,'Command: rbac account deny'),
(205,'Command: rbac account revoke'),
(206,'Command: rbac list'),
(207,'Command: battlenetaccount'),
(208,'Command: battlenetaccount create'),
(209,'Command: battlenetaccount lock country'),
(210,'Command: battlenetaccount lock ip'),
(211,'Command: battlenetaccount password'),
(212,'Command: battlenetaccount set'),
(213,'Command: battlenetaccount set password'),
(214,'Command: bnetaccount link'),
(215,'Command: bnetaccount unlink'),
(216,'Command: bnetaccount gameaccountcreate'),
(217,'Command: account'),
(218,'Command: account addon'),
(219,'Command: account create'),
(220,'Command: account delete'),
(221,'Command: account lock'),
(222,'Command: account lock country'),
(223,'Command: account lock ip'),
(224,'Command: account onlinelist'),
(225,'Command: account password'),
(226,'Command: account set'),
(227,'Command: account set addon'),
(228,'Command: account set gmlevel'),
(229,'Command: account set password'),
(230,'Command: achievement'),
(231,'Command: achievement add'),
(232,'Command: arena'),
(233,'Command: arena captain'),
(234,'Command: arena create'),
(235,'Command: arena disband'),
(236,'Command: arena info'),
(237,'Command: arena lookup'),
(238,'Command: arena rename'),
(239,'Command: ban'),
(240,'Command: ban account'),
(241,'Command: ban character'),
(242,'Command: ban ip'),
(243,'Command: ban playeraccount'),
(244,'Command: baninfo'),
(245,'Command: baninfo account'),
(246,'Command: baninfo character'),
(247,'Command: baninfo ip'),
(248,'Command: banlist'),
(249,'Command: banlist account'),
(250,'Command: banlist character'),
(251,'Command: banlist ip'),
(252,'Command: unban'),
(253,'Command: unban account'),
(254,'Command: unban character'),
(255,'Command: unban ip'),
(256,'Command: unban playeraccount'),
(257,'Command: bf'),
(258,'Command: bf start'),
(259,'Command: bf stop'),
(260,'Command: bf switch'),
(261,'Command: bf timer'),
(262,'Command: bf enable'),
(263,'Command: account email'),
(264,'Command: account set sec'),
(265,'Command: account set sec email'),
(266,'Command: account set sec regmail'),
(267,'Command: cast'),
(268,'Command: cast back'),
(269,'Command: cast dist'),
(270,'Command: cast self'),
(271,'Command: cast target'),
(272,'Command: cast dest'),
(273,'Command: character'),
(274,'Command: character customize'),
(275,'Command: character changefaction'),
(276,'Command: character changerace'),
(277,'Command: character deleted'),
(279,'Command: character deleted list'),
(280,'Command: character deleted restore'),
(283,'Command: character level'),
(284,'Command: character rename'),
(285,'Command: character reputation'),
(286,'Command: character titles'),
(287,'Command: levelup'),
(288,'Command: pdump'),
(289,'Command: pdump load'),
(290,'Command: pdump write'),
(291,'Command: cheat'),
(292,'Command: cheat casttime'),
(293,'Command: cheat cooldown'),
(294,'Command: cheat explore'),
(295,'Command: cheat god'),
(296,'Command: cheat power'),
(297,'Command: cheat status'),
(298,'Command: cheat taxi'),
(299,'Command: cheat waterwalk'),
(300,'Command: debug'),
(301,'Command: debug anim'),
(302,'Command: debug areatriggers'),
(303,'Command: debug arena'),
(304,'Command: debug bg'),
(305,'Command: debug entervehicle'),
(306,'Command: debug getitemstate'),
(307,'Command: debug getitemvalue'),
(308,'Command: debug getvalue'),
(309,'Command: debug hostil'),
(310,'Command: debug itemexpire'),
(311,'Command: debug lootrecipient'),
(312,'Command: debug los'),
(313,'Command: debug mod32value'),
(314,'Command: debug moveflags'),
(315,'Command: debug play'),
(316,'Command: debug play cinematics'),
(317,'Command: debug play movie'),
(318,'Command: debug play sound'),
(319,'Command: debug send'),
(320,'Command: debug send buyerror'),
(321,'Command: debug send channelnotify'),
(322,'Command: debug send chatmessage'),
(323,'Command: debug send equiperror'),
(324,'Command: debug send largepacket'),
(325,'Command: debug send opcode'),
(326,'Command: debug send qinvalidmsg'),
(327,'Command: debug send qpartymsg'),
(328,'Command: debug send sellerror'),
(329,'Command: debug send setphaseshift'),
(330,'Command: debug send spellfail'),
(331,'Command: debug setaurastate'),
(332,'Command: debug setbit'),
(333,'Command: debug setitemvalue'),
(334,'Command: debug setvalue'),
(335,'Command: debug setvid'),
(336,'Command: debug spawnvehicle'),
(337,'Command: debug threat'),
(338,'Command: debug update'),
(339,'Command: debug uws'),
(340,'Command: wpgps'),
(341,'Command: deserter'),
(342,'Command: deserter bg'),
(343,'Command: deserter bg add'),
(344,'Command: deserter bg remove'),
(345,'Command: deserter instance'),
(346,'Command: deserter instance add'),
(347,'Command: deserter instance remove'),
(348,'Command: disable'),
(349,'Command: disable add'),
(350,'Command: disable add criteria'),
(351,'Command: disable add battleground'),
(352,'Command: disable add map'),
(353,'Command: disable add mmap'),
(354,'Command: disable add outdoorpvp'),
(355,'Command: disable add quest'),
(356,'Command: disable add spell'),
(357,'Command: disable add vmap'),
(358,'Command: disable remove'),
(359,'Command: disable remove criteria'),
(360,'Command: disable remove battleground'),
(361,'Command: disable remove map'),
(362,'Command: disable remove mmap'),
(363,'Command: disable remove outdoorpvp'),
(364,'Command: disable remove quest'),
(365,'Command: disable remove spell'),
(366,'Command: disable remove vmap'),
(367,'Command: event info'),
(368,'Command: event activelist'),
(369,'Command: event start'),
(370,'Command: event stop'),
(371,'Command: gm'),
(372,'Command: gm chat'),
(373,'Command: gm fly'),
(374,'Command: gm ingame'),
(375,'Command: gm list'),
(376,'Command: gm visible'),
(377,'Command: go'),
(378,'Command: go creature'),
(379,'Command: go graveyard'),
(380,'Command: go grid'),
(381,'Command: go object'),
(382,'Command: go taxinode'),
(384,'Command: go trigger'),
(385,'Command: go xyz'),
(386,'Command: go zonexy'),
(387,'Command: gobject'),
(388,'Command: gobject activate'),
(389,'Command: gobject add'),
(390,'Command: gobject add temp'),
(391,'Command: gobject delete'),
(392,'Command: gobject info'),
(393,'Command: gobject move'),
(394,'Command: gobject near'),
(395,'Command: gobject set'),
(396,'Command: gobject set phase'),
(397,'Command: gobject set state'),
(398,'Command: gobject target'),
(399,'Command: gobject turn'),
(400,'debug transport'),
(401,'Command: guild'),
(402,'Command: guild create'),
(403,'Command: guild delete'),
(404,'Command: guild invite'),
(405,'Command: guild uninvite'),
(406,'Command: guild rank'),
(407,'Command: guild rename'),
(408,'Command: honor'),
(409,'Command: honor add'),
(410,'Command: honor add kill'),
(411,'Command: honor update'),
(412,'Command: instance'),
(413,'Command: instance listbinds'),
(414,'Command: instance unbind'),
(415,'Command: instance stats'),
(416,'Command: instance savedata'),
(417,'Command: learn'),
(418,'Command: learn all'),
(419,'Command: learn all my'),
(420,'Command: learn all my class'),
(421,'Command: learn all my pettalents'),
(422,'Command: learn all my spells'),
(423,'Command: learn all my talents'),
(424,'Command: learn all gm'),
(425,'Command: learn all crafts'),
(426,'Command: learn all default'),
(427,'Command: learn all lang'),
(428,'Command: learn all recipes'),
(429,'Command: unlearn'),
(430,'Command: lfg'),
(431,'Command: lfg player'),
(432,'Command: lfg group'),
(433,'Command: lfg queue'),
(434,'Command: lfg clean'),
(435,'Command: lfg options'),
(436,'Command: list'),
(437,'Command: list creature'),
(438,'Command: list item'),
(439,'Command: list object'),
(440,'Command: list auras'),
(441,'Command: list mail'),
(442,'Command: lookup'),
(443,'Command: lookup area'),
(444,'Command: lookup creature'),
(445,'Command: lookup event'),
(446,'Command: lookup faction'),
(447,'Command: lookup item'),
(448,'Command: lookup itemset'),
(449,'Command: lookup object'),
(450,'Command: lookup quest'),
(451,'Command: lookup player'),
(452,'Command: lookup player ip'),
(453,'Command: lookup player account'),
(454,'Command: lookup player email'),
(455,'Command: lookup skill'),
(456,'Command: lookup spell'),
(457,'Command: lookup spell id'),
(458,'Command: lookup taxinode'),
(459,'Command: lookup tele'),
(460,'Command: lookup title'),
(461,'Command: lookup map'),
(462,'Command: announce'),
(463,'Command: channel'),
(464,'Command: channel set'),
(465,'Command: channel set ownership'),
(466,'Command: gmannounce'),
(467,'Command: gmnameannounce'),
(468,'Command: gmnotify'),
(469,'Command: nameannounce'),
(470,'Command: notify'),
(471,'Command: whispers'),
(472,'Command: group'),
(473,'Command: group leader'),
(474,'Command: group disband'),
(475,'Command: group remove'),
(476,'Command: group join'),
(477,'Command: group list'),
(478,'Command: group summon'),
(479,'Command: pet'),
(480,'Command: pet create'),
(481,'Command: pet learn'),
(482,'Command: pet unlearn'),
(483,'Command: send'),
(484,'Command: send items'),
(485,'Command: send mail'),
(486,'Command: send message'),
(487,'Command: send money'),
(488,'Command: additem'),
(489,'Command: additemset'),
(490,'Command: appear'),
(491,'Command: aura'),
(492,'Command: bank'),
(493,'Command: bindsight'),
(494,'Command: combatstop'),
(495,'Command: cometome'),
(496,'Command: commands'),
(497,'Command: cooldown'),
(498,'Command: damage'),
(499,'Command: dev'),
(500,'Command: die'),
(501,'Command: dismount'),
(502,'Command: distance'),
(503,'Command: flusharenapoints'),
(504,'Command: freeze'),
(505,'Command: gps'),
(506,'Command: guid'),
(507,'Command: help'),
(508,'Command: hidearea'),
(509,'Command: itemmove'),
(510,'Command: kick'),
(511,'Command: linkgrave'),
(512,'Command: listfreeze'),
(513,'Command: maxskill'),
(514,'Command: movegens'),
(515,'Command: mute'),
(516,'Command: neargrave'),
(517,'Command: pinfo'),
(518,'Command: playall'),
(519,'Command: possess'),
(520,'Command: recall'),
(521,'Command: repairitems'),
(522,'Command: respawn'),
(523,'Command: revive'),
(524,'Command: saveall'),
(525,'Command: save'),
(526,'Command: setskill'),
(527,'Command: showarea'),
(528,'Command: summon'),
(529,'Command: unaura'),
(530,'Command: unbindsight'),
(531,'Command: unfreeze'),
(532,'Command: unmute'),
(533,'Command: unpossess'),
(534,'Command: unstuck'),
(535,'Command: wchange'),
(536,'Command: mmap'),
(537,'Command: mmap loadedtiles'),
(538,'Command: mmap loc'),
(539,'Command: mmap path'),
(540,'Command: mmap stats'),
(541,'Command: mmap testarea'),
(542,'Command: morph'),
(543,'Command: demorph'),
(544,'Command: modify'),
(545,'Command: modify arenapoints'),
(546,'Command: modify bit'),
(547,'Command: modify drunk'),
(548,'Command: modify energy'),
(549,'Command: modify faction'),
(550,'Command: modify gender'),
(551,'Command: modify honor'),
(552,'Command: modify hp'),
(553,'Command: modify mana'),
(554,'Command: modify money'),
(555,'Command: modify mount'),
(556,'Command: modify phase'),
(557,'Command: modify rage'),
(558,'Command: modify reputation'),
(559,'Command: modify runicpower'),
(560,'Command: modify scale'),
(561,'Command: modify speed'),
(562,'Command: modify speed all'),
(563,'Command: modify speed backwalk'),
(564,'Command: modify speed fly'),
(565,'Command: modify speed walk'),
(566,'Command: modify speed swim'),
(567,'Command: modify spell'),
(568,'Command: modify standstate'),
(569,'Command: modify talentpoints'),
(570,'Command: npc'),
(571,'Command: npc add'),
(572,'Command: npc add formation'),
(573,'Command: npc add item'),
(574,'Command: npc add move'),
(575,'Command: npc add temp'),
(576,'Command: npc add delete'),
(577,'Command: npc add delete item'),
(578,'Command: npc add follow'),
(579,'Command: npc add follow stop'),
(580,'Command: npc set'),
(581,'Command: npc set allowmove'),
(582,'Command: npc set entry'),
(583,'Command: npc set factionid'),
(584,'Command: npc set flag'),
(585,'Command: npc set level'),
(586,'Command: npc set link'),
(587,'Command: npc set model'),
(588,'Command: npc set movetype'),
(589,'Command: npc set phase'),
(590,'Command: npc set spawndist'),
(591,'Command: npc set spawntime'),
(592,'Command: npc set data'),
(593,'Command: npc info'),
(594,'Command: npc near'),
(595,'Command: npc move'),
(596,'Command: npc playemote'),
(597,'Command: npc say'),
(598,'Command: npc textemote'),
(599,'Command: npc whisper'),
(600,'Command: npc yell'),
(601,'Command: npc tame'),
(602,'Command: quest'),
(603,'Command: quest add'),
(604,'Command: quest complete'),
(605,'Command: quest remove'),
(606,'Command: quest reward'),
(607,'Command: reload'),
(608,'Command: reload access_requirement'),
(609,'Command: reload criteria_data'),
(610,'Command: reload achievement_reward'),
(611,'Command: reload all'),
(612,'Command: reload all achievement'),
(613,'Command: reload all area'),
(615,'Command: reload all gossips'),
(616,'Command: reload all item'),
(617,'Command: reload all locales'),
(618,'Command: reload all loot'),
(619,'Command: reload all npc'),
(620,'Command: reload all quest'),
(621,'Command: reload all scripts'),
(623,'Command: reload areatrigger_involvedrelation'),
(624,'Command: reload areatrigger_tavern'),
(625,'Command: reload areatrigger_teleport'),
(626,'Command: reload auctions'),
(627,'Command: reload autobroadcast'),
(628,'Command: reload command'),
(629,'Command: reload conditions'),
(630,'Command: reload config'),
(631,'Command: reload battleground_template'),
(632,'Command: .mutehistory'),
(633,'Command: reload creature_linked_respawn'),
(634,'Command: reload creature_loot_template'),
(635,'Command: reload creature_onkill_reputation'),
(636,'Command: reload creature_questender'),
(637,'Command: reload creature_queststarter'),
(638,'Command: reload creature_summon_groups'),
(639,'Command: reload creature_template'),
(640,'Command: reload creature_text'),
(641,'Command: reload disables'),
(642,'Command: reload disenchant_loot_template'),
(643,'Command: reload event_scripts'),
(644,'Command: reload fishing_loot_template'),
(645,'Command: reload game_graveyard_zone'),
(646,'Command: reload game_tele'),
(647,'Command: reload gameobject_questender'),
(648,'Command: reload gameobject_loot_template'),
(649,'Command: reload gameobject_queststarter'),
(650,'Command: reload support'),
(651,'Command: reload gossip_menu'),
(652,'Command: reload gossip_menu_option'),
(653,'Command: reload item_enchantment_template'),
(654,'Command: reload item_loot_template'),
(655,'Command: reload item_set_names'),
(656,'Command: reload lfg_dungeon_rewards'),
(657,'Command: reload locales_achievement_reward'),
(658,'Command: reload locales_creature'),
(659,'Command: reload locales_creature_text'),
(660,'Command: reload locales_gameobject'),
(661,'Command: reload locales_gossip_menu_option'),
(663,'Command: reload locales_item_set_name'),
(665,'Command: reload locales_page_text'),
(666,'Command: reload locales_points_of_interest'),
(667,'Command: reload quest_locale'),
(668,'Command: reload mail_level_reward'),
(669,'Command: reload mail_loot_template'),
(670,'Command: reload milling_loot_template'),
(671,'Command: reload npc_spellclick_spells'),
(672,'Command: reload npc_trainer'),
(673,'Command: reload npc_vendor'),
(674,'Command: reload page_text'),
(675,'Command: reload pickpocketing_loot_template'),
(676,'Command: reload points_of_interest'),
(677,'Command: reload prospecting_loot_template'),
(678,'Command: reload quest_poi'),
(679,'Command: reload quest_template'),
(680,'Command: reload rbac'),
(681,'Command: reload reference_loot_template'),
(682,'Command: reload reserved_name'),
(683,'Command: reload reputation_reward_rate'),
(684,'Command: reload reputation_spillover_template'),
(685,'Command: reload skill_discovery_template'),
(686,'Command: reload skill_extra_item_template'),
(687,'Command: reload skill_fishing_base_level'),
(688,'Command: reload skinning_loot_template'),
(689,'Command: reload smart_scripts'),
(690,'Command: reload spell_required'),
(691,'Command: reload spell_area'),
(693,'Command: reload spell_group'),
(694,'Command: reload spell_learn_spell'),
(695,'Command: reload spell_loot_template'),
(696,'Command: reload spell_linked_spell'),
(697,'Command: reload spell_pet_auras'),
(698,'Command: reload spell_proc_event'),
(699,'Command: reload spell_proc'),
(700,'Command: reload spell_scripts'),
(701,'Command: reload spell_target_position'),
(702,'Command: reload spell_threats'),
(703,'Command: reload spell_group_stack_rules'),
(704,'Command: reload trinity_string'),
(705,'Command: reload warden_action'),
(706,'Command: reload waypoint_scripts'),
(707,'Command: reload waypoint_data'),
(708,'Command: reload vehicle_accessory'),
(709,'Command: reload vehicle_template_accessory'),
(710,'Command: reset'),
(711,'Command: reset achievements'),
(712,'Command: reset honor'),
(713,'Command: reset level'),
(714,'Command: reset spells'),
(715,'Command: reset stats'),
(716,'Command: reset talents'),
(717,'Command: reset all'),
(718,'Command: server'),
(719,'Command: server corpses'),
(720,'Command: server exit'),
(721,'Command: server idlerestart'),
(722,'Command: server idlerestart cancel'),
(723,'Command: server idleshutdown'),
(724,'Command: server idleshutdown cancel'),
(725,'Command: server info'),
(726,'Command: server plimit'),
(727,'Command: server restart'),
(728,'Command: server restart cancel'),
(729,'Command: server set'),
(730,'Command: server set closed'),
(731,'Command: server set difftime'),
(732,'Command: server set loglevel'),
(733,'Command: server set motd'),
(734,'Command: server shutdown'),
(735,'Command: server shutdown cancel'),
(736,'Command: server motd'),
(737,'Command: tele'),
(738,'Command: tele add'),
(739,'Command: tele del'),
(740,'Command: tele name'),
(741,'Command: tele group'),
(742,'Command: ticket'),
(753,'Command: ticket reset'),
(757,'Command: ticket togglesystem'),
(761,'Command: titles'),
(762,'Command: titles add'),
(763,'Command: titles current'),
(764,'Command: titles remove'),
(765,'Command: titles set'),
(766,'Command: titles set mask'),
(767,'Command: wp'),
(768,'Command: wp add'),
(769,'Command: wp event'),
(770,'Command: wp load'),
(771,'Command: wp modify'),
(772,'Command: wp unload'),
(773,'Command: wp reload'),
(774,'Command: wp show'),
(776,'Command: debug phase'),
(777,'Command: mailbox'),
(778,'Command: ahbot'),
(779,'Command: ahbot items'),
(780,'Command: ahbot items gray'),
(781,'Command: ahbot items white'),
(782,'Command: ahbot items green'),
(783,'Command: ahbot items blue'),
(784,'Command: ahbot items purple'),
(785,'Command: ahbot items orange'),
(786,'Command: ahbot items yellow'),
(787,'Command: ahbot ratio'),
(788,'Command: ahbot ratio alliance'),
(789,'Command: ahbot ratio horde'),
(790,'Command: ahbot ratio neutral'),
(791,'Command: ahbot rebuild'),
(792,'Command: ahbot reload'),
(793,'Command: ahbot status'),
(794,'Command: .guild info'),
(797,'Command: pvpstats'),
(798,'Command: .mod xp'),
(799,'Command: .go bugticket'),
(800,'Command: .go complaintticket'),
(801,'Command: .go suggestionticket'),
(802,'Command: .ticket bug'),
(803,'Command: .ticket complaint'),
(804,'Command: .ticket suggestion'),
(805,'Command: .ticket bug assign'),
(806,'Command: .ticket bug close'),
(807,'Command: .ticket bug closedlist'),
(808,'Command: .ticket bug comment'),
(809,'Command: .ticket bug delete'),
(810,'Command: .ticket bug list'),
(811,'Command: .ticket bug unassign'),
(812,'Command: .ticket bug view'),
(813,'Command: .ticket complaint assign'),
(814,'Command: .ticket complaint close'),
(815,'Command: .ticket complaint closedlist'),
(816,'Command: .ticket complaint comment'),
(817,'Command: .ticket complaint delete'),
(818,'Command: .ticket complaint list'),
(819,'Command: .ticket complaint unassign'),
(820,'Command: .ticket complaint view'),
(821,'Command: .ticket suggestion assign'),
(822,'Command: .ticket suggestion close'),
(823,'Command: .ticket suggestion closedlist'),
(824,'Command: .ticket suggestion comment'),
(825,'Command: .ticket suggestion delete'),
(826,'Command: .ticket suggestion list'),
(827,'Command: .ticket suggestion unassign'),
(828,'Command: .ticket suggestion view'),
(829,'Command: .ticket reset all'),
(830,'Command: .bnetaccount listgameaccounts'),
(831,'Command: .ticket reset bug'),
(832,'Command: .ticket reset complaint'),
(833,'Command: .ticket reset suggestion'),
(834,'Command: go quest'),
(835,'Command: debug loadcells'),
(836,'Command: .debug boundary'),
(837,'Command: npc evade'),
(838,'Command: pet level'),
(839,'Command: server shutdown force'),
(840,'Command: server restart force'),
(841,'Command: .debug neargraveyard'),
(842,'Command: reload character_template'),
(843,'Command: reload quest_greeting'),
(844,'Command: scene'),
(845,'Command: scene debug'),
(846,'Command: scene play'),
(847,'Command: scene play package'),
(848,'Command: scene cancel'),
(849,'Command: list scenes'),
(850,'Command: reload scenes'),
(851,'Command: reload areatrigger_templates'),
(852,'Command: go offset'),
(853,'Command: .reload conversation_template'),
(854,'Command: .debug conversation'),
(868,'Command: modify power'),
(869,'Command: debug send playerchoice');
/*!40000 ALTER TABLE `rbac_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '26972',
  `Region` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Battlegroup` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES
(1,'LegionCore','127.0.0.1','127.0.0.1','255.255.255.0',8085,0,0,1,0,0,26972,1,1);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updates_include`
--

DROP TABLE IF EXISTS `updates_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates_include`
--

LOCK TABLES `updates_include` WRITE;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` VALUES ('$/sql/LegionCore/auth','RELEASED');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-19 22:43:07
