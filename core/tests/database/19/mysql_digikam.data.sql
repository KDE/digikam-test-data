-- MySQL dump 10.13  Distrib 5.1.56, for pc-linux-gnu (x86_64)
--
-- Host: localhost    Database: digikam19
-- ------------------------------------------------------
-- Server version	5.1.56-log

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
-- Table structure for table `albumroots`
--

DROP TABLE IF EXISTS `albumroots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albumroots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` longtext,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `identifier` longtext,
  `specificPath` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`(167),`specificPath`(166))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumroots`
--

LOCK TABLES `albumroots` WRITE;
/*!40000 ALTER TABLE `albumroots` DISABLE KEYS */;
INSERT INTO `albumroots` VALUES (1,NULL,0,1,'volumeid:?uuid=800b21c2-dadc-4930-829e-a96b04ce26fa','/vivo/digikam-devel/data/testimages/a1'),(2,'a2',0,1,'volumeid:?uuid=800b21c2-dadc-4930-829e-a96b04ce26fa','/vivo/digikam-devel/data/testimages/a2');
/*!40000 ALTER TABLE `albumroots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumRoot` int(11) NOT NULL,
  `relativePath` longtext NOT NULL,
  `date` date DEFAULT NULL,
  `caption` longtext,
  `collection` longtext,
  `icon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albumRoot` (`albumRoot`,`relativePath`(332))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,1,'/','2011-06-18',NULL,NULL,NULL),(2,1,'/jpg','2011-06-23',NULL,NULL,NULL),(3,1,'/png','2011-06-23',NULL,NULL,NULL),(4,2,'/','2011-06-23',NULL,NULL,NULL),(5,2,'/pgf','2011-06-23',NULL,NULL,NULL),(6,2,'/pgf/link','2011-06-18',NULL,NULL,NULL);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadhistory`
--

DROP TABLE IF EXISTS `downloadhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` longtext,
  `filename` longtext,
  `filesize` int(11) DEFAULT NULL,
  `filedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`(164),`filename`(165),`filesize`,`filedate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadhistory`
--

LOCK TABLES `downloadhistory` WRITE;
/*!40000 ALTER TABLE `downloadhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagecomments`
--

DROP TABLE IF EXISTS `imagecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `language` varchar(128) DEFAULT NULL,
  `author` longtext,
  `date` datetime DEFAULT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imageid` (`imageid`,`type`,`language`,`author`(202))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagecomments`
--

LOCK TABLES `imagecomments` WRITE;
/*!40000 ALTER TABLE `imagecomments` DISABLE KEYS */;
INSERT INTO `imagecomments` VALUES (1,1,1,'x-default',NULL,NULL,'This file is a part of digiKam project\nhttp://www.digikam.org\nCopyright (C) 2011 by Francesco Riosa <francesco+kde at pnpitalia it>'),(2,2,1,'x-default',NULL,NULL,'This file is a part of digiKam project\nhttp://www.digikam.org\nCopyright (C) 2011 by Francesco Riosa <francesco+kde at pnpitalia it>');
/*!40000 ALTER TABLE `imagecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagecopyright`
--

DROP TABLE IF EXISTS `imagecopyright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagecopyright` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) DEFAULT NULL,
  `property` longtext,
  `value` longtext,
  `extraValue` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imageid` (`imageid`,`property`(110),`value`(111),`extraValue`(111))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagecopyright`
--

LOCK TABLES `imagecopyright` WRITE;
/*!40000 ALTER TABLE `imagecopyright` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagecopyright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagehaarmatrix`
--

DROP TABLE IF EXISTS `imagehaarmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagehaarmatrix` (
  `imageid` int(11) NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `uniqueHash` longtext,
  `matrix` longblob,
  PRIMARY KEY (`imageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagehaarmatrix`
--

LOCK TABLES `imagehaarmatrix` WRITE;
/*!40000 ALTER TABLE `imagehaarmatrix` DISABLE KEYS */;
INSERT INTO `imagehaarmatrix` VALUES (1,'2011-06-18 16:23:27','cba2141333c98a6da8d20f44cda6bda8','\0\0\0?҂�5��\0���C��e���&Tt*r���\0\0\0$��������\0\0�������}���\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0��������~\0\0��������y����\0\0\0\0\n\0\0�������������\0\0\0\0\0\0������������\0\0\0\r���|��������\0\0���~�������\0\0\0�\0\0����\0\0�����\0\0	\0\0�\0\0\0����P\0\0���P����\0\0�\0\0\0\0����8�������#���\0��������\0\0	����\0\0\0�\0\0H���R\0\0\0\0\0����\0\0�����\0\0����u����\0\0\0	�������\0�������\0��������\0\0	�����������\0\0\0\0�����\0\0�����\0\0\n\0\0H\0\0\0%\0\0\0	�������������������u����\0\0%����\0\0������~\0\0\0����\0\0�����\0\0���������\0\0����������������������������\0���\0'),(2,'2011-06-18 16:24:26','a398423699151ea8dce74f7158818440','\0\0\0?ҳ/r�},�r@�a��E�d��:R�\0\0�\0\0\0$����\0\0�����������}���\0\0\0\0\0\0\0�\0\0���~����\0\0\0\0\0\0�����\0\0�����\0\0���y\0\0\0\0\n����\0\0���������\0\0\0\0\0\0������������\0\0\0\r���|�����������~\0\0�������\0���e�������\0\0\0����u\0\0�\0\0\0	\0\0-|���E�������\0\0�����������\0\0\0\r\0\0\0�\0\0\08�����������\0\0\0\0�����������\0\0\n�\0\0����y\0\0\0\0\0\0\0\0\0��������\0\0\0\0�\0\0�����\0\0�\0\0�\0\0\0��������\0\0-�����\0\0w\0\0�\0\0(�\0\0���e\0\0���y\0\0\0�\0\0�\0\0,\0\0)�\0\0�\0\0\0�\0\0\0����\0\0([\0\0-�����\0\0����q\0\0\0\0\0r����\0\0\n�\0\0�\0\0\0\0\n\0\0\r�������E\0\0\0\0\0\n�\0\0*�����\0\0�\0\0\0'),(3,'2011-06-23 17:19:40','84664648e10b81f6234bf89e1a765cfa','\0\0\0?�/@u�ÿY�R.Rf�p`ܝ*�~\0\0���~\0\0\0M\0\0\0\0\0\0\0\0\0\0\0\0\r����\0\0\r\0\0\0\r\0\0\0���p���~����\0\0!\0���\0����������\0\0\0?\0\0����\0\0\0�\0\0\0\0\0\0\0\0\0	����\0\0\0�������\0�����������\0\0\0����\0��������\0\0�\0\0����y�����������H\0\0	�����\0\0�\0\0�\0\0���\r������߀����\0\0���\0\0\0�\0\0�\0\0����~\0\0\0\0���������������������H����������������\0\0����H���H���\0���\0���\0���\0���\0���\0����\0\0����\0\0	\0\0%\0���������������\0\0\0\0\0\0\0\0 \0���u\0\0\0����\0\0	���~��������\0\0\r��������\0\0\0\0\0\0����\0\0�\0\0���}����\0\0\0�����\0\0�\0\0�\0\0	\0\0\0\0����~\0\0\0\0\0\0\0\0\0'),(4,'2011-06-23 17:19:47','d7db271ef64e528899e5c30cab4707bc','\0\0\0?��vv�R?l4��ƿm!���WI���{\0\0\0\0����\0\0\0\0�\0\0&����\0\0:����\0�������\0\0\0}\0\0\0|����\0\0\0\08����y���|\0\0\0\0\0��ހ����\0\0\0\0\0�\0\0�\0\0\0>\0\0�\0\0\0\0\0?\0���\0���\0\0����\0\0\0\0\0\0\0���\0\0\0�\0\0\0���\0���s�������\0\0&�\0\0\0�\0\0����\0\0\0\0\'�\0\0����\0\0\'�\0\0�\0\0��������~\0\0\0\0\0\'\0�������\0����\0\0	�\0\0&�\0\0�\0\0������z����\0\0	�\0\0\'�\0\0����{���\0\0\0\'\0\0����}���}�������}��؀���s���s���v\0\0\'����s\0\0\'�\0\0����~\0\0%����������������~\0\0	�����\0\0\'\0�������z����\0\0\0\0&��������\0\0	�\0\0���\0���\0\0\0	\0\0�\0\0\'�\0\0�\0\0\'���{\0\0����}\0\0����}��؀���}����'),(5,'2011-06-23 17:20:41','52f6830591b57137f2bfeb3b181817ed','\0\0\0?�/#I�`���\n�m�>�s��Z�^\0\0\0\0����}����\0\0\0�\0\0\0����\0������g\0\0�����\0\0����|\0\0����r\0\0�\0\0����w���z����\0\0����\0����\0\0	���z���r\0\0\0��������\0\0����w���\0\0��������~����\0\0���~�����������}\0\0\0�\0\0����a�������2\0\0;�\0\0����\0\0����v\0\0����y\0\0;�����\0\0�\0\0\0\0\0\0\0�\0\0\0\0w���m�������y\0\0�\0\0\0����\0\0\0\0\0�\0\0����\0\0\0�������\0\0\0\0\0�����\0\0\0�\0\0\0\0\0\0\0\0���t\0\0\0�\0\0�\0\0����b\0\0\0��������\0\0�\0\0�����\0\0\0\0�\0\0�\0\0�\0\0	z\0\0\0����B\0\02\0\0w���\0���q\0\0\0������Á\0\0�\0\0\0\0\0\0\0�\0\0�\0\0�\0\0\0�\0\0����\0\0\0�\0\0�\0\0\0�\0\0\0\0\0\0'),(6,'2011-06-18 16:36:49','7696e970796358ca8b929650bb00dd2d','\0\0\0?�dO_���ט�<ÿ�i�a���\0\0\0$����������}\0\0\0����\0\0\0\0\0\0\0\0\0\0\0\0����\0\0�������~\0\0\0\0\0��������y����\0\0\n\0\0\0\0�\0\0�������������\0\0\0\0\0\0������������\0\0\0\r���|��������\0\0���~�������\0\0\0	\0\0\0\0\0�\0\00���n���u\0\0������������\0������������\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\0\0\0\0���\0\0\0%\0\0	\0\0�����\0\0�\0\0\0����\0\0\0�����������u����\0\0\0	�����������\0���\0�������{��������������������\0\0\n\0\0����~���\0������������\0\0\n����������������\0\0\0�������u\0\0����~\0\0\0%����\0\0\0\0\0�����\0\0����\0\0%\0\0����������������������������\0���\0'),(7,'2011-06-18 16:36:49','7696e970796358ca8b929650bb00dd2d','\0\0\0?�dO_���ט�<ÿ�i�a���\0\0\0$����������}\0\0\0����\0\0\0\0\0\0\0\0\0\0\0\0����\0\0�������~\0\0\0\0\0��������y����\0\0\n\0\0\0\0�\0\0�������������\0\0\0\0\0\0������������\0\0\0\r���|��������\0\0���~�������\0\0\0	\0\0\0\0\0�\0\00���n���u\0\0������������\0������������\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\0\0\0\0���\0\0\0%\0\0	\0\0�����\0\0�\0\0\0����\0\0\0�����������u����\0\0\0	�����������\0���\0�������{��������������������\0\0\n\0\0����~���\0������������\0\0\n����������������\0\0\0�������u\0\0����~\0\0\0%����\0\0\0\0\0�����\0\0����\0\0%\0\0����������������������������\0���\0'),(8,'2011-06-18 16:36:49','7696e970796358ca8b929650bb00dd2d','\0\0\0?�dO_���ט�<ÿ�i�a���\0\0\0$����������}\0\0\0����\0\0\0\0\0\0\0\0\0\0\0\0����\0\0�������~\0\0\0\0\0��������y����\0\0\n\0\0\0\0�\0\0�������������\0\0\0\0\0\0������������\0\0\0\r���|��������\0\0���~�������\0\0\0	\0\0\0\0\0�\0\00���n���u\0\0������������\0������������\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\0\0\0\0���\0\0\0%\0\0	\0\0�����\0\0�\0\0\0����\0\0\0�����������u����\0\0\0	�����������\0���\0�������{��������������������\0\0\n\0\0����~���\0������������\0\0\n����������������\0\0\0�������u\0\0����~\0\0\0%����\0\0\0\0\0�����\0\0����\0\0%\0\0����������������������������\0���\0');
/*!40000 ALTER TABLE `imagehaarmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageinformation`
--

DROP TABLE IF EXISTS `imageinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imageinformation` (
  `imageid` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `digitizationDate` datetime DEFAULT NULL,
  `orientation` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `format` longtext,
  `colorDepth` int(11) DEFAULT NULL,
  `colorModel` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageinformation`
--

LOCK TABLES `imageinformation` WRITE;
/*!40000 ALTER TABLE `imageinformation` DISABLE KEYS */;
INSERT INTO `imageinformation` VALUES (1,-1,'2011-06-18 16:23:27','2011-06-18 16:23:27',0,720,479,'JPG',8,5),(2,-1,'2011-06-18 16:24:26',NULL,0,720,479,'JPG',8,2),(3,-1,'2011-06-18 16:24:54','2011-06-18 16:24:54',0,1920,1080,'PNG',8,4),(4,-1,'2011-06-18 16:25:00','2011-06-18 16:25:00',0,824,3271,'PNG',8,4),(5,-1,'2011-06-18 16:40:36','2011-06-18 16:40:36',0,640,472,'JPG',8,2),(6,-1,'2011-06-18 16:36:49','2011-06-18 16:36:49',0,720,479,'PGF',24,1),(7,-1,'2011-06-18 16:36:49','2011-06-18 16:36:49',0,720,479,'PGF',24,1),(8,-1,'2011-06-18 16:36:49','2011-06-18 16:36:49',0,720,479,'PGF',24,1);
/*!40000 ALTER TABLE `imageinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagemetadata`
--

DROP TABLE IF EXISTS `imagemetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagemetadata` (
  `imageid` int(11) NOT NULL,
  `make` longtext,
  `model` longtext,
  `lens` longtext,
  `aperture` double DEFAULT NULL,
  `focalLength` double DEFAULT NULL,
  `focalLength35` double DEFAULT NULL,
  `exposureTime` double DEFAULT NULL,
  `exposureProgram` int(11) DEFAULT NULL,
  `exposureMode` int(11) DEFAULT NULL,
  `sensitivity` int(11) DEFAULT NULL,
  `flash` int(11) DEFAULT NULL,
  `whiteBalance` int(11) DEFAULT NULL,
  `whiteBalanceColorTemperature` int(11) DEFAULT NULL,
  `meteringMode` int(11) DEFAULT NULL,
  `subjectDistance` double DEFAULT NULL,
  `subjectDistanceCategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagemetadata`
--

LOCK TABLES `imagemetadata` WRITE;
/*!40000 ALTER TABLE `imagemetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagemetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagepositions`
--

DROP TABLE IF EXISTS `imagepositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagepositions` (
  `imageid` int(11) NOT NULL,
  `latitude` longtext,
  `latitudeNumber` double DEFAULT NULL,
  `longitude` longtext,
  `longitudeNumber` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `orientation` double DEFAULT NULL,
  `tilt` double DEFAULT NULL,
  `roll` double DEFAULT NULL,
  `accuracy` double DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`imageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagepositions`
--

LOCK TABLES `imagepositions` WRITE;
/*!40000 ALTER TABLE `imagepositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagepositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageproperties`
--

DROP TABLE IF EXISTS `imageproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imageproperties` (
  `imageid` int(11) NOT NULL,
  `property` longtext NOT NULL,
  `value` longtext NOT NULL,
  UNIQUE KEY `imageid` (`imageid`,`property`(332))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageproperties`
--

LOCK TABLES `imageproperties` WRITE;
/*!40000 ALTER TABLE `imageproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `imageproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album` int(11) DEFAULT NULL,
  `name` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `uniqueHash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album` (`album`,`name`(332)),
  KEY `dir_index` (`album`),
  KEY `hash_index` (`uniqueHash`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,2,'foto001.jpg',1,1,'2011-06-18 16:23:27',126893,'cba2141333c98a6da8d20f44cda6bda8'),(2,2,'foto001bw.jpg',1,1,'2011-06-18 16:24:26',86838,'a398423699151ea8dce74f7158818440'),(3,3,'snap001.png',1,1,'2011-06-23 17:19:40',119878,'84664648e10b81f6234bf89e1a765cfa'),(4,3,'snap002.png',1,1,'2011-06-23 17:19:47',119968,'d7db271ef64e528899e5c30cab4707bc'),(5,4,'Martian_face_viking.jpg',1,1,'2011-06-23 17:20:41',99582,'52f6830591b57137f2bfeb3b181817ed'),(6,5,'foto001.pgf',1,1,'2011-06-18 16:36:49',496246,'7696e970796358ca8b929650bb00dd2d'),(7,6,'foto001.pgf',1,1,'2011-06-18 16:36:49',496246,'7696e970796358ca8b929650bb00dd2d'),(8,6,'lntofoto.pgf',1,1,'2011-06-18 16:36:49',496246,'7696e970796358ca8b929650bb00dd2d');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`digikam`@`%`*/ /*!50003 TRIGGER delete_image AFTER DELETE ON Images
            FOR EACH ROW BEGIN
            DELETE FROM ImageTags
            WHERE imageid=OLD.id;
            DELETE From ImageHaarMatrix
            WHERE imageid=OLD.id;
            DELETE From ImageInformation
            WHERE imageid=OLD.id;
            DELETE From ImageMetadata
            WHERE imageid=OLD.id;
            DELETE From ImagePositions
            WHERE imageid=OLD.id;
            DELETE From ImageComments
            WHERE imageid=OLD.id;
            DELETE From ImageCopyright
            WHERE imageid=OLD.id;
            DELETE From ImageProperties
            WHERE imageid=OLD.id;
            UPDATE Albums SET icon=null
            WHERE icon=OLD.id;
            UPDATE Tags SET icon=null
            WHERE icon=OLD.id;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `imagetags`
--

DROP TABLE IF EXISTS `imagetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetags` (
  `imageid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  UNIQUE KEY `imageid` (`imageid`,`tagid`),
  KEY `tag_index` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetags`
--

LOCK TABLES `imagetags` WRITE;
/*!40000 ALTER TABLE `imagetags` DISABLE KEYS */;
INSERT INTO `imagetags` VALUES (1,15),(3,2),(3,3),(3,7),(3,8),(3,10),(4,5),(4,12),(4,14);
/*!40000 ALTER TABLE `imagetags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` longtext NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `keyword` longtext NOT NULL,
  `value` longtext,
  UNIQUE KEY `keyword` (`keyword`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('preAlpha010Update1','true'),('preAlpha010Update2','true'),('preAlpha010Update3','true'),('beta010Update1','true'),('beta010Update2','true'),('databaseImageFormats','jpg;jpeg;jpe;jp2;j2k;jpx;jpc;pgx;tif;tiff;png;xpm;ppm;pnm;pgf;gif;bmp;xcf;pcx;bay;bmq;cr2;crw;cs1;dc2;dcr;dng;erf;fff;hdr;k25;kdc;mdc;mos;mrw;nef;orf;pef;pxn;raf;raw;rdc;sr2;srf;x3f;arw;3fr;cine;ia;kc2;mef;nrw;qtk;rw2;sti;rwl;'),('databaseVideoFormats','mpeg;mpg;mpo;mpe;avi;mov;wmf;asf;mp4;3gp;wmv'),('databaseAudioFormats','ogg;mp3;wma;wav'),('FilterSettingsVersion','3'),('DcrawFilterSettingsVersion','3'),('DBVersion','5');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` longtext NOT NULL,
  `icon` int(11) DEFAULT NULL,
  `iconkde` longtext,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,0,'tagl0a',0,NULL,1,30),(2,1,'tagl1a',0,NULL,28,29),(3,1,'tagl1b',0,NULL,4,27),(4,1,'tagl1c',0,NULL,2,3),(5,3,'tagl2a',0,NULL,25,26),(6,3,'tagl2b',0,NULL,9,24),(7,3,'tagl2c',0,NULL,7,8),(8,3,'tagl2d',0,NULL,5,6),(9,6,'tagl3a',0,NULL,22,23),(10,6,'tagl3b',0,NULL,20,21),(11,0,'tl0',0,NULL,10,19),(12,11,'tl0a',0,NULL,13,18),(13,11,'tl0b',0,NULL,11,12),(14,12,'tl0a0',0,NULL,16,17),(15,12,'tl0a1',0,NULL,14,15);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`digikam`@`%`*/ /*!50003 TRIGGER move_tagstree AFTER UPDATE ON Tags
            FOR EACH ROW BEGIN
            DELETE FROM TagsTree;
            REPLACE INTO TagsTree
            SELECT node.id, parent.pid
            FROM Tags AS node, Tags AS parent
            WHERE node.lft BETWEEN parent.lft AND parent.rgt
            ORDER BY parent.lft;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`digikam`@`%`*/ /*!50003 TRIGGER delete_tag AFTER DELETE ON Tags
            FOR EACH ROW BEGIN
                DELETE FROM ImageTags WHERE tagid=OLD.id;
                DELETE FROM TagsTree;
                REPLACE INTO TagsTree
                SELECT node.id, parent.pid
                FROM Tags AS node, Tags AS parent
                WHERE node.lft BETWEEN parent.lft AND parent.rgt
                ORDER BY parent.lft;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tagstree`
--

DROP TABLE IF EXISTS `tagstree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagstree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagstree`
--

LOCK TABLES `tagstree` WRITE;
/*!40000 ALTER TABLE `tagstree` DISABLE KEYS */;
INSERT INTO `tagstree` VALUES (1,0),(2,0),(2,1),(3,0),(3,1),(4,0),(4,1),(5,0),(5,1),(5,3),(6,0),(6,1),(6,3),(7,0),(7,1),(7,3),(8,0),(8,1),(8,3),(9,0),(9,1),(9,3),(9,6),(10,0),(10,1),(10,3),(10,6),(11,0),(11,1),(11,3),(12,0),(12,1),(12,3),(12,11),(13,0),(13,1),(13,3),(13,11),(14,0),(14,1),(14,3),(14,11),(14,12);
/*!40000 ALTER TABLE `tagstree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'digikam19'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-23 23:28:39
