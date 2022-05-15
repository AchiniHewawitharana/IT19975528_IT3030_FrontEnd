-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: electrogrid
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `bill_ID` int NOT NULL AUTO_INCREMENT,
  `power_consumption_ID` int NOT NULL,
  `User_Name` varchar(45) DEFAULT NULL,
  `NIC` varchar(15) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `month` varchar(30) DEFAULT NULL,
  `monthly_units` int DEFAULT NULL,
  `rate` int NOT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`bill_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,4,'Lochana','982645386v','Badulla','April-2022',92,20,1840),(2,5,'Lihini','989835256v','Kandy','April-2022',100,5,500),(9,3,'Achi','235','athuru','Jan-2020',50,10,500),(16,10,'Achini','926662880V','TestAddress','May',5,10,50),(17,7,'Lihini','926662880V','Test','Jan-2020',90,10,5000);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumption`
--

DROP TABLE IF EXISTS `consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumption` (
  `conID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(5) NOT NULL,
  `month` varchar(30) NOT NULL,
  `preMonReading` int NOT NULL,
  `curMonReading` int NOT NULL,
  `conUnits` int NOT NULL,
  PRIMARY KEY (`conID`),
  UNIQUE KEY `conID_UNIQUE` (`conID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumption`
--

LOCK TABLES `consumption` WRITE;
/*!40000 ALTER TABLE `consumption` DISABLE KEYS */;
INSERT INTO `consumption` VALUES (4,'C0001','April-2022',0,92,92),(5,'C0002','April-2022',0,100,100),(6,'C0002','March-2022',100,210,110),(7,'C0004','June-2021',60,75,15);
/*!40000 ALTER TABLE `consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` varchar(5) NOT NULL,
  `name` varchar(45) NOT NULL,
  `dob` varchar(30) NOT NULL,
  `nicNo` varchar(15) NOT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(60) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('C0001','Lochana','12-07-1998','982645386v','0711485236','lochana@gmail.com','Badulla','lochana1234'),('C0002','Lihini','04-06-1998','989835256v','0717520534','lihini@gmail.com','Kandy','lihini1234'),('C0003','Raeesul','25-03-1998','988502639v','0776328550','raeesul@gmail.com','Kalutara','raeesul1234'),('C0004','Achini','14-06-1992','924448678v','0710232323','achi@gmail.com','Athurugiriya','achi1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 19:03:57
