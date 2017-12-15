-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dbo
-- ------------------------------------------------------
-- Server version	5.7.20-ndb-7.5.8-cluster-gpl

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `doctorsID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  KEY `patientID` (`patientID`),
  KEY `doctorsID` (`doctorsID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`doctorsID`) REFERENCES `doctors` (`doctorsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'askdflsadj','234','Old City','NY','111111',5,NULL),(2,'askdflsadj','234','Old City','NY','111111',NULL,NULL),(3,'askdflsadj','234','Old City','NY','111111',6,NULL),(4,'askdflsadj','234','Old City','NY','111111',7,NULL),(5,'askdflsadj','234','Old City','NY','111111',8,NULL),(6,'askdflsadj','234','Old City','NY','111111',9,NULL),(7,'askdflsadj','234','Old City','NY','111111',10,NULL),(8,'askdflsadj','234','Old City','NY','111111',NULL,2),(9,'askdflsadj','234','Old City','NY','111111',NULL,3),(10,'askdflsadj','234','Old City','NY','111111',NULL,4),(11,'askdflsadj','234','Old City','NY','111111',NULL,5),(12,'askdflsadj','234','Old City','NY','111111',11,NULL),(13,'askdflsadj','234','Old City','NY','111111',12,NULL),(14,'askdflsadj','234','Old City','NY','111111',13,NULL),(15,'askdflsadj','234','Old City','NY','111111',14,NULL),(16,'askdflsadj','234','Old City','NY','111111',15,NULL),(17,'askdflsadj','234','Old City','NY','111111',16,NULL),(18,'askdflsadj','234','Old City','NY','111111',17,NULL),(19,'askdflsadj','234','Old City','NY','111111',18,NULL),(20,'askdflsadj','234','Old City','NY','111111',19,NULL),(21,'askdflsadj','234','Old City','NY','111111',0,NULL),(22,'askdflsadj','234','Old City','NY','111111',0,NULL),(23,'k','k','k','k','k',1,NULL),(24,'askdflsadj','234','Old City','NY','111111',2,NULL),(25,'askdflsadj','234','Old City','NY','111111',3,NULL),(26,'askdflsadj','234','Old City','NY','111111',4,NULL),(27,'askdflsadj','234','Old City','NY','111111',5,NULL),(28,'askdflsadj','234','Old City','NY','111111',6,NULL),(29,'askdflsadj','234','Old City','NY','111111',7,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bridge_diag`
--

DROP TABLE IF EXISTS `bridge_diag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bridge_diag` (
  `diagID` int(11) NOT NULL AUTO_INCREMENT,
  `diagDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`diagID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `bridge_diag_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bridge_diag`
--

LOCK TABLES `bridge_diag` WRITE;
/*!40000 ALTER TABLE `bridge_diag` DISABLE KEYS */;
INSERT INTO `bridge_diag` VALUES (1,'2017-12-11 05:00:00',2),(2,'2017-12-11 05:00:00',3),(3,'2017-12-11 05:00:00',4),(4,'2017-12-12 05:00:00',5);
/*!40000 ALTER TABLE `bridge_diag` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dbo`.`bridge_diag_AFTER_INSERT` AFTER INSERT ON `bridge_diag` FOR EACH ROW
BEGIN

  insert into nonTreatable (diagID, nonTreatableID) values (new.diagID, null);
  
  insert into treatable (diagID, treatableID) values (new.diagID, null);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `doctorsID` int(11) NOT NULL AUTO_INCREMENT,
  `d_fname` varchar(20) NOT NULL,
  `d_lname` varchar(20) NOT NULL,
  `practiceNum` varchar(20) NOT NULL,
  `specialty` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`doctorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'k','k','k','k','k','k'),(2,'new','The newest aqwee','1990302','special','Email@email.com','123456789'),(3,'new','The newest aqwee','1990302','special','Email@email.com','123456789'),(4,'new','The newest aqwee','1990302','special','Email@email.com','123456789'),(5,'new','The newest aqwee','1990302','special','Email@email.com','123456789'),(6,'new','The newest aqwee','1990302','special','Email@email.com','123456789'),(7,'new','The newest aqwee','1990302','special','Email@email.com','123456789');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger doctor_after_ins_trig after insert on doctors
for each row
begin
  insert into address (addressID, doctorsID) values (null, new.doctorsID);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `doctors_vu`
--

DROP TABLE IF EXISTS `doctors_vu`;
/*!50001 DROP VIEW IF EXISTS `doctors_vu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `doctors_vu` AS SELECT 
 1 AS `doctorsID`,
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Practice_Number`,
 1 AS `Specialty`,
 1 AS `Email`,
 1 AS `Phone`,
 1 AS `Street_Address`,
 1 AS `Apartment_Num`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Zip_Code`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `full_vu`
--

DROP TABLE IF EXISTS `full_vu`;
/*!50001 DROP VIEW IF EXISTS `full_vu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `full_vu` AS SELECT 
 1 AS `Dr_ID`,
 1 AS `Dr_First_Name`,
 1 AS `Dr_Last_Name`,
 1 AS `Practice_Number`,
 1 AS `Specialty`,
 1 AS `Email`,
 1 AS `Phone`,
 1 AS `Dr_Address1`,
 1 AS `Dr_APT_Num`,
 1 AS `Dr_City`,
 1 AS `Dr_State`,
 1 AS `Dr_Zip`,
 1 AS `patientID`,
 1 AS `doctorsID`,
 1 AS `Patient First Name`,
 1 AS `Patient Last Name`,
 1 AS `DOB`,
 1 AS `Street_Address`,
 1 AS `Apartment_Num`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Zip_Code`,
 1 AS `Diagnosis_Date`,
 1 AS `hepatitis`,
 1 AS `hsv1`,
 1 AS `hsv2`,
 1 AS `hiv`,
 1 AS `aids`,
 1 AS `hltv`,
 1 AS `hpv`,
 1 AS `molluscum_contag`,
 1 AS `zika`,
 1 AS `chlamydia`,
 1 AS `gonorrhea`,
 1 AS `syphilis`,
 1 AS `trich`,
 1 AS `crabs`,
 1 AS `scabies`,
 1 AS `bv_yeast`,
 1 AS `chancroid`,
 1 AS `donovanosis`,
 1 AS `genital_warts`,
 1 AS `pid`,
 1 AS `ngu`,
 1 AS `inetst_parasites`,
 1 AS `mycoplasma`,
 1 AS `lgv`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nonTreatable`
--

DROP TABLE IF EXISTS `nonTreatable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonTreatable` (
  `diagID` int(11) DEFAULT NULL,
  `nonTreatableID` int(11) NOT NULL AUTO_INCREMENT,
  `hepatitis` tinyint(1) NOT NULL DEFAULT '0',
  `hsv1` tinyint(1) NOT NULL DEFAULT '0',
  `hsv2` tinyint(1) NOT NULL DEFAULT '0',
  `hiv` tinyint(1) NOT NULL DEFAULT '0',
  `aids` tinyint(1) NOT NULL DEFAULT '0',
  `hltv` tinyint(1) NOT NULL DEFAULT '0',
  `hpv` tinyint(1) NOT NULL DEFAULT '0',
  `molluscum_contag` tinyint(1) NOT NULL DEFAULT '0',
  `zika` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nonTreatableID`),
  KEY `diagID` (`diagID`),
  CONSTRAINT `nontreatable_ibfk_1` FOREIGN KEY (`diagID`) REFERENCES `bridge_diag` (`diagID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonTreatable`
--

LOCK TABLES `nonTreatable` WRITE;
/*!40000 ALTER TABLE `nonTreatable` DISABLE KEYS */;
INSERT INTO `nonTreatable` VALUES (1,1,0,0,0,0,0,0,0,0,0),(2,2,0,0,0,0,0,0,0,0,0),(3,3,0,0,0,0,0,0,0,0,0),(4,4,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `nonTreatable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_vu`
--

DROP TABLE IF EXISTS `patient_vu`;
/*!50001 DROP VIEW IF EXISTS `patient_vu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `patient_vu` AS SELECT 
 1 AS `patientID`,
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `DOB`,
 1 AS `doctorsID`,
 1 AS `Street_Address`,
 1 AS `Apartment_Num`,
 1 AS `City`,
 1 AS `State`,
 1 AS `Zip_Code`,
 1 AS `Diagnosis_Date`,
 1 AS `hepatitis`,
 1 AS `hsv1`,
 1 AS `hsv2`,
 1 AS `hiv`,
 1 AS `aids`,
 1 AS `hltv`,
 1 AS `hpv`,
 1 AS `molluscum_contag`,
 1 AS `zika`,
 1 AS `chlamydia`,
 1 AS `gonorrhea`,
 1 AS `syphilis`,
 1 AS `trich`,
 1 AS `crabs`,
 1 AS `scabies`,
 1 AS `bv_yeast`,
 1 AS `chancroid`,
 1 AS `donovanosis`,
 1 AS `genital_warts`,
 1 AS `pid`,
 1 AS `ngu`,
 1 AS `inetst_parasites`,
 1 AS `mycoplasma`,
 1 AS `lgv`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `doctorsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  KEY `doctorsID_idx` (`doctorsID`),
  CONSTRAINT `doctorsID` FOREIGN KEY (`doctorsID`) REFERENCES `doctors` (`doctorsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (2,'asdfjal','aslasdf','1992-03-02',10),(3,'Hello World','sss','1992-03-02',10),(4,'new and latest','aslasdf','1992-03-02',10),(5,'new and latest','aslasdf','1992-03-02',10);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dbo`.`patients_AFTER_INSERT` AFTER INSERT ON `patients` FOR EACH ROW
BEGIN

  insert into address (addressID, patientID) values (null, new.patientID);
  
  
  insert into bridge_diag (diagID, diagDate ,patientID) values (null, curdate() , new.patientID);


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treatable`
--

DROP TABLE IF EXISTS `treatable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatable` (
  `diagID` int(11) DEFAULT NULL,
  `treatableID` int(11) NOT NULL AUTO_INCREMENT,
  `chlamydia` tinyint(1) NOT NULL DEFAULT '0',
  `gonorrhea` tinyint(1) NOT NULL DEFAULT '0',
  `syphilis` tinyint(1) NOT NULL DEFAULT '0',
  `trich` tinyint(1) NOT NULL DEFAULT '0',
  `crabs` tinyint(1) NOT NULL DEFAULT '0',
  `scabies` tinyint(1) NOT NULL DEFAULT '0',
  `bv_yeast` tinyint(1) NOT NULL DEFAULT '0',
  `chancroid` tinyint(1) NOT NULL DEFAULT '0',
  `donovanosis` tinyint(1) NOT NULL DEFAULT '0',
  `genital_warts` tinyint(1) NOT NULL DEFAULT '0',
  `pid` tinyint(1) NOT NULL DEFAULT '0',
  `ngu` tinyint(1) NOT NULL DEFAULT '0',
  `inetst_parasites` tinyint(1) NOT NULL DEFAULT '0',
  `mycoplasma` tinyint(1) NOT NULL DEFAULT '0',
  `lgv` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`treatableID`),
  KEY `diagID` (`diagID`),
  CONSTRAINT `treatable_ibfk_1` FOREIGN KEY (`diagID`) REFERENCES `bridge_diag` (`diagID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatable`
--

LOCK TABLES `treatable` WRITE;
/*!40000 ALTER TABLE `treatable` DISABLE KEYS */;
INSERT INTO `treatable` VALUES (1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `treatable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbo'
--

--
-- Dumping routines for database 'dbo'
--
/*!50003 DROP PROCEDURE IF EXISTS `all_patients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_patients`()
    COMMENT 'Search for a doctor'
BEGIN
SELECT 
	d.doctorsID 'Dr_ID',
	d.First_Name 'Dr_First_Name',
    d.Last_Name 'Dr_Last_Name',
    d.Practice_Number,
    d.Specialty,
    d.Email,
    d.Phone,
    d.Street_Address 'Dr_Address1',
    d.Apartment_Num 'Dr_APT_Num',
    d.City 'Dr_City',
    d.State 'Dr_State',
    d.Zip_Code 'Dr_Zip', 
    p.patientID,
    p.doctorsID,
    p.First_Name'Patient First Name',
    p.Last_Name 'Patient Last Name',
    p.DOB,
    p.Street_Address,
    p.Apartment_Num,
    p.City,
    p.State,
    p.Zip_Code,
    p.Diagnosis_Date,
    p.hepatitis,
    p.hsv1,
    p.hsv2,
    p.hiv,
    p.aids,
    p.hltv,
    p.hpv,
    p.molluscum_contag,
    p.zika,
    p.chlamydia,
    p.gonorrhea,
    p.syphilis,
    p.trich,
    p.crabs,
    p.scabies,
    p.bv_yeast,
    p.chancroid,
    p.donovanosis,
    p.genital_warts,
    p.pid,
    p.ngu,
    p.inetst_parasites,
    p.mycoplasma,
    p.lgv
FROM doctors_vu d , patient_vu p
WHERE d.doctorsID = p.doctorsID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_dr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_dr`(IN dr_id int(11))
    COMMENT 'Search for a doctor'
BEGIN
SELECT *
FROM doctors_vu
WHERE doctorsID = dr_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_patient`(IN LastName varchar(25), IN p_id varchar(25))
BEGIN

		SELECT *
        FROM patient_vu
		where patientID = p_id
        OR last_name = LASTNAME;


      
	IF p_id IS NULL THEN
    
		SELECT *
        FROM patient_vu
        WHERE last_name = LASTNAME;
    

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_patient_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_patient_profile`(IN p_id int(11))
    COMMENT 'Search for a doctor'
BEGIN
SELECT 
	d.doctorsID 'Dr_ID',
	d.First_Name 'Dr_First_Name',
    d.Last_Name 'Dr_Last_Name',
    d.Practice_Number,
    d.Specialty,
    d.Email,
    d.Phone,
    d.Street_Address 'Dr_Address1',
    d.Apartment_Num 'Dr_APT_Num',
    d.City 'Dr_City',
    d.State 'Dr_State',
    d.Zip_Code 'Dr_Zip', 
    p.patientID,
    p.doctorsID,
    p.First_Name'Patient First Name',
    p.Last_Name 'Patient Last Name',
    p.DOB,
    p.Street_Address,
    p.Apartment_Num,
    p.City,
    p.State,
    p.Zip_Code,
    p.Diagnosis_Date,
    p.hepatitis,
    p.hsv1,
    p.hsv2,
    p.hiv,
    p.aids,
    p.hltv,
    p.hpv,
    p.molluscum_contag,
    p.zika,
    p.chlamydia,
    p.gonorrhea,
    p.syphilis,
    p.trich,
    p.crabs,
    p.scabies,
    p.bv_yeast,
    p.chancroid,
    p.donovanosis,
    p.genital_warts,
    p.pid,
    p.ngu,
    p.inetst_parasites,
    p.mycoplasma,
    p.lgv
FROM doctors_vu d , patient_vu p
WHERE d.doctorsID = p.doctorsID
and patientID = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_doctor`(
		IN docFirstName varchar(20),
      IN docLastName varchar(20),
      IN docPractice varchar(20), 
      IN docSpecialty varchar(20),
      IN docEmail varchar(20),
      IN docPhone varchar(20),
      IN Street_Address varchar(20),
      IN Apartment_Num varchar(20),
      IN City varchar(20),
      IN State varchar(20),
      IN Zip_Code  varchar(20)
      )
BEGIN
    


   INSERT INTO doctors(d_fname, d_lname, practiceNum, specialty, email, phone) 
   
     VALUES(
      docFirstName,
      docLastName,
      docPractice,
      docSpecialty,
      docEmail,
      docPhone

     );

	update address set 
	
    address1 =Street_Address, address2 =Apartment_Num, city = City, state = State, zip  = Zip_Code
	
    where doctorsID = LAST_INSERT_ID() ;
    
    Select * from doctors_vu where doctorsID=LAST_INSERT_ID();
    
        
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_patient`(
    
-- Patient's Table
    		IN First_Name varchar(20), 
            IN  Last_Name varchar(20), 
            IN  DOB date, 
            IN  doctorsID int(11), 
            
-- Address Table
            IN  Street_Address varchar(50), 
            IN  Apartment_Num varchar(50), 
            IN  City varchar(30), 
            IN  State varchar(30), 
            IN  Zip_Code varchar(30) 

	
    )
BEGIN


		INSERT INTO patients
		(
		fname,
		lname,
		dob,
		doctorsID)
	VALUES
		(  	First_Name,
		Last_Name,
		DOB,
		doctorsID
		);



	update address set 
	
    address1 =Street_Address, address2 =Apartment_Num, city = City, state = State, zip  = Zip_Code
	
    where patientID = LAST_INSERT_ID();
    
    select LAST_INSERT_ID();
    
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN

select *
from patient_vu;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `doctors_vu`
--

/*!50001 DROP VIEW IF EXISTS `doctors_vu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctors_vu` AS select `d`.`doctorsID` AS `doctorsID`,`d`.`d_fname` AS `First_Name`,`d`.`d_lname` AS `Last_Name`,`d`.`practiceNum` AS `Practice_Number`,`d`.`specialty` AS `Specialty`,`d`.`email` AS `Email`,`d`.`phone` AS `Phone`,`a`.`address1` AS `Street_Address`,`a`.`address2` AS `Apartment_Num`,`a`.`city` AS `City`,`a`.`state` AS `State`,`a`.`zip` AS `Zip_Code` from (`doctors` `d` left join `address` `a` on(((`d`.`doctorsID` = `a`.`doctorsID`) and (`a`.`doctorsID` is not null)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `full_vu`
--

/*!50001 DROP VIEW IF EXISTS `full_vu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_vu` AS select `d`.`doctorsID` AS `Dr_ID`,`d`.`First_Name` AS `Dr_First_Name`,`d`.`Last_Name` AS `Dr_Last_Name`,`d`.`Practice_Number` AS `Practice_Number`,`d`.`Specialty` AS `Specialty`,`d`.`Email` AS `Email`,`d`.`Phone` AS `Phone`,`d`.`Street_Address` AS `Dr_Address1`,`d`.`Apartment_Num` AS `Dr_APT_Num`,`d`.`City` AS `Dr_City`,`d`.`State` AS `Dr_State`,`d`.`Zip_Code` AS `Dr_Zip`,`p`.`patientID` AS `patientID`,`p`.`doctorsID` AS `doctorsID`,`p`.`First_Name` AS `Patient First Name`,`p`.`Last_Name` AS `Patient Last Name`,`p`.`DOB` AS `DOB`,`p`.`Street_Address` AS `Street_Address`,`p`.`Apartment_Num` AS `Apartment_Num`,`p`.`City` AS `City`,`p`.`State` AS `State`,`p`.`Zip_Code` AS `Zip_Code`,`p`.`Diagnosis_Date` AS `Diagnosis_Date`,`p`.`hepatitis` AS `hepatitis`,`p`.`hsv1` AS `hsv1`,`p`.`hsv2` AS `hsv2`,`p`.`hiv` AS `hiv`,`p`.`aids` AS `aids`,`p`.`hltv` AS `hltv`,`p`.`hpv` AS `hpv`,`p`.`molluscum_contag` AS `molluscum_contag`,`p`.`zika` AS `zika`,`p`.`chlamydia` AS `chlamydia`,`p`.`gonorrhea` AS `gonorrhea`,`p`.`syphilis` AS `syphilis`,`p`.`trich` AS `trich`,`p`.`crabs` AS `crabs`,`p`.`scabies` AS `scabies`,`p`.`bv_yeast` AS `bv_yeast`,`p`.`chancroid` AS `chancroid`,`p`.`donovanosis` AS `donovanosis`,`p`.`genital_warts` AS `genital_warts`,`p`.`pid` AS `pid`,`p`.`ngu` AS `ngu`,`p`.`inetst_parasites` AS `inetst_parasites`,`p`.`mycoplasma` AS `mycoplasma`,`p`.`lgv` AS `lgv` from (`doctors_vu` `d` join `patient_vu` `p`) where (`d`.`doctorsID` = `p`.`doctorsID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_vu`
--

/*!50001 DROP VIEW IF EXISTS `patient_vu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_vu` AS select `p`.`patientID` AS `patientID`,`p`.`fname` AS `First_Name`,`p`.`lname` AS `Last_Name`,`p`.`dob` AS `DOB`,`p`.`doctorsID` AS `doctorsID`,`a`.`address1` AS `Street_Address`,`a`.`address2` AS `Apartment_Num`,`a`.`city` AS `City`,`a`.`state` AS `State`,`a`.`zip` AS `Zip_Code`,`b`.`diagDate` AS `Diagnosis_Date`,`n`.`hepatitis` AS `hepatitis`,`n`.`hsv1` AS `hsv1`,`n`.`hsv2` AS `hsv2`,`n`.`hiv` AS `hiv`,`n`.`aids` AS `aids`,`n`.`hltv` AS `hltv`,`n`.`hpv` AS `hpv`,`n`.`molluscum_contag` AS `molluscum_contag`,`n`.`zika` AS `zika`,`t`.`chlamydia` AS `chlamydia`,`t`.`gonorrhea` AS `gonorrhea`,`t`.`syphilis` AS `syphilis`,`t`.`trich` AS `trich`,`t`.`crabs` AS `crabs`,`t`.`scabies` AS `scabies`,`t`.`bv_yeast` AS `bv_yeast`,`t`.`chancroid` AS `chancroid`,`t`.`donovanosis` AS `donovanosis`,`t`.`genital_warts` AS `genital_warts`,`t`.`pid` AS `pid`,`t`.`ngu` AS `ngu`,`t`.`inetst_parasites` AS `inetst_parasites`,`t`.`mycoplasma` AS `mycoplasma`,`t`.`lgv` AS `lgv` from ((((`patients` `p` join `address` `a`) join `bridge_diag` `b`) join `nontreatable` `n`) join `treatable` `t`) where ((`p`.`patientID` = `a`.`patientID`) and (`p`.`patientID` = `b`.`patientID`) and (`b`.`diagID` = `n`.`diagID`) and (`b`.`diagID` = `t`.`diagID`) and (`a`.`patientID` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 21:26:18
