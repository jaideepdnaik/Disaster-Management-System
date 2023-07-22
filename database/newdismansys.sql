-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dismansys
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affected_person`
--

DROP TABLE IF EXISTS `affected_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affected_person` (
  `AP_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(45) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `DIS_ID` int DEFAULT NULL,
  `REQUEST_STATUS` varchar(45) DEFAULT 'NOT_REQUESTED',
  PRIMARY KEY (`AP_ID`),
  KEY `DIS_ID_idx` (`DIS_ID`),
  CONSTRAINT `DIS_ID` FOREIGN KEY (`DIS_ID`) REFERENCES `disaster` (`DIS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affected_person`
--

LOCK TABLES `affected_person` WRITE;
/*!40000 ALTER TABLE `affected_person` DISABLE KEYS */;
INSERT INTO `affected_person` VALUES (1,'Noothan','Male','Shimoga','9108019265','hello',2,'GRANTED'),(2,'Rohit','Male','Karwar','7019773244','world',1,'GRANTED'),(3,'Shashank','Male','Hassan','7019773244','helloworld',3,'GRANTED'),(4,'sandeep','male','ullala','7418529631','hello',3,'NOT_REQUESTED'),(5,'Shabban','Male','Mangaluru','7418529631','shabaan',3,'NOT_REQUESTED'),(6,'SHASHANK','MALE','HASSAN','7418529631','SHASHANK',3,'REQUESTED');
/*!40000 ALTER TABLE `affected_person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `affected_person_BEFORE_INSERT` BEFORE INSERT ON `affected_person` FOR EACH ROW BEGIN
 IF LENGTH(NEW.password) < 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must be at least 5 characters.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `disaster`
--

DROP TABLE IF EXISTS `disaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disaster` (
  `DIS_ID` int NOT NULL AUTO_INCREMENT,
  `DIS_NAME` varchar(45) DEFAULT NULL,
  `NO_OF_PEOPLE_AFF` int DEFAULT NULL,
  `LOCATION` varchar(45) DEFAULT NULL,
  `NO_PEOPLE_RESCUED` int DEFAULT NULL,
  `NEEDS_ID` int DEFAULT NULL,
  PRIMARY KEY (`DIS_ID`),
  KEY `NEEDS_ID_idx` (`NEEDS_ID`),
  CONSTRAINT `NEEDS_ID` FOREIGN KEY (`NEEDS_ID`) REFERENCES `needs` (`NEEDS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disaster`
--

LOCK TABLES `disaster` WRITE;
/*!40000 ALTER TABLE `disaster` DISABLE KEYS */;
INSERT INTO `disaster` VALUES (1,'Flood',13,'Mangalore',2,1),(2,'Earthquake',20,'Coorg',20,5),(3,'Landslide',45,'Surathkal',40,3),(4,'Flood ',27,'Manglore',20,4);
/*!40000 ALTER TABLE `disaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `DONOR_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `TYPE_OF_NEED` varchar(45) DEFAULT NULL,
  `QUANTITY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DONOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (1,'Kaushik','Male','7019773244','Food','3'),(2,'Jaideep','Male','9108019265','Water','2'),(3,'Adhithya','Male','9611303265','Clothing','1'),(7,'shabaan','male','7418529635','Clothing','12');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donor_BEFORE_INSERT` BEFORE INSERT ON `donor` FOR EACH ROW BEGIN
IF LENGTH(NEW.phone) != 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone Number Must Have 10 Digits';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `USERNAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('shashank','shashank'),('jaideep','jaideep'),('admin','admin'),('sanketh','tiger');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `login_BEFORE_INSERT` BEFORE INSERT ON `login` FOR EACH ROW BEGIN
 IF LENGTH(NEW.password) < 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password must be at least 5 characters.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `needs`
--

DROP TABLE IF EXISTS `needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `needs` (
  `NEEDS_ID` int NOT NULL AUTO_INCREMENT,
  `TYPE_OF_NEED` varchar(45) DEFAULT NULL,
  `QUANTITY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NEEDS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `needs`
--

LOCK TABLES `needs` WRITE;
/*!40000 ALTER TABLE `needs` DISABLE KEYS */;
INSERT INTO `needs` VALUES (1,'Food','2'),(2,'Shelter','4'),(3,'Clothing','5'),(4,'Water','3'),(5,'Financial Support','1000'),(6,'Clothing','2'),(7,'Shelter','3');
/*!40000 ALTER TABLE `needs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_needs`
--

DROP TABLE IF EXISTS `request_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_needs` (
  `AP_ID` int DEFAULT NULL,
  `FOOD_QUANTITY` varchar(45) DEFAULT NULL,
  `FINANCIAL` varchar(45) DEFAULT NULL,
  `SHELTER` varchar(45) DEFAULT NULL,
  KEY `AP_ID_idx` (`AP_ID`),
  CONSTRAINT `AP_ID` FOREIGN KEY (`AP_ID`) REFERENCES `affected_person` (`AP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_needs`
--

LOCK TABLES `request_needs` WRITE;
/*!40000 ALTER TABLE `request_needs` DISABLE KEYS */;
INSERT INTO `request_needs` VALUES (3,'Granted','Granted','Granted'),(1,'Granted','Granted','Granted'),(1,'Granted','Granted','Granted'),(6,'2','1000','Yes'),(1,'Granted','Granted','Granted'),(2,'Granted','Granted','Granted');
/*!40000 ALTER TABLE `request_needs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_needs_BEFORE_INSERT` BEFORE INSERT ON `request_needs` FOR EACH ROW BEGIN
IF( new.shelter='YES' || new.shelter='NO' ) then
	UPDATE AFFECTED_PERSON SET REQUEST_STATUS='REQUESTED' WHERE AP_ID=NEW.AP_ID;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_needs_AFTER_UPDATE` AFTER UPDATE ON `request_needs` FOR EACH ROW BEGIN
	IF(new.FOOD_QUANTITY='Granted' && new.financial='Granted' && new.shelter='Granted') then
	UPDATE AFFECTED_PERSON SET REQUEST_STATUS='GRANTED' WHERE AP_ID=NEW.AP_ID;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rescue_team`
--

DROP TABLE IF EXISTS `rescue_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rescue_team` (
  `RT_ID` int NOT NULL AUTO_INCREMENT,
  `RT_NAME` varchar(45) DEFAULT NULL,
  `BASE_LOCATION` varchar(45) DEFAULT NULL,
  `NO_OF_PEOPLE` int DEFAULT NULL,
  PRIMARY KEY (`RT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rescue_team`
--

LOCK TABLES `rescue_team` WRITE;
/*!40000 ALTER TABLE `rescue_team` DISABLE KEYS */;
INSERT INTO `rescue_team` VALUES (1,'Rotary','Mangalore',16),(2,'Lions Club','Mysore',55),(3,'Zeus','Puttur',22),(4,'Saphire','Kudla',33),(5,'Ruby','Bangalore',22),(6,'rotary','ullala',17),(7,'Rotaty Club','Mangaluru',17),(8,'BHANDARY CLUB','MANGALURU',17),(9,'lions club','mangaluru',17);
/*!40000 ALTER TABLE `rescue_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `VOL_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(45) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `RT_ID` int DEFAULT NULL,
  PRIMARY KEY (`VOL_ID`),
  KEY `RT_ID_idx` (`RT_ID`),
  CONSTRAINT `RT_ID` FOREIGN KEY (`RT_ID`) REFERENCES `rescue_team` (`RT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (3,'Jaideep','Male','hassan','7418524561',7),(4,'Shashank B','Male','Hassan','9234567910',4),(5,'Shabaan','Male','Ullala','8524561234',2),(6,'saadya','Female','bellare','7418529632',4),(7,'saanidi','Male','ullala','7418529631',5),(9,'Shankar','Male','Mysore','8529631471',7);
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `volunteer_BEFORE_INSERT` BEFORE INSERT ON `volunteer` FOR EACH ROW BEGIN
IF LENGTH(NEW.phone) != 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone Number Must Contain 10 Digits';
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

-- Dump completed on 2023-01-31 13:18:37
