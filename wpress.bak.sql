-- MySQL dump 10.13  Distrib 5.5.38, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	(null)

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
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','test','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y'),('%','test\\_%','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N','Y','Y'),('localhost','wordpress_db','wp_user','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'','2013-12-31 17:20:04');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `authentication_string` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('127.0.0.1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('::1','root','','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',''),('localhost','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL),('localhost','wp_user','*F2F404D601FA580AABED31977D6DD7CCA98BA152','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Flush Grant Tables 
--

/*! FLUSH PRIVILEGES */;

--
-- Current Database: `wordpress_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wordpress_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wordpress_db`;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1411 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','https://secret-grammar-446.appspot.com','yes'),(2,'blogname','AMDG Technologies','yes'),(3,'blogdescription','Inspirational Technologies','yes'),(4,'users_can_register','0','yes'),(5,'admin_email','mpeaton@amdgtechnologies.com','yes'),(6,'start_of_week','0','yes'),(7,'use_balanceTags','0','yes'),(8,'use_smilies','1','yes'),(9,'require_name_email','1','yes'),(10,'comments_notify','1','yes'),(11,'posts_per_rss','10','yes'),(12,'rss_use_excerpt','0','yes'),(13,'mailserver_url','mail.example.com','yes'),(14,'mailserver_login','login@example.com','yes'),(15,'mailserver_pass','password','yes'),(16,'mailserver_port','110','yes'),(17,'default_category','1','yes'),(18,'default_comment_status','open','yes'),(19,'default_ping_status','open','yes'),(20,'default_pingback_flag','1','yes'),(21,'posts_per_page','10','yes'),(22,'date_format','F j, Y','yes'),(23,'time_format','g:i a','yes'),(24,'links_updated_date_format','F j, Y g:i a','yes'),(25,'links_recently_updated_prepend','<em>','yes'),(26,'links_recently_updated_append','</em>','yes'),(27,'links_recently_updated_time','120','yes'),(28,'comment_moderation','0','yes'),(29,'moderation_notify','1','yes'),(30,'permalink_structure','','yes'),(31,'gzipcompression','0','yes'),(32,'hack_file','0','yes'),(33,'blog_charset','UTF-8','yes'),(34,'moderation_keys','','no'),(35,'active_plugins','a:1:{i:0;s:31:\"google-app-engine/appengine.php\";}','yes'),(36,'home','https://secret-grammar-446.appspot.com','yes'),(37,'category_base','','yes'),(38,'ping_sites','http://rpc.pingomatic.com/','yes'),(39,'advanced_edit','0','yes'),(40,'comment_max_links','2','yes'),(41,'gmt_offset','0','yes'),(42,'default_email_category','1','yes'),(43,'recently_edited','','no'),(44,'template','twentytwelve','yes'),(45,'stylesheet','twentytwelve','yes'),(46,'comment_whitelist','1','yes'),(47,'blacklist_keys','','no'),(48,'comment_registration','0','yes'),(49,'html_type','text/html','yes'),(50,'use_trackback','0','yes'),(51,'default_role','subscriber','yes'),(52,'db_version','26691','yes'),(53,'uploads_use_yearmonth_folders','1','yes'),(54,'upload_path','','yes'),(55,'blog_public','1','yes'),(56,'default_link_category','2','yes'),(57,'show_on_front','page','yes'),(58,'tag_base','','yes'),(59,'show_avatars','1','yes'),(60,'avatar_rating','G','yes'),(61,'upload_url_path','','yes'),(62,'thumbnail_size_w','150','yes'),(63,'thumbnail_size_h','150','yes'),(64,'thumbnail_crop','1','yes'),(65,'medium_size_w','300','yes'),(66,'medium_size_h','300','yes'),(67,'avatar_default','mystery','yes'),(68,'large_size_w','1024','yes'),(69,'large_size_h','1024','yes'),(70,'image_default_link_type','file','yes'),(71,'image_default_size','','yes'),(72,'image_default_align','','yes'),(73,'close_comments_for_old_posts','0','yes'),(74,'close_comments_days_old','14','yes'),(75,'thread_comments','1','yes'),(76,'thread_comments_depth','5','yes'),(77,'page_comments','0','yes'),(78,'comments_per_page','50','yes'),(79,'default_comments_page','newest','yes'),(80,'comment_order','asc','yes'),(81,'sticky_posts','a:0:{}','yes'),(82,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(83,'widget_text','a:0:{}','yes'),(84,'widget_rss','a:0:{}','yes'),(85,'uninstall_plugins','a:0:{}','no'),(86,'timezone_string','','yes'),(87,'page_for_posts','0','yes'),(88,'page_on_front','2','yes'),(89,'default_post_format','0','yes'),(90,'link_manager_enabled','0','yes'),(91,'initial_db_version','26691','yes'),(92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(98,'sidebars_widgets','a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(99,'cron','a:5:{i:1417551624;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1417551644;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1417553691;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1417593240;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}s:7:\"version\";i:2;}','yes'),(101,'_transient_random_seed','780fa1dad4ec66bd37e6659a093c9fdd','yes'),(102,'secure_auth_key','M%47LuG%_a#9PpZb_ML8l_5o,@v^ucF`*]:L6Zzrc.[SvBE3a5R2Pw1-$O5&VRF/','yes'),(103,'secure_auth_salt','tYJRKXWH]V^_a)Pes5 -A !m GN^Kg_G,pwgR6[9@(Td]sRj;D6WZH:d.k~SW{xS','yes'),(104,'logged_in_key','H!,j^3i?Pd[b)#s[_C7EPp_V54 e#<IS|;so%:: 50CSLVwOvW-u~-3ataZ,*{h{','yes'),(105,'logged_in_salt','_d[;6+;`Xc;;#KFJS2* $0!(]$3$|,P&!)~JCDCNQSL}.t7z<)2dz:2|v@#*f?d2','yes'),(106,'nonce_key','9x1HJ;4$8D/r*V{0UT@bkxM=!rQ)G2[1dx,g1z@Hdow]*qVoS -<E]Yb-O:1K?MY','yes'),(107,'nonce_salt','M7g|R}*$i:N._y!P!Rm9I=x7 X{BZr&Y.^5ktqi{^E!K;n((cz1odV%O0LLhvYEJ','yes'),(108,'_site_transient_update_core','O:8:\"stdClass\":3:{s:7:\"updates\";a:0:{}s:15:\"version_checked\";s:3:\"3.8\";s:12:\"last_checked\";i:1417550785;}','yes'),(109,'_site_transient_update_plugins','O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1417550786;}','yes'),(112,'_site_transient_update_themes','O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1417550786;}','yes'),(117,'can_compress_scripts','0','yes'),(120,'theme_mods_twentyfourteen','a:8:{s:16:\"header_textcolor\";s:6:\"777777\";s:16:\"background_color\";s:6:\"f5f5f5\";s:16:\"background_image\";s:0:\"\";s:17:\"background_repeat\";s:6:\"repeat\";s:21:\"background_position_x\";s:4:\"left\";s:21:\"background_attachment\";s:5:\"fixed\";s:23:\"featured_content_layout\";s:4:\"grid\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1393262139;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(121,'recently_activated','a:0:{}','yes'),(143,'_transient_timeout_plugin_slugs','1393349311','no'),(144,'_transient_plugin_slugs','a:3:{i:0;s:19:\"akismet/akismet.php\";i:1;s:31:\"google-app-engine/appengine.php\";i:2;s:9:\"hello.php\";}','no'),(413,'current_theme','Twenty Twelve','yes'),(414,'theme_mods_twentytwelve','a:7:{i:0;b:0;s:16:\"header_textcolor\";s:6:\"515151\";s:16:\"background_color\";s:6:\"e6e6e6\";s:16:\"background_image\";s:0:\"\";s:17:\"background_repeat\";s:6:\"repeat\";s:21:\"background_position_x\";s:4:\"left\";s:21:\"background_attachment\";s:5:\"fixed\";}','yes'),(415,'theme_switched','','yes'),(1270,'_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51','1413774881','no'),(1271,'_transient_dash_4077549d03da2e451c8b5f002294ff51','<div class=\"rss-widget\"><p><strong>RSS Error</strong>: WP HTTP Error: 0: php_network_getaddresses: gethostbyname failed. errno=0</p></div><div class=\"rss-widget\"><p><strong>RSS Error</strong>: WP HTTP Error: 0: php_network_getaddresses: gethostbyname failed. errno=0</p></div>','no'),(1275,'_transient_is_multi_author','0','yes'),(1409,'_site_transient_timeout_theme_roots','1417552586','yes'),(1410,'_site_transient_theme_roots','a:3:{s:14:\"twentyfourteen\";s:7:\"/themes\";s:14:\"twentythirteen\";s:7:\"/themes\";s:12:\"twentytwelve\";s:7:\"/themes\";}','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','page-templates/front-page.php'),(2,2,'_edit_lock','1413736070:1'),(3,2,'_edit_last','1'),(7,8,'_edit_last','1'),(8,8,'_wp_page_template','page-templates/front-page.php'),(9,8,'_edit_lock','1412451590:1'),(13,20,'_edit_last','1'),(14,20,'_wp_page_template','page-templates/front-page.php'),(15,20,'_edit_lock','1406217415:1'),(22,71,'_edit_last','1'),(23,71,'_edit_lock','1412463410:1'),(24,71,'_wp_page_template','default');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (2,1,'2013-12-31 20:20:10','2013-12-31 20:20:10','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a company founded on three motivating factors.\r\n\r\nWe want to do only good things, for life.  We should try always to agree on what is Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we strongly believe in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\r\n\r\n&nbsp;','About Us','','publish','open','open','','sample-page','','','2014-10-19 16:01:14','2014-10-19 16:01:14','',0,'https://secret-grammar-446.appspot.com/?page_id=2',0,'page','',0),(4,1,'2014-10-19 16:00:33','2014-10-19 16:00:33','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a company founded on three motivating factors.\n\nWe want to do only good things, for life.  We should try always to agree on what is Good.\n\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\n\nFinally, we are committed to transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\n\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\n\n&nbsp;','About Us','','inherit','open','open','','2-autosave-v1','','','2014-10-19 16:00:33','2014-10-19 16:00:33','',2,'https://secret-grammar-446.appspot.com/?p=4',0,'revision','',0),(5,1,'2014-01-01 20:53:17','2014-01-01 20:53:17','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change in our communities through public outreach, education, and most of all hope.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.  And not just work, inspirational work!\r\n\r\nFor information, or if you\'d like to get involved.  Please email us at info@amdgtechnologies.com.\r\n\r\n&nbsp;','What\'s this about','','inherit','open','open','','2-revision-v1','','','2014-01-01 20:53:17','2014-01-01 20:53:17','',2,'https://secret-grammar-446.appspot.com/?p=5',0,'revision','',0),(8,1,'2014-01-03 14:47:56','2014-01-03 14:47:56','We have over a decade of experience in statistical analysis of data across multiple domains. With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nWe  have expertise with the following technologies:\r\n\r\n<strong>Software Development:  </strong>C/C++, Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\r\n\r\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','publish','open','open','','data-science','','','2014-10-04 19:41:09','2014-10-04 19:41:09','',0,'https://secret-grammar-446.appspot.com/?page_id=8',0,'page','',0),(9,1,'2014-01-03 14:47:48','2014-01-03 14:47:48','','Data Science','','inherit','open','open','','8-revision-v1','','','2014-01-03 14:47:48','2014-01-03 14:47:48','',8,'https://secret-grammar-446.appspot.com/?p=9',0,'revision','',0),(14,1,'2014-10-04 19:40:33','2014-10-04 19:40:33','We have over a decade of experience in statistical analysis of data across multiple domains. With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\n\nWe  have expertise with the following technologies:\n\n<strong>Software Development:  </strong>C/C++, Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout\n\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\n\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\n\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization, geodesy\n\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\n\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','inherit','open','open','','8-autosave-v1','','','2014-10-04 19:40:33','2014-10-04 19:40:33','',8,'https://secret-grammar-446.appspot.com/?p=14',0,'revision','',0),(15,1,'2014-01-03 14:59:05','2014-01-03 14:59:05','With over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  We have the fundamentals, the experience, and knowledge of the latest tools and trends in analysis of big data, little data, YOUR data!\r\n\r\n&nbsp;','Data Science','','inherit','open','open','','8-revision-v1','','','2014-01-03 14:59:05','2014-01-03 14:59:05','',8,'https://secret-grammar-446.appspot.com/?p=15',0,'revision','',0),(20,1,'2014-01-03 15:07:05','2014-01-03 15:07:05','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>RF receivers</strong>, compression,  beamforming, Radar, clutter models, <strong>EOIR systems</strong>, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','publish','open','open','','consulting-services','','','2014-07-24 15:58:36','2014-07-24 15:58:36','',0,'https://secret-grammar-446.appspot.com/?page_id=20',0,'page','',0),(21,1,'2014-01-03 15:07:05','2014-01-03 15:07:05','','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-01-03 15:07:05','2014-01-03 15:07:05','',20,'https://secret-grammar-446.appspot.com/?p=21',0,'revision','',0),(23,1,'2014-01-03 15:09:14','2014-01-03 15:09:14','Not sure what we can do for you?  We enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-01-03 15:09:14','2014-01-03 15:09:14','',20,'https://secret-grammar-446.appspot.com/?p=23',0,'revision','',0),(24,1,'2014-01-03 15:17:58','2014-01-03 15:17:58','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change in our communities through public outreach, education, and most of all hope.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.  And not just work, inspirational work!','What\'s this about','','inherit','open','open','','2-revision-v1','','','2014-01-03 15:17:58','2014-01-03 15:17:58','',2,'https://secret-grammar-446.appspot.com/?p=24',0,'revision','',0),(26,1,'2014-01-03 19:18:12','2014-01-03 19:18:12','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  fundamentals,  experience and knowledge of the latest tools and trends, we specialize in the analysis of big data, little data, YOUR data!\r\n\r\n&nbsp;','Data Science','','inherit','open','open','','8-revision-v1','','','2014-01-03 19:18:12','2014-01-03 19:18:12','',8,'https://secret-grammar-446.appspot.com/?p=26',0,'revision','',0),(27,1,'2014-01-03 19:19:25','2014-01-03 19:19:25','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends, we specialize in the analysis of big data, little data, YOUR data!\r\n\r\n&nbsp;','Data Science','','inherit','open','open','','8-revision-v1','','','2014-01-03 19:19:25','2014-01-03 19:19:25','',8,'https://secret-grammar-446.appspot.com/?p=27',0,'revision','',0),(28,1,'2014-01-05 13:49:49','2014-01-05 13:49:49','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\n&nbsp;','Data Science','','inherit','open','open','','8-revision-v1','','','2014-01-05 13:49:49','2014-01-05 13:49:49','',8,'https://secret-grammar-446.appspot.com/?p=28',0,'revision','',0),(31,1,'2014-02-14 18:18:03','2014-02-14 18:18:03','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change in our communities through public outreach, education, and most of all hope.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.  And not just work, inspirational work!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-14 18:18:03','2014-02-14 18:18:03','',2,'https://secret-grammar-446.appspot.com/?p=31',0,'revision','',0),(37,1,'2014-02-24 18:28:02','2014-02-24 18:28:02','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nAdditionally, we are currently experimenting with cloud-based interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe currently have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, outmeans, EM, NN, LR, Bayes Net, SVM, DS\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds, Kalman, Adaptive Filter Theory\r\n\r\n<strong>Numerical Methods:</strong> Matrix and Linear Algebra, Optimization, Geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, multiratefilters , BSS, deconvolution, super-resolution, fusion, image processing, and compression algorithms.\r\n\r\n<strong>Sensors:</strong>  EO/IR, Inertial, Acoustic, Radar/RF/Comms','Data Science','','inherit','open','open','','8-revision-v1','','','2014-02-24 18:28:02','2014-02-24 18:28:02','',8,'https://secret-grammar-446.appspot.com/?p=37',0,'revision','',0),(41,1,'2014-02-24 19:34:15','2014-02-24 19:34:15','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate, and create positive change  and are passionate about effective use of time, resources, and energy\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering list of technical buzzwords.  If it\'s there we\'ve touched at one time or another, and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary technical environment that sometimes just renames things for fun.  Contact us, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"></p>\r\n<p style=\"text-align: center;\">\r\n<strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>Defense, </strong>pulsed doppler, phased array, SAR, GMTI, passive, ECM, pulse compression, receivers, beamforming, clutter models EOIR systems: missile seekers, photogrammetry, radiometry, hyperspectral  <strong>Biomedical, </strong>Instrumentation, EEG, EKG, EMG ,<strong> Operating Systems</strong>, Linux, Windows, OS X , ChomeOS, <strong>Control Systems</strong>,  guidance law, navigation, tracking ,<strong>Communications</strong>, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\">\r\n<strong>Electronics </strong></p>\r\n<p style=\"text-align: center;\"><strong></strong>SPICE, ADC, analog filters, instrumentation, BJT, TTL, op-amps, Digital Design, VHDL/Prolog</p>\r\n<p style=\"text-align: center;\">\r\n<strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>Machine Learning,</strong> PCA, ICA, k-means, EM, NN, LR, Bayes Net, SVM, DS\r\nEstimation Theory, Cramer-Rao bounds, <strong>Kalman and Adaptive Filter Theory </strong>\r\nNumerical Methods, Matrix and Linear Algebra, Optimization, Geodesy\r\n<strong>Signal Processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, BSS, deconvolution, super-resolution, fusion, <strong>image processing</strong>, compression\r\n\r\n</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-02-24 19:34:15','2014-02-24 19:34:15','',20,'https://secret-grammar-446.appspot.com/?p=41',0,'revision','',0),(42,1,'2014-02-24 20:22:07','2014-02-24 20:22:07','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.  We believe the environmental and sociological advantages to close-commuting to out way the disadvantages.   Not just tele-work, inspirational tele-work!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 20:22:07','2014-02-24 20:22:07','',2,'https://secret-grammar-446.appspot.com/?p=42',0,'revision','',0),(43,1,'2014-02-24 20:25:19','2014-02-24 20:25:19','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.  Additionally, technology professionals have a responsibility to insure that the information age does not lead to information ghettos caused by knowledge propagation lag.  We believe the environmental and sociological advantages to close-commuting to out way the disadvantages.   Not just tele-work, inspirational tele-work!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 20:25:19','2014-02-24 20:25:19','',2,'https://secret-grammar-446.appspot.com/?p=43',0,'revision','',0),(44,1,'2014-02-24 20:26:30','2014-02-24 20:26:30','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.  Technology professionals have a responsibility to insure that the information age does not lead to information ghettos due to knowledge propagation lag.  We believe the environmental and sociological advantages to close-commuting to out way the disadvantages.   Not just tele-work, inspirational tele-work!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 20:26:30','2014-02-24 20:26:30','',2,'https://secret-grammar-446.appspot.com/?p=44',0,'revision','',0),(45,1,'2014-02-24 20:30:05','2014-02-24 20:30:05','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things.  Good for people, good for the planet, good for clients.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.    We believe the environmental and sociological advantages to close-commuting to out way the disadvantages.   Not just tele-work, inspirational tele-work!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 20:30:05','2014-02-24 20:30:05','',2,'https://secret-grammar-446.appspot.com/?p=45',0,'revision','',0),(46,1,'2014-02-24 21:19:32','2014-02-24 21:19:32','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.    We believe the environmental and sociological advantages to close-commuting to out way the disadvantages.   Not just tele-work, inspirational tele-work!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 21:19:32','2014-02-24 21:19:32','',2,'https://secret-grammar-446.appspot.com/?p=46',0,'revision','',0),(47,1,'2014-02-24 21:42:50','2014-02-24 21:42:50','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.    We believe the environmental and sociological advantages to close-commuting to outweigh the disadvantages.   Not just telework, inspirational telework!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 21:42:50','2014-02-24 21:42:50','',2,'https://secret-grammar-446.appspot.com/?p=47',0,'revision','',0),(49,1,'2014-02-24 22:36:27','2014-02-24 22:36:27','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nFirst, we want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nSecond, technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.    We believe the environmental and sociological advantages of telecommuting, and distributed office environments to outweigh the disadvantages.   Not just telework, inspirational telework!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-24 22:36:27','2014-02-24 22:36:27','',2,'https://secret-grammar-446.appspot.com/?p=49',0,'revision','',0),(52,1,'2014-02-25 13:12:45','2014-02-25 13:12:45','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we would like to emphasize and nurture small communities, like our neighborhood of Bethel, Ohio.  We believe that modern technology and tools have provided the opportunity to live and work closer to family and friends.    We believe the environmental and sociological advantages of telecommuting and distributed office environments to outweigh the disadvantages.   Not just telework, inspirational telework!','About Us','','inherit','open','open','','2-revision-v1','','','2014-02-25 13:12:45','2014-02-25 13:12:45','',2,'https://secret-grammar-446.appspot.com/?p=52',0,'revision','',0),(54,1,'2014-02-25 13:29:33','2014-02-25 13:29:33','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>defensive systems, </strong>pulsed doppler, phased array, SAR, GMTI, passive, ECM, pulse compression, receivers, beamforming, clutter models, <strong>EOIR system</strong>s, missile seekers, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Electronics </strong></p>\r\n<p style=\"text-align: center;\"><strong></strong>SPICE, ADC, analog filters, instrumentation, BJT, TTL, op-amps, Digital Design, VHDL, Prolog</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\">machine learning<strong>,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, Dempster-Shafer, e<strong>stimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, adaptive filter theory, </strong>Numerical Methods, Matrix Theory, li<strong>near algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-02-25 13:29:33','2014-02-25 13:29:33','',20,'https://secret-grammar-446.appspot.com/?p=54',0,'revision','',0),(55,1,'2014-02-25 13:30:43','2014-02-25 13:30:43','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nAdditionally, we are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe currently have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, outmeans, EM, NN, LR, Bayes Net, SVM, DS\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds, Kalman, Adaptive Filter Theory\r\n\r\n<strong>Numerical Methods:</strong> Matrix and Linear Algebra, Optimization, Geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, multiratefilters , BSS, deconvolution, super-resolution, fusion, image processing, and compression algorithms.\r\n\r\n<strong>Sensors:</strong>  EO/IR, Inertial, Acoustic, Radar/RF/Comms','Data Science','','inherit','open','open','','8-revision-v1','','','2014-02-25 13:30:43','2014-02-25 13:30:43','',8,'https://secret-grammar-446.appspot.com/?p=55',0,'revision','',0),(56,1,'2014-02-28 01:32:24','2014-02-28 01:32:24','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>defensive systems, </strong>pulsed doppler, phased array, SAR, GMTI, passive, ECM, pulse compression, receivers, beamforming, clutter models, <strong>EOIR systems</strong>, missile seekers, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Electronics </strong></p>\r\n<p style=\"text-align: center;\"><strong></strong>SPICE, ADC, analog filters, instrumentation, BJT, TTL, op-amps, Digital Design, VHDL, Prolog</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\">machine learning<strong>,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, Dempster-Shafer, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-02-28 01:32:24','2014-02-28 01:32:24','',20,'https://secret-grammar-446.appspot.com/?p=56',0,'revision','',0),(57,1,'2014-03-01 12:33:05','2014-03-01 12:33:05','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>defensive systems, </strong>pulsed doppler, phased array, SAR, GMTI, passive, ECM, pulse compression, receivers, beamforming, clutter models, <strong>EOIR systems</strong>, missile seekers, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\">machine learning<strong>,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, Dempster-Shafer, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-03-01 12:33:05','2014-03-01 12:33:05','',20,'https://secret-grammar-446.appspot.com/?p=57',0,'revision','',0),(59,1,'2014-03-04 11:29:24','2014-03-04 11:29:24','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nAdditionally, we are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe currently have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, outmeans, EM, NN, LR, Bayes Net, SVM, DS\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds, Kalman, Adaptive Filter Theory\r\n\r\n<strong>Numerical Methods:</strong> Matrix and Linear Algebra, Optimization, Geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, multiratefilters , BSS, deconvolution, super-resolution, fusion, image processing, and compression algorithms.\r\n\r\n<strong>Sensors:</strong>  EO/IR, Inertial, Acoustic, Radar/RF/Comms','Data Science','','inherit','open','open','','8-revision-v1','','','2014-03-04 11:29:24','2014-03-04 11:29:24','',8,'https://secret-grammar-446.appspot.com/?p=59',0,'revision','',0),(60,1,'2014-03-04 13:33:47','2014-03-04 13:33:47','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nAdditionally, we are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe currently have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, DS, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds, Kalman, Adaptive Filter Theory, System Identification\r\n\r\n<strong>Numerical Methods:</strong> Matrix and Linear Algebra, Optimization, Geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, multiratefilters , BSS, deconvolution, super-resolution, fusion, image processing, and compression algorithms.\r\n\r\n<strong>Sensors:</strong>  EO/IR, Inertial, Acoustic, Radar/RF/Comms','Data Science','','inherit','open','open','','8-revision-v1','','','2014-03-04 13:33:47','2014-03-04 13:33:47','',8,'https://secret-grammar-446.appspot.com/?p=60',0,'revision','',0),(61,1,'2014-03-04 13:34:49','2014-03-04 13:34:49','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nAdditionally, we are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe currently have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, DS, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  System Identification, Inverse Systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and Linear Algebra, Optimization, Geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, Kalman, Adaptive Filter Theory, multirate filters , BSS, deconvolution, super-resolution, fusion, image processing, and compression algorithms.\r\n\r\n<strong>Sensors:</strong>  EO/IR, Inertial, Acoustic, Radar/RF/Comms','Data Science','','inherit','open','open','','8-revision-v1','','','2014-03-04 13:34:49','2014-03-04 13:34:49','',8,'https://secret-grammar-446.appspot.com/?p=61',0,'revision','',0),(63,1,'2014-03-20 20:51:18','2014-03-20 20:51:18','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!','About Us','','inherit','open','open','','2-revision-v1','','','2014-03-20 20:51:18','2014-03-20 20:51:18','',2,'https://secret-grammar-446.appspot.com/?p=63',0,'revision','',0),(65,1,'2014-03-29 23:39:03','2014-03-29 23:39:03','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>defensive systems, </strong>pulsed doppler, phased array, SAR, GMTI, passive, ECM, pulse compression, receivers, beamforming, clutter models, <strong>EOIR systems</strong>, missile seekers, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-03-29 23:39:03','2014-03-29 23:39:03','',20,'https://secret-grammar-446.appspot.com/?p=65',0,'revision','',0),(66,1,'2014-03-29 23:49:12','2014-03-29 23:49:12','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>RF receivers</strong>, compression,  beamforming, Radar, clutter models, <strong>EOIR systems</strong>, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-03-29 23:49:12','2014-03-29 23:49:12','',20,'https://secret-grammar-446.appspot.com/?p=66',0,'revision','',0),(67,1,'2014-03-30 00:00:18','2014-03-30 00:00:18','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nWe are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe some have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization, geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\r\n\r\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','inherit','open','open','','8-revision-v1','','','2014-03-30 00:00:18','2014-03-30 00:00:18','',8,'https://secret-grammar-446.appspot.com/?p=67',0,'revision','',0),(68,1,'2014-03-30 00:01:04','2014-03-30 00:01:04','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nWe are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe some have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization, geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, DSP, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\r\n\r\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','inherit','open','open','','8-revision-v1','','','2014-03-30 00:01:04','2014-03-30 00:01:04','',8,'https://secret-grammar-446.appspot.com/?p=68',0,'revision','',0),(69,1,'2014-03-30 00:01:24','2014-03-30 00:01:24','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nWe are currently experimenting with <a title=\"Cloud Development\" href=\"https://secret-grammar-446.appspot.com/?page_id=38\">cloud-based</a> interface for data analysis and visualization.  Consider us for your next data processing challenge.\r\n\r\nWe some have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization, geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\r\n\r\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','inherit','open','open','','8-revision-v1','','','2014-03-30 00:01:24','2014-03-30 00:01:24','',8,'https://secret-grammar-446.appspot.com/?p=69',0,'revision','',0),(71,1,'2014-05-07 15:44:20','2014-05-07 15:44:20','AMDG Technologies is currently looking for collaborators.  There are 10080 shares available, for good.\r\n\r\n&nbsp;','Investors','','publish','open','open','','investors','','','2014-10-04 22:58:38','2014-10-04 22:58:38','',0,'https://secret-grammar-446.appspot.com/?page_id=71',0,'page','',0),(72,1,'2014-05-07 15:44:20','2014-05-07 15:44:20','AMDG Technologies is currently looking for investors.  There are 10080 shares available, and there is no intention of producing any more.  Share purchase price and quantity to be determined by the buyer, at sellers discretion of course.','Investors','','inherit','open','open','','71-revision-v1','','','2014-05-07 15:44:20','2014-05-07 15:44:20','',71,'https://secret-grammar-446.appspot.com/?p=72',0,'revision','',0),(74,1,'2014-05-20 18:53:01','2014-05-20 18:53:01','AMDG Technologies is currently looking for investors.  There are 10080 shares available, and there is no intention of producing any more.','Investors','','inherit','open','open','','71-revision-v1','','','2014-05-20 18:53:01','2014-05-20 18:53:01','',71,'https://secret-grammar-446.appspot.com/?p=74',0,'revision','',0),(75,1,'2014-05-20 18:53:33','2014-05-20 18:53:33','AMDG Technologies is currently looking for investors.  There are 10080 shares available.  There is no intention of producing any more, ever.\r\n\r\n&nbsp;','Investors','','inherit','open','open','','71-revision-v1','','','2014-05-20 18:53:33','2014-05-20 18:53:33','',71,'https://secret-grammar-446.appspot.com/?p=75',0,'revision','',0),(76,1,'2014-05-20 18:54:03','2014-05-20 18:54:03','AMDG Technologies is currently looking for investors.  There are 10080 shares available.  There is no intention of producing any more, for good.\r\n\r\n&nbsp;','Investors','','inherit','open','open','','71-revision-v1','','','2014-05-20 18:54:03','2014-05-20 18:54:03','',71,'https://secret-grammar-446.appspot.com/?p=76',0,'revision','',0),(81,1,'2014-10-04 22:58:30','2014-10-04 22:58:30','AMDG Technologies is currently looking for collaborators.  There are 10080 shares available, for good.\n\n&nbsp;','Investors','','inherit','open','open','','71-autosave-v1','','','2014-10-04 22:58:30','2014-10-04 22:58:30','',71,'https://secret-grammar-446.appspot.com/?p=81',0,'revision','',0),(82,1,'2014-05-31 11:34:20','2014-05-31 11:34:20','AMDG Technologies is currently looking for investors.  There are 10080 shares available, for good.\r\n\r\n&nbsp;','Investors','','inherit','open','open','','71-revision-v1','','','2014-05-31 11:34:20','2014-05-31 11:34:20','',71,'https://secret-grammar-446.appspot.com/?p=82',0,'revision','',0),(86,1,'2014-05-31 17:51:27','2014-05-31 17:51:27','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.  Heck, we might even compose a custom jingle for your mnemonic enjoyment.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>RF receivers</strong>, compression,  beamforming, Radar, clutter models, <strong>EOIR systems</strong>, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-05-31 17:51:27','2014-05-31 17:51:27','',20,'https://secret-grammar-446.appspot.com/?p=86',0,'revision','',0),(87,1,'2014-05-31 19:34:39','2014-05-31 19:34:39','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.  Heck, we might even compose a custom jingle for your mnemonic entertainment.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>RF receivers</strong>, compression,  beamforming, Radar, clutter models, <strong>EOIR systems</strong>, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-05-31 19:34:39','2014-05-31 19:34:39','',20,'https://secret-grammar-446.appspot.com/?p=87',0,'revision','',0),(88,1,'2014-06-01 13:02:42','2014-06-01 13:02:42','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.  Heck, we might even compose a custom jingle for your mnemonic enjoyment.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>RF receivers</strong>, compression,  beamforming, Radar, clutter models, <strong>EOIR systems</strong>, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-06-01 13:02:42','2014-06-01 13:02:42','',20,'https://secret-grammar-446.appspot.com/?p=88',0,'revision','',0),(90,1,'2014-06-09 13:27:22','2014-06-09 13:27:22','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\nhttps://www.linkedin.com/in/mpeaton','About Us','','inherit','open','open','','2-revision-v1','','','2014-06-09 13:27:22','2014-06-09 13:27:22','',2,'https://secret-grammar-446.appspot.com/?p=90',0,'revision','',0),(91,1,'2014-06-09 13:29:57','2014-06-09 13:29:57','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-06-09 13:29:57','2014-06-09 13:29:57','',2,'https://secret-grammar-446.appspot.com/?p=91',0,'revision','',0),(92,1,'2014-06-09 13:31:05','2014-06-09 13:31:05','AMDG Technologies, Inc.  is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-06-09 13:31:05','2014-06-09 13:31:05','',2,'https://secret-grammar-446.appspot.com/?p=92',0,'revision','',0),(93,1,'2014-06-09 13:32:28','2014-06-09 13:32:28','<a href=\"https://www.facebook.com/AMDGTechnologies\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-06-09 13:32:28','2014-06-09 13:32:28','',2,'https://secret-grammar-446.appspot.com/?p=93',0,'revision','',0),(94,1,'2014-06-09 14:52:35','2014-06-09 14:52:35','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-06-09 14:52:35','2014-06-09 14:52:35','',2,'https://secret-grammar-446.appspot.com/?p=94',0,'revision','',0),(95,1,'2014-06-09 14:54:02','2014-06-09 14:54:02','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients.  We will settle for less money, for greater good.\r\n\r\nAdditionally, we believe that technology is for everyone, and everyone is capable of making a contribution.   We would hope to provide pathways to create positive change through public outreach, education, and job training.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-06-09 14:54:02','2014-06-09 14:54:02','',2,'https://secret-grammar-446.appspot.com/?p=95',0,'revision','',0),(96,1,'2014-06-10 00:08:34','2014-06-10 00:08:34','We have over a decade of experience in statistical analysis of data across multiple domains including biomedical, defense, and business clients.  With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nWe some have expertise with the following technologies:\r\n\r\n<strong>Software:</strong>  Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout, C/C++,\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization, geodesy\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\r\n\r\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','inherit','open','open','','8-revision-v1','','','2014-06-10 00:08:34','2014-06-10 00:08:34','',8,'https://secret-grammar-446.appspot.com/?p=96',0,'revision','',0),(98,1,'2014-07-24 15:58:36','2014-07-24 15:58:36','We are happy to offer consulting services in the areas of  systems engineering, software engineering, information technology, biomedical engineering, and data science.\r\n\r\nWe are motivated by a strong desire to innovate and create positive change.  We are passionate about effective use of time, resources, and energy.\r\n\r\nWe enjoy nothing more than inspiring creativity.  We can help you understand your problem, your needs, and how we might be able to help.\r\n\r\nThe following is a somewhat bewildering compilation of technical jargon.  If it\'s there, we\'ve touched upon it at one time or another and can find it if we need to.  It\'s really difficult to form a taxonomy of ones knowledge base, especially in a non-stationary environment that sometimes renames things for fun.  If we don\'t know, we\'ll say so.  If we can\'t do it, we\'ll tell you so. <a title=\"Contact Us\" href=\"https://secret-grammar-446.appspot.com/?page_id=34\">Contact us</a>, we\'ll cross-correlate!\r\n<p style=\"text-align: center;\"><strong>Software</strong></p>\r\n<p style=\"text-align: center;\">Java, Matlab, C/C++, BOOST, STL, <strong>Python, SciPy</strong>, Android, Perl, Fortran, BLAS, LAPACK, Atlas, bash, TCL/TK, Qt, GTK, SQL, SysML/UML, DODAF, SQL, XML, LabView, Altivec, SSE , Eclipse, GCC, GDB, MSVS, Vim, <strong>PyCharm</strong>, Google AppEngine, Google Compute Engine, EC2 ,  <strong>Software Development Tools</strong>, Eclipse, GCC, GDB, MSVS, <strong>Vim</strong>, SVN, git, curl, depot-tools, gcutil</p>\r\n<p style=\"text-align: center;\"><strong>Systems</strong></p>\r\n<p style=\"text-align: center;\"><strong>network engineering,</strong> TCPIP, VLANS, encryption, DHCP, DNS, traceroute, 802.11, RIP, EIGRP,  <strong>RF receivers</strong>, compression,  beamforming, Radar, clutter models, <strong>EOIR systems</strong>, photogrammetry, radiometry, hyperspectral  <strong>b</strong><strong>iomedical instrumentation</strong>, EEG, EKG, EMG, operating systems, <strong>l</strong><strong>lnux</strong>, windows, OS X , <strong>c</strong><strong>hromeOS</strong>, control systems,  guidance law, navigation, <strong>tracking</strong> ,communications, GSM/GMSK, OFDM, MSK, BPSK</p>\r\n<p style=\"text-align: center;\"><strong>Mathematics and Theory</strong></p>\r\n<p style=\"text-align: center;\"><strong>machine learning,</strong> PCA, <strong>ICA</strong>, inverse systems, k means, EM, NN, LR, Bayes net, SVM, <strong>estimation theory</strong>, Cramer-Rao bounds, <strong>Kalman Filter, </strong>adaptive filter theory<strong>, </strong>Numerical Methods, Matrix Theory, <strong>linear algebra</strong>, optimization, geodesy\r\n<strong>signal processing,</strong> wavelets, filters, filter banks, DSP, ARMA, multirate, <strong>BSS, deconvolution</strong>, super-resolution, fusion, <strong>image processing</strong>, compression</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Consulting Services','','inherit','open','open','','20-revision-v1','','','2014-07-24 15:58:36','2014-07-24 15:58:36','',20,'https://secret-grammar-446.appspot.com/?p=98',0,'revision','',0),(100,1,'2014-10-04 19:41:09','2014-10-04 19:41:09','We have over a decade of experience in statistical analysis of data across multiple domains. With deep knowledge of  the fundamentals,  and experience with the latest tools and trends; we specialize in the analysis of big data, little data, YOUR data!\r\n\r\nWe  have expertise with the following technologies:\r\n\r\n<strong>Software Development:  </strong>C/C++, Python/SciPy/Numpy/Pandas,  Java/Hadoop/Mahout\r\n\r\n<strong>Machine Learning:</strong>  PCA, ICA, EM, NN, LR, Bayes Net, SVM, clustering\r\n\r\n<strong>Estimation Theory:</strong>  Cramer-Rao bounds,  system identification, inverse systems\r\n\r\n<strong>Numerical Methods:</strong> Matrix and linear algebra, optimization\r\n\r\n<strong>Signal Processing</strong>:  Wavelets and filter banks, DSP, ARMA, adaptive filter theory, multitirate filters , blind source separation, blind deconvolution, super-resolution, fusion, image processing, compression.\r\n\r\n<strong>Sensors:</strong>  EO/IR, inertial, acoustic, RF','Data Science','','inherit','open','open','','8-revision-v1','','','2014-10-04 19:41:09','2014-10-04 19:41:09','',8,'https://secret-grammar-446.appspot.com/?p=100',0,'revision','',0),(101,1,'2014-10-04 19:52:04','2014-10-04 19:52:04','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do good things;  for people, for the planet, for clients, for Good.  If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-04 19:52:04','2014-10-04 19:52:04','',2,'https://secret-grammar-446.appspot.com/?p=101',0,'revision','',0),(102,1,'2014-10-04 19:54:16','2014-10-04 19:54:16','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things;  for people, for the planet, for clients, for Good.  If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-04 19:54:16','2014-10-04 19:54:16','',2,'https://secret-grammar-446.appspot.com/?p=102',0,'revision','',0),(103,1,'2014-10-04 19:55:44','2014-10-04 19:55:44','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things;  for people, for the planet, for clients, for Good.  If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\nRight now AMDG Technologies is...\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-04 19:55:44','2014-10-04 19:55:44','',2,'https://secret-grammar-446.appspot.com/?p=103',0,'revision','',0),(104,1,'2014-10-04 19:56:03','2014-10-04 19:56:03','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things;  for people, for the planet, for clients, for Good.  If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n&nbsp;\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-04 19:56:03','2014-10-04 19:56:03','',2,'https://secret-grammar-446.appspot.com/?p=104',0,'revision','',0),(105,1,'2014-10-04 19:56:19','2014-10-04 19:56:19','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things;  for people, for the planet, for clients, for Good.  If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\">Michael Eaton, CTO</a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-04 19:56:19','2014-10-04 19:56:19','',2,'https://secret-grammar-446.appspot.com/?p=105',0,'revision','',0),(106,1,'2014-10-04 22:58:38','2014-10-04 22:58:38','AMDG Technologies is currently looking for collaborators.  There are 10080 shares available, for good.\r\n\r\n&nbsp;','Investors','','inherit','open','open','','71-revision-v1','','','2014-10-04 22:58:38','2014-10-04 22:58:38','',71,'https://secret-grammar-446.appspot.com/?p=106',0,'revision','',0),(108,1,'2014-10-19 15:15:45','2014-10-19 15:15:45','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things;  for people, for the planet, for clients, for Good.  If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-19 15:15:45','2014-10-19 15:15:45','',2,'https://secret-grammar-446.appspot.com/?p=108',0,'revision','',0),(109,1,'2014-10-19 15:17:41','2014-10-19 15:17:41','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things, for life. If we don\'t agree it isn\'t Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-19 15:17:41','2014-10-19 15:17:41','',2,'https://secret-grammar-446.appspot.com/?p=109',0,'revision','',0),(110,1,'2014-10-19 15:55:23','2014-10-19 15:55:23','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a new kind of start up.  A company founded on three motivating factors.\r\n\r\nWe want to do only good things, for life.  We should try always to agree on what is Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-19 15:55:23','2014-10-19 15:55:23','',2,'https://secret-grammar-446.appspot.com/?p=110',0,'revision','',0),(111,1,'2014-10-19 15:57:29','2014-10-19 15:57:29','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a company founded on three motivating factors.\r\n\r\nWe want to do only good things, for life.  We should try always to agree on what is Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we believe  strongly in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-19 15:57:29','2014-10-19 15:57:29','',2,'https://secret-grammar-446.appspot.com/?p=111',0,'revision','',0),(112,1,'2014-10-19 16:01:14','2014-10-19 16:01:14','<a href=\"https://www.facebook.com/AMDGTechnologies\" target=\"_blank\">AMDG Technologies, Inc. </a> is a company founded on three motivating factors.\r\n\r\nWe want to do only good things, for life.  We should try always to agree on what is Good.\r\n\r\nTechnology is the application of knowledge.  Knowledge should be applied Ad Maiorem Dei Gloriam.\r\n\r\nFinally, we strongly believe in transparency, integrity, and candor.  At AMDG Technologies, we really do think that truth conquers all things!\r\n\r\n<a href=\"https://www.linkedin.com/in/mpeaton\" target=\"_blank\"> </a>\r\n\r\n&nbsp;','About Us','','inherit','open','open','','2-revision-v1','','','2014-10-19 16:01:14','2014-10-19 16:01:14','',2,'https://secret-grammar-446.appspot.com/?p=112',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','mpeaton'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),(13,1,'show_welcome_panel','1'),(14,1,'wp_dashboard_quick_press_last_post_id','107'),(15,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),(16,1,'metaboxhidden_nav-menus','a:3:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";}'),(17,1,'wp_user-settings','mfold=o&hidetb=1&wplink=1'),(18,1,'wp_user-settings-time','1393334969'),(19,1,'default_password_nag',''),(20,2,'first_name','Laura'),(21,2,'last_name','Eaton'),(22,2,'nickname','lreaton'),(23,2,'description',''),(24,2,'rich_editing','true'),(25,2,'comment_shortcuts','false'),(26,2,'admin_color','fresh'),(27,2,'use_ssl','0'),(28,2,'show_admin_bar_front','true'),(29,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(30,2,'wp_user_level','10'),(31,2,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'mpeaton','$P$BGr5R6tdu4dy.CT5NEya3leZ2/LmJQ/','mpeaton','mpeaton@amdgtechnologies.com','','2013-12-31 20:20:09','',0,'mpeaton'),(2,'lreaton','$P$BNo374OFplQJebtd1.4JkuhAwQAsnf/','lreaton','lreaton@gmail.com','','2014-03-18 13:22:04','',0,'Laura Eaton');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-03 17:08:39
