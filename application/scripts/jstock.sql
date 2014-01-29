CREATE DATABASE  IF NOT EXISTS `jstock` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jstock`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: jstock
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `daily_summary`
--

DROP TABLE IF EXISTS `daily_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summary_date` date DEFAULT NULL,
  `stock` varchar(20) DEFAULT NULL,
  `security` varchar(128) DEFAULT NULL,
  `volume` decimal(18,2) DEFAULT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `change` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_summary`
--

LOCK TABLES `daily_summary` WRITE;
/*!40000 ALTER TABLE `daily_summary` DISABLE KEYS */;
INSERT INTO `daily_summary` VALUES (1,'2014-01-23','ADVANCING','Caribbean Cement Company Ltd.',108345.00,4.08,0.09),(2,'2014-01-23','ADVANCING','Jamaica Broilers Ltd.',2880.00,4.72,0.01),(3,'2014-01-23','ADVANCING','Jamaica Money Market Brokers Limited 8.75%',350500.00,3.01,0.01),(4,'2014-01-23','ADVANCING','Pan-Jamaican Investment Trust Ltd.',216.00,48.20,0.05),(5,'2014-01-23','ADVANCING','Proven Investments Limited 8%',1150.00,5.10,0.02),(6,'2014-01-23','ADVANCING','Scotia Group Jamaica',66879.00,20.86,0.10),(7,'2014-01-23','DECLINING','Carreras Limited',14019.00,34.53,-1.97),(8,'2014-01-23','DECLINING','GraceKennedy Ltd.',123716.00,55.00,-1.00),(9,'2014-01-23','DECLINING','Hardware & Lumber',17500.00,8.34,-0.66),(10,'2014-01-23','DECLINING','Jamaica Money Market Brokers Ltd.',558.00,7.11,-0.38),(11,'2014-01-23','DECLINING','Sagicor Group Jamaica Limited',11117.00,8.45,-0.04),(12,'2014-01-23','DECLINING','Sagicor Real Estate X Fund Limited',300.00,6.30,-0.20),(13,'2014-01-23','DECLINING','Seprod Limited',107484.00,10.84,-0.16),(14,'2014-01-23','DECLINING','Supreme Ventures Limited',78102.00,2.40,-0.02),(15,'2014-01-23','TRADING_FIRM','Berger Paints Ltd.',445725.00,1.80,0.00),(16,'2014-01-23','TRADING_FIRM','Desnoes and Geddes Ltd.',45909.00,5.00,0.00),(17,'2014-01-23','TRADING_FIRM','Gleaner Company',5600.00,1.10,0.00),(18,'2014-01-23','TRADING_FIRM','Jamaica Money Market Brokers Ltd 8.50%',1000.00,3.50,0.00),(19,'2014-01-23','TRADING_FIRM','Mayberry Investments Ltd',1223442.00,2.00,0.00),(20,'2014-01-23','TRADING_FIRM','National Commercial Bank of Jamaica Ltd.',133900.00,17.99,0.00);
/*!40000 ALTER TABLE `daily_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_summary_master`
--

DROP TABLE IF EXISTS `daily_summary_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_summary_master` (
  `summary_date` date NOT NULL,
  `cache_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `summary1` varchar(512) DEFAULT NULL,
  `summary2` varchar(512) DEFAULT NULL,
  `summary_list` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`summary_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_summary_master`
--

LOCK TABLES `daily_summary_master` WRITE;
/*!40000 ALTER TABLE `daily_summary_master` DISABLE KEYS */;
INSERT INTO `daily_summary_master` VALUES ('2014-01-23','2014-01-26 00:42:36','COMPLETE','Overall Market activity resulted from trading in 20 \r\n  stocks of which 6 advanced, 8 \r\n  declined and\r\n  6 traded firm.','Market volume amounted to 2,738,342 \r\n   units valued at over $17,705,312. Mayberry Investments Ltd \r\n  was the volume leader with 1,223,442 units (44.68%) \r\n  followed by Berger Paints Ltd. with 445,725 \r\n  units (16.28%) and Jamaica Money Market Brokers Limited 8.75% \r\n  with 350,500 units (12.80%).','[\"The JSE Market Index declined by 402.47 points (0.50%) to close at 79,771.25.\",\"The JSE Select Index declined by 22.44 points (1.00%) to close at 2,228.50.\",\"The JSE All Jamaican Composite declined by 610.49 points (0.74%) to close at 81,413.32.\",\"The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 724.34.\",\"The JSE Junior Market Index declined by 10.72 points (1.36%) to close at 775.31.\",\"The JSE Combined Index declined by 461.13 points (0.56%) to close at 82,217.98.\",\"The JSE US Equities Index  by 0.00 points (0.00%) to close at 95.00.\"]');
/*!40000 ALTER TABLE `daily_summary_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-29  6:51:39
