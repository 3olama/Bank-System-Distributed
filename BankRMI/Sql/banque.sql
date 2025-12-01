-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: banque
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `accountNumber` int NOT NULL AUTO_INCREMENT,
  `agenceId` int DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ssn` varchar(100) NOT NULL,
  `atmCard` varchar(2) DEFAULT NULL,
  `chequeBook` varchar(2) DEFAULT NULL,
  `internetBanking` varchar(2) DEFAULT NULL,
  `mobileBanking` varchar(2) DEFAULT NULL,
  `eStatement` varchar(2) DEFAULT NULL,
  `emailSMS` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`),
  KEY `agenceId` (`agenceId`),
  KEY `accounts_ibfk_4` (`ssn`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`agenceId`) REFERENCES `agence` (`agenceId`),
  CONSTRAINT `accounts_ibfk_3` FOREIGN KEY (`agenceId`) REFERENCES `agence` (`agenceId`),
  CONSTRAINT `accounts_ibfk_4` FOREIGN KEY (`ssn`) REFERENCES `customer` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (104,7,98266,'',NULL,'3423681808','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agence` (
  `agenceId` int NOT NULL AUTO_INCREMENT,
  `bankId` int DEFAULT NULL,
  `nameAgence` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`agenceId`),
  KEY `bankId` (`bankId`),
  CONSTRAINT `agence_ibfk_1` FOREIGN KEY (`bankId`) REFERENCES `bank` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
INSERT INTO `agence` VALUES (1,1,'Rabat Main Branch','123 Avenue Mohammed V, Rabat','+212600111222'),(2,1,'Rabat Souissi Branch','45 Rue Souissi, Rabat','+212600111223'),(3,1,'Casablanca Central','45 Boulevard de la Corniche, Casablanca','+212600333444'),(4,1,'Casablanca Maarif','12 Rue Maarif, Casablanca','+212600333445'),(5,1,'Marrakech Gueliz','88 Avenue Mohammed V, Marrakech','+212600444555'),(6,1,'Marrakech Medina','10 Rue Bab Doukkala, Marrakech','+212600444556'),(7,1,'Fès Ville Nouvelle','23 Avenue Hassan II, Fès','+212600555666'),(8,1,'Fès Medina','5 Rue Talaa Sghira, Fès','+212600555667'),(9,1,'Tanger City','1 Boulevard Pasteur, Tanger','+212600666777'),(10,1,'Tanger Medina','Rue de la Kasbah, Tanger','+212600666778'),(11,1,'Agadir Centre','Avenue Hassan II, Agadir','+212600777888'),(12,1,'Agadir Marina','Boulevard du Port, Agadir','+212600777889');
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atm`
--

DROP TABLE IF EXISTS `atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atm` (
  `atmId` int NOT NULL AUTO_INCREMENT,
  `agenceId` int DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  PRIMARY KEY (`atmId`),
  KEY `agenceId` (`agenceId`),
  CONSTRAINT `atm_ibfk_1` FOREIGN KEY (`agenceId`) REFERENCES `agence` (`agenceId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
