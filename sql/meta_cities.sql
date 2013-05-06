-- MySQL dump 10.13  Distrib 5.1.61, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: newindex
-- ------------------------------------------------------
-- Server version	5.1.61

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `meta_cities`
--

DROP TABLE IF EXISTS `meta_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `checksum` varchar(16) COLLATE utf8_bin NOT NULL,
  `lat` varchar(255) COLLATE utf8_bin NOT NULL,
  `long` varchar(255) COLLATE utf8_bin NOT NULL,
  `full_location` varchar(255) COLLATE utf8_bin NOT NULL,
  `total_word_cnt` mediumint(9) NOT NULL,
  `distinct_word_cnt` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `checksum` (`checksum`),
  KEY `province_id` (`province_id`,`city_id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=654 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-20 20:31:33
