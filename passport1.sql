-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: passport1
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `number` varchar(15) NOT NULL,
  `number_alt` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `email_alt` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `first_contact_date` date DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `referred_by` varchar(30) DEFAULT NULL,
  `process_type` varchar(20) DEFAULT NULL,
  `first_registration_of` varchar(30) DEFAULT NULL,
  `lead_type` varchar(20) DEFAULT NULL,
  `search_required` varchar(5) DEFAULT NULL,
  `assigned_to` varchar(30) DEFAULT NULL,
  `search_location` varchar(30) DEFAULT NULL,
  `search_taluka` varchar(30) DEFAULT NULL,
  `wa_group` varchar(5) DEFAULT NULL,
  `wa_group_name` varchar(30) DEFAULT NULL,
  `address` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (27,'Jyoti Harijan','9373555015','','jyotiharijan07@gmail.com','jyotiharijan07@gmail.com','Mapusa',NULL,'Facebook',NULL,'BB 1961 Registration',NULL,'Hot',NULL,NULL,'Goa',NULL,'Yes','Jk & Jyoti Work','H.No. 20 Feira Altha, Mapusa Goa','2021-04-19 06:34:27','2021-04-19 06:34:27'),(28,'Leonilda & Clemente','7666012739','+447459811634','leonildafernandes248@gmail.com','leonildafernandes248@gmail.com','Margao',NULL,'Facebook',NULL,'BA 1961 Registration',NULL,'Hot',NULL,NULL,'',NULL,'Yes','PCFG Leonilda & Clemente','Curtorim Salcete Goa','2021-04-19 09:50:14','2021-04-19 09:50:14');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `registration` text,
  `to_register` text,
  `document` text,
  `document_of` text,
  `name` text,
  `place` text,
  `date` date DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `doc_available` text,
  `doc_in_office` text,
  `sac_date` date DEFAULT NULL,
  `a/t_date` date DEFAULT NULL,
  `translation_date` date DEFAULT NULL,
  `notary_date` date DEFAULT NULL,
  `collector_date` date DEFAULT NULL,
  `apostle_date` date DEFAULT NULL,
  `send_to_pt_date` date DEFAULT NULL,
  `doc_reached_pt` text,
  `received_in_pt_date` date DEFAULT NULL,
  `submitted_date` date DEFAULT NULL,
  `concluded_date` date DEFAULT NULL,
  `doc_issue_date` date DEFAULT NULL,
  `reg_bill` text,
  `submitted` text,
  `attachment` text,
  `comment` text,
  `billable` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (24,18,'test','self','this','self','Dattaprasad','place here','2021-01-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/.gitignore',NULL,NULL,'2021-02-17 11:14:27','2021-02-17 11:14:27'),(25,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/jyoti bank details.pdf',NULL,NULL,'2021-04-19 06:38:13','2021-04-19 06:38:13'),(26,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/PCFG - Terms & Conditions.pdf',NULL,NULL,'2021-04-19 09:19:28','2021-04-19 09:19:28'),(27,27,'Birth Before 1961',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/PCFG - Terms & Conditions.pdf',NULL,NULL,'2021-04-19 09:20:02','2021-04-19 09:20:02'),(28,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/Birth cert of Leonilda fraiza fernandes.pdf',NULL,NULL,'2021-04-19 10:24:51','2021-04-19 10:24:51'),(29,28,NULL,NULL,NULL,NULL,'Leonilda Fraiza Fernandes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/Adhar card Leonilda fraiza fernandes.pdf',NULL,NULL,'2021-04-19 10:27:57','2021-04-19 10:27:57'),(30,28,NULL,NULL,NULL,NULL,'Leonilda Fraiza Fernandes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/Birth cert of Leonilda fraiza fernandes.pdf',NULL,NULL,'2021-04-19 10:29:09','2021-04-19 10:29:09'),(31,28,NULL,NULL,'Handoff Shhet',NULL,'Leonilda Fraiza Fernandes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/handoff sheet 7 apr 2021.pdf',NULL,NULL,'2021-04-19 10:31:25','2021-04-19 10:31:25'),(32,28,NULL,NULL,'casamento',NULL,'Leonilda Fraiza Fernandes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/assento de casamento clemente & filipina.jpeg',NULL,NULL,'2021-04-19 10:31:52','2021-04-19 10:31:52'),(33,28,NULL,NULL,'nascimento',NULL,'Leonilda Fraiza Fernandes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/assento de nascimento clemente.jpeg',NULL,NULL,'2021-04-19 10:32:21','2021-04-19 10:32:21'),(34,28,'Birth After 1961','Self','Adhar Card','Self','Leonilda Fraiza Fernandes','Curtorim',NULL,NULL,'Photocopy','Photocopy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://some-name-for-bucket.s3.amazonaws.com/assento de nascimento clemente.jpeg',NULL,NULL,'2021-04-19 10:36:59','2021-04-19 10:36:59');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `followup_for` text,
  `type` text,
  `date` date DEFAULT NULL,
  `comments` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES (26,18,'New Employee','Enquiry clients closures','2021-03-02','mjkl;','2021-02-05 16:39:22','2021-02-05 16:39:22');
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `remind` text,
  `current_case_stage` text,
  `closed_by` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
INSERT INTO `reminder` VALUES (13,18,'Joshua','','','2021-02-05 16:40:09','2021-02-05 16:40:09'),(14,18,'Joshua','Case Stage 1','New Employee','2021-02-05 16:40:19','2021-02-05 16:40:19'),(15,18,'Joshua','Case Stage 1','New Employee','2021-02-05 16:40:27','2021-02-05 16:40:27'),(16,18,'New Employee','Dead End','Joshua','2021-03-03 09:45:09','2021-03-03 09:45:09');
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (20,'Admin','ekavade@gmail.com','data1234',1,'2021-04-19 06:13:26','2021-04-19 06:15:00'),(21,'Jyoti','jyoti@gmail.com','jyoti9012',2,'2021-04-19 06:16:19','2021-04-19 06:16:19'),(22,'Vinita','vinita@gmail.com','vinita9012',2,'2021-04-19 06:16:55','2021-04-19 06:16:55');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20  5:56:08
