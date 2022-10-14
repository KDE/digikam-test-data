-- MySQL dump 10.13  Distrib 5.1.56, for pc-linux-gnu (x86_64)
--
-- Host: localhost    Database: digikam
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
  UNIQUE KEY `identifier` (`identifier`(127),`specificPath`(128))
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
  UNIQUE KEY `albumRoot` (`albumRoot`,`relativePath`(255))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,1,'/','2011-06-18',NULL,NULL,NULL),(2,1,'/jpg','2011-06-27',NULL,NULL,NULL),(3,1,'/png','2011-06-27',NULL,NULL,NULL),(4,2,'/','2011-06-27',NULL,NULL,NULL),(5,2,'/pgf','2011-06-27',NULL,NULL,NULL),(6,2,'/pgf/link','2011-06-27',NULL,NULL,NULL);
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
INSERT INTO `imagehaarmatrix` VALUES (1,'2011-06-27 22:29:38','874f072fa8186c7e555c76c139ec3223','\0\0\0?ј��|<���7�^���7�������\0\0\0\0\0$�������}����\0\0\0�\0\0\0���\0\0\0\0\0\0\0���\0\0�����\0\0����~�������y\0\0\0\0\n��������\0\0�����\0\0\0����\0\0\0��������\0\0\0\r���������������|����\0\0���~�������\0\0\0��������8\0\0���P\0\0\0�\0\0���R����\0\0����\0����������������\0\0\n\0\0\0%�������#\0\0��������\0\0	\0\0\0����\0\0\0\0\0�\0\0H���u\0\0����\0\0���������\0\0\0	�������\0�������\0����\0\0	����\0\0K����\0\0�����\0\0\0�����������������\0\0H���u\0\0\0%����\0\0\n\0\0\0	���~\0\0%����\0\0�\0\0������������\0\0\0\0\0��������\0\0������������������������������������\0���\0'),(2,'2011-06-27 15:36:34','62005ab09158c728652c972600f72b22','\0\0\0?�=���g>�G�F��CKl7�\0\0�����\0\0\0$���}\0\0\0\0\0������������\0\0\0\0\0\0\0\0\0\0���~\0\0�����\0\0������������y\0\0\0\0\0\0\n\0\0�������������\0\0\0\0\0\0��������\0\0\0\r�������|�����������~\0\0�������\0���\\���W\0\0\Z�\0\0�\0\0\Zg���\0\0����\0\0c\0\0;���b\0\0�\0\0x���\0\0\r�\0\0)\0\0����m\0\0����D\0\0)\0\0>��Ϸ���8��ܮ\0\0�����\0\0S\0\0�����\0\0H������E��������\0\0Z\0\02��������\0\0\0\0\0����J����\0\0\n�����\0\0������Ҝ\0\06Y\0\0\0\0\0�\0\0\n(���b\0\0�\0\0y��������\0\0�������\0\0�\0\0;���q\0\0\0\0�����\0\0�\0\0\0\0����<\0\0�\0\0��������z������������������E\0\0\0'),(3,'2011-06-27 15:31:45','1b9ef89b5b08b2866196e66435436bbc','\0\0\0?���?I��]�N�5�H��g$����\0\0\0\0\0\0\0\0\0\0���~\0\0\0����\0���x\0\0\0���\0\0\0\0\0�\0\0��������\0\0\0~���~���\0\0\0\0\0�����������\0\0\0����\0\0\0 �����������\0\0\0@\0\0����\0������������\0\0�\0\0����\0��������\0\0���{����\0\0\0\0\0���~\0\0\0\0�������]\0\0\0����������������\0\0\0\0���������\0\0�\0\0\0\0\0?����\0\0����\0\0������������\0����\0\0 \0���\0\0\0�\0\0����\0\0\0���\0���\0���\0��������\0\0�\0\0\0\0\0\0�\0\0���������\0\0\0����\0\0���������\0\0�\0\0\0\0�\0\0�\0\0�\0\0�\0\0�����������������\0\0\0���}\0\0\0\0\0�\0\0�����\0\0\0���\0\0\0\0-����\0\0�\0\0\0\0\0\0\0\0\0\0\0\0'),(4,'2011-06-27 15:31:50','92f83bf9cd9d363180be2e83913b27a4','\0\0\0?�Ya��?t6]����kFL\'��}��������\0\0��̀���\0\0����\0����\0\0����x���{����\0\0\0��������}\0\0\0\0\0����\0\03����}\0\0\0\0\r�����������\0\0����y\0\0�������݀���\0\0\0\0����\0\0>�\0\0�\0\0�\0\0����\0���\0���\0\0\0�\0\0\0���}���}���{���z���j����\0\0\n�����\0\0���~\0\0�\0\0+�\0\0\0�\0\0����\0\0\0�\0\0\0�������}\0\0�\0\0\0���\0����\0\0\0\0����\0\0-�\0\0�\0\0\n�����\0\0-����{���\0���\0����\0\0�\0\0�\0\0�\0\0�\0\0���{�������j�����������~\0\0�\0\0\0�\0\0+�\0\0\0\0��������\0\0\0\n����������\0����\0\0\0\0����\0\0\n����\0\0\0�\0\0-�\0\0-����\0\0\0����}���z���{����\0\0�\0\0\n����}����\0\0�\0\0�'),(5,'2011-06-27 16:39:02','c528d0080c44b6cadfb5f46202f57af7','\0\0\0?u-��8<�3��[��RںM����u\0\0�����\0\0�\0\0\0\0\01\0\0\0\0�\0\0���O����\0\0\0���u����\0\0�\0\0�\0\0���z���}��������\0\0�\0\0\0\0���������\0\0\0\0\0\0\0����\0\0\0���z���t����\0\0�\0\0�����\0\0���t\0\0�\0\0\0�������{���u���\0�������h�����������P\0\0�\0\0�\0\0\0\0�\0\0�\0\0�\0\0\0\0�������{\0\0\0\0\0���i���\0���u������������\0\0�\0\0�\0\0\0\0���u���i��������\0\0�\0\0���i����\0\0/�\0\0\0\0�\0\00�������i���!\0\0^���\"�����О\0\00`���O\0\0\0\00a\0\0/����!\0\0����i\0\0\0\01^���Q���i\0\0�\0\0/`���P\0\0b\0\0\0\0^��ϣ\0\0\0\0/0\0\0/^�����Ο���!���P\0\0�������#'),(6,'2011-06-27 16:20:19','723417e0715e351b1f8dfb44ca9d47a5','\0\0\0?Ȫ0�2�Ͽl�.�o��?Ou���e����s���y����\0\0\0�\0\0�\0\0��������}\0\0����\0\0\0�����\0\0\0�������\0��������\0\0�\0\0���z����\0\0���~\0\0�\0\0��������r����\0\0�\0\0����\0\0\0����\0\0\0����\0\0\0\0\0�������}\0\0\0\0\0�\0\0\0���w�������{��������\0\0\0\0����z\0\0�����\0\0�\0\0���{\0\0�\0\0\0���}\0\0����\0\0����|���~\0\0\0�\0\0\0\0\0����~\0\0����\0����\0\0��������\0��������\0\0\0\0\0�\0\0���~\0\0\0�\0\0�����\0\0�\0\0���y�������y\0\0\0	���x\0\0�\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�����������~\0\0\0\0���q\0\0��������|\0\0����\0\0�������������\0\0���������\0\0\0\0\0\0����\0\0\0�\0\0�\0\0\0'),(7,'2011-06-27 16:16:53','2c2fae970fe09d46a08e3bd663d0c464','\0\0\0?�����-�?a�)�_(�Y��A������\0\0\0	\0\0\0\0\0\0�\0\0\0\0\0���|\0\0\0\0\0���z\0\0����{���}\0\0\0����x\0\0\0\0\0\0\0\0\0\0�������\0���|\0\0��������\0\0\0�����\0\0�\0\0\0�������~���}����\0\0�\0\0�������\0\0\0�\0\0�����\0\0����}����\0\0����\0\0\0\0\0�\0\0�����������������\0\0\0\0\0����\0\0\0����\0\0���z���\0\0�\0\0��������\0\0\0\0\0\0\0�����\0\0	\0\0\0\0\0\0����\0\0\0���r����\0\0���}��������\0\0\0����~����\0\0	���\0����������������\0\0�����\0\0������������\0�������\0\0���{\0\0\0\0\0\0\0����\0\0�\0\0\0����\0\0\0\0���������\0\0\0\0\0\0\0\0\0\0\0���w����\0\0���~\0\0\0�����'),(8,'2011-06-27 15:39:52','8c834a0330d63fd804d5966d2132bf1d','\0\0\0?�/#I�`���\n�m�>�s��Z�^\0\0\0\0����}����\0\0\0�\0\0\0����\0������g\0\0�����\0\0����|\0\0����r\0\0�\0\0����w���z����\0\0����\0����\0\0	���z���r\0\0\0��������\0\0����w���\0\0��������~����\0\0���~�����������}\0\0\0�\0\0����a�������2\0\0;�\0\0����\0\0����v\0\0����y\0\0;�����\0\0�\0\0\0\0\0\0\0�\0\0\0\0w���m�������y\0\0�\0\0\0����\0\0\0\0\0�\0\0����\0\0\0�������\0\0\0\0\0�����\0\0\0�\0\0\0\0\0\0\0\0���t\0\0\0�\0\0�\0\0����b\0\0\0��������\0\0�\0\0�����\0\0\0\0�\0\0�\0\0�\0\0	z\0\0\0����B\0\02\0\0w���\0���q\0\0\0������Á\0\0�\0\0\0\0\0\0\0�\0\0�\0\0�\0\0\0�\0\0����\0\0\0�\0\0�\0\0\0�\0\0\0\0\0\0'),(9,'2011-06-27 16:03:22','90f2915b9c26374327e8b33b1893a480','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������'),(10,'2011-06-27 16:03:22','90f2915b9c26374327e8b33b1893a480','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������'),(11,'2011-06-27 16:03:22','90f2915b9c26374327e8b33b1893a480','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������');
/*!40000 ALTER TABLE `imagehaarmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagehistory`
--

DROP TABLE IF EXISTS `imagehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagehistory` (
  `imageid` int(11) NOT NULL,
  `uuid` varchar(128) DEFAULT NULL,
  `history` longtext,
  PRIMARY KEY (`imageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagehistory`
--

LOCK TABLES `imagehistory` WRITE;
/*!40000 ALTER TABLE `imagehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagehistory` ENABLE KEYS */;
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
INSERT INTO `imageinformation` VALUES (1,-1,'2011-06-05 16:28:34','2011-06-05 16:28:34',1,720,479,'JPG',8,5),(2,-1,'2011-06-05 16:28:34','2011-06-05 16:28:34',1,720,479,'JPG',8,2),(3,-1,'2011-06-27 15:31:45',NULL,0,1538,852,'PNG',8,1),(4,-1,'2011-06-27 15:31:50',NULL,0,802,1916,'PNG',8,4),(5,5,'2011-06-27 16:39:02',NULL,0,2560,2560,'PNG',8,1),(6,-1,'2006-03-11 15:42:12','2006-03-11 15:42:12',1,400,400,'JPG',8,5),(7,-1,'2011-06-27 16:16:53',NULL,0,798,798,'JPG',8,5),(8,-1,'2011-06-18 16:40:36','2011-06-18 16:40:36',0,640,472,'JPG',8,2),(9,-1,'2011-06-05 16:28:34','2011-06-05 16:28:34',1,538,358,'PGF',24,1),(10,-1,'2011-06-05 16:28:34','2011-06-05 16:28:34',1,538,358,'PGF',24,1),(11,-1,'2011-06-05 16:28:34','2011-06-05 16:28:34',1,538,358,'PGF',24,1),(12,-1,'2006-03-11 15:42:12','2006-03-11 15:42:12',1,400,400,'PNG',8,1);
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
INSERT INTO `imagepositions` VALUES (1,'0,0.00000000N',0,'90,0.00000000E',90,200,NULL,NULL,NULL,NULL,NULL);
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
  UNIQUE KEY `imageid` (`imageid`,`property`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageproperties`
--

LOCK TABLES `imageproperties` WRITE;
/*!40000 ALTER TABLE `imageproperties` DISABLE KEYS */;
INSERT INTO `imageproperties` VALUES (1,'country','Forever Iced'),(1,'city','Santa Claus'),(1,'location','North Pole'),(1,'provinceState','Icecream');
/*!40000 ALTER TABLE `imageproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagerelations`
--

DROP TABLE IF EXISTS `imagerelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagerelations` (
  `subject` int(11) DEFAULT NULL,
  `object` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  UNIQUE KEY `subject` (`subject`,`object`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagerelations`
--

LOCK TABLES `imagerelations` WRITE;
/*!40000 ALTER TABLE `imagerelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagerelations` ENABLE KEYS */;
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
  `uniqueHash` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album` (`album`,`name`(255))
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,2,'foto001.jpg',1,1,'2011-06-27 22:29:38',145538,'874f072fa8186c7e555c76c139ec3223'),(2,2,'foto001bw.jpg',1,1,'2011-06-27 15:36:34',105505,'62005ab09158c728652c972600f72b22'),(3,3,'snap001.png',1,1,'2011-06-27 15:31:45',173933,'1b9ef89b5b08b2866196e66435436bbc'),(4,3,'snap002.png',1,1,'2011-06-27 15:31:50',71056,'92f83bf9cd9d363180be2e83913b27a4'),(5,4,'big-image.png',1,1,'2011-06-27 16:39:02',114493,'c528d0080c44b6cadfb5f46202f57af7'),(6,4,'icc-test-farbkreis.jpg',1,1,'2011-06-27 16:20:19',75675,'723417e0715e351b1f8dfb44ca9d47a5'),(7,4,'icc-test-no-profile.jpg',1,1,'2011-06-27 16:16:53',50331,'2c2fae970fe09d46a08e3bd663d0c464'),(8,4,'Martian_face_viking.jpg',1,1,'2011-06-27 15:39:52',99416,'8c834a0330d63fd804d5966d2132bf1d'),(9,5,'foto001q5.pgf',1,1,'2011-06-27 16:03:22',89012,'90f2915b9c26374327e8b33b1893a480'),(10,6,'foto001q5.pgf',1,1,'2011-06-27 16:03:22',89012,'90f2915b9c26374327e8b33b1893a480'),(11,6,'otherlink.pgf',1,1,'2011-06-27 16:03:22',89012,'90f2915b9c26374327e8b33b1893a480'),(12,4,'icc-test-farbkreis_v1.png',1,1,'2011-06-27 23:06:01',107932,'49fc239f8d5cf5c4d256ae6bb098aee4');
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
                        DELETE FROM ImageTags          WHERE imageid=OLD.id;
                        DELETE From ImageHaarMatrix    WHERE imageid=OLD.id;
                        DELETE From ImageInformation   WHERE imageid=OLD.id;
                        DELETE From ImageMetadata      WHERE imageid=OLD.id;
                        DELETE From ImagePositions     WHERE imageid=OLD.id;
                        DELETE From ImageComments      WHERE imageid=OLD.id;
                        DELETE From ImageCopyright     WHERE imageid=OLD.id;
                        DELETE From ImageProperties    WHERE imageid=OLD.id;
                        DELETE From ImageHistory       WHERE imageid=OLD.id;
                        DELETE FROM ImageRelations     WHERE subject=OLD.id OR object=OLD.id;
                        DELETE FROM ImageTagProperties WHERE imageid=OLD.id;
                        UPDATE Albums SET icon=null    WHERE icon=OLD.id;
                        UPDATE Tags SET icon=null      WHERE icon=OLD.id;
                    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `imagetagproperties`
--

DROP TABLE IF EXISTS `imagetagproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetagproperties` (
  `imageid` int(11) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL,
  `property` text,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetagproperties`
--

LOCK TABLES `imagetagproperties` WRITE;
/*!40000 ALTER TABLE `imagetagproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetagproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetags`
--

DROP TABLE IF EXISTS `imagetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetags` (
  `imageid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  UNIQUE KEY `imageid` (`imageid`,`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetags`
--

LOCK TABLES `imagetags` WRITE;
/*!40000 ALTER TABLE `imagetags` DISABLE KEYS */;
INSERT INTO `imagetags` VALUES (1,24),(3,11),(3,12),(3,13),(3,16),(3,17),(3,19),(3,26),(3,36),(4,14),(4,21),(4,23),(4,26),(4,36),(5,31),(5,39),(8,40);
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
  UNIQUE KEY `keyword` (`keyword`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('preAlpha010Update1','true'),('preAlpha010Update2','true'),('preAlpha010Update3','true'),('beta010Update1','true'),('beta010Update2','true'),('uniqueHashVersion','2'),('databaseImageFormats','jpg;jpeg;jpe;jp2;j2k;jpx;jpc;pgx;tif;tiff;png;xpm;ppm;pnm;pgf;gif;bmp;xcf;pcx;bay;bmq;cr2;crw;cs1;dc2;dcr;dng;erf;fff;hdr;k25;kdc;mdc;mos;mrw;nef;orf;pef;pxn;raf;raw;rdc;sr2;srf;x3f;arw;3fr;cine;ia;kc2;mef;nrw;qtk;rw2;sti;rwl;srw;'),('databaseVideoFormats','mpeg;mpg;mpo;mpe;avi;mov;wmf;asf;mp4;3gp;wmv'),('databaseAudioFormats','ogg;mp3;wma;wav'),('FilterSettingsVersion','3'),('DcrawFilterSettingsVersion','4'),('DBVersion','6'),('DBVersionRequired','6');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagproperties`
--

DROP TABLE IF EXISTS `tagproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagproperties` (
  `tagid` int(11) DEFAULT NULL,
  `property` text,
  `value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagproperties`
--

LOCK TABLES `tagproperties` WRITE;
/*!40000 ALTER TABLE `tagproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagproperties` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (0,-1,'_Digikam_root_tag_',0,NULL,1,82),(1,0,'_Digikam_Internal_Tags_',0,NULL,40,81),(2,1,'Need Resolving History',0,NULL,79,80),(3,1,'Need Tagging History Graph',0,NULL,77,78),(4,0,'People',0,NULL,34,39),(5,4,'Unknown',0,NULL,37,38),(6,1,'Original Version',0,NULL,75,76),(7,1,'Intermediate Version',0,NULL,73,74),(8,1,'Current Version',0,NULL,71,72),(9,1,'Version Always Visible',0,NULL,69,70),(10,0,'tagl0a',0,NULL,14,33),(11,10,'tagl1a',0,NULL,31,32),(12,10,'tagl1b',0,NULL,17,30),(13,10,'tagl1c',0,NULL,15,16),(14,12,'tagl2a',0,NULL,28,29),(15,12,'tagl2b',0,NULL,22,27),(16,12,'tagl2c',0,NULL,20,21),(17,12,'tagl2d',0,NULL,18,19),(18,15,'tagl3a',0,NULL,25,26),(19,15,'tagl3b',0,NULL,23,24),(20,0,'tl0',0,NULL,2,13),(21,20,'tl0a',0,NULL,7,12),(22,20,'tl0b',0,NULL,5,6),(23,21,'tl0a0',0,NULL,10,11),(24,21,'tl0a1',0,NULL,8,9),(25,20,'tagl1c',0,NULL,3,4),(26,1,'Color Label None',0,NULL,67,68),(27,1,'Color Label Red',0,NULL,65,66),(28,1,'Color Label Orange',0,NULL,63,64),(29,1,'Color Label Yellow',0,NULL,61,62),(30,1,'Color Label Green',0,NULL,59,60),(31,1,'Color Label Blue',0,NULL,57,58),(32,1,'Color Label Magenta',0,NULL,55,56),(33,1,'Color Label Gray',0,NULL,53,54),(34,1,'Color Label Black',0,NULL,51,52),(35,1,'Color Label White',0,NULL,49,50),(36,1,'Pick Label None',0,NULL,47,48),(37,1,'Pick Label Rejected',0,NULL,45,46),(38,1,'Pick Label Pending',0,NULL,43,44),(39,1,'Pick Label Accepted',0,NULL,41,42),(40,4,'LadyMars',0,NULL,35,36);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`digikam`@`%`*/ /*!50003 TRIGGER delete_tag AFTER DELETE ON Tags
            FOR EACH ROW BEGIN
                DELETE FROM ImageTags          WHERE tagid=OLD.id;
                DELETE FROM TagProperties      WHERE tagid=OLD.id;
                DELETE FROM ImageTagProperties WHERE tagid=OLD.id;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'digikam'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_index_if_not_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`digikam`@`%`*/ /*!50003 PROCEDURE `create_index_if_not_exists`(table_name_vc varchar(50), index_name_vc varchar(50), field_list_vc varchar(1024))
    SQL SECURITY INVOKER
BEGIN

                set @Index_cnt = (
                    SELECT COUNT(1) cnt
                    FROM INFORMATION_SCHEMA.STATISTICS
                    WHERE CONVERT(table_name USING latin1) = CONVERT(table_name_vc USING latin1)
                      AND CONVERT(index_name USING latin1) = CONVERT(index_name_vc USING latin1)
                );

                IF IFNULL(@Index_cnt, 0) = 0 THEN
                    set @index_sql = CONCAT( 
                        CONVERT( 'ALTER TABLE ' USING latin1),
                        CONVERT( table_name_vc USING latin1),
                        CONVERT( ' ADD INDEX ' USING latin1),
                        CONVERT( index_name_vc USING latin1),
                        CONVERT( '(' USING latin1),
                        CONVERT( field_list_vc USING latin1),
                        CONVERT( ');' USING latin1)
                    );
                    PREPARE stmt FROM @index_sql;
                    EXECUTE stmt;
                    DEALLOCATE PREPARE stmt;
                END IF;
                END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-27 23:14:47
