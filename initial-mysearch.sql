-- MySQL dump 10.19  Distrib 10.2.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.2.41-MariaDB-1:10.2.41+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_dashboards`
--

DROP TABLE IF EXISTS `be_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_dashboards` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `identifier` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `widgets` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_dashboards`
--

LOCK TABLES `be_dashboards` WRITE;
/*!40000 ALTER TABLE `be_dashboards` DISABLE KEYS */;
INSERT INTO `be_dashboards` VALUES (1,0,1636911577,1636911577,1,0,0,0,0,'3bc0943bd228fd6309a77cca7fa86b0a3aa09aff','My dashboard','{\"ca16ffc2fb939c42744a6ad53ce44edb960e4e22\":{\"identifier\":\"t3information\"},\"672bb822b7a14af59008d9eef7260cad135cacc2\":{\"identifier\":\"t3news\"},\"d17b3d5489c03a9a092922c0ba75bf891d82a994\":{\"identifier\":\"docGettingStarted\"}}'),(2,0,1637498043,1637498043,3,0,0,0,0,'c7c4b306f7eaa76c17f0534ffaa3778bf932f4d1','My dashboard','{\"a82e106e5470272fc1db45dc0d1e650dc9a9e6fe\":{\"identifier\":\"t3information\"},\"ab9446502ff8c45c4fc8a1d8cebdc3a50c7831b5\":{\"identifier\":\"t3news\"},\"43ec3af736646e57d68778cf117f9dadc3da95bb\":{\"identifier\":\"docGettingStarted\"}}');
/*!40000 ALTER TABLE `be_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explicit_allowdeny` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_mountpoints` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagetypes_select` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tables_select` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tables_modify` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groupMods` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availableWidgets` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfa_providers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subgroup` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `category_perms` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` longblob DEFAULT NULL,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT 0,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT 0,
  `usergroup` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` smallint(5) unsigned NOT NULL DEFAULT 0,
  `realName` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userMods` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `TSconfig` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `workspace_id` int(11) NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  `category_perms` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1636907584,1636907584,0,0,0,0,0,NULL,'db',0,'$argon2i$v=19$m=65536,t=16,p=1$dGhObXJhWk96Wm9TZjZYMw$x5btS5Q72bEoswxeZyPldoohbKw/2fZdaldEaUJLQr4',1,NULL,'default','',NULL,0,'',NULL,'','a:10:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:2:{s:28:\"dashboard/current_dashboard/\";s:40:\"3bc0943bd228fd6309a77cca7fa86b0a3aa09aff\";s:10:\"web_layout\";a:3:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";s:19:\"constant_editor_cat\";N;}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1636911422;s:15:\"moduleSessionID\";a:2:{s:28:\"dashboard/current_dashboard/\";s:40:\"6d6610d60128f7a60443cb8af003d0e0b970f013\";s:10:\"web_layout\";s:40:\"6d6610d60128f7a60443cb8af003d0e0b970f013\";}}',NULL,NULL,1,NULL,1636911422,0,NULL,NULL,''),(2,0,1636907673,1636907673,0,0,0,0,0,NULL,'_cli_',0,'$argon2i$v=19$m=65536,t=16,p=1$MTdkZDFzaVJvVzNZeHJwQw$t3OTF16qVn23tKuiRcKKKg+P3Wy/Zqa0es7Ub5JzUhs',1,NULL,'default','',NULL,0,'',NULL,'','a:9:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:0:{}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1636907673;}',NULL,NULL,1,NULL,0,0,NULL,NULL,''),(3,0,1637497814,1637497814,0,0,0,0,0,NULL,'mysearch-admin',0,'$argon2i$v=19$m=65536,t=16,p=1$UFRQZW84NzQxei5Rc2RaUg$OV+lWyOfyvXjDs/gLpzqMOP6sdKfhmZEhSeOvd1HYQ0',1,NULL,'default','test@example.de',NULL,0,'',NULL,'','a:11:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:8:{s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}s:28:\"dashboard/current_dashboard/\";s:40:\"c7c4b306f7eaa76c17f0534ffaa3778bf932f4d1\";s:10:\"web_layout\";a:3:{s:8:\"function\";s:1:\"2\";s:8:\"language\";s:2:\"-1\";s:19:\"constant_editor_cat\";N;}s:6:\"web_ts\";a:8:{s:8:\"function\";s:87:\"TYPO3\\CMS\\Tstemplate\\Controller\\TypoScriptTemplateObjectBrowserModuleFunctionController\";s:8:\"language\";N;s:19:\"constant_editor_cat\";s:7:\"content\";s:15:\"ts_browser_type\";s:5:\"setup\";s:16:\"ts_browser_const\";s:1:\"0\";s:23:\"ts_browser_showComments\";s:1:\"1\";s:25:\"tsbrowser_depthKeys_const\";a:1:{s:4:\"page\";i:1;}s:25:\"tsbrowser_depthKeys_setup\";a:2:{s:15:\"page.headerData\";i:1;s:6:\"plugin\";i:1;}}s:10:\"FormEngine\";a:2:{i:0;a:3:{s:32:\"86205c5935270b8ee413592ec1b62292\";a:4:{i:0;s:25:\"Main TypoScript Rendering\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:35:\"&edit%5Bsys_template%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"af6a208f792a83220f87a953a62a081a\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:6;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B6%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:6;s:3:\"pid\";i:6;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"f87337ea07fd5e46b7487a4d63a03a03\";a:4:{i:0;s:53:\"[Translate to English:] Faktorisierung von einer Zahl\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:8;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B8%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:8;s:3:\"pid\";i:6;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"f87337ea07fd5e46b7487a4d63a03a03\";}s:16:\"opendocs::recent\";a:8:{s:32:\"639c80047818aac48db3b25ab8d3d802\";a:4:{i:0;s:38:\"[Translate to English:] Faktorisierung\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:7;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B7%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:7;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"629911c017052e9e049ce359020150c0\";a:4:{i:0;s:29:\"Faktorisierung von einer Zahl\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:7;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B7%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:7;s:3:\"pid\";i:6;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"af6a208f792a83220f87a953a62a081a\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:6;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B6%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:6;s:3:\"pid\";i:6;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"3af505b920348c1a79bf62ea28cbec90\";a:4:{i:0;s:32:\"[Translate to English:] MySearch\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:5;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B5%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:5;s:3:\"pid\";i:0;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"494c59ed0b451cdb0042831766e2d4b1\";a:4:{i:0;s:31:\"[Translate to English:] Vorwort\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:5;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B5%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:5;s:3:\"pid\";i:2;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"7d9e144e24486a6668d151356ea4c9d4\";a:4:{i:0;s:37:\"[Translate to English:] Dokumentation\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:4;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B4%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:4;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"a3b9454ecc0d182884b26f9c529ddb87\";a:4:{i:0;s:7:\"Vorwort\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:4;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B4%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:4;s:3:\"pid\";i:2;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"581106f297d9eed8dec1190ee4d6b04d\";a:4:{i:0;s:38:\"Streichen der Einzelnaorm BGB ┬º1631d \";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:3;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B3%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:3;s:3:\"pid\";i:3;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}s:8:\"web_list\";a:3:{s:8:\"function\";N;s:8:\"language\";N;s:19:\"constant_editor_cat\";N;}s:9:\"clipboard\";a:5:{s:6:\"normal\";a:0:{}s:5:\"tab_1\";a:1:{s:4:\"mode\";s:0:\"\";}s:5:\"tab_2\";a:0:{}s:5:\"tab_3\";a:0:{}s:7:\"current\";s:5:\"tab_1\";}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1637515647;s:15:\"moduleSessionID\";a:8:{s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:40:\"d6b6a10a3d0a446a7475d3f1a1af28510e15bcd7\";s:28:\"dashboard/current_dashboard/\";s:40:\"24f5d72e657db7e268a51ed5080dadcca817613a\";s:10:\"web_layout\";s:40:\"d6b6a10a3d0a446a7475d3f1a1af28510e15bcd7\";s:6:\"web_ts\";s:40:\"d6b6a10a3d0a446a7475d3f1a1af28510e15bcd7\";s:10:\"FormEngine\";s:40:\"d6b6a10a3d0a446a7475d3f1a1af28510e15bcd7\";s:16:\"opendocs::recent\";s:40:\"d6b6a10a3d0a446a7475d3f1a1af28510e15bcd7\";s:8:\"web_list\";s:40:\"0de3d40badf6d0e3010e723a078731acd1dc4a92\";s:9:\"clipboard\";s:40:\"4a5b54c3f4e8763cc8a9410e4239cbc2b73d7774\";}s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:1:{s:3:\"0_1\";s:1:\"1\";}}}}}',NULL,NULL,1,NULL,1647784743,0,NULL,NULL,'');
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_adminpanel_requestcache`
--

DROP TABLE IF EXISTS `cache_adminpanel_requestcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_adminpanel_requestcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_adminpanel_requestcache`
--

LOCK TABLES `cache_adminpanel_requestcache` WRITE;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_adminpanel_requestcache_tags`
--

DROP TABLE IF EXISTS `cache_adminpanel_requestcache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_adminpanel_requestcache_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_adminpanel_requestcache_tags`
--

LOCK TABLES `cache_adminpanel_requestcache_tags` WRITE;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
INSERT INTO `cache_hash` VALUES (1,'86af02ae5f5a1084c71b6f1f0e44d9bf',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:5:{s:4:\"mod.\";a:6:{s:9:\"web_list.\";a:3:{s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:10:{s:7:\"common.\";a:3:{s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";s:9:\"elements.\";a:8:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:57:\"header,text,textpic,image,textmedia,bullets,table,uploads\";}s:5:\"menu.\";a:3:{s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";s:9:\"elements.\";a:15:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}s:14:\"menu_card_dir.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-menu-card\";s:5:\"title\";s:78:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_dir\";s:11:\"description\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_dir.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_card_dir\";}}s:15:\"menu_card_list.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-menu-card\";s:5:\"title\";s:79:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_list\";s:11:\"description\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.card_list.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"menu_card_list\";}}s:19:\"menu_thumbnail_dir.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-menu-thumbnail\";s:5:\"title\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_dir\";s:11:\"description\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_dir.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_thumbnail_dir\";}}s:20:\"menu_thumbnail_list.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-menu-thumbnail\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_list\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:menu.thumbnail_list.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"menu_thumbnail_list\";}}}s:4:\"show\";s:259:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages,menu_card_dir,menu_card_list,menu_thumbnail_dir,menu_thumbnail_list\";}s:8:\"special.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";}s:6:\"forms.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";s:4:\"show\";s:34:\"formframework,search,felogin_login\";s:9:\"elements.\";a:3:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:81:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:7:\"search.\";a:4:{s:14:\"iconIdentifier\";s:27:\"content-elements-searchform\";s:5:\"title\";s:79:\"LLL:EXT:indexed_search/Resources/Private/Language/locallang_db.xlf:plugin_title\";s:11:\"description\";s:85:\"LLL:EXT:indexed_search/Resources/Private/Language/locallang_db.xlf:plugin_description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:17:\"indexedsearch_pi2\";}}s:14:\"felogin_login.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-elements-login\";s:5:\"title\";s:92:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.title\";s:11:\"description\";s:98:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"felogin_login\";}}}}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:3:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}s:12:\"mysearchext.\";a:4:{s:14:\"iconIdentifier\";s:30:\"mysearchext-plugin-mysearchext\";s:5:\"title\";s:95:\"LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_mysearchext.name\";s:11:\"description\";s:102:\"LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_mysearchext.description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:23:\"mysearchext_mysearchext\";}}s:10:\"factorize.\";a:4:{s:14:\"iconIdentifier\";s:28:\"mysearchext-plugin-factorize\";s:11:\"description\";s:100:\"LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_factorize.description\";s:5:\"title\";s:93:\"LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_factorize.name\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:21:\"mysearchext_factorize\";}}}s:4:\"show\";s:1:\"*\";}s:12:\"interactive.\";a:3:{s:6:\"header\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.interactive\";s:9:\"elements.\";a:5:{s:10:\"accordion.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-accordion\";s:5:\"title\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.accordion\";s:11:\"description\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.accordion.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"accordion\";}}s:9:\"carousel.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"carousel\";}}s:20:\"carousel_fullscreen.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_fullscreen\";s:11:\"description\";s:112:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_fullscreen.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"carousel_fullscreen\";}}s:15:\"carousel_small.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-carousel\";s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_small\";s:11:\"description\";s:107:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.carousel_small.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"carousel_small\";}}s:9:\"timeline.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-timeline\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.timeline\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.timeline.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"timeline\";}}}s:4:\"show\";s:62:\"accordion,carousel,carousel_fullscreen,carousel_small,timeline\";}s:6:\"media.\";a:3:{s:6:\"header\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.media\";s:9:\"elements.\";a:11:{s:6:\"audio.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-audio\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.audio\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.audio.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"audio\";}}s:11:\"card_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-card-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"card_group\";}}s:15:\"external_media.\";a:4:{s:14:\"iconIdentifier\";s:38:\"content-bootstrappackage-externalmedia\";s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.external_media\";s:11:\"description\";s:107:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.external_media.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:14:\"external_media\";}}s:8:\"gallery.\";a:4:{s:14:\"iconIdentifier\";s:32:\"content-bootstrappackage-gallery\";s:5:\"title\";s:88:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.gallery\";s:11:\"description\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.gallery.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"gallery\";}}s:11:\"icon_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-icon-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.icon_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.icon_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"icon_group\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:6:\"media.\";a:4:{s:14:\"iconIdentifier\";s:30:\"mimetypes-x-content-multimedia\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.media\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.media.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"media\";}}s:4:\"tab.\";a:4:{s:14:\"iconIdentifier\";s:28:\"content-bootstrappackage-tab\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.tab\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.tab.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"tab\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}}s:4:\"show\";s:92:\"audio,card_group,external_media,gallery,icon_group,image,media,tab,textmedia,textpic,uploads\";}s:5:\"text.\";a:3:{s:6:\"header\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.text\";s:9:\"elements.\";a:13:{s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:11:\"card_group.\";a:4:{s:14:\"iconIdentifier\";s:35:\"content-bootstrappackage-card-group\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.card_group.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"card_group\";}}s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:10:\"listgroup.\";a:4:{s:14:\"iconIdentifier\";s:34:\"content-bootstrappackage-listgroup\";s:5:\"title\";s:90:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.listgroup\";s:11:\"description\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.listgroup.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"listgroup\";}}s:6:\"panel.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-panel\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.panel\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.panel.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"panel\";}}s:6:\"quote.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-quote\";s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.quote\";s:11:\"description\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.quote.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"quote\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:11:\"textcolumn.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-text-columns\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textcolumn\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textcolumn.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"textcolumn\";}}s:9:\"texticon.\";a:4:{s:14:\"iconIdentifier\";s:33:\"content-bootstrappackage-texticon\";s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.texticon\";s:11:\"description\";s:101:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.texticon.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"texticon\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:11:\"textteaser.\";a:4:{s:14:\"iconIdentifier\";s:19:\"content-text-teaser\";s:5:\"title\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textteaser\";s:11:\"description\";s:103:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.textteaser.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"textteaser\";}}}s:4:\"show\";s:107:\"bullets,card_group,header,listgroup,panel,quote,table,text,textcolumn,texticon,textmedia,textpic,textteaser\";}s:7:\"social.\";a:3:{s:6:\"header\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.social_media\";s:9:\"elements.\";a:1:{s:13:\"social_links.\";a:4:{s:14:\"iconIdentifier\";s:37:\"content-bootstrappackage-social-links\";s:5:\"title\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.social_links\";s:11:\"description\";s:105:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.social_links.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"social_links\";}}}s:4:\"show\";s:12:\"social_links\";}s:5:\"data.\";a:3:{s:6:\"header\";s:83:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_group.data\";s:9:\"elements.\";a:2:{s:4:\"csv.\";a:4:{s:14:\"iconIdentifier\";s:28:\"content-bootstrappackage-csv\";s:5:\"title\";s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.csv\";s:11:\"description\";s:96:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:content_element.csv.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"csv\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}}s:4:\"show\";s:9:\"csv,table\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:6:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:2:\"3.\";a:2:{s:5:\"label\";s:75:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_layouts\";s:6:\"fields\";s:79:\"title,uid,actual_backend_layout,backend_layout,backend_layout_next_level,layout\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:106:\"title,uid,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:67:\"title,uid,og_title,og_description,twitter_title,twitter_description\";}}}s:14:\"linkvalidator.\";a:8:{s:13:\"searchFields.\";a:2:{s:5:\"pages\";s:9:\"media,url\";s:10:\"tt_content\";s:28:\"bodytext,header_link,records\";}s:9:\"linktypes\";s:16:\"db,file,external\";s:16:\"linktypesConfig.\";a:1:{s:9:\"external.\";a:7:{s:13:\"httpAgentName\";s:19:\"TYPO3 LinkValidator\";s:12:\"httpAgentUrl\";s:0:\"\";s:14:\"httpAgentEmail\";s:0:\"\";s:8:\"headers.\";a:0:{}s:6:\"method\";s:4:\"HEAD\";s:5:\"range\";s:6:\"0-4048\";s:7:\"timeout\";s:2:\"20\";}}s:11:\"checkhidden\";s:1:\"0\";s:16:\"showCheckLinkTab\";s:1:\"1\";s:21:\"actionAfterEditRecord\";s:7:\"recheck\";s:5:\"mail.\";a:5:{s:8:\"fromname\";s:13:\"LinkValidator\";s:9:\"fromemail\";s:25:\"linkvalidator@example.com\";s:11:\"replytoname\";s:0:\"\";s:12:\"replytoemail\";s:0:\"\";s:7:\"subject\";s:26:\"TYPO3 LinkValidator report\";}s:12:\"linkhandler.\";a:1:{s:19:\"reportHiddenRecords\";s:1:\"0\";}}s:11:\"web_layout.\";a:2:{s:11:\"tt_content.\";a:1:{s:8:\"preview.\";a:4:{s:3:\"csv\";s:66:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/Csv.html\";s:14:\"external_media\";s:76:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/ExternalMedia.html\";s:9:\"listgroup\";s:72:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/ListGroup.html\";s:5:\"quote\";s:68:\"EXT:bootstrap_package/Resources/Private/Templates/Preview/Quote.html\";}}s:15:\"BackendLayouts.\";a:14:{s:10:\"2_columns.\";a:3:{s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:73:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns.svg\";}s:16:\"2_columns_25_75.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_25_75\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_25_75.svg\";}s:16:\"2_columns_50_50.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_50_50\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_50_50.svg\";}s:23:\"2_columns_offset_right.\";a:3:{s:5:\"title\";s:102:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.2_columns_offset_right\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"8\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:86:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/2_columns_offset_right.svg\";}s:10:\"3_columns.\";a:3:{s:5:\"title\";s:89:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.3_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"3.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:73:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/3_columns.svg\";}s:8:\"default.\";a:3:{s:5:\"title\";s:87:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.default\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:71:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/default.svg\";}s:7:\"simple.\";a:3:{s:5:\"title\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.simple\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"4\";s:5:\"rows.\";a:4:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}}}}s:4:\"icon\";s:70:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/simple.svg\";}s:16:\"special_feature.\";a:3:{s:5:\"title\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.special_feature\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:2:\"10\";s:5:\"rows.\";a:10:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special1\";s:6:\"colPos\";s:2:\"30\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special2\";s:6:\"colPos\";s:2:\"31\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special3\";s:6:\"colPos\";s:2:\"32\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special4\";s:6:\"colPos\";s:2:\"33\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"6.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.main2\";s:6:\"colPos\";s:1:\"4\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"7.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special5\";s:6:\"colPos\";s:2:\"34\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special6\";s:6:\"colPos\";s:2:\"35\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"8.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special7\";s:6:\"colPos\";s:2:\"36\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:95:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.special8\";s:6:\"colPos\";s:2:\"37\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"9.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:3:\"10.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:79:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/special_feature.svg\";}s:14:\"special_start.\";a:3:{s:5:\"title\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.special_start\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"6\";s:5:\"rows.\";a:6:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle1\";s:6:\"colPos\";s:2:\"20\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle2\";s:6:\"colPos\";s:2:\"21\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.middle3\";s:6:\"colPos\";s:2:\"22\";s:7:\"colspan\";s:1:\"4\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"6.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:77:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/special_start.svg\";}s:19:\"subnavigation_left.\";a:3:{s:5:\"title\";s:98:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_left\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"9\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:82:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_left.svg\";}s:29:\"subnavigation_left_2_columns.\";a:3:{s:5:\"title\";s:108:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_left_2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}s:2:\"2.\";a:3:{s:4:\"name\";s:91:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.left\";s:6:\"colPos\";s:1:\"1\";s:7:\"colspan\";s:1:\"3\";}s:2:\"3.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:92:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_left_2_columns.svg\";}s:20:\"subnavigation_right.\";a:3:{s:5:\"title\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_right\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:2:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"9\";}s:2:\"2.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:83:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_right.svg\";}s:30:\"subnavigation_right_2_columns.\";a:3:{s:5:\"title\";s:109:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.subnavigation_right_2_columns\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:2:\"12\";s:8:\"rowCount\";s:1:\"5\";s:5:\"rows.\";a:5:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.border\";s:6:\"colPos\";s:1:\"3\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"2.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:100:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentbefore\";s:6:\"colPos\";s:1:\"8\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"3.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";s:7:\"colspan\";s:1:\"6\";}s:2:\"2.\";a:3:{s:4:\"name\";s:92:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.right\";s:6:\"colPos\";s:1:\"2\";s:7:\"colspan\";s:1:\"3\";}s:2:\"3.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.subnav\";s:7:\"colspan\";s:1:\"3\";}}}s:2:\"4.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:3:{s:4:\"name\";s:99:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.contentafter\";s:6:\"colPos\";s:1:\"9\";s:7:\"colspan\";s:2:\"12\";}}}s:2:\"5.\";a:1:{s:8:\"columns.\";a:3:{s:2:\"1.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer1\";s:6:\"colPos\";s:2:\"10\";s:7:\"colspan\";s:1:\"4\";}s:2:\"2.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer2\";s:6:\"colPos\";s:2:\"11\";s:7:\"colspan\";s:1:\"4\";}s:2:\"3.\";a:3:{s:4:\"name\";s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:backend_layout.column.footer3\";s:6:\"colPos\";s:2:\"12\";s:7:\"colspan\";s:1:\"4\";}}}}}}s:4:\"icon\";s:93:\"EXT:bootstrap_package/Resources/Public/Icons/BackendLayouts/subnavigation_right_2_columns.svg\";}s:8:\"example.\";a:3:{s:5:\"title\";s:87:\"LLL:EXT:mysearchsite/Resources/Private/Language/locallang_be.xlf:backend_layout.example\";s:7:\"config.\";a:1:{s:15:\"backend_layout.\";a:3:{s:8:\"colCount\";s:1:\"1\";s:8:\"rowCount\";s:1:\"1\";s:5:\"rows.\";a:1:{s:2:\"1.\";a:1:{s:8:\"columns.\";a:1:{s:2:\"1.\";a:2:{s:4:\"name\";s:93:\"LLL:EXT:mysearchsite/Resources/Private/Language/locallang_be.xlf:backend_layout.column.normal\";s:6:\"colPos\";s:1:\"0\";}}}}}}s:4:\"icon\";s:66:\"EXT:mysearchsite/Resources/Public/Icons/BackendLayouts/example.svg\";}}}}s:8:\"TCEMAIN.\";a:3:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:6:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:9:\"page,file\";s:9:\"scanAfter\";s:9:\"page,file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:16:\"page,file,folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:20:\"page,file,folder,url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:25:\"page,file,folder,url,mail\";s:10:\"scanBefore\";s:3:\"url\";}}s:12:\"permissions.\";a:4:{s:7:\"groupid\";s:1:\"1\";s:4:\"user\";s:36:\"show, editcontent, edit, new, delete\";s:5:\"group\";s:36:\"show, editcontent, edit, new, delete\";s:9:\"everybody\";s:0:\"\";}}s:8:\"TCEFORM.\";a:2:{s:11:\"tt_content.\";a:10:{s:12:\"imageorient.\";a:2:{s:6:\"types.\";a:2:{s:6:\"image.\";a:2:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";s:8:\"disabled\";s:1:\"1\";}s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:11:\"removeItems\";s:14:\"1,2,9,10,17,18\";}s:14:\"header_layout.\";a:1:{s:10:\"altLabels.\";a:5:{i:1;s:2:\"H1\";i:2;s:2:\"H2\";i:3;s:2:\"H3\";i:4;s:2:\"H4\";i:5;s:2:\"H5\";}}s:7:\"layout.\";a:3:{s:11:\"removeItems\";s:5:\"1,2,3\";s:29:\"disableNoMatchingValueElement\";s:1:\"1\";s:6:\"types.\";a:1:{s:8:\"uploads.\";a:2:{s:11:\"removeItems\";s:1:\"3\";s:10:\"altLabels.\";a:3:{i:0;s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.default\";i:1;s:84:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.icons\";i:2;s:94:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:uploadslayout.iconsandpreview\";}}}}s:12:\"table_class.\";a:1:{s:9:\"addItems.\";a:2:{s:5:\"hover\";s:82:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:tablelayout.hover\";s:9:\"condensed\";s:86:\"LLL:EXT:bootstrap_package/Resources/Private/Language/Backend.xlf:tablelayout.condensed\";}}s:12:\"imageborder.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:10:\"imagecols.\";a:1:{s:11:\"removeItems\";s:3:\"7,8\";}s:11:\"image_zoom.\";a:1:{s:6:\"types.\";a:1:{s:6:\"media.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}}s:20:\"accessibility_title.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:12:\"imageheight.\";a:1:{s:8:\"disabled\";s:1:\"1\";}s:11:\"imagewidth.\";a:1:{s:8:\"disabled\";s:1:\"1\";}}s:6:\"pages.\";a:1:{s:7:\"layout.\";a:1:{s:11:\"removeItems\";s:5:\"1,2,3\";}}}s:4:\"RTE.\";a:1:{s:8:\"default.\";a:1:{s:6:\"preset\";s:8:\"mysearch\";}}s:12:\"TCAdefaults.\";a:1:{s:11:\"tt_content.\";a:1:{s:9:\"imagecols\";s:1:\"1\";}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"3f03881ee9384e0bf87193071ae3e4f2\";}');
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
INSERT INTO `cache_hash_tags` VALUES (1,'86af02ae5f5a1084c71b6f1f0e44d9bf','pageTSconfig');
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection`
--

DROP TABLE IF EXISTS `cache_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection`
--

LOCK TABLES `cache_pagesection` WRITE;
/*!40000 ALTER TABLE `cache_pagesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cache_pagesection_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection_tags`
--

LOCK TABLES `cache_pagesection_tags` WRITE;
/*!40000 ALTER TABLE `cache_pagesection_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
INSERT INTO `cache_rootline` VALUES (1,'1__0_-99_1',1650384485,'x£MÉMrâ0à´Ô­3mZsåfC÷+─c1Xªe2╣{ÈÈ+¤¹,=IO╦R>¡,\Z-½J>â¼Ñ¡═╩6wU▓·öéÛ&à eæÓw╚hÖh MÉ­SKÄuÉR|--Þ®╗ï¦█ÙY▀l+÷Äîızù┬Ú#%Wwk°ÏïÃNDv8Fƒñ\0or┬▄@§ãqÁÕìïÝe;°!.¥`»ú¯!d&┤îÉ\"aôK█í┐┘^4þÁØk(ýDY▀╣hÍ■¾_(6¿`	&D╩R0zRY¯eòAà¯Ó§Â┤├Ìz5á9Ä®8¿½¯╝Â┌ËQ×»PfpGx»Î/9ô£ã');
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
INSERT INTO `cache_rootline_tags` VALUES (1,'1__0_-99_1','pageId_1');
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `treelist` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_treelist`
--

LOCK TABLES `cache_treelist` WRITE;
/*!40000 ALTER TABLE `cache_treelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_treelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subgroup` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `felogin_redirectPid` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` mediumblob DEFAULT NULL,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usergroup` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uc` blob DEFAULT NULL,
  `title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `is_online` int(10) unsigned NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  `felogin_redirectPid` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `felogin_forgotHash` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`),
  KEY `felogin_forgotHash` (`felogin_forgotHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_config`
--

DROP TABLE IF EXISTS `index_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_config` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_id` int(11) NOT NULL DEFAULT 0,
  `session_data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `depth` int(10) unsigned NOT NULL DEFAULT 0,
  `table2index` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alternative_source_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `get_params` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fieldlist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `externalUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `indexcfgs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extensions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timer_next_indexing` int(11) NOT NULL DEFAULT 0,
  `timer_frequency` int(11) NOT NULL DEFAULT 0,
  `timer_offset` int(11) NOT NULL DEFAULT 0,
  `url_deny` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recordsbatch` int(11) NOT NULL DEFAULT 0,
  `records_indexonchange` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_config`
--

LOCK TABLES `index_config` WRITE;
/*!40000 ALTER TABLE `index_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_debug`
--

DROP TABLE IF EXISTS `index_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_debug` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `debuginfo` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_debug`
--

LOCK TABLES `index_debug` WRITE;
/*!40000 ALTER TABLE `index_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_fulltext`
--

DROP TABLE IF EXISTS `index_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_fulltext` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `fulltextdata` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaphonedata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_fulltext`
--

LOCK TABLES `index_fulltext` WRITE;
/*!40000 ALTER TABLE `index_fulltext` DISABLE KEYS */;
INSERT INTO `index_fulltext` VALUES (123013461,'Faktorisierung   Faktorisierung von einer Zahl    F├╝r das Produkt A*B gibt es ein eindeutige Ergebniss P. Die letzte Ziffer in einem Produkt lasst sich auch wenige Ziffern-Kombinationen reduzieren.  Weiterhin gilt f├╝r jedes beliebige Basis eine Ziffern-System, dass zwei Zahlen mit m+n Ziffern immer zu einem Produkt f├╝hren mit m+n oder m+n-1 Ziffern. Wegen dieser Eigenschaft hatte ich die Idee, dass man ein Produkt auf Ziffernbasis h├ñtte zur├╝ckrechnen k├Ânnen.  Der Algorithmus ist ein erster Versuch, um ohne Kenntnis der Primfaktoren einen Zahl auf der Basis von Ziffern zu zerlegen. Leider explodiert mit zunehmender Gr├Â├ƒe des Produkts die Zahl der notwendigen Versuche, eine richtige Bitkombination f├╝r die Faktoren zu bestimmen.  War ein interessanter Versuch. Vielleicht kann die Idee jemanden anderen inspirieren.','');
/*!40000 ALTER TABLE `index_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_grlist`
--

DROP TABLE IF EXISTS `index_grlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_grlist` (
  `uniqid` int(11) NOT NULL AUTO_INCREMENT,
  `phash` int(11) NOT NULL DEFAULT 0,
  `phash_x` int(11) NOT NULL DEFAULT 0,
  `hash_gr_list` int(11) NOT NULL DEFAULT 0,
  `gr_list` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uniqid`),
  KEY `joinkey` (`phash`,`hash_gr_list`),
  KEY `phash_grouping` (`phash_x`,`hash_gr_list`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_grlist`
--

LOCK TABLES `index_grlist` WRITE;
/*!40000 ALTER TABLE `index_grlist` DISABLE KEYS */;
INSERT INTO `index_grlist` VALUES (15,123013461,123013461,215747215,'0,-1');
/*!40000 ALTER TABLE `index_grlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_phash`
--

DROP TABLE IF EXISTS `index_phash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_phash` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `phash_grouping` int(11) NOT NULL DEFAULT 0,
  `static_page_arguments` blob DEFAULT NULL,
  `data_filename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data_page_id` int(10) unsigned NOT NULL DEFAULT 0,
  `data_page_type` int(10) unsigned NOT NULL DEFAULT 0,
  `data_page_mp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gr_list` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_type` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_mtime` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `item_size` int(11) NOT NULL DEFAULT 0,
  `contentHash` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `parsetime` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `item_crdate` int(11) NOT NULL DEFAULT 0,
  `externalUrl` smallint(6) NOT NULL DEFAULT 0,
  `recordUid` int(11) NOT NULL DEFAULT 0,
  `freeIndexUid` int(11) NOT NULL DEFAULT 0,
  `freeIndexSetId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`phash`),
  KEY `phash_grouping` (`phash_grouping`),
  KEY `freeIndexUid` (`freeIndexUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_phash`
--

LOCK TABLES `index_phash` WRITE;
/*!40000 ALTER TABLE `index_phash` DISABLE KEYS */;
INSERT INTO `index_phash` VALUES (123013461,36818715,'[]','',6,0,'','0,-1','0','Faktorisierung','Faktorisierung von einer Zahl F├╝r das Produkt A*B gibt es ein eindeutige Ergebniss P. Die letzte Ziffer in einem Produkt lasst sich auch wenige Ziffern-Kombinationen reduzieren. Weiterhin gilt f├╝r jed',1647788736,1647792046,8094,123807889,1647792046,82,0,1647784823,0,0,0,0);
/*!40000 ALTER TABLE `index_phash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_rel`
--

DROP TABLE IF EXISTS `index_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_rel` (
  `phash` int(11) NOT NULL DEFAULT 0,
  `wid` int(11) NOT NULL DEFAULT 0,
  `count` smallint(5) unsigned NOT NULL DEFAULT 0,
  `first` int(10) unsigned NOT NULL DEFAULT 0,
  `freq` smallint(5) unsigned NOT NULL DEFAULT 0,
  `flags` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`phash`,`wid`),
  KEY `wid` (`wid`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_rel`
--

LOCK TABLES `index_rel` WRITE;
/*!40000 ALTER TABLE `index_rel` DISABLE KEYS */;
INSERT INTO `index_rel` VALUES (123013461,7646479,1,30,2622,0),(123013461,11432134,1,66,2622,0),(123013461,12527125,1,104,2622,0),(123013461,13375323,1,7,2622,0),(123013461,14483683,1,76,2622,0),(123013461,15527538,1,95,2622,0),(123013461,16405607,1,21,2622,0),(123013461,19165438,1,10,2622,0),(123013461,20667390,1,18,2622,0),(123013461,22387446,1,80,2622,0),(123013461,22894032,1,36,2622,0),(123013461,25587748,3,43,7868,0),(123013461,28777174,1,17,2622,0),(123013461,28797657,1,78,2622,0),(123013461,29479722,2,19,5245,0),(123013461,31572772,1,24,2622,0),(123013461,31786404,4,6,10491,0),(123013461,32473688,1,22,2622,0),(123013461,39782543,2,65,5245,0),(123013461,44455709,1,5,2622,0),(123013461,45378455,1,77,2622,0),(123013461,56396699,2,35,5245,0),(123013461,58014769,1,107,2622,0),(123013461,60580829,1,62,2622,0),(123013461,63916464,1,58,2622,0),(123013461,67063490,3,3,7868,0),(123013461,79021260,1,120,2622,0),(123013461,80387389,1,110,2622,0),(123013461,81154680,1,68,2622,0),(123013461,89935432,1,50,2622,0),(123013461,95445454,3,4,7868,0),(123013461,96547841,1,27,2622,0),(123013461,100353572,1,54,2622,0),(123013461,100776207,1,25,2622,0),(123013461,101324009,1,31,2622,0),(123013461,110736162,1,12,2622,0),(123013461,111663818,1,2,2622,0),(123013461,113068209,4,70,10491,0),(123013461,116979063,3,39,7868,0),(123013461,120475576,3,38,7868,0),(123013461,122836453,1,13,2622,0),(123013461,129546597,2,40,5245,0),(123013461,131719851,1,74,2622,0),(123013461,136012729,5,15,13114,0),(123013461,136831513,1,119,2622,0),(123013461,137849141,2,75,5245,0),(123013461,137918665,1,14,2622,0),(123013461,139773738,1,9,2622,0),(123013461,140694603,1,100,2622,0),(123013461,141693632,1,16,2622,0),(123013461,142894170,1,109,2622,0),(123013461,143041210,1,81,2622,0),(123013461,145399322,1,26,2622,0),(123013461,149243865,1,93,2622,0),(123013461,153825879,1,96,2622,0),(123013461,154056191,1,8,2622,0),(123013461,154689495,1,90,2622,0),(123013461,155626615,1,114,2622,0),(123013461,159188277,1,67,2622,0),(123013461,161456903,2,1,5245,0),(123013461,163747725,1,42,2622,0),(123013461,166208274,1,71,2622,0),(123013461,170975537,1,46,2622,0),(123013461,173858318,3,41,7868,0),(123013461,177459123,1,28,2622,0),(123013461,180899535,1,89,2622,0),(123013461,186424132,1,23,2622,0),(123013461,193809126,2,0,5245,128),(123013461,194761389,1,112,2622,0),(123013461,196532340,1,37,2622,0),(123013461,199118408,1,118,2622,0),(123013461,203100129,1,103,2622,0),(123013461,209868318,1,52,2622,0),(123013461,213864351,2,33,5245,0),(123013461,219331479,2,60,5245,0),(123013461,222097601,1,56,2622,0),(123013461,226268637,2,32,5245,0),(123013461,240816951,1,72,2622,0),(123013461,241831225,1,55,2622,0),(123013461,241852763,1,91,2622,0),(123013461,244821167,1,101,2622,0),(123013461,253191240,1,115,2622,0),(123013461,257982654,1,69,2622,0),(123013461,262500644,1,57,2622,0),(123013461,263700778,1,34,2622,0),(123013461,266056613,1,94,2622,0),(123013461,268367710,4,11,10491,0);
/*!40000 ALTER TABLE `index_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_section`
--

DROP TABLE IF EXISTS `index_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_section` (
  `uniqid` int(11) NOT NULL AUTO_INCREMENT,
  `phash` int(11) NOT NULL DEFAULT 0,
  `phash_t3` int(11) NOT NULL DEFAULT 0,
  `rl0` int(10) unsigned NOT NULL DEFAULT 0,
  `rl1` int(10) unsigned NOT NULL DEFAULT 0,
  `rl2` int(10) unsigned NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uniqid`),
  KEY `joinkey` (`phash`,`rl0`),
  KEY `page_id` (`page_id`),
  KEY `rl0` (`rl0`,`rl1`,`phash`),
  KEY `rl0_2` (`rl0`,`phash`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_section`
--

LOCK TABLES `index_section` WRITE;
/*!40000 ALTER TABLE `index_section` DISABLE KEYS */;
INSERT INTO `index_section` VALUES (15,123013461,123013461,1,6,0,6);
/*!40000 ALTER TABLE `index_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_stat_word`
--

DROP TABLE IF EXISTS `index_stat_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_stat_word` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `index_stat_search_id` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `pageid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tstamp` (`tstamp`,`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_stat_word`
--

LOCK TABLES `index_stat_word` WRITE;
/*!40000 ALTER TABLE `index_stat_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_stat_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_words`
--

DROP TABLE IF EXISTS `index_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_words` (
  `wid` int(11) NOT NULL DEFAULT 0,
  `baseword` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `metaphone` int(11) NOT NULL DEFAULT 0,
  `is_stopword` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`wid`),
  KEY `baseword` (`baseword`),
  KEY `metaphone` (`metaphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_words`
--

LOCK TABLES `index_words` WRITE;
/*!40000 ALTER TABLE `index_words` DISABLE KEYS */;
INSERT INTO `index_words` VALUES (383458,'udn',188834326,0),(1016966,'unter',55392644,0),(1299463,'138',0,0),(2082502,'bessere',132498837,0),(2347262,'babys',242653929,0),(3969025,'erforderliche',40525802,0),(5024686,'erwachsenen',125091741,0),(5623316,'bestimmungen',109344500,0),(5804802,'dilettanten',60357703,0),(5847445,'unseren',79116240,0),(6144310,'erlauben',203835173,0),(7280102,'hoffe',77114142,0),(7646479,'jedes',136870826,0),(8065409,'unversertheit',47402106,0),(8179683,'also',90334567,0),(8571533,'gestimmt',188341998,0),(8963276,'beschneidung',44959789,0),(9065241,'jeder',93194904,0),(9079692,'geben',209315642,0),(11432134,'ziffernbasis',127160282,0),(12527125,'bitkombination',23258369,0),(12876592,'erweitert',42835252,0),(13375323,'a',133977639,0),(14483683,'um',67793360,0),(14706523,'teilnahme',217177022,0),(15527538,'des',112888235,0),(15895389,'141',0,0),(16384513,'zwecks',65230653,0),(16405607,'lasst',148929577,0),(17390295,'bundestag',155427348,0),(18592904,'niederen',243680160,0),(19137005,'├╝bungen',212481805,0),(19165438,'es',4987386,0),(20209370,'selbstbestimmung',215337542,0),(20470132,'140',0,0),(20558014,'notwehr',108846349,0),(20667390,'in',210169357,0),(20954323,'alten',155674370,0),(21349916,'bedeutet',48970906,0),(21962647,'via',134242697,0),(22255264,'auftretenden',182813420,0),(22361773,'namentlicher',137754907,0),(22387446,'primfaktoren',200405826,0),(22758691,'politische',147848566,0),(22894032,'zwei',116746916,0),(23700415,'denke',11662837,0),(23804529,'sie',98290061,0),(24059599,'zwingend',238200323,0),(24315471,'urteilsf├ñhige',129300991,0),(25117915,'verfassung',155367445,0),(25136934,'aspekt',203571700,0),(25587748,'zu',98290061,0),(25887900,'an',227967440,0),(26621022,'deutscher',75216367,0),(27777397,'anlass',57766336,0),(27878887,'einsetzt',128357616,0),(28557757,'zukunft',243297844,0),(28777174,'ziffer',145267603,0),(28797657,'kenntnis',54693801,0),(29479722,'einem',169887962,0),(31116824,'eingereicht',26972126,0),(31572772,'wenige',75537512,0),(31786404,'produkt',156287124,0),(32473688,'sich',207383350,0),(34924692,'bundesregierung',101436100,0),(34943403,'wird',50420941,0),(35015879,'1631d',194956824,0),(36387043,'garantie',189684263,0),(36411651,'sollte',208754236,0),(36448106,'wer',254493503,0),(36640204,'beschnitten',174395743,0),(36885086,'personen',6663192,0),(37006781,'zwingen',223989414,0),(37138472,'verh├ñltnis',157402365,0),(38775036,'eigenen',102469807,0),(39018827,'2012',0,0),(39782543,'auf',7316839,0),(40605984,'www.gesetzeiminternet.de/bgb/__1631d.html',136914144,0),(41257113,'einige',162050959,0),(41340754,'unschuldigen',73394880,0),(42700276,'damaligen',248778136,0),(43916639,'12.12.12',0,0),(43966401,'deutsche',235119847,0),(44455709,'das',112888235,0),(45130876,'obdachlose',24604894,0),(45378455,'ohne',151409131,0),(45586258,'beschneiderschutz',22230846,0),(45588553,'m├ñdchen',45837222,0),(46206929,'damit',22823587,0),(46862644,'stellenweert',126325084,0),(47251343,'denken',238740216,0),(47655230,'einsichts',37554235,0),(48015221,'begr├╝ndung',67782286,0),(48095482,'https://dserver.bundestag.de/btd/17/112/1711295.pdf',185082189,0),(48801294,'wenn',208277116,0),(49443089,'abstimmung',217222255,0),(49555996,'abgeben',182437024,0),(49570755,'abgeordnete',125843785,0),(49982843,'niemand',199873189,0),(50242394,'ersatzlos',257081654,0),(50367801,'selbat',56635807,0),(51299140,'schutzw├╝rdiger',70128892,0),(52249921,'fast',31156501,0),(52761083,'z├Âpfe',189725493,0),(53247010,'minister',120726905,0),(53275072,'den',155703254,0),(55325544,'dieter',178055572,0),(55680746,'penisbeschneider',197089506,0),(55716882,'unwiderruflich',90905324,0),(55990610,'genau',228271400,0),(56359837,'aktion',104475700,0),(56396699,'dass',112888235,0),(56600609,'freiheit',98480740,0),(56845880,'169',0,0),(57238291,'eher',22162039,0),(57748566,'beispiel',102186580,0),(58014769,'faktoren',214233199,0),(58374287,'vier',18542032,0),(58634611,'bremen',109327862,0),(58755785,'gleichzeitg',165550257,0),(59270283,'anzusiedeln',191709230,0),(59270942,'gelten',115707996,0),(59431758,'viele',180819856,0),(59473408,'bgb',27154391,0),(59707738,'kinder',193582262,0),(60062750,'lehren',266686886,0),(60161607,'beschneidern',46345575,0),(60329087,'137',0,0),(60370114,'besch├ñmend',222244949,0),(60580829,'man',155430831,0),(61744348,'wieder',121072355,0),(62695103,'kanzler',118230821,0),(63056591,'medizinisch',238898812,0),(63916464,'ich',58596291,0),(65278965,'wie',102669318,0),(65791562,'offrecordtext',117335879,0),(65994805,'neue',148488967,0),(67063490,'zahl',122391892,0),(67327732,'n├ñchsten',264480924,0),(67961663,'weil',103777,0),(68261433,'event',112085771,0),(68812013,'schutz',81773618,0),(69864984,'136',0,0),(70149200,'negativen',196553766,0),(72422564,'meint',83837556,0),(72513577,'eltern',17591990,0),(72670787,'├Âffentlichen',223570712,0),(72936076,'beschlossen',143654641,0),(73113544,'gezwungen',148434882,0),(73121934,'dem',180856059,0),(73254560,'gleichen',78475928,0),(74145369,'hat',151872750,0),(74681917,'jahren',258268408,0),(75327212,'werte',50420941,0),(77039377,'gewalt',264403795,0),(77756498,'kindeswohl',14053826,0),(79021260,'inspirieren.',79459989,0),(79022921,'namentliche',3717993,0),(79345960,'solche',259009752,0),(79736082,'zum',81843446,0),(80387389,'war',254493503,0),(80717343,'glauben',122894356,0),(80788237,'kabinett',56749741,0),(81154680,'zur├╝ckrechnen',267367698,0),(81931136,'verletzenden',160826224,0),(83283814,'freund',13193335,0),(83573986,'fanatiker',227899214,0),(84114287,'├╝nw├╝rdig',249519546,0),(84794418,'politiker',123925878,0),(85223465,'geistigbehinderten',64948564,0),(85965240,'ber├╝cksichtigung',124986976,0),(86740146,'meinen',180977587,0),(87083549,'├╝bung',256520901,0),(87527926,'https://www.gesetzeiminternet.de/gg/bjnr000010949.html',118590619,0),(89935432,'oder',164965875,0),(90331430,'gem├ñ├ƒ',86791942,0),(90602914,'alter',168016832,0),(90965533,'faschitoiden',1839094,0),(91096526,'unterdr├╝ckte',248351936,0),(92267705,'bei',165014887,0),(92708603,'deutschland',173924645,0),(95374409,'beschlie├ƒen',133240336,0),(95445454,'f├╝r',18542032,0),(96122749,'recht',95885177,0),(96547841,'weiterhin',112558040,0),(96863734,'w├╝rde',117793038,0),(97011098,'mehr',224150565,0),(97135272,'da',194956824,0),(97462980,'aufrechte',146870857,0),(97594229,'alle',243871352,0),(98065123,'genitalbeschneider',237264172,0),(98351624,'bereich',151015165,0),(99361821,'initiator',122164851,0),(99481280,'m├Âge',254989000,0),(99612055,'noch',158596452,0),(99760938,'einzustehen',130896310,0),(100353572,'wegen',154902632,0),(100606819,'und',159492066,0),(100776207,'ziffernkombinationen',223928610,0),(101324009,'beliebige',177641423,0),(101758898,'12.12.2012',0,0),(101907979,'pervers',71976711,0),(102390031,'august',158488041,0),(104001063,'aktuell',41093971,0),(104166408,'unnd',159492066,0),(105982932,'11',0,0),(106813440,'sind',143728665,0),(107115235,'zugestimmt',46102460,0),(107413230,'k├Ârperlichen',223993598,0),(107430654,'bzw',161624513,0),(109350261,'baby',164878596,0),(109527022,'w├ñchst',136718015,0),(110466388,'religi├Âser',76728149,0),(110705797,'grundgesetzes',57730460,0),(110736162,'eindeutige',192838711,0),(110912334,'tr├ñgt',233698086,0),(111663818,'einer',131177876,0),(111921950,'medien',108035454,0),(112277324,'gesundheitsminister',59641243,0),(113068209,'der',247333392,0),(113323028,'merkel',42791694,0),(114825695,'quellen',103121024,0),(115122745,'zorn',177074640,0),(116232831,'parlament',95975435,0),(116551711,'grund',189684263,0),(116979063,'m',110531015,0),(117132145,'menschenrechte',180392383,0),(117345455,'augen',147122005,0),(117451059,'blick',59157768,0),(117660338,'nicht',66150317,0),(118902113,'https://www.bundestag.de/parlament/plenum/abstimmung/abstimm',74950892,0),(118924004,'genannten',81239457,0),(119015414,'vor',18542032,0),(119343577,'b├╝rger',27964373,0),(120475576,'mit',9097359,0),(120559199,'ihres',57123223,0),(121093008,'betroffenen',120508208,0),(121367502,'im',130518715,0),(121466531,'ungeeignet',18742910,0),(121774324,'gesellschaft',90259041,0),(122026454,'hauptperson',130209886,0),(122157798,'urteilsf├ñhigen',221900633,0),(122216706,'religi├Âse',47137001,0),(122483392,'outet',166357202,0),(122836453,'ergebniss',31247421,0),(123042590,'jetzige',36965847,0),(123719003,'meinung',37485378,0),(123722516,'perversen',161726899,0),(124095757,'018',0,0),(125335511,'12.12.2021',0,0),(126937371,'erlaubt',238252531,0),(127094175,'kirchlichen',130421474,0),(127107165,'weg',159923245,0),(128392412,'strafrechtlich',2604686,0),(128848484,'umkehrschluss',212605565,0),(129546597,'n',148488967,0),(130418576,'verfolgbar',214760595,0),(130835048,'zunehmend',11320289,0),(131261868,'gesundheitliches',56077889,0),(131382839,'gesetz',122538669,0),(131719851,'erster',234741441,0),(132204146,'welchen',209934542,0),(133374642,'m├ñnnlichen',68169446,0),(133888790,'dies',112888235,0),(134997838,'haben',190718526,0),(135492417,'gesundheitschutz',99103327,0),(135854532,'er',29178372,0),(135871064,'vergangenheit',115511277,0),(135993131,'regierungs├ñmter',164798713,0),(136012729,'die',194956824,0),(136227399,'abw├ñhlt',11492641,0),(136498701,'einzelnaorm',27524200,0),(136831513,'anderen',6395456,0),(136931626,'mein',155430831,0),(137027337,'pers├Ânlichkeit',215880043,0),(137849141,'versuch',251471611,0),(137918665,'p',72100333,0),(138308511,'handlung',105769918,0),(138765035,'30.12.2021',0,0),(139354719,'beamte',220460012,0),(139502328,'schutzbefohlenen',220719756,0),(139773738,'gibt',252921263,0),(139914770,'genitalbschneidung',55637138,0),(140694603,'notwendigen',260719714,0),(140799350,'kindes',252619202,0),(141693632,'letzte',115675934,0),(141796530,'mitgleieder',85816453,0),(142894170,'bestimmen',210690400,0),(143041210,'einen',64785063,0),(143483333,'bundespr├ñsidenten',55173813,0),(144153262,'artikel',42859231,0),(144623371,'betroffene',210677389,0),(145284860,'wonach',243361750,0),(145399322,'reduzieren',237909780,0),(145554894,'abgesurft',5589367,0),(145794112,'person',162596655,0),(146588252,'au',133977639,0),(146775512,'darf',172421246,0),(147367311,'1919',0,0),(147662572,'praktiken',181696555,0),(148175407,'entwickelt',222758904,0),(148828748,'amt',154154951,0),(149243865,'zunehmender',69764283,0),(149460642,'ihnen',262159019,0),(151472346,'seiner',148656999,0),(151489781,'freiheitlichen',240765215,0),(152120664,'feudalistischer',134449857,0),(152656139,'porth',250503351,0),(153198580,'konform',75565200,0),(153825879,'produkts',46544365,0),(154056191,'b',165014887,0),(154072967,'weitere',121072355,0),(154133412,'onlineversion',157561184,0),(154689495,'leider',65230433,0),(155564351,'stand',255492215,0),(155626615,'vielleicht',75915939,0),(156277578,'entschuldigung',187831111,0),(156364663,'fehlt',30156939,0),(156834330,'aber',193973353,0),(157253746,'heuttzutage',237447620,0),(159188277,'h├ñtte',194956824,0),(159561795,'zust├ñndig',5622595,0),(160639459,'welt',146187509,0),(160691971,'juristische',224835364,0),(161152697,'aufgeschlossenen',194145345,0),(161456903,'von',228422298,0),(162222141,'menschenrechten',110235306,0),(162258769,'absatz',100862168,0),(162328826,'heutige',76337558,0),(163195915,'einzelnorm',27524200,0),(163747725,'immer',108313715,0),(164176915,'vom',267996051,0),(164250330,'grundgesetzwidrig',176138097,0),(164338917,'generation',90424952,0),(166208274,'algorithmus',55683984,0),(166830645,'habe',90512784,0),(166955913,'angesurft',165561845,0),(167339998,'geh├Ârt',90532687,0),(167801132,'durchf├╝hren',206032031,0),(168003580,'unterstelle',203431419,0),(168099406,'alternative',229707268,0),(169802516,'einheit',242072906,0),(169982096,'beschneider',144590733,0),(170350143,'tendenzen',116025505,0),(170778485,'schlie├ƒlich',162254723,0),(170975537,'f├╝hren',209179024,0),(171075159,'r├╝ckgrat',170992224,0),(171916638,'wegr├ñumt',263827018,0),(172353841,'verteidigen',92246942,0),(173307217,'abgesprochen',75355674,0),(173431766,'unversettheit',77721006,0),(173858318,'ziffern',146201993,0),(174031083,'befand',211027931,0),(174342158,'strafrecht',135076739,0),(175255394,'liebder',181847379,0),(175616857,'was',88994746,0),(175687103,'ja',267666800,0),(176684903,'4',0,0),(177459123,'gilt',37279136,0),(178652426,'vergangeneheit',115511277,0),(178937294,'m├ñnnliche',6042502,0),(179321238,'schuld',178506833,0),(180719576,'feierlichkeit',247901519,0),(180899535,'zerlegen',237016750,0),(181458829,'verhindern',54073596,0),(183383921,'bewiesen',12438956,0),(183431716,'28.12.21',0,0),(183630041,'sein',153511504,0),(184207162,'soll',122391892,0),(185748398,'perverse',71976711,0),(185780588,'werden',62020844,0),(186424132,'auch',93219234,0),(186918639,'insbesondere',245625395,0),(187087268,'religi├Âsen',150583249,0),(187658171,'verantwort',78332064,0),(188025861,'verstanden',196281651,0),(188545973,'beweggr├╝nden',197884913,0),(189171882,'dr',247333392,0),(189624090,'ruf',66993640,0),(190584764,'28.12.2021',0,0),(190618845,'wurde',50420941,0),(190672753,'20211212',0,0),(191194067,'kindern',69491527,0),(191503002,'prinzipien',19535906,0),(192966691,'so',98290061,0),(192985975,'id',215163142,0),(193300465,'stimme',12718891,0),(193774157,'entrechtung',140960115,0),(193809126,'faktorisierung',129047500,0),(194761389,'interessanter',163999747,0),(194885037,'eigenst├ñndige',194002703,0),(195190625,'├╝berfordern',52404110,0),(195632642,'scholzkabinett',138054671,0),(196045359,'hohe',262863921,0),(196163532,'gef├ñhrdet',255955750,0),(196532340,'zahlen',83395527,0),(196629507,'├ñhnlich',235459764,0),(197310761,'andere',152480336,0),(198123733,'jungen',149350414,0),(198493418,'these',118069971,0),(198587798,'neuen',147598962,0),(199118408,'jemanden',135807022,0),(199631218,'perversion',153774466,0),(201504722,'penis',216929544,0),(201641272,'am',39766294,0),(202713418,'gewaltt├ñtige',54953936,0),(203100129,'richtige',244384606,0),(203306566,'vertrauensw├╝rdiges',128629182,0),(204276115,'m├╝ssen',164297903,0),(204704483,'wohl',103777,0),(204952191,'finde',211521030,0),(205084111,'als',90334567,0),(206170995,'vorschlag',228666434,0),(206259854,'anderem',217094906,0),(206349347,'1',0,0),(206759341,'findet',148226215,0),(207537954,'deutschen',70625100,0),(207576418,'streichen',141011964,0),(208688696,'spricht',189412437,0),(209388519,'manche',62682599,0),(209839912,'2',0,0),(209868318,'n1',148488967,0),(211659555,'muss',128345034,0),(211981889,'negativ',175865253,0),(211984352,'entrechtet',172868227,0),(213176652,'zur',147529744,0),(213864351,'eine',178806552,0),(214292485,'pers├Ânlich',178965340,0),(215691617,'petition',245778543,0),(216257716,'scholz',119725409,0),(216629197,'teilnehmen',137724268,0),(216827721,'1631dentwurdf',213922361,0),(217010486,'freunde',13193335,0),(217138861,'aktuellen',144585406,0),(217617943,'schlie├ƒt',178506833,0),(217854681,'diese',112888235,0),(218115512,'vergleichbaren',263390757,0),(219331479,'idee',215163142,0),(221567347,'gewaltt├ñter',210832905,0),(222097601,'eigenschaft',176939887,0),(222823155,'babyentw├╝rdigung',250100888,0),(223421439,'verst├╝mmeln',53501072,0),(223852867,'besch├ñtigt',64993567,0),(224645417,'lauterbach',19816429,0),(226010355,'ausdr├╝cklich',259425649,0),(226268637,'basis',110983556,0),(226533369,'dokumentation',213556526,0),(227081326,'ch',2173371,0),(227415658,'besseren',60623684,0),(227793447,'satz',212906582,0),(227843312,'respekt',16912657,0),(228198303,'jahr',264320953,0),(228453251,'artikels',116016346,0),(229026832,'ihr',83316020,0),(231069220,'deren',158656382,0),(232397344,'peinlich',164170811,0),(232620613,'gen├╝gend',165993255,0),(232665393,'steinmeier',143171025,0),(234037243,'entwickler',253270732,0),(234936835,'139',0,0),(235227197,'politker',123925878,0),(237676437,'w├╝rdigeren',187439717,0),(238403646,'feierlichkeiten',132486085,0),(240816951,'ist',29982503,0),(241274501,'fehler',195140834,0),(241831225,'dieser',68619023,0),(241852763,'explodiert',155391174,0),(243222740,'menschen',258804905,0),(243450317,'sch├╝tzen',141365724,0),(244046387,'sch├╝tzt',68664002,0),(244357005,'infoarbeiter',61959589,0),(244821167,'versuche',251471611,0),(245004175,'solcher',215908631,0),(245482756,'bundespr├ñsident',260086754,0),(246896076,'liebe',211096176,0),(247783351,'grundgesetz',106056376,0),(248170223,'streng',229415808,0),(248400736,'bundesversammlung',84461798,0),(248402392,'genitalien',226598164,0),(248415547,'ministern',22549370,0),(248988972,'durchgef├╝hrt',263847227,0),(249246960,'entw├╝rdigung',123699638,0),(249307076,'solidarit├ñt',139546801,0),(249868347,'genitalbeschneidung',55637138,0),(251790783,'solchen',184087599,0),(251868931,'gegen',84972423,0),(252063099,'einfache',229612983,0),(252157551,'misst',162940566,0),(252671798,'sorge',5143298,0),(252681705,'lasse',243433616,0),(253191240,'kann',178434925,0),(254077159,'bestraft',182901212,0),(255935432,'entw├╝rdet',73086170,0),(256009586,'wenig',77003149,0),(256770744,'ganuso',57027986,0),(257982654,'k├Ânnen',190852643,0),(258319152,'teil',205862080,0),(258752624,'straffrei',247536853,0),(259974978,'vertrauen',206905908,0),(260263375,'entweder',182233888,0),(262439853,'mysearch',42542042,0),(262457913,'meinesuche',235442343,0),(262500644,'hatte',151872750,0),(263046589,'sagt',94298901,0),(263364417,'denen',214750822,0),(263373790,'factorize',133132718,0),(263700778,'ziffernsystem',222459897,0),(264813222,'aus',170666265,0),(264859126,'aufnahme',92541630,0),(265259520,'durch',56944318,0),(266056613,'gr├Â├ƒe',59627541,0),(266199670,'m├Âglich',254596732,0),(267908178,'meine',155430831,0),(267956426,'diskutiert',264868368,0),(268367710,'ein',178806552,0);
/*!40000 ALTER TABLE `index_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `rowDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `perms_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doktype` int(10) unsigned NOT NULL DEFAULT 0,
  `TSconfig` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_siteroot` smallint(6) NOT NULL DEFAULT 0,
  `php_tree_stop` smallint(6) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int(10) unsigned NOT NULL DEFAULT 0,
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT 0,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `target` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT 0,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `cache_tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT 0,
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT 0,
  `abstract` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT 0,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT 0,
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT 0,
  `l18n_cfg` smallint(6) NOT NULL DEFAULT 0,
  `fe_login_mode` smallint(6) NOT NULL DEFAULT 0,
  `backend_layout` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `no_index` smallint(6) NOT NULL DEFAULT 0,
  `no_follow` smallint(6) NOT NULL DEFAULT 0,
  `og_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `og_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `twitter_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `canonical_link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT 0.5,
  `sitemap_changefreq` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_icon_set` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_icon_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_icon` int(10) unsigned DEFAULT 0,
  `thumbnail` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1638624837,1636907648,1,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,0,'{\"title\":\"\"}',0,0,0,0,1,1,31,31,1,'MySearch','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1638624837,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'','',0.5,'','','',0,0),(2,1,1637498236,1637498149,3,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,3,1,31,31,0,'Dokumentation','/dokumentation',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1637498236,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0),(3,1,1639317812,1639316556,3,0,0,0,0,'0',128,NULL,0,0,0,0,NULL,0,'{\"hidden\":\"\"}',0,0,0,0,3,1,31,31,0,'Off-Record-Text','/off-record-text',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1639317812,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0),(4,1,1640890738,1640890430,3,0,0,0,0,'',256,NULL,0,1,2,2,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'{\"doktype\":\"1\",\"title\":\"Dokumentation\",\"slug\":\"\\/dokumentation\",\"nav_title\":\"\",\"subtitle\":\"\",\"nav_icon_set\":\"\",\"nav_icon\":\"0\",\"seo_title\":\"\",\"description\":\"\",\"canonical_link\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"0.5\",\"og_title\":\"\",\"og_description\":\"\",\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_card\":\"summary\",\"abstract\":\"\",\"keywords\":\"\",\"hidden\":\"0\",\"categories\":\"0\",\"rowDescription\":\"\",\"TSconfig\":\"\",\"php_tree_stop\":\"0\",\"editlock\":\"0\",\"layout\":\"0\",\"fe_group\":\"0\",\"extendToSubpages\":\"0\",\"target\":\"\",\"cache_timeout\":\"0\",\"cache_tags\":\"\",\"mount_pid\":\"0\",\"is_siteroot\":\"0\",\"mount_pid_ol\":\"0\",\"module\":\"\",\"fe_login_mode\":\"0\",\"l18n_cfg\":\"0\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":\"\",\"no_index\":\"0\",\"no_follow\":\"0\",\"thumbnail\":\"0\"}',0,0,0,0,3,1,31,31,0,'Documentation','/documentation',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0),(5,0,1640896894,1640890769,3,0,1,0,0,'',512,NULL,0,1,1,1,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'{\"doktype\":\"1\",\"title\":\"MySearch\",\"slug\":\"\\/\",\"nav_title\":\"\",\"subtitle\":\"\",\"nav_icon_set\":\"\",\"nav_icon\":\"0\",\"seo_title\":\"\",\"description\":\"\",\"canonical_link\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"0.5\",\"og_title\":\"\",\"og_description\":\"\",\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_card\":\"\",\"abstract\":\"\",\"keywords\":\"\",\"hidden\":\"0\",\"categories\":\"0\",\"rowDescription\":\"\",\"TSconfig\":\"\",\"php_tree_stop\":\"0\",\"editlock\":\"0\",\"layout\":\"0\",\"fe_group\":\"0\",\"extendToSubpages\":\"0\",\"target\":\"\",\"cache_timeout\":\"0\",\"cache_tags\":\"\",\"mount_pid\":\"0\",\"is_siteroot\":\"1\",\"mount_pid_ol\":\"0\",\"module\":\"\",\"fe_login_mode\":\"0\",\"l18n_cfg\":\"0\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":\"\",\"no_index\":\"0\",\"no_follow\":\"0\",\"thumbnail\":\"0\"}',0,0,0,0,1,1,31,31,1,'MySearch','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0),(6,1,1647788736,1647784823,3,0,0,0,0,'0',64,NULL,0,0,0,0,NULL,0,'{\"title\":\"\"}',0,0,0,0,3,1,31,31,0,'Faktorisierung','/factorize',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1647788736,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0),(7,1,1647790042,1647789919,3,0,0,0,0,'',64,NULL,0,1,6,6,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'{\"doktype\":\"1\",\"title\":\"Faktorisierung\",\"slug\":\"\\/factorize\",\"nav_title\":\"\",\"subtitle\":\"\",\"nav_icon_set\":\"\",\"nav_icon\":\"0\",\"seo_title\":\"\",\"description\":\"\",\"canonical_link\":\"\",\"sitemap_changefreq\":\"\",\"sitemap_priority\":\"0.5\",\"og_title\":\"\",\"og_description\":\"\",\"twitter_title\":\"\",\"twitter_description\":\"\",\"twitter_card\":\"summary\",\"abstract\":\"\",\"keywords\":\"\",\"hidden\":\"0\",\"categories\":\"0\",\"rowDescription\":\"\",\"TSconfig\":\"\",\"php_tree_stop\":\"0\",\"editlock\":\"0\",\"layout\":\"0\",\"fe_group\":\"0\",\"extendToSubpages\":\"0\",\"target\":\"\",\"cache_timeout\":\"0\",\"cache_tags\":\"\",\"mount_pid\":\"0\",\"is_siteroot\":\"0\",\"mount_pid_ol\":\"0\",\"module\":\"\",\"fe_login_mode\":\"0\",\"l18n_cfg\":\"0\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":\"\",\"no_index\":\"0\",\"no_follow\":\"0\",\"thumbnail\":\"0\"}',0,0,0,0,3,1,31,31,0,'factorizing','/factorizing',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'','','',0,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `arguments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sc_group` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` int(11) NOT NULL DEFAULT 0,
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(10) unsigned NOT NULL DEFAULT 0,
  `uid_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `tablenames` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `last_indexed` int(11) NOT NULL DEFAULT 0,
  `missing` smallint(6) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT 0,
  `identifier` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `creation_date` int(11) NOT NULL DEFAULT 0,
  `modification_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,0,1636907697,0,0,1,'2',0,'/introduction/images/typo3-book-backend-login.png','01242ba34d7590b5be9dbc145a543c2b3ad62e13','e1500cfc74aa6405848b1f4f4acfe1e7fa4120a8','png','image/png','typo3-book-backend-login.png','115d94bdbab0847307a8b8979d75fb5709fee247',204314,1636907697,1636907692),(2,0,1636907698,0,0,1,'2',0,'/introduction/images/unsplash/the-creative-exchange-373981-unsplash.jpg','2ca0113a744ef1dfa38d5ca07c44ba0c6c9a536d','83abe7ede085ecc67a618a9f6fccc18d008a33cd','jpg','image/jpeg','the-creative-exchange-373981-unsplash.jpg','e7348589256acfcfac390a9690bb3cacea86877e',262954,1636907698,1636907695),(3,0,1636907698,0,0,1,'2',0,'/introduction/images/unsplash/rawpixel-1046262-unsplash.jpg','23facb1abcb6da3a7ccfc6d441c64759ac7a42ac','83abe7ede085ecc67a618a9f6fccc18d008a33cd','jpg','image/jpeg','rawpixel-1046262-unsplash.jpg','6a14cf97b87022ff46fca42814ca87970aa87a36',170729,1636907698,1636907693),(4,0,1636907698,0,0,1,'2',0,'/introduction/images/streets/kimon-maritz-193428.jpg','7d1259bd55acfba0b347d131e6c7caf4ff602e00','14f32ec0c139b87b52cd0c9950f03819395e64c2','jpg','image/jpeg','kimon-maritz-193428.jpg','e14a7eb6a4f654b697eeca3573c32af9cfe62272',194512,1636907698,1636907695),(5,0,1636907698,0,0,1,'2',0,'/introduction/images/streets/nikita-maru-70928.jpg','d1fefec4dd5c5b48f099ac0fc29b0b729fa7e6a8','14f32ec0c139b87b52cd0c9950f03819395e64c2','jpg','image/jpeg','nikita-maru-70928.jpg','c7dbc831eff5ab47169f6fec6f095f65fb8988ad',171753,1636907698,1636907694),(6,0,1636907698,0,0,1,'2',0,'/introduction/images/streets/felix-russell-saw-182331.jpg','884c65f94edd5178b3148f0741ea0b77badd6aa0','14f32ec0c139b87b52cd0c9950f03819395e64c2','jpg','image/jpeg','felix-russell-saw-182331.jpg','3c164b3b79568b9252f072afa39e6b25c8f29028',168271,1636907698,1636907693),(7,0,1636907699,0,0,1,'2',0,'/introduction/images/streets/geran-de-klerk-136351.jpg','1f92c9da38b528d3e760a333b57cff4209104250','14f32ec0c139b87b52cd0c9950f03819395e64c2','jpg','image/jpeg','geran-de-klerk-136351.jpg','5221d34195c1969365e7435b795816be62354f68',252357,1636907698,1636907693),(8,0,1636907699,0,0,1,'2',0,'/introduction/icons/content/content-special-html.svg','2de0b4bce8f0e7e7111a89986af35c44b592db55','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-special-html.svg','de73379c326b0bf29b83810d8678bd18b0e15890',384,1636907699,1636907694),(9,0,1636907699,0,0,1,'2',0,'/introduction/icons/content/content-special-shortcut.svg','7e8bd653681c617017d41b2518385580f305f74c','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-special-shortcut.svg','d4dbedee164d764cfc3f89c81b1b36b523d83a8c',1015,1636907699,1636907694),(10,0,1636907699,0,0,1,'2',0,'/introduction/icons/content/content-menu-thumbnail.svg','d424779b0c406b8b39e41d2e9ea5ad345ca7a673','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-menu-thumbnail.svg','3da3cfe6994b43afda2728d44dcc2839401934ac',399,1636907699,1636907693),(11,0,1636907699,0,0,1,'2',0,'/introduction/images/streets/richard-nolan-157476.jpg','705ec41274ca11601a85cd1a25d25e37f8ab799b','14f32ec0c139b87b52cd0c9950f03819395e64c2','jpg','image/jpeg','richard-nolan-157476.jpg','0a88cfb665a2e3865a244076d3d57080c4e66d97',212120,1636907699,1636907692),(12,0,1636907699,0,0,1,'2',0,'/introduction/images/streets/adrian-207619.jpg','76914249136f133a3b5efd56ac73cafbae76df58','14f32ec0c139b87b52cd0c9950f03819395e64c2','jpg','image/jpeg','adrian-207619.jpg','360cd247d0903619ca381fbd91c95dc3ed13f836',313638,1636907699,1636907692),(13,0,1636907699,0,0,1,'2',0,'/introduction/icons/content/content-menu-sitemap.svg','8cf20b374964c9f536a7cd1d2fa49de31653a025','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-menu-sitemap.svg','a5f1d2c8b1a2c4ab9c61b757ff83ba8eeb2da4b3',593,1636907699,1636907694),(14,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-menu-section.svg','de7a8c03808ad7a499a13218268ec702fd497243','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-menu-section.svg','39cd9505dce74d453d7b1270b03b0e60b071ddaf',538,1636907699,1636907692),(15,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-menu-pages.svg','b0d488e1662deaf4a416eacf58b35dd159e3a725','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-menu-pages.svg','6d938e03a0e20c470662d185bc5354e15afb1f80',692,1636907700,1636907693),(16,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-menu-categorized.svg','eef7d04191c1393a6ac1e33a9aae64ab06543271','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-menu-categorized.svg','920ee2721b9066c62db2106e3c9c61ad7fe1024f',563,1636907700,1636907693),(17,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/menu-card.svg','28ab0091f456e97e24b5b3140cc9283a3f3ad4ad','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','menu-card.svg','82d2f0ab564ba496357efe275f1a5d1e91497198',795,1636907700,1636907693),(18,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-menu-abstract.svg','b814e30d75b64d8ad5eb44bd251185cbbbc1de85','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-menu-abstract.svg','fd1d07e742ba45a5b4828cccbeb2e1166b32b32b',357,1636907700,1636907695),(19,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-elements-searchform.svg','ff0fb08c92365f2eb1550cf626f62689eba4aaab','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-elements-searchform.svg','94b5eec55258e3e173458e0b56f312b651b6acfe',521,1636907700,1636907693),(20,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-elements-login.svg','c2c48bcb209d25d40b0012a42a965e479f225689','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-elements-login.svg','45898fe74025f91c4992654d1b875af23dfe0da6',534,1636907700,1636907693),(21,0,1636907700,0,0,1,'2',0,'/introduction/icons/content/content-form.svg','42fd0237fb23e5e831f19d5f2e1e1c982bfb49c5','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-form.svg','937fc67857d001f25db7798fa2a08a7a063b0a9e',331,1636907700,1636907693),(22,0,1636907701,0,0,1,'2',0,'/introduction/icons/content/timeline.svg','b69701b69b882ba985be9e73e0c8457518c4934c','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','timeline.svg','45e16b7ef692a244db7d1664008a1efa364faa24',565,1636907700,1636907693),(23,0,1636907701,0,0,1,'2',0,'/introduction/images/typo3_9_5_lts_release.jpg','f82492200eba0ce148d5b37ce3d4b0d460e1ca30','e1500cfc74aa6405848b1f4f4acfe1e7fa4120a8','jpg','image/jpeg','typo3_9_5_lts_release.jpg','7b402c4b246b71b563932824a16d3c6a435098ba',139451,1636907701,1636907693),(24,0,1636907701,0,0,1,'2',0,'/introduction/images/typo3_10_4_lts_release.jpg','483bc27abf74fbe4073a6b7744c854892d2eaed5','e1500cfc74aa6405848b1f4f4acfe1e7fa4120a8','jpg','image/jpeg','typo3_10_4_lts_release.jpg','fe28775a3fed5a92ac0fea3488e7d237251ca6b4',273937,1636907701,1636907695),(25,0,1636907701,0,0,1,'2',0,'/introduction/images/typo3_11_5_lts_release.png','ad864dd0409f3fb014a91ce7aaa253d8f51e47f7','e1500cfc74aa6405848b1f4f4acfe1e7fa4120a8','png','image/png','typo3_11_5_lts_release.png','ce479424071718eaed7c8536432b83bc71249631',736723,1636907701,1636907694),(26,0,1636907701,0,0,1,'2',0,'/introduction/icons/content/content-tab.svg','8e3ada7b9c94d59806bd0d8c9b7858abd97584e0','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-tab.svg','8235f86bcd8504b6e61baed3edd2ed9fdbc0ebba',449,1636907701,1636907693),(27,0,1636907701,0,0,1,'2',0,'/introduction/icons/content/content-carousel.svg','43c8dec9839c5b22a20f05af5f455eba062fbdc0','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','content-carousel.svg','be7940adfa4e74b2ffe8cdc1e150a35cb868c4e2',434,1636907701,1636907694),(28,0,1636907701,0,0,1,'2',0,'/introduction/images/map.png','f5c436e9aa2bede148f0b1a31f8082683ecc1782','e1500cfc74aa6405848b1f4f4acfe1e7fa4120a8','png','image/png','map.png','2e539aa55d2d3a209078555f0f661798fbab084a',5907,1636907701,1636907692),(29,0,1636907702,0,0,1,'2',0,'/introduction/images/background/background-grey.jpg','21e1c0e0f80f028fec76374bc46086a7699254a0','9be8657d534723bca1337bd2ce598225d0da074f','jpg','image/jpeg','background-grey.jpg','919d13be3e463f325355d0d9608536c4b958ce20',20606,1636907701,1636907693),(30,0,1636907702,0,0,1,'2',0,'/introduction/images/background/background-orange.jpg','130fa236a5031c1bdde7f5f956c6f17dbc1b4383','9be8657d534723bca1337bd2ce598225d0da074f','jpg','image/jpeg','background-orange.jpg','bc490a475e1fa69bc20b3449d39eea09e62bd11f',88957,1636907702,1636907694),(31,0,1636907702,0,0,1,'2',0,'/introduction/icons/content/accordion.svg','a20ffdfb78632c133413262ac815ac56d9e61fd9','890034ce7e40fcf4ef9e3c299235335d8482e521','svg','image/svg+xml','accordion.svg','ce6ba85a7f45f635ac88e8f6da33f1cccece1e2b',364,1636907702,1636907694),(32,0,1636907702,0,0,1,'4',0,'/introduction/youtube/what_is_typo3_.youtube','4d4e51a78c44754a0a1c2402af321c6d1089579f','03ffccb220a709b1c51d29b2187830401913c04f','youtube','video/youtube','what_is_typo3_.youtube','e6a7478baf06899bc46cd8f2fc8f2be11b5dcf84',11,1636907702,1636907695),(33,0,1638625093,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/BootstrapPackage.svg','53b7aaf32363271515e80e6c7b25293292185218','27aadec2782a38a84423e8476091a41d1dbdbc06','svg','image/svg+xml','BootstrapPackage.svg','a6fb0cc7b50579d6255f16171147695a55b93c27',3843,1637325343,1637325343),(34,0,1638625093,0,0,0,'2',0,'/typo3conf/ext/bootstrap_package/Resources/Public/Images/BootstrapPackageInverted.svg','5b24af7f7f2c99d8a6188015bc8298396b952ab7','27aadec2782a38a84423e8476091a41d1dbdbc06','svg','image/svg+xml','BootstrapPackageInverted.svg','493f5cd69ede03cf7d436e92481422145674b907',3784,1637325343,1637325343),(35,0,1639944169,0,0,0,'2',0,'/typo3conf/ext/mysearchsite/Resources/Public/Images/logo.svg','685a50dadefe9f7e124947d219bead2408f7d52f','d5ec2fd44eaf9a4cdb3ee7b7ef6fee5deca90e86','svg','image/svg+xml','logo.svg','f97b55ab95885df9797440f4f4b74b0a4911e120',2566,1636909314,1636909314),(36,0,1639944169,0,0,0,'2',0,'/typo3conf/ext/mysearchsite/Resources/Public/Images/logo-inverted.svg','e3981520b749984457081f533f23bac5a1098ed4','d5ec2fd44eaf9a4cdb3ee7b7ef6fee5deca90e86','svg','image/svg+xml','logo-inverted.svg','6f9c74943d9b212d9e04c6cbe4ef3dd8a91f271e',2578,1636909314,1636909314),(37,0,1639944514,0,0,0,'2',0,'/typo3conf/ext/mysearchsite/Resources/Public/Icons/logo.svg','b91c7eb593538c572d291eaf596fd7335e41d155','606079f8ea6f46bcf10731e4806a27958bbd6ce7','svg','image/svg+xml','logo.svg','16d637f7a048c6dde07960b6f586c4a13c830ef3',1788,1638617315,1638617315);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `folder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recursive` smallint(6) NOT NULL DEFAULT 0,
  `category` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `file` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `visible` int(10) unsigned DEFAULT 1,
  `status` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_tool` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `download_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `publisher` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `copyright` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_country` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location_region` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location_city` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `latitude` decimal(24,14) DEFAULT 0.00000000000000,
  `longitude` decimal(24,14) DEFAULT 0.00000000000000,
  `ranking` int(10) unsigned DEFAULT 0,
  `content_creation_date` int(10) unsigned DEFAULT 0,
  `content_modification_date` int(10) unsigned DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `duration` double DEFAULT 0,
  `color_space` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pages` int(10) unsigned DEFAULT 0,
  `language` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fe_groups` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES (1,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,1,NULL,1140,673,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(2,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,2,NULL,1200,900,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(3,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,3,NULL,1200,841,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(4,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,4,NULL,1200,698,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(5,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,5,NULL,1200,675,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(6,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,6,NULL,1200,800,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(7,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,7,NULL,1200,900,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(8,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,8,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(9,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,9,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(10,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,10,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(11,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,11,NULL,1200,899,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(12,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,12,NULL,1200,1800,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(13,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,13,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(14,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,14,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(15,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,15,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(16,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,16,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(17,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,17,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(18,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,18,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(19,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,19,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(20,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,20,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(21,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,21,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(22,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,22,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(23,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,23,NULL,1200,564,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(24,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,24,NULL,1500,500,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(25,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,25,NULL,3126,1042,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(26,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,26,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(27,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,27,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(28,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,28,NULL,920,480,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(29,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,29,NULL,2048,1152,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(30,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,30,NULL,2048,1152,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(31,0,1636907673,1636907673,2,0,0,NULL,0,'',0,0,0,0,31,NULL,16,16,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(32,0,1638625090,1638625090,3,0,0,NULL,0,'',0,0,0,0,33,NULL,244,68,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(33,0,1638625090,1638625090,3,0,0,NULL,0,'',0,0,0,0,34,NULL,244,68,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(34,0,1639944165,1639944165,3,0,0,NULL,0,'',0,0,0,0,35,NULL,185,50,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(35,0,1639944165,1639944165,3,0,0,NULL,0,'',0,0,0,0,36,NULL,185,50,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL),(36,0,1639944509,1639944509,3,0,0,NULL,0,'',0,0,0,0,37,NULL,192,192,NULL,NULL,0,1,'',NULL,NULL,'','','','','',NULL,'','','',0.00000000000000,0.00000000000000,0,0,0,NULL,'',0,'',0,'',NULL);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `original` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configuration` blob DEFAULT NULL,
  `configurationsha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
INSERT INTO `sys_file_processedfile` VALUES (1,1638625095,1638625095,0,33,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','a6fb0cc7b50579d6255f16171147695a55b93c27','Image.CropScaleMask','ff4078bb82',244,68),(2,1638625095,1638625095,0,34,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','493f5cd69ede03cf7d436e92481422145674b907','Image.CropScaleMask','1be194bfeb',244,68),(3,1639944169,1639944169,0,35,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','f97b55ab95885df9797440f4f4b74b0a4911e120','Image.CropScaleMask','72a91fce24',185,50),(4,1639944169,1639944169,0,36,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','6f9c74943d9b212d9e04c6cbe4ef3dd8a91f271e','Image.CropScaleMask','865568972f',185,50),(5,1639944515,1639944515,0,37,'',NULL,'','a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}','24f48d5b4de7d99b7144e6559156976855e74b5d','16d637f7a048c6dde07960b6f586c4a13c830ef3','Image.CropScaleMask','17047ea148',192,192);
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `table_local` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `driver` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `is_browsable` smallint(6) NOT NULL DEFAULT 0,
  `is_public` smallint(6) NOT NULL DEFAULT 0,
  `is_writable` smallint(6) NOT NULL DEFAULT 0,
  `is_online` smallint(6) NOT NULL DEFAULT 1,
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT 1,
  `processingfolder` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1636907673,1636907673,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT 0,
  `read_only` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `actiontype` smallint(6) NOT NULL DEFAULT 0,
  `usertype` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int(10) unsigned DEFAULT NULL,
  `originaluserid` int(10) unsigned DEFAULT NULL,
  `recuid` int(11) NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workspace` int(11) DEFAULT 0,
  `correlation_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hreflang` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `direction` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_language`
--

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;
INSERT INTO `sys_language` VALUES (1,0,1637506817,0,256,'English','en-us-gb','en','','','',''),(2,0,1638634270,0,128,'Deutsch','de','de','','','','');
/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `record_table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT 0,
  `record_pid` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `action` smallint(5) unsigned NOT NULL DEFAULT 0,
  `recuid` int(10) unsigned NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT 0,
  `error` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `channel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `details_nr` smallint(6) NOT NULL DEFAULT 0,
  `IP` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `log_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_pid` int(11) NOT NULL DEFAULT -1,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `NEWid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT 0,
  `component` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `errorcount` (`tstamp`,`error`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_note`
--

DROP TABLE IF EXISTS `sys_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_note` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal` smallint(5) unsigned NOT NULL DEFAULT 0,
  `category` smallint(5) unsigned NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_note`
--

LOCK TABLES `sys_note` WRITE;
/*!40000 ALTER TABLE `sys_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_redirect`
--

DROP TABLE IF EXISTS `sys_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_redirect` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `updatedon` int(10) unsigned NOT NULL DEFAULT 0,
  `createdon` int(10) unsigned NOT NULL DEFAULT 0,
  `createdby` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `source_host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_regexp` smallint(5) unsigned NOT NULL DEFAULT 0,
  `protected` smallint(5) unsigned NOT NULL DEFAULT 0,
  `force_https` smallint(5) unsigned NOT NULL DEFAULT 0,
  `respect_query_parameters` smallint(5) unsigned NOT NULL DEFAULT 0,
  `keep_query_parameters` smallint(5) unsigned NOT NULL DEFAULT 0,
  `target` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target_statuscode` int(11) NOT NULL DEFAULT 307,
  `hitcount` int(11) NOT NULL DEFAULT 0,
  `lasthiton` int(11) NOT NULL DEFAULT 0,
  `disable_hitcount` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `index_source` (`source_host`(80),`source_path`(80)),
  KEY `parent` (`pid`,`deleted`,`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_redirect`
--

LOCK TABLES `sys_redirect` WRITE;
/*!40000 ALTER TABLE `sys_redirect` DISABLE KEYS */;
INSERT INTO `sys_redirect` VALUES (1,4,1640890484,1640890484,3,0,0,0,0,'mysearch.ddev.site','/en/translate-to-english-dokumentation',0,0,0,0,0,'t3://page?uid=2&_language=1',307,0,0,0),(2,7,1647789965,1647789965,3,0,0,0,0,'mysearch.ddev.site','/en/translate-to-english-faktorisierung',0,0,0,0,0,'t3://page?uid=6&_language=1',307,0,0,0);
/*!40000 ALTER TABLE `sys_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT 0,
  `field` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `ref_table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT 0,
  `ref_string` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
INSERT INTO `sys_refindex` VALUES ('0953cd2814ae4205e7e917df26ac6921','pages',5,'l10n_parent','','','',0,0,'pages',1,''),('0ad00e77a175a4a5d134cc2b115839fd','sys_file',20,'storage','','','',0,0,'sys_file_storage',1,''),('0bc75fc48a18f1b7592b49955076fe97','sys_file',6,'storage','','','',0,0,'sys_file_storage',1,''),('15597f65d7df3a40d1e792514c91c69f','sys_file',10,'storage','','','',0,0,'sys_file_storage',1,''),('1c9b8784c1518ef7b22704c4fc698ca9','sys_file',2,'storage','','','',0,0,'sys_file_storage',1,''),('1d0c915ba80d50b79070fee03197459d','sys_file',31,'storage','','','',0,0,'sys_file_storage',1,''),('1fabae24f59ca3f3e0d62a5fcf301b9c','sys_file',24,'storage','','','',0,0,'sys_file_storage',1,''),('205ee1e7af4e30938944dda3fc6a9e60','sys_file',13,'storage','','','',0,0,'sys_file_storage',1,''),('239fba3e85c15ff64f8d8c37233fe64d','sys_file',19,'storage','','','',0,0,'sys_file_storage',1,''),('24d47b29aa969cf4db8635e76dd1c386','sys_file',3,'storage','','','',0,0,'sys_file_storage',1,''),('257f5aa6298ff7205f9e27cafe41c46e','sys_file',28,'storage','','','',0,0,'sys_file_storage',1,''),('2904d2268da6711d186f124299916387','sys_file',27,'storage','','','',0,0,'sys_file_storage',1,''),('39433ea4a82060704109046e4828d3c8','sys_file',1,'storage','','','',0,0,'sys_file_storage',1,''),('4394148e0fd8e4616b141feca0d15865','tt_content',8,'l18n_parent','','','',0,0,'tt_content',7,''),('45491331fdb3cba18904110be4b946ea','sys_file',21,'storage','','','',0,0,'sys_file_storage',1,''),('4750dd38eb5ff9d98e5df04ea4a442c4','sys_file',32,'storage','','','',0,0,'sys_file_storage',1,''),('509889494498e77aff2ef9a7a05fd25e','pages',4,'l10n_parent','','','',0,0,'pages',2,''),('548ed853921311a0fb994c2bd01d6a33','tt_content',5,'l18n_parent','','','',0,0,'tt_content',4,''),('56e4e8537bcee3014e2ac130b0b35a42','sys_file',15,'storage','','','',0,0,'sys_file_storage',1,''),('5d075746177918b286cfa8ab85a1ba2e','sys_file',29,'storage','','','',0,0,'sys_file_storage',1,''),('63cbcd5625ef74e8252c29cc0145c690','sys_file',12,'storage','','','',0,0,'sys_file_storage',1,''),('692e129d0a6ae1105f43e3627f14e64d','sys_file',8,'storage','','','',0,0,'sys_file_storage',1,''),('6de7fbfdf87cd90b8d512692ad834533','sys_file',26,'storage','','','',0,0,'sys_file_storage',1,''),('6f20646f8d44edc6d9790fcba9a0ab4b','pages',7,'l10n_parent','','','',0,0,'pages',6,''),('71885f231631e39b155d14fac1b50305','sys_file',11,'storage','','','',0,0,'sys_file_storage',1,''),('73a4ad6c86e15226ae62976172244f26','sys_file',14,'storage','','','',0,0,'sys_file_storage',1,''),('791d3f9d43dcbfa78cd49dd8258caa09','sys_file',5,'storage','','','',0,0,'sys_file_storage',1,''),('83e547bebf151c6d932f7bdc5487ef64','sys_file',9,'storage','','','',0,0,'sys_file_storage',1,''),('8abaa6774d3e98094d474b5ed6354794','sys_file',23,'storage','','','',0,0,'sys_file_storage',1,''),('93004573d1d006a130ef069b9f27b1f9','sys_file',7,'storage','','','',0,0,'sys_file_storage',1,''),('a1e46773c821e13ad488d005962cf05b','sys_file',30,'storage','','','',0,0,'sys_file_storage',1,''),('a6572b97acc7d0627fbf9e311fec1cc4','sys_file',16,'storage','','','',0,0,'sys_file_storage',1,''),('b9a940b61a6995976be45e87a34bf06d','sys_file',22,'storage','','','',0,0,'sys_file_storage',1,''),('bab37143de5339e474516691bf0c5857','sys_file',4,'storage','','','',0,0,'sys_file_storage',1,''),('c2b395196aa463648bdd19f4425ba07b','sys_file',25,'storage','','','',0,0,'sys_file_storage',1,''),('e6b04ffe8f8567add2849e2d054eaa10','tt_content',9,'l18n_parent','','','',0,0,'tt_content',6,''),('eba3edcca5617605a00d4b7a61aca7c4','sys_file',18,'storage','','','',0,0,'sys_file_storage',1,''),('fa98b45a3c6c53d9716b0d3a05bc9c38','sys_file',17,'storage','','','',0,0,'sys_file_storage',1,'');
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FeeditExtractionUpdate','i:1;'),(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\TaskcenterExtractionUpdate','i:1;'),(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysActionExtractionUpdate','i:1;'),(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SvgFilesSanitization','i:1;'),(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\ShortcutRecordsMigration','i:1;'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\CollectionsExtractionUpdate','i:1;'),(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserLanguageMigration','i:1;'),(8,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysLogChannel','i:1;'),(9,'installUpdate','TYPO3\\CMS\\FrontendLogin\\Updates\\MigrateFeloginPlugins','i:1;'),(10,'installUpdateRows','rowUpdatersDone','a:4:{i:0;s:69:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceVersionRecordsMigration\";i:1;s:66:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\L18nDiffsourceToJsonMigration\";i:2;s:77:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceMovePlaceholderRemovalMigration\";i:3;s:76:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceNewPlaceholderRemovalMigration\";}'),(11,'extensionDataImport','typo3/sysext/core/ext_tables_static+adt.sql','s:0:\"\";'),(12,'extensionDataImport','typo3/sysext/scheduler/ext_tables_static+adt.sql','s:0:\"\";'),(13,'extensionDataImport','typo3/sysext/extbase/ext_tables_static+adt.sql','s:0:\"\";'),(14,'extensionDataImport','typo3/sysext/fluid/ext_tables_static+adt.sql','s:0:\"\";'),(15,'extensionDataImport','typo3/sysext/install/ext_tables_static+adt.sql','s:0:\"\";'),(16,'extensionDataImport','typo3/sysext/recordlist/ext_tables_static+adt.sql','s:0:\"\";'),(17,'extensionDataImport','typo3/sysext/backend/ext_tables_static+adt.sql','s:0:\"\";'),(18,'extensionDataImport','typo3/sysext/frontend/ext_tables_static+adt.sql','s:0:\"\";'),(19,'extensionDataImport','typo3/sysext/adminpanel/ext_tables_static+adt.sql','s:0:\"\";'),(20,'extensionDataImport','typo3/sysext/dashboard/ext_tables_static+adt.sql','s:0:\"\";'),(21,'extensionDataImport','typo3/sysext/reports/ext_tables_static+adt.sql','s:0:\"\";'),(22,'extensionDataImport','typo3/sysext/redirects/ext_tables_static+adt.sql','s:0:\"\";'),(23,'extensionDataImport','typo3/sysext/fluid_styled_content/ext_tables_static+adt.sql','s:0:\"\";'),(24,'extensionDataImport','typo3/sysext/filelist/ext_tables_static+adt.sql','s:0:\"\";'),(25,'extensionDataImport','typo3/sysext/impexp/ext_tables_static+adt.sql','s:0:\"\";'),(26,'extensionDataImport','typo3/sysext/form/ext_tables_static+adt.sql','s:0:\"\";'),(27,'extensionDataImport','typo3/sysext/info/ext_tables_static+adt.sql','s:0:\"\";'),(28,'extensionDataImport','typo3/sysext/linkvalidator/ext_tables_static+adt.sql','s:0:\"\";'),(29,'extensionDataImport','typo3/sysext/seo/ext_tables_static+adt.sql','s:0:\"\";'),(30,'extensionDataImport','typo3/sysext/indexed_search/ext_tables_static+adt.sql','s:0:\"\";'),(31,'extensionDataImport','typo3/sysext/recycler/ext_tables_static+adt.sql','s:0:\"\";'),(32,'extensionDataImport','typo3/sysext/setup/ext_tables_static+adt.sql','s:0:\"\";'),(33,'extensionDataImport','typo3/sysext/rte_ckeditor/ext_tables_static+adt.sql','s:0:\"\";'),(34,'extensionDataImport','typo3/sysext/belog/ext_tables_static+adt.sql','s:0:\"\";'),(35,'extensionDataImport','typo3/sysext/beuser/ext_tables_static+adt.sql','s:0:\"\";'),(36,'extensionDataImport','typo3/sysext/extensionmanager/ext_tables_static+adt.sql','s:0:\"\";'),(37,'extensionDataImport','typo3/sysext/felogin/ext_tables_static+adt.sql','s:0:\"\";'),(38,'extensionDataImport','typo3/sysext/filemetadata/ext_tables_static+adt.sql','s:0:\"\";'),(39,'extensionDataImport','typo3/sysext/lowlevel/ext_tables_static+adt.sql','s:0:\"\";'),(40,'extensionDataImport','typo3/sysext/sys_note/ext_tables_static+adt.sql','s:0:\"\";'),(41,'extensionDataImport','typo3/sysext/t3editor/ext_tables_static+adt.sql','s:0:\"\";'),(42,'extensionDataImport','typo3/sysext/tstemplate/ext_tables_static+adt.sql','s:0:\"\";'),(43,'extensionDataImport','typo3/sysext/viewpage/ext_tables_static+adt.sql','s:0:\"\";'),(44,'extensionDataImport','typo3conf/ext/bootstrap_package/ext_tables_static+adt.sql','s:0:\"\";'),(45,'extensionDataImport','typo3conf/ext/introduction/Initialisation/Files','i:1;'),(46,'extensionDataImport','typo3conf/ext/introduction/ext_tables_static+adt.sql','s:0:\"\";'),(47,'extensionDataImport','typo3conf/ext/introduction/Initialisation/dataImported','i:1;'),(48,'siteConfigImport','introduction','i:1;'),(49,'extensionDataImport','helhum/typo3-console/ext_tables_static+adt.sql','s:0:\"\";'),(50,'extensionDataImport','typo3conf/ext/mysearchext/ext_tables_static+adt.sql','s:32:\"cd57437a5f633b70b114c94c126c4e1f\";'),(51,'core','formProtectionSessionToken:1','s:64:\"6b07ab7b58be89df5148912311e9a097c1479b421c0e9942668301fa87986cc2\";'),(59,'core','formProtectionSessionToken:3','s:64:\"724e77d635e8cf7d5ca1295a8d50c37bdc44851922172c7ac3db26f0547403d7\";');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `root` smallint(5) unsigned NOT NULL DEFAULT 0,
  `clear` smallint(5) unsigned NOT NULL DEFAULT 0,
  `include_static_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `constants` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basedOn` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT 0,
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,1,1639943800,1636907648,1,0,0,0,0,0,'This is an Empty Site Package TypoScript template.\r\n\r\nFor each website you need a TypoScript template on the main page of your website (on the top level). For better maintenance all TypoScript should be extracted into external files via @import \'EXT:site_myproject/Configuration/TypoScript/setup.typoscript\'',0,0,0,0,0,'Main TypoScript Rendering',1,1,'EXT:mysearchsite/Configuration/TypoScript','','config {\r\n        contentObjectExceptionHandler = 0\r\n}',NULL,0,0,0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l18n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l18n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `CType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `assets` int(10) unsigned NOT NULL DEFAULT 0,
  `image` int(10) unsigned NOT NULL DEFAULT 0,
  `imagewidth` int(10) unsigned NOT NULL DEFAULT 0,
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT 0,
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `frame_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int(10) unsigned NOT NULL DEFAULT 0,
  `space_before_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `records` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pages` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colPos` int(10) unsigned NOT NULL DEFAULT 0,
  `subheader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header_link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `header_layout` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT 0,
  `file_collections` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT 0,
  `filelink_sorting` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `recursive` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageheight` int(10) unsigned NOT NULL DEFAULT 0,
  `pi_flexform` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accessibility_title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT 0,
  `accessibility_bypass_text` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_field` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT 0,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `selected_categories` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `teaser` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aspect_ratio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.3333333333333',
  `items_per_page` int(10) unsigned DEFAULT 10,
  `readmore_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quote_source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quote_link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `panel_class` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `file_folder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_set` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT 0,
  `icon_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_size` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `icon_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `icon_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `external_media_source` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `external_media_ratio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_bootstrappackage_card_group_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_carousel_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_accordion_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_icon_group_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_tab_item` int(10) unsigned DEFAULT 0,
  `tx_bootstrappackage_timeline_item` int(10) unsigned DEFAULT 0,
  `frame_layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `background_color_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `background_image` int(10) unsigned DEFAULT 0,
  `background_image_options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
INSERT INTO `tt_content` VALUES (1,'',1,1637499617,1637499617,3,0,0,0,0,'',256,0,0,0,0,NULL,0,'',0,0,0,0,'list','','',NULL,0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,'',0,'','',0,'0','mysearchext_mysearchext',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(2,'',3,1640885570,1639317448,3,0,0,0,0,'',256,0,0,0,0,NULL,0,'{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"subheader\":\"\",\"bodytext\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"frame_layout\":\"\",\"background_color_class\":\"\",\"background_image\":\"\",\"background_image_options\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'text','Meine Entschuldigung an die Freunde der Menschenrechte','','<p>Liebe Freunde der Menschenrechte,</p>\r\n<p>am 12.12.2012 haben einige Mitgleieder der neuen Bundesregierung wie auch der Bundespr&auml;sident Steinmeier f&uuml;r die Aufnahme der Einzelnorm BGB &sect;1631d gestimmt. Ich finde die Beschneidung von Genitalien pervers. In meinen Augen haben Steinmeier, Merkel, Lauterbach, udn viele andere im Parlament 2012 bewiesen, dass sie die Menschenrechte und das Grundgesetz entweder nicht verstanden haben oder das ihnen das R&uuml;ckgrat fehlt, um f&uuml;r die Prinzipien von Freiheit und Menschenrechte einzustehen. Wer liebder Genitalbeschneider als die unschuldigen Babys sch&uuml;tzt, der tr&auml;gt die politische Verantwort auch f&uuml;r die gewaltt&auml;tige Notwehr, mit denen manche Menschen glauben, sich verteidigen zu m&uuml;ssen.</p>\r\n<p>Ich finde es peinlich und besch&auml;mend, wenn der Bundespr&auml;sident Steinmeier von deutscher Schuld und den Lehren aus der Vergangeneheit spricht und gleichzeitg mit seiner Stimme die Babys entw&uuml;rdet und sich selbat als Freund der Perversen outet. Eine solche Person besch&auml;tigt das Amt und den Ruf von Deutschland in der Welt. Ich hoffe, dass Deutschland sich wieder mehr zu einer Gesellschaft entwickelt, in denen die Garantie von Selbstbestimmung, Respekt und Solidarit&auml;t als hohe Werte gelten. Die aktuellen faschitoiden Tendenzen geben Anlass zur Sorge.</p>\r\n<p>Ich hoffe, dass die neue Generation von Politker die alten Z&ouml;pfe abw&auml;hlt und die Fehler der Vergangenheit f&uuml;r einen eigenen bessere Zukunft wegr&auml;umt. Aktuell w&auml;chst der unterdr&uuml;ckte Zorn gegen die zunehmend feudalistischer auftretenden Politiker, Beamte und Infoarbeiter der &ouml;ffentlichen Medien.&nbsp;</p>\r\n<p>30.12.2021 - Bremen - Dr. Dieter Porth (Initiator von MySearch)</p>',0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(3,'',3,1640884353,1640884353,3,0,0,0,0,'',128,0,0,0,0,NULL,0,'',0,0,0,0,'text','Streichen der Einzelnaorm BGB ┬º1631d ','','<p><strong>These:</strong></p>\r\n<p>Der Schutz von Beschneidern durch BGB &sect;1631d, die eine medizinisch nicht erforderliche Beschneidung an Schutzbefohlenen durchf&uuml;hren, und Eltern, die dies erlauben, ist mit Blick auf Artikel 140 des Grundgesetzes grundgesetzwidrig.</p>\r\n<p><strong>Begr&uuml;ndung:</strong></p>\r\n<p>Um zu verhindern, dass die Beschneidung aus niederen Beweggr&uuml;nden oder von Dilettanten durchgef&uuml;hrt wird, wird gilt gem&auml;&szlig; BGB &sect;1631d der Beschneiderschutz nicht, &bdquo;wenn durch die Beschneidung auch unter Ber&uuml;cksichtigung ihres Zwecks das Kindeswohl gef&auml;hrdet wird.&ldquo; [BGB &sect;1631d Absatz 1 Satz 2].</p>\r\n<p>In Umkehrschluss bedeutet dies, dass die Beschneidung immer zu einer kirchlichen Handlung oder zu einer Feierlichkeit oder zu einer religi&ouml;sen &Uuml;bung oder einem vergleichbaren Event geh&ouml;rt, an dem der Betroffene zwingend als Hauptperson teilnehmen muss, weil ja schlie&szlig;lich der Penis des Betroffenen unwiderruflich beschnitten werden werden soll.</p>\r\n<p>Der Artikel 140 des Grundgesetzes erweitert die Bestimmungen des Grundgesetzes um die Artikel 136, 137, 138, 139 und 141 der deutschen Verfassung vom 11. August 1919. Der Artikel 136 Absatz 4 sagt ausdr&uuml;cklich: &bdquo;Niemand darf zu einer kirchlichen Handlung oder Feierlichkeit oder zur Teilnahme an religi&ouml;sen &Uuml;bungen oder &hellip; gezwungen werden.&ldquo; Das &sbquo;Niemand&lsquo; schlie&szlig;t alle Menschen ein. Niemand meint alle Menschen, also zum Beispiel alle Erwachsenen, alle Geistigbehinderten. Niemand insbesondere auch die in BGB &sect;1631d genannten &bdquo;nicht einsichts- und urteilsf&auml;higen m&auml;nnlichen Kinder&ldquo; im Alter von 0-18 Jahren.</p>\r\n<p>Da das Gesetz BGB &sect;1631d dem Beschneider und den Eltern von den Kindern erlaubt, das nicht einsichts- und urteilsf&auml;hige m&auml;nnliche Kinder zur Teilnahme an einer verletzenden Feierlichkeit zu zwingen, ist BGB &sect;1631d gem&auml;&szlig; des Artikels 140 des Grundgesetzes in Einheit mit dem Artikel 136 aus der deutschen Verfassung von 1919 grundgesetzwidrig, da niemand zu solchen Feierlichkeiten gezwungen werden darf.</p>\r\n<p>In der Begr&uuml;ndung der damaligen Bundesregierung <a href=\"https://dserver.bundestag.de/btd/17/112/1711295.pdf\">https://dserver.bundestag.de/btd/17/112/1711295.pdf</a> wurde dieser Aspekt des Grundgesetzes nicht diskutiert.</p>\r\n<p><strong>Aktion :</strong></p>\r\n<p>Ich habe am 28.12.21 eine Petition eingereicht, wonach&nbsp; der Bundestag beschlie&szlig;en m&ouml;ge, den BGB &sect;1631d ist ersatzlos zu streichen.</p>\r\n<p>Ich hoffe, dass das Strafrecht der Genitalbeschneidung von Jungen &auml;hnlich streng bestraft wird wie die Genitalbschneidung bei M&auml;dchen. (Das ist aber nicht Teil der petition. Man darf heuttzutage Abgeordnete nicht &uuml;berfordern.)</p>\r\n\r\n\r\n<p>Quellen</p>\r\n<p>Onlineversion der Einzelnorm BGB &sect;1631d angesurft 28.12.2021 https://www.gesetze-im-internet.de/bgb/__1631d.html</p>\r\n<p>Vorschlag zum Gesetz der Bundesregierung f&uuml;r BGB &sect;1631d abgesurft 28.12.2021 <a href=\"https://dserver.bundestag.de/btd/17/112/1711295.pdf\">https://dserver.bundestag.de/btd/17/112/1711295.pdf</a></p>\r\n<p>namentliche Abstimmung zum BGB &sect;1631d-Entwurdf der Bundesregierung angesurft 28.12.2021</p>\r\n<p><a href=\"https://www.bundestag.de/parlament/plenum/abstimmung/abstimmung?id=169\">https://www.bundestag.de/parlament/plenum/abstimmung/abstimmung?id=169</a></p>\r\n<p>Grundgesetz angesurft 28.12.2021 <a href=\"https://www.gesetze-im-internet.de/gg/BJNR000010949.html\">https://www.gesetze-im-internet.de/gg/BJNR000010949.html</a></p>\r\n\r\n\r\n\r\n\r\n',0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(4,'',2,1640890348,1640887835,3,0,0,0,0,'',256,0,0,0,0,NULL,0,'{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"subheader\":\"\",\"bodytext\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"frame_layout\":\"\",\"background_color_class\":\"\",\"background_image\":\"\",\"background_image_options\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'text','Vorwort','','<p>Das Projekt ist in Entwicklung. Wenn etwas nicht funktioniert, so scheuen sie sich bitte nicht, einen Issue bei Github zu diesem Projekt porthd/mysearch (https://github.com/porthd/mysearch) zu hinterlassen.</p>\r\n<p>Das Projekt &#39;mysearch&#39; will jedem die M&ouml;glichkeit geben, seine pers&ouml;nliche Surf-Historie in einem privaten Suchindex auf dem lokalen Rechner speichern zu k&ouml;nnen. Es ist offen so konzipiert, damit auch anderer bestehenden TYPO3-Extensions durch bessere ersetzen k&ouml;nnen. Auch ist das AddOn nur ein erster Prototyp. Gernen nehme ich AddOns f&uuml;r anderer Browser wie Chrome, Edge mit in ide Liste der Browser-Extensions mit auf.</p>\r\n<p>Also: Verbesserungsvorschl&auml;ge sind herzlich willkommen. Die Software hier ist nur ein erster Entwurf.</p>',0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(5,'',2,1640890730,1640890539,3,0,0,0,0,'',512,0,1,4,4,NULL,4,'{\"CType\":\"text\",\"colPos\":\"0\",\"header\":\"Vorwort\",\"header_layout\":\"0\",\"header_position\":\"\",\"date\":\"0\",\"header_link\":\"\",\"subheader\":\"\",\"bodytext\":\"<p>Das Projekt ist in Entwicklung. Wenn etwas nicht funktioniert, so scheuen sie sich bitte nicht, einen Issue bei Github zu diesem Projekt porthd\\/mysearch (https:\\/\\/github.com\\/porthd\\/mysearch) zu hinterlassen.<\\/p>\\r\\n<p>Das Projekt &#39;mysearch&#39; will jedem die M&ouml;glichkeit geben, seine pers&ouml;nliche Surf-Historie in einem privaten Suchindex auf dem lokalen Rechner speichern zu k&ouml;nnen. Es ist offen so konzipiert, damit auch anderer bestehenden TYPO3-Extensions durch bessere ersetzen k&ouml;nnen. Auch ist das AddOn nur ein erster Prototyp. Gernen nehme ich AddOns f&uuml;r anderer Browser wie Chrome, Edge mit in ide Liste der Browser-Extensions mit auf.<\\/p>\\r\\n<p>Also: Verbesserungsvorschl&auml;ge sind herzlich willkommen. Die Software hier ist nur ein erster Entwurf.<\\/p>\",\"layout\":\"0\",\"frame_class\":\"default\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"frame_layout\":\"default\",\"background_color_class\":\"none\",\"background_image\":\"0\",\"background_image_options\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"parallax\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"fade\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"filter\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"sectionIndex\":\"1\",\"linkToTop\":\"0\",\"sys_language_uid\":\"0\",\"hidden\":\"0\",\"starttime\":\"0\",\"endtime\":\"0\",\"fe_group\":\"\",\"editlock\":\"0\",\"categories\":\"0\",\"rowDescription\":\"\",\"l18n_parent\":\"0\",\"aspect_ratio\":\"1.3333333333333\",\"items_per_page\":\"10\"}',0,0,0,0,'text','Foreword','','<p>The project is under development. If something doesn&#39;t work, please don&#39;t hesitate to post an issue on Github about this project porthd/mysearch (<a href=\"https://github.com/porthd/mysearch\">https://github.com/porthd/mysearch</a>).</p>\r\n<p>The &#39;mysearch&#39; project wants to give everyone the opportunity to save their personal surfing history in a private search index on the local computer. It is openly designed so that other existing TYPO3 extensions can also be replaced by better ones. The add-on is also just a first prototype. I am happy to include add-ons for other browsers such as Chrome, Edge in the list of browser extensions.</p>\r\n<p>So: suggestions for improvement are very welcome. The software here is just a first draft.</p>',0,0,0,0,0,0,0,1,0,0,0,'default',0,'','','','',0,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,'0',0,NULL,'1.3333333333333',10,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(6,'',6,1647785855,1647785350,3,0,0,0,0,'',256,0,0,0,0,NULL,0,'{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"subheader\":\"\",\"list_type\":\"\",\"pages\":\"\",\"recursive\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"frame_layout\":\"\",\"background_color_class\":\"\",\"background_image\":\"\",\"background_image_options\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'list','','',NULL,0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,'',0,'','',0,'0','mysearchext_factorize',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(7,'',6,1647789857,1647789857,3,0,0,0,0,'',128,0,0,0,0,NULL,0,'',0,0,0,0,'text','Faktorisierung von einer Zahl','','<p>F&uuml;r das Produkt A*B gibt es ein eindeutige Ergebniss P. Die letzte Ziffer in einem Produkt lasst sich auch wenige Ziffern-Kombinationen reduzieren.<br /> Weiterhin gilt f&uuml;r jedes beliebige Basis eine Ziffern-System, dass zwei Zahlen mit m+n Ziffern immer zu einem Produkt f&uuml;hren mit m+n oder m+n-1 Ziffern. Wegen dieser Eigenschaft hatte ich die Idee, dass man ein Produkt auf Ziffernbasis h&auml;tte zur&uuml;ckrechnen k&ouml;nnen.<br /> Der Algorithmus ist ein erster Versuch, um ohne Kenntnis der Primfaktoren einen Zahl auf der Basis von Ziffern zu zerlegen. Leider explodiert mit zunehmender Gr&ouml;&szlig;e des Produkts die Zahl der notwendigen Versuche, eine richtige Bitkombination f&uuml;r die Faktoren zu bestimmen.</p>\r\n<p>War ein interessanter Versuch. Vielleicht kann die Idee jemanden anderen inspirieren.</p>',0,0,0,0,0,0,0,1,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL,0,NULL,'1.3333333333333',10,'','','','default',NULL,'','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(8,'',6,1647790599,1647790507,3,0,0,0,0,'',192,0,1,7,7,NULL,7,'{\"hidden\":\"0\",\"starttime\":\"0\",\"endtime\":\"0\",\"frame_layout\":\"default\",\"background_color_class\":\"none\",\"background_image\":\"0\",\"background_image_options\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"parallax\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"fade\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"filter\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"aspect_ratio\":\"1.3333333333333\",\"items_per_page\":\"10\",\"CType\":\"text\",\"colPos\":\"0\",\"header\":\"Faktorisierung von einer Zahl\",\"header_layout\":\"0\",\"header_position\":\"\",\"date\":\"0\",\"header_link\":\"\",\"subheader\":\"\",\"bodytext\":\"<p>F&uuml;r das Produkt A*B gibt es ein eindeutige Ergebniss P. Die letzte Ziffer in einem Produkt lasst sich auch wenige Ziffern-Kombinationen reduzieren.<br \\/> Weiterhin gilt f&uuml;r jedes beliebige Basis eine Ziffern-System, dass zwei Zahlen mit m+n Ziffern immer zu einem Produkt f&uuml;hren mit m+n oder m+n-1 Ziffern. Wegen dieser Eigenschaft hatte ich die Idee, dass man ein Produkt auf Ziffernbasis h&auml;tte zur&uuml;ckrechnen k&ouml;nnen.<br \\/> Der Algorithmus ist ein erster Versuch, um ohne Kenntnis der Primfaktoren einen Zahl auf der Basis von Ziffern zu zerlegen. Leider explodiert mit zunehmender Gr&ouml;&szlig;e des Produkts die Zahl der notwendigen Versuche, eine richtige Bitkombination f&uuml;r die Faktoren zu bestimmen.<\\/p>\\r\\n<p>War ein interessanter Versuch. Vielleicht kann die Idee jemanden anderen inspirieren.<\\/p>\",\"layout\":\"0\",\"frame_class\":\"default\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"sectionIndex\":\"1\",\"linkToTop\":\"0\",\"sys_language_uid\":\"0\",\"l18n_parent\":\"0\",\"fe_group\":\"\",\"editlock\":\"0\",\"categories\":\"0\",\"rowDescription\":\"\"}',0,0,0,0,'text','Factoring a number','','<p>For the product A*B there is a unique result P. The last digit in a product can also be reduced to a few digit combinations.<br /> Furthermore, for any base a digit system, two numbers with m+n digits always lead to a product with m+n or m+n-1 digits. Because of this property, I had the idea that one could have back-calculated a product based on digits.<br /> The algorithm is a first attempt to decompose a number on the basis of digits without knowing the prime factors. Unfortunately, as the product grows in size, the number of attempts necessary to determine a correct bit combination for the factors explodes.</p>\r\n<p>Was an interesting try. Maybe the idea can inspire someone else.</p>',0,0,0,0,0,0,0,1,0,0,0,'default',0,'','','','',0,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,'0',0,NULL,'1.3333333333333',10,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(9,'',6,1647790523,1647790507,3,0,0,0,0,'',224,0,1,6,6,NULL,6,'{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"subheader\":\"\",\"list_type\":\"\",\"pages\":\"\",\"recursive\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"frame_layout\":\"default\",\"background_color_class\":\"none\",\"background_image\":\"0\",\"background_image_options\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"parallax\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"fade\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n                <field index=\\\"filter\\\">\\n                    <value index=\\\"vDEF\\\"><\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"0\",\"starttime\":\"0\",\"endtime\":\"0\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\",\"aspect_ratio\":\"1.3333333333333\",\"items_per_page\":\"10\"}',0,0,0,0,'list',' (copy 1)','',NULL,0,0,0,0,0,0,0,1,0,0,0,'default',0,'','','','',0,'','',0,'0','mysearchext_factorize',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,'0',0,NULL,'1.3333333333333',10,'','','','default','','','',0,'','default','default','#FFFFFF','#333333','','',0,0,0,0,0,0,'default','none',0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"parallax\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"fade\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"filter\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_accordion_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_accordion_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_accordion_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` int(10) unsigned DEFAULT 0,
  `mediaorient` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 1,
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_accordion_item`
--

LOCK TABLES `tx_bootstrappackage_accordion_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_accordion_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_accordion_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_card_group_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_card_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_card_group_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subheader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` int(11) NOT NULL DEFAULT 0,
  `bodytext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_icon_set` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_icon_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_icon` int(10) unsigned DEFAULT 0,
  `link_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_card_group_item`
--

LOCK TABLES `tx_bootstrappackage_card_group_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_card_group_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_card_group_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_carousel_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_carousel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_carousel_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tt_content` int(10) unsigned DEFAULT 0,
  `item_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header_layout` smallint(5) unsigned NOT NULL DEFAULT 1,
  `header_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'center',
  `header_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subheader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subheader_layout` smallint(5) unsigned NOT NULL DEFAULT 2,
  `subheader_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` int(10) unsigned DEFAULT 0,
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `background_image` int(10) unsigned DEFAULT 0,
  `background_image_options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_carousel_item`
--

LOCK TABLES `tx_bootstrappackage_carousel_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_carousel_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_icon_group_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_icon_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_icon_group_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subheader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_set` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT 0,
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_icon_group_item`
--

LOCK TABLES `tx_bootstrappackage_icon_group_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_icon_group_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_icon_group_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_tab_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_tab_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_tab_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tt_content` int(10) unsigned DEFAULT 0,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` int(10) unsigned DEFAULT 0,
  `mediaorient` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 1,
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_tab_item`
--

LOCK TABLES `tx_bootstrappackage_tab_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_tab_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_tab_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_bootstrappackage_timeline_item`
--

DROP TABLE IF EXISTS `tx_bootstrappackage_timeline_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_bootstrappackage_timeline_item` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tt_content` int(10) unsigned DEFAULT 0,
  `date` datetime DEFAULT NULL,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_set` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon_file` int(10) unsigned DEFAULT 0,
  `image` int(10) unsigned DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `t3ver_id` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t3ver_count` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_move_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_bootstrappackage_timeline_item`
--

LOCK TABLES `tx_bootstrappackage_timeline_item` WRITE;
/*!40000 ALTER TABLE `tx_bootstrappackage_timeline_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_bootstrappackage_timeline_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `extension_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `repository` int(11) NOT NULL DEFAULT 1,
  `remote` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ter',
  `version` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `review_state` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `serialized_dependencies` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorcompany` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) NOT NULL DEFAULT 0,
  `lastreviewedversion` int(11) NOT NULL DEFAULT 0,
  `documentation_link` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distribution_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distribution_welcome_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`remote`),
  KEY `index_extrepo` (`extension_key`,`remote`),
  KEY `index_versionrepo` (`integer_version`,`remote`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_impexp_presets`
--

DROP TABLE IF EXISTS `tx_impexp_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_impexp_presets` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `user_uid` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `public` smallint(6) NOT NULL DEFAULT 0,
  `item_uid` int(11) NOT NULL DEFAULT 0,
  `preset_data` blob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `lookup` (`item_uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_impexp_presets`
--

LOCK TABLES `tx_impexp_presets` WRITE;
/*!40000 ALTER TABLE `tx_impexp_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_impexp_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_linkvalidator_link`
--

DROP TABLE IF EXISTS `tx_linkvalidator_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_linkvalidator_link` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `record_uid` int(11) NOT NULL DEFAULT 0,
  `record_pid` int(11) NOT NULL DEFAULT 0,
  `language` int(11) NOT NULL DEFAULT -1,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `element_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_check` int(11) NOT NULL DEFAULT 0,
  `link_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `needs_recheck` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_linkvalidator_link`
--

LOCK TABLES `tx_linkvalidator_link` WRITE;
/*!40000 ALTER TABLE `tx_linkvalidator_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_linkvalidator_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_scheduler_task`
--

DROP TABLE IF EXISTS `tx_scheduler_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_scheduler_task` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nextexecution` int(10) unsigned NOT NULL DEFAULT 0,
  `lastexecution_time` int(10) unsigned NOT NULL DEFAULT 0,
  `lastexecution_failure` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastexecution_context` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `serialized_task_object` mediumblob DEFAULT NULL,
  `serialized_executions` mediumblob DEFAULT NULL,
  `task_group` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `index_nextexecution` (`nextexecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_scheduler_task`
--

LOCK TABLES `tx_scheduler_task` WRITE;
/*!40000 ALTER TABLE `tx_scheduler_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_scheduler_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_scheduler_task_group`
--

DROP TABLE IF EXISTS `tx_scheduler_task_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_scheduler_task_group` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `groupName` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_scheduler_task_group`
--

LOCK TABLES `tx_scheduler_task_group` WRITE;
/*!40000 ALTER TABLE `tx_scheduler_task_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_scheduler_task_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 16:08:37
