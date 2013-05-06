-- MySQL dump 10.13  Distrib 5.5.27, for osx10.6 (i386)
--
-- Host: localhost    Database: wboutreach
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `seeding_wbuser`
--

DROP TABLE IF EXISTS `seeding_wbuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeding_wbuser` (
  `wbuserid` bigint(20) NOT NULL,
  `screen_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bi_followers_count` int(11) DEFAULT NULL,
  `followers_count` int(11) DEFAULT NULL,
  `statuses_count` int(11) DEFAULT NULL,
  `allow_all_comment` tinyint(1) NOT NULL,
  `allow_all_act_msg` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `verified_type` int(11) DEFAULT NULL,
  `verified_reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `mbtype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `block_word` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `friends_count` int(11) DEFAULT NULL,
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `insertts` datetime NOT NULL,
  `updatets` datetime NOT NULL,
  PRIMARY KEY (`wbuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeding_wbuser`
--
-- WHERE:  wbuserid in (SELECT author_id FROM wboutreach.seeding_feed where wbfeedmid in ( 'zmiE7pqq2', 'y7ojc5ifZ', 'zmxjHsvOf', 'zmxaon8q9', 'zlZk4nzKq', 'zlRJAAQtn', 'zmrF6c3ZT', 'zmePg2CJY', 'znw3dyfOB', 'znZf1lJtc', 'zn5xgiMV0' ))

LOCK TABLES `seeding_wbuser` WRITE;
/*!40000 ALTER TABLE `seeding_wbuser` DISABLE KEYS */;
INSERT INTO `seeding_wbuser` VALUES (1097414213,'袁裕来律师','袁裕来律师','m','2010-10-01 18:28:26+08:00',472,582328,24988,1,0,1,0,'','zh-cn','1000','33','浙江','12',0,0,574,'','2013-03-12 07:25:51','2013-03-21 06:20:04'),(1195818302,'赵晓','赵晓','m','2010-03-29 11:21:39+08:00',484,5390720,10379,1,0,1,0,'','zh-cn','1000','11','北京','0',0,0,573,'','2013-03-12 23:02:15','2013-03-21 06:03:31'),(1414148492,'共识网','共识网','m','2009-09-29 11:43:45+08:00',1721,147436,10033,1,1,1,2,'','zh-cn','5','11','北京 朝阳区','0',0,0,1966,'','2013-03-21 06:08:40','2013-03-21 06:09:11'),(1602334920,'自由曼德拉','自由曼德拉','m','2010-12-28 20:48:20+08:00',628,26604,3021,1,1,0,220,'','zh-cn','1000','34','安徽','13',0,0,945,'','2013-03-12 23:15:52','2013-03-21 06:06:28'),(1721825977,'许小年','许小年','m','2010-04-01 11:21:06+08:00',106,5918888,2789,1,0,1,0,'','zh-cn','1000','11','北京','0',0,0,126,'','2013-03-21 06:07:14','2013-03-21 06:08:07'),(1748019141,'周保松','周保松','m','2010-05-28 22:33:54+08:00',911,48780,3017,1,0,1,0,'','zh-tw','15','81','香港 沙田区','0',0,0,1300,'','2013-03-21 06:10:17','2013-03-21 06:10:33'),(1779749705,'海上的飘叶','海上的飘叶','f','2010-07-20 12:19:37+08:00',306,15119,880,1,0,0,-1,'','zh-cn','2','21','辽宁 大连','0',0,0,306,'','2013-03-22 06:35:19','2013-03-22 06:37:31'),(1830438495,'土家野夫','土家野夫','m','2010-10-15 20:19:58+08:00',1573,401686,12124,1,0,1,0,'','zh-cn','29','53','云南 大理','12',0,0,1581,'','2013-03-21 05:27:30','2013-03-21 06:08:46'),(2892948025,'计生-国耻','计生-国耻','f','2012-07-19 01:50:46+08:00',434,493,2646,1,0,0,-1,'','zh-cn','1','37','山东 济南','2',0,0,557,'','2013-03-12 23:02:16','2013-03-21 06:06:13');
/*!40000 ALTER TABLE `seeding_wbuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-21 23:39:08
