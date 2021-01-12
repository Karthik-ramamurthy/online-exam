-- MySQL dump 10.13  Distrib 5.7.29, for osx10.15 (x86_64)
--
-- Host: localhost    Database: ExamDB
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(50) NOT NULL,
  `text` varchar(200) NOT NULL,
  `is_answer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,10,'MODI',1),(2,10,'singh',0),(3,10,'shah',0),(4,10,'rahul',0),(5,11,'MODI',1),(6,11,'singh',0),(7,11,'shah',0),(8,11,'rahul',0),(9,13,'MODI',1),(10,13,'singh',0),(11,13,'shah',0),(12,13,'rahul',0),(13,15,'MODI',1),(14,15,'singh',0),(15,15,'shah',0),(16,15,'rahul',0),(17,16,'MODI',1),(18,16,'singh',0),(19,16,'shah',0),(20,16,'rahul',0),(21,17,'MODI',1),(22,17,'singh',0),(23,17,'shah',0),(24,17,'rahul',0),(25,18,'MODI',0),(26,18,'singh',1),(27,18,'shah',0),(28,18,'rahul',0),(33,22,'TN',0),(34,22,'Assam',0),(35,22,'Ap',0),(36,22,'KN',0),(37,23,'TN',0),(38,23,'Assam',0),(39,23,'AP',0),(40,23,'KN',1),(45,25,'TN',0),(46,25,'Ap',0),(47,25,'KN',0),(48,25,'MP',1),(49,26,'KN',0),(50,26,'TN',0),(51,26,'Ap',0),(52,26,'YS',1),(53,27,'KN',0),(54,27,'KA',1),(55,27,'TN',0),(56,27,'AP',0),(57,32,'KN',0),(58,32,'KA',0),(59,32,'PY',0),(60,32,'TN',1),(61,33,'AP',0),(62,33,'PU',0),(63,33,'PY',0),(64,33,'TN',1),(65,34,'KA',0),(66,34,'PU',0),(67,34,'PY',0),(68,34,'IY',1),(69,35,'KI',0),(70,35,'Yu',0),(71,35,'io',0),(72,35,'op',1),(73,36,'io',0),(74,36,'ui',0),(75,36,'ty',0),(76,36,'yu',1),(77,37,'io',0),(78,37,'ui',0),(79,37,'ty',0),(80,37,'rt',1),(81,38,'ui',0),(82,38,'op',0),(83,38,'ty',0),(84,38,'io',1),(85,39,'op',0),(86,39,'ui',0),(87,39,'yu',0),(88,39,'po',0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'who is PM'),(2,'who is PM'),(3,'who is PM'),(4,'who is PM'),(5,'who is PM'),(6,'who is PM'),(7,'who is PM'),(8,'who is PM'),(9,'who is PM'),(10,'who is PM'),(11,'who is PM'),(12,'who is PM'),(13,'who is PM'),(14,'who is PM'),(15,'who is PM'),(16,'who is PM'),(17,'who is PM'),(18,'who is FM'),(19,'Kalgoorlie and Coolgardie'),(20,'Kalgoorlie and Coolgardie'),(21,'Tadoba national park'),(22,'Tadoba national park '),(23,'national park'),(24,'park'),(25,'nation'),(26,'school'),(27,'Animal sanctuary'),(28,'Animal sanctuary 2'),(29,'Sanctuary 3'),(30,'SANCT2'),(31,'SANCT3'),(32,'SANCT 3'),(33,'SANCT 4'),(34,'SANCT 5'),(35,'SANCT 6'),(36,'sanct 7'),(37,'Sanct 8'),(38,'sanct 9'),(39,'sanct 10');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` int(50) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'karthik','k','karthik@gmail.com','karthik',1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `created_by` int(50) NOT NULL,
  `status` varchar(50) DEFAULT 'progress',
  PRIMARY KEY (`test_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (2,'science','1:00',1,'publish'),(3,'geography','0:45',1,'publish'),(4,'maths','0:45',1,'publish'),(5,'maths 2','0:45',1,'publish'),(6,'maths 3','0:46',1,'progress');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_question`
--

DROP TABLE IF EXISTS `test_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(50) NOT NULL,
  `test_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `test_question_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `test_question_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_question`
--

LOCK TABLES `test_question` WRITE;
/*!40000 ALTER TABLE `test_question` DISABLE KEYS */;
INSERT INTO `test_question` VALUES (2,16,2),(3,17,3),(4,18,3),(5,19,2),(6,20,2),(7,21,2),(8,22,2),(9,23,2),(10,24,2),(11,25,2),(12,26,2),(13,27,2),(14,28,2),(15,29,2),(16,30,2),(17,31,2),(18,32,2),(19,33,2),(20,34,2),(21,35,2),(22,36,2),(23,37,2),(24,38,2),(25,39,2);
/*!40000 ALTER TABLE `test_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 19:48:01