INSERT INTO `atm` VALUES (1,1,'Lobby Rabat Main Branch','Active','2025-11-06'),(2,2,'Entrance Rabat Souissi Branch','Active','2025-11-06'),(3,3,'Lobby Casablanca Central','Active','2025-11-06'),(4,4,'Parking Casablanca Maarif','Maintenance','2025-11-05'),(5,5,'Lobby Marrakech Gueliz','Active','2025-11-06'),(6,6,'Outside Marrakech Medina','Active','2025-11-06'),(7,7,'Lobby Fès Ville Nouvelle','Active','2025-11-06'),(8,8,'Street Fès Medina','Active','2025-11-06'),(9,9,'Lobby Tanger City','Active','2025-11-06'),(10,10,'Kasbah Tanger Medina','Maintenance','2025-11-05'),(11,11,'Lobby Agadir Centre','Active','2025-11-06'),(12,12,'Marina Agadir','Active','2025-11-06');
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atm_session`
--

DROP TABLE IF EXISTS `atm_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atm_session` (
  `sessionId` int NOT NULL AUTO_INCREMENT,
  `atmId` int DEFAULT NULL,
  `cardId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT NULL,
  `logoutTime` timestamp NULL DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sessionId`),
  KEY `atmId` (`atmId`),
  KEY `cardId` (`cardId`),
  KEY `userId` (`userId`),
  CONSTRAINT `atm_session_ibfk_1` FOREIGN KEY (`atmId`) REFERENCES `atm` (`atmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm_session`
--

LOCK TABLES `atm_session` WRITE;
/*!40000 ALTER TABLE `atm_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `atm_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `bankId` int NOT NULL,
  `bankName` varchar(20) DEFAULT NULL,
  `bankCode` varchar(10) DEFAULT NULL,
  `adress` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'Bank of Morocco','BM001','Rabat, Morocco','+212600123456');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `cardNumber` varchar(16) NOT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `expireDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `accountNumber` int DEFAULT NULL,
  PRIMARY KEY (`cardNumber`),
  UNIQUE KEY `unique_pin` (`pin`),
  KEY `accountNumber` (`accountNumber`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `accounts` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('8060599051809627','1234',NULL,'ACTIVE',104);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ssn` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mariatal` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `passportNo` varchar(20) DEFAULT NULL,
  `race` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `income` varchar(50) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `seniorCitizen` varchar(50) DEFAULT NULL,
  `existAcnt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('3423681808','mariem sibba','mariemsibba@gmail.com',NULL,'smara',NULL,'30/08/2004','Female','Unmarried','smara','smara','12','46854685','White','Other','More than $156,600','Masters degree','Student','No','No');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `agenceId` int DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employeeId`),
  KEY `agenceId` (`agenceId`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`agenceId`) REFERENCES `agence` (`agenceId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Ahmed El Khari',NULL,'Manager','+212600555601'),(2,1,'Fatima Zahra',NULL,'Cashier','+212600555602'),(3,1,'Mohamed Ali',NULL,'Teller','+212600555603'),(4,1,'Sara Benali',NULL,'Security','+212600555604'),(5,1,'Hassan Rachid',NULL,'Support','+212600555605'),(6,2,'Imane Bouziane',NULL,'Manager','+212600555606'),(7,2,'Youssef Charki',NULL,'Cashier','+212600555607'),(8,2,'Khalid Bennis',NULL,'Teller','+212600555608'),(9,2,'Leila Benkirane',NULL,'Security','+212600555609'),(10,2,'Rachid El Fassi',NULL,'Support','+212600555610'),(11,3,'Mohamed Amrani',NULL,'Manager','+212600666601'),(12,3,'Nadia El Amrani',NULL,'Cashier','+212600666602'),(13,3,'Yassine Bouziane',NULL,'Teller','+212600666603'),(14,3,'Salma Hachimi',NULL,'Security','+212600666604'),(15,3,'Omar Charki',NULL,'Support','+212600666605'),(16,4,'Hicham Benkirane',NULL,'Manager','+212600666606'),(17,4,'Imane Zahra',NULL,'Cashier','+212600666607'),(18,4,'Soufiane Rachid',NULL,'Teller','+212600666608'),(19,4,'Sara El Khari',NULL,'Security','+212600666609'),(20,4,'Khalid Ali',NULL,'Support','+212600666610'),(21,5,'Ahmed Rachid',NULL,'Manager','+212600777601'),(22,5,'Leila Ben Ali',NULL,'Cashier','+212600777602'),(23,5,'Mohamed Charki',NULL,'Teller','+212600777603'),(24,5,'Fatima Zahra',NULL,'Security','+212600777604'),(25,5,'Youssef El Amrani',NULL,'Support','+212600777605'),(26,6,'Hassan El Khari',NULL,'Manager','+212600777606'),(27,6,'Nadia Benkirane',NULL,'Cashier','+212600777607'),(28,6,'Khalid Bouziane',NULL,'Teller','+212600777608'),(29,6,'Sara Amrani',NULL,'Security','+212600777609'),(30,6,'Imane Charki',NULL,'Support','+212600777610'),(31,7,'Mohamed Rachid',NULL,'Manager','+212600888601'),(32,7,'Fatima Ben Ali',NULL,'Cashier','+212600888602'),(33,7,'Ahmed Charki',NULL,'Teller','+212600888603'),(34,7,'Leila Zahra',NULL,'Security','+212600888604'),(35,7,'Yassine El Khari',NULL,'Support','+212600888605'),(36,8,'Hassan Amrani',NULL,'Manager','+212600888606'),(37,8,'Nadia Bouziane',NULL,'Cashier','+212600888607'),(38,8,'Khalid Benkirane',NULL,'Teller','+212600888608'),(39,8,'Sara El Fassi',NULL,'Security','+212600888609'),(40,8,'Imane Rachid',NULL,'Support','+212600888610'),(41,9,'Ahmed Benkirane',NULL,'Manager','+212600999601'),(42,9,'Fatima El Khari',NULL,'Cashier','+212600999602'),(43,9,'Mohamed El Amrani',NULL,'Teller','+212600999603'),(44,9,'Leila Charki',NULL,'Security','+212600999604'),(45,9,'Youssef Rachid',NULL,'Support','+212600999605'),(46,10,'Hassan Ben Ali',NULL,'Manager','+212600999606'),(47,10,'Nadia El Fassi',NULL,'Cashier','+212600999607'),(48,10,'Khalid El Khari',NULL,'Teller','+212600999608'),(49,10,'Sara El Amrani',NULL,'Security','+212600999609'),(50,10,'Imane Rachid',NULL,'Support','+212600999610'),(51,11,'Ahmed El Fassi',NULL,'Manager','+212601000601'),(52,11,'Fatima Charki',NULL,'Cashier','+212601000602'),(53,11,'Mohamed El Khari',NULL,'Teller','+212601000603'),(54,11,'Leila Amrani',NULL,'Security','+212601000604'),(55,11,'Youssef Benkirane',NULL,'Support','+212601000605'),(56,12,'Hassan El Amrani',NULL,'Manager','+212601000606'),(57,12,'Nadia Rachid',NULL,'Cashier','+212601000607'),(58,12,'Khalid El Fassi',NULL,'Teller','+212601000608'),(59,12,'Sara Bouziane',NULL,'Security','+212601000609'),(60,12,'Imane El Khari',NULL,'Support','+212601000610');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `loginId` int NOT NULL AUTO_INCREMENT,
  `ssn` varchar(100) NOT NULL,
  `cardNumber` varchar(16) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`loginId`),
  KEY `login_ibfk_1` (`ssn`),
  KEY `login_ibfk_2` (`cardNumber`),
  KEY `login_pin_fk` (`pin`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `customer` (`ssn`),
  CONSTRAINT `login_ibfk_2` FOREIGN KEY (`cardNumber`) REFERENCES `card` (`cardNumber`),
  CONSTRAINT `login_pin_fk` FOREIGN KEY (`pin`) REFERENCES `card` (`pin`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (2,'3423681808','8060599051809627','1234');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginhistory`
--

DROP TABLE IF EXISTS `loginhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginhistory` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(15) NOT NULL,
  `loginTime` timestamp NULL DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `ipAdress` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`logId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginhistory`
--

LOCK TABLES `loginhistory` WRITE;
/*!40000 ALTER TABLE `loginhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transactionId` int NOT NULL AUTO_INCREMENT,
  `accountNumber` int DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `atmId` int DEFAULT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `accountNumber` (`accountNumber`),
  KEY `atmId` (`atmId`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `accounts` (`accountNumber`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`atmId`) REFERENCES `atm` (`atmId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (8,104,'Deposit',100000.00,'2025-12-01 05:26:50','Cash deposit',NULL),(9,104,'Withdraw',500.00,'2025-12-01 05:27:02','Cash withdrawal',NULL),(10,104,'Withdraw',1234.00,'2025-12-01 05:27:14','Cash withdrawal',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01  6:42:01
