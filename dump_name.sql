-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `Foot`
--

DROP TABLE IF EXISTS `Foot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Foot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Foot`
--

LOCK TABLES `Foot` WRITE;
/*!40000 ALTER TABLE `Foot` DISABLE KEYS */;
INSERT INTO `Foot` VALUES (4,'пицца',1);
/*!40000 ALTER TABLE `Foot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Going`
--

DROP TABLE IF EXISTS `Going`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Going` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `finish` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `count_max` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `creater_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Going`
--

LOCK TABLES `Going` WRITE;
/*!40000 ALTER TABLE `Going` DISABLE KEYS */;
INSERT INTO `Going` VALUES (1,'111','brbrr',11,11,2,'rbr',11,1,6,1),(2,'Фильм \"Мы\"','для любителей фильмов ужасов',19,20,10,'Фильмы',5,1,1,1),(3,'Пицца Лисица','Пошли обедать',13,14,9,'пицца',2,1,1,1);
/*!40000 ALTER TABLE `Going` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interes`
--

DROP TABLE IF EXISTS `Interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Interes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interes`
--

LOCK TABLES `Interes` WRITE;
/*!40000 ALTER TABLE `Interes` DISABLE KEYS */;
INSERT INTO `Interes` VALUES (31,'aaa',1),(32,'cps',1);
/*!40000 ALTER TABLE `Interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ivents`
--

DROP TABLE IF EXISTS `Ivents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ivents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ivents`
--

LOCK TABLES `Ivents` WRITE;
/*!40000 ALTER TABLE `Ivents` DISABLE KEYS */;
INSERT INTO `Ivents` VALUES (22,'аниме',3),(34,'кино',1),(35,'театр',1),(36,'боулинг',1),(37,'бильярд',1),(38,'океан',2),(39,'полюса',2),(40,'рыба',2),(41,'кино',2),(44,'кино',4),(45,'боулинг',4),(46,'витебск',5),(47,'кино',5),(48,'кальян',5),(49,'театр',1),(51,'777',4);
/*!40000 ALTER TABLE `Ivents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `adressant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (1,'qwvebe','bedbre ',1,1),(2,'rogijrg0ij','frpibjribrb\r\n',1,1);
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `profi` varchar(120) DEFAULT NULL,
  `avatar` varchar(120) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `login` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'serz','сивков','DQ','1474011210_15.jpg','password','sivkov.s@profitero.com'),(2,'morz',NULL,NULL,NULL,'password','email'),(3,'oleg',NULL,NULL,NULL,'password','email'),(4,'Igor',NULL,NULL,NULL,'password','halushka.i@profitero.com'),(5,'Dima',NULL,NULL,NULL,'password','shamritskiy3468@gmail.com'),(6,'Ваше имя','Ваша фамилия','Ваша должность','default.jpg','password','test@profitero.com');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goings_people`
--

DROP TABLE IF EXISTS `goings_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goings_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_going` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goings_people`
--

LOCK TABLES `goings_people` WRITE;
/*!40000 ALTER TABLE `goings_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `goings_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'text','testааа','2019-03-29 08:34:18');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-31 14:15:30
