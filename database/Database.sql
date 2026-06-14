CREATE DATABASE  IF NOT EXISTS `edurights_sl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `edurights_sl`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: edurights_sl
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,2,'Logged into the system','2026-05-31 08:39:05'),(2,2,'Uploaded resource: IT LAW LECTURES','2026-05-31 08:41:04'),(3,2,'Logged out of the system','2026-05-31 08:41:15'),(4,4,'Logged into the system','2026-05-31 08:42:09'),(5,4,'Approved resource ID: 1','2026-05-31 08:42:41'),(6,4,'Logged out of the system','2026-05-31 08:42:47'),(7,4,'Logged into the system','2026-05-31 08:43:13'),(8,4,'Logged out of the system','2026-05-31 08:43:23'),(9,3,'Logged into the system','2026-05-31 08:43:32'),(10,3,'Downloaded resource: IT LAW LECTURES','2026-05-31 08:43:49'),(11,3,'Logged out of the system','2026-05-31 08:44:17'),(12,3,'Logged into the system','2026-05-31 08:44:21'),(13,3,'Logged out of the system','2026-05-31 08:44:26'),(14,3,'Logged into the system','2026-05-31 08:47:01'),(15,3,'Logged out of the system','2026-05-31 09:10:27'),(16,4,'Logged into the system','2026-05-31 09:10:33'),(17,4,'Logged out of the system','2026-05-31 09:21:55'),(18,3,'Logged into the system','2026-05-31 09:22:29'),(19,3,'Logged out of the system','2026-05-31 09:22:38'),(20,4,'Logged into the system','2026-05-31 09:22:44'),(21,4,'Logged out of the system','2026-05-31 09:22:50'),(22,2,'Logged into the system','2026-05-31 09:23:01'),(23,2,'Logged out of the system','2026-05-31 09:23:06'),(24,2,'Logged into the system','2026-05-31 09:41:01'),(25,2,'Logged out of the system','2026-05-31 09:41:22'),(26,4,'Logged into the system','2026-05-31 09:50:03'),(27,4,'Logged out of the system','2026-05-31 09:51:34'),(28,2,'Logged into the system','2026-05-31 09:51:40'),(29,2,'Logged out of the system','2026-05-31 09:51:47'),(30,3,'Logged into the system','2026-05-31 09:51:55'),(31,3,'Logged out of the system','2026-05-31 10:01:17'),(32,3,'Logged into the system','2026-05-31 10:01:22'),(33,3,'Logged out of the system','2026-05-31 10:01:25'),(34,2,'Logged into the system','2026-05-31 10:01:31'),(35,2,'Logged out of the system','2026-05-31 10:01:34'),(36,4,'Logged into the system','2026-05-31 10:01:41'),(37,4,'Logged out of the system','2026-05-31 10:02:35'),(38,4,'Logged into the system','2026-05-31 10:13:51'),(39,4,'Logged out of the system','2026-05-31 10:30:42'),(40,4,'Logged into the system','2026-05-31 10:30:47'),(41,4,'Logged out of the system','2026-05-31 10:30:55'),(42,2,'Logged into the system','2026-05-31 10:59:22'),(43,2,'Logged out of the system','2026-05-31 10:59:33'),(44,4,'Logged into the system','2026-05-31 10:59:39'),(45,4,'Logged out of the system','2026-05-31 10:59:46'),(46,2,'Logged into the system','2026-05-31 10:59:51'),(47,2,'Uploaded resource: jbjk.kll.nkl','2026-05-31 11:00:38'),(48,2,'Logged out of the system','2026-05-31 11:00:57'),(49,4,'Logged into the system','2026-05-31 11:02:49'),(50,4,'Approved resource ID: 2','2026-05-31 11:02:57'),(51,4,'Logged out of the system','2026-05-31 11:03:03'),(52,5,'Logged into the system','2026-06-02 02:17:44'),(53,5,'Uploaded resource: FUNDERMENTALS OF ENTRE','2026-06-02 02:19:30'),(54,5,'Logged out of the system','2026-06-02 02:19:38'),(55,4,'Logged into the system','2026-06-02 02:19:44'),(56,4,'Approved resource ID: 3','2026-06-02 02:19:58'),(57,4,'Logged out of the system','2026-06-02 02:20:03'),(58,3,'Logged into the system','2026-06-02 02:20:10'),(59,3,'Downloaded resource: FUNDERMENTALS OF ENTRE','2026-06-02 02:20:27'),(60,3,'Logged out of the system','2026-06-02 02:21:00'),(61,2,'Logged into the system','2026-06-04 03:50:45'),(62,2,'Downloaded resource: FUNDERMENTALS OF ENTRE','2026-06-04 03:50:52'),(63,2,'Logged out of the system','2026-06-04 03:50:56'),(64,4,'Logged into the system','2026-06-04 03:55:05'),(65,4,'Logged into the system','2026-06-04 18:57:57'),(66,4,'Logged out of the system','2026-06-04 18:58:39'),(67,2,'Logged into the system','2026-06-04 19:00:22'),(68,2,'Uploaded resource: HEALTH STUDIES','2026-06-04 19:58:01'),(69,2,'Logged out of the system','2026-06-04 19:58:08'),(70,2,'Logged into the system','2026-06-04 19:58:31'),(71,2,'Logged out of the system','2026-06-04 19:58:38'),(72,4,'Logged into the system','2026-06-04 19:58:44'),(73,4,'Approved resource ID: 4','2026-06-04 19:58:51'),(74,4,'Downloaded resource: HEALTH STUDIES','2026-06-04 19:59:23'),(75,4,'Logged out of the system','2026-06-04 20:00:37'),(76,2,'Logged into the system','2026-06-04 20:12:31'),(77,2,'Uploaded resource: Educational Documentary','2026-06-04 20:13:46'),(78,2,'Logged out of the system','2026-06-04 20:13:50'),(79,4,'Logged into the system','2026-06-04 20:13:54'),(80,4,'Approved resource ID: 5','2026-06-04 20:14:03'),(81,4,'Logged out of the system','2026-06-04 20:35:55'),(82,4,'Logged into the system','2026-06-04 20:36:01'),(83,4,'Logged out of the system','2026-06-04 20:36:52'),(84,2,'Logged into the system','2026-06-04 20:37:00'),(85,2,'Logged out of the system','2026-06-04 20:37:11'),(86,3,'Logged into the system','2026-06-04 20:37:17'),(87,3,'Logged out of the system','2026-06-04 20:43:09'),(88,2,'Logged into the system','2026-06-04 20:43:21'),(89,2,'Uploaded resource: Dart Programming','2026-06-04 20:55:28'),(90,2,'Logged out of the system','2026-06-04 20:55:33'),(91,4,'Logged into the system','2026-06-04 20:55:41'),(92,4,'Rejected resource ID: 6','2026-06-04 20:55:53'),(93,4,'Logged out of the system','2026-06-04 20:56:02'),(94,2,'Logged into the system','2026-06-04 20:56:09'),(95,2,'Uploaded resource: Dart Programming','2026-06-04 20:57:05'),(96,2,'Logged out of the system','2026-06-04 20:57:09'),(97,4,'Logged into the system','2026-06-04 20:57:15'),(98,4,'Approved resource ID: 7','2026-06-04 20:57:34'),(99,4,'Downloaded resource: Dart Programming','2026-06-04 20:57:54'),(100,4,'Deleted resource from library: jbjk.kll.nkl','2026-06-04 20:58:32'),(101,4,'Logged out of the system','2026-06-04 20:59:29'),(102,4,'Logged into the system','2026-06-04 20:59:34'),(103,4,'Logged out of the system','2026-06-04 21:00:07'),(104,2,'Logged into the system','2026-06-10 13:31:44'),(105,2,'Logged out of the system','2026-06-10 13:54:36'),(106,4,'Logged into the system','2026-06-10 13:54:43'),(107,4,'Logged into the system','2026-06-11 15:40:52'),(108,4,'Logged out of the system','2026-06-11 16:07:10'),(109,2,'Logged into the system','2026-06-11 16:07:15'),(110,2,'Logged out of the system','2026-06-11 16:43:37'),(111,2,'Logged into the system','2026-06-11 16:43:41'),(112,2,'Logged out of the system','2026-06-11 17:14:06'),(113,2,'Logged into the system','2026-06-11 17:14:21'),(114,2,'Logged out of the system','2026-06-11 17:20:32'),(115,2,'Logged into the system','2026-06-11 17:20:36'),(116,2,'Logged into the system','2026-06-11 17:24:35'),(117,2,'Logged out of the system','2026-06-11 17:29:14'),(118,2,'Logged into the system','2026-06-11 17:29:18'),(119,2,'Logged out of the system','2026-06-11 17:30:14'),(120,4,'Logged into the system','2026-06-11 17:30:23'),(121,4,'Logged out of the system','2026-06-11 17:30:37'),(122,2,'Logged into the system','2026-06-11 17:30:45'),(123,2,'Logged out of the system','2026-06-11 17:34:05'),(124,2,'Logged into the system','2026-06-11 17:34:10'),(125,2,'Logged out of the system','2026-06-11 17:34:53'),(126,2,'Logged into the system','2026-06-11 17:34:58'),(127,2,'Logged into the system','2026-06-11 17:35:50'),(128,2,'Logged out of the system','2026-06-11 17:40:50'),(129,2,'Logged into the system','2026-06-11 17:40:54'),(130,2,'Logged out of the system','2026-06-11 17:54:09'),(131,2,'Logged into the system','2026-06-11 17:54:12'),(132,2,'Logged out of the system','2026-06-11 18:28:51'),(133,2,'Logged into the system','2026-06-11 18:29:03'),(134,2,'Uploaded resource: Exercise 1','2026-06-11 18:55:14'),(135,2,'Logged out of the system','2026-06-11 18:55:26'),(136,4,'Logged into the system','2026-06-11 18:55:33'),(137,4,'Logged out of the system','2026-06-11 20:26:28'),(138,4,'Logged into the system','2026-06-11 20:26:32'),(139,4,'Logged out of the system','2026-06-11 20:30:12'),(140,4,'Logged into the system','2026-06-11 20:30:16'),(141,4,'Approved resource ID: 8','2026-06-11 20:47:01'),(142,4,'Deleted resource from library: Exercise 1','2026-06-11 20:48:54'),(143,4,'Logged out of the system','2026-06-11 20:49:06'),(144,3,'Logged into the system','2026-06-11 20:49:13'),(145,3,'Downloaded resource: Educational Documentary','2026-06-11 20:49:20'),(146,2,'Logged into the system','2026-06-12 01:49:12'),(147,2,'Logged out of the system','2026-06-12 03:28:34'),(148,2,'Logged into the system','2026-06-12 03:28:38'),(149,2,'Logged out of the system','2026-06-12 04:05:32'),(150,2,'Logged into the system','2026-06-12 04:05:35'),(151,2,'Logged out of the system','2026-06-12 04:57:25'),(152,2,'Logged into the system','2026-06-12 04:57:28'),(153,2,'Uploaded resource: CV5','2026-06-12 05:10:44'),(154,2,'Logged out of the system','2026-06-12 05:10:50'),(155,4,'Logged into the system','2026-06-12 05:10:56'),(156,4,'Approved resource ID: 9','2026-06-12 05:12:01'),(157,4,'Deleted resource from library: CV5','2026-06-12 05:12:23'),(158,4,'Logged out of the system','2026-06-12 05:12:28'),(159,3,'Logged into the system','2026-06-12 11:07:33'),(160,3,'Logged out of the system','2026-06-12 11:08:10'),(161,3,'Logged into the system','2026-06-12 11:41:18'),(162,3,'Logged out of the system','2026-06-12 11:42:05'),(163,3,'Logged into the system','2026-06-12 11:43:13'),(164,3,'Logged out of the system','2026-06-12 11:46:00'),(165,2,'Logged into the system','2026-06-12 11:46:08'),(166,2,'Logged out of the system','2026-06-12 12:27:16'),(167,2,'Logged into the system','2026-06-12 12:27:23'),(168,2,'Logged out of the system','2026-06-12 13:01:48'),(169,2,'Logged into the system','2026-06-12 13:04:13'),(170,2,'Logged out of the system','2026-06-12 13:04:16'),(171,6,'Logged into the system','2026-06-12 13:04:39'),(172,6,'Logged out of the system','2026-06-12 13:04:46'),(173,2,'Logged into the system','2026-06-12 17:54:58'),(174,2,'Logged out of the system','2026-06-12 17:55:08'),(175,2,'Logged into the system','2026-06-13 00:44:39'),(176,2,'Logged out of the system','2026-06-13 00:47:08'),(177,2,'Logged into the system','2026-06-13 00:47:27'),(178,2,'Logged out of the system','2026-06-13 00:49:06'),(179,2,'Logged into the system','2026-06-13 02:55:55'),(180,2,'Logged out of the system','2026-06-13 02:56:37'),(181,2,'Logged into the system','2026-06-13 02:56:46'),(182,2,'Logged out of the system','2026-06-13 03:04:54'),(183,4,'Logged into the system','2026-06-13 03:05:01'),(184,4,'Logged out of the system','2026-06-13 03:26:04'),(185,3,'Logged into the system','2026-06-13 03:35:45'),(186,3,'Logged out of the system','2026-06-13 03:44:05'),(187,4,'Logged into the system','2026-06-13 03:44:11'),(188,2,'Logged into the system','2026-06-13 13:01:32'),(189,2,'Logged out of the system','2026-06-13 13:02:52'),(190,4,'Logged into the system','2026-06-13 13:03:01'),(191,4,'Logged out of the system','2026-06-13 13:07:00'),(192,3,'Logged into the system','2026-06-13 13:07:10'),(193,3,'Downloaded resource: Dart Programming','2026-06-13 13:13:32'),(194,3,'Logged out of the system','2026-06-13 13:14:07'),(195,2,'Logged into the system','2026-06-13 13:14:17'),(196,2,'Logged out of the system','2026-06-13 13:14:31'),(197,4,'Logged into the system','2026-06-13 13:14:40'),(198,4,'Logged out of the system','2026-06-13 13:14:53'),(199,4,'Logged into the system','2026-06-13 13:16:12'),(200,4,'Logged out of the system','2026-06-13 13:29:06'),(201,2,'Logged into the system','2026-06-13 13:29:16'),(202,2,'Logged out of the system','2026-06-13 13:29:27'),(203,3,'Logged into the system','2026-06-13 13:29:35'),(204,3,'Logged out of the system','2026-06-13 13:29:52'),(205,4,'Logged into the system','2026-06-13 13:29:59'),(206,4,'Logged out of the system','2026-06-13 13:44:23'),(207,2,'Logged into the system','2026-06-13 14:09:20'),(208,2,'Uploaded resource: PROJECT','2026-06-13 15:02:17'),(209,2,'Logged out of the system','2026-06-13 15:02:23'),(210,4,'Logged into the system','2026-06-13 15:02:29'),(211,4,'Approved resource ID: 10','2026-06-13 15:02:58'),(212,4,'Deleted resource from library: PROJECT','2026-06-13 15:03:10'),(213,4,'Logged out of the system','2026-06-13 15:04:05'),(214,4,'Logged into the system','2026-06-13 15:04:09'),(215,4,'Logged out of the system','2026-06-13 15:36:12'),(216,4,'Logged into the system','2026-06-13 15:37:16'),(217,4,'Logged out of the system','2026-06-13 15:39:02'),(218,3,'Logged into the system','2026-06-13 15:39:09'),(219,3,'Logged out of the system','2026-06-13 15:53:33'),(220,2,'Logged into the system','2026-06-13 15:53:43'),(221,2,'Logged out of the system','2026-06-13 15:53:54'),(222,4,'Logged into the system','2026-06-13 15:54:06'),(223,4,'Logged out of the system','2026-06-13 15:54:37'),(224,3,'Logged into the system','2026-06-13 15:54:46'),(225,3,'Logged out of the system','2026-06-13 15:55:00'),(226,2,'Logged into the system','2026-06-13 15:55:08'),(227,2,'Downloaded resource: Educational Documentary','2026-06-13 15:55:29'),(228,2,'Logged out of the system','2026-06-13 15:58:24'),(229,4,'Logged into the system','2026-06-13 21:52:10'),(230,4,'Logged out of the system','2026-06-13 22:49:17'),(231,2,'Logged into the system','2026-06-13 22:51:37'),(232,2,'Uploaded resource: NOTE 1','2026-06-13 22:54:53'),(233,2,'Logged out of the system','2026-06-13 22:55:00'),(234,4,'Logged into the system','2026-06-13 22:55:09'),(235,4,'Approved resource ID: 11','2026-06-13 22:56:08'),(236,4,'Deleted resource from library: NOTE 1','2026-06-13 22:56:29'),(237,4,'Logged out of the system','2026-06-13 22:56:38'),(238,4,'Logged into the system','2026-06-13 22:58:10'),(239,4,'Logged out of the system','2026-06-13 23:04:15'),(240,4,'Logged into the system','2026-06-13 23:04:55'),(241,4,'Logged out of the system','2026-06-13 23:05:01'),(242,3,'Logged into the system','2026-06-13 23:05:09'),(243,3,'Logged out of the system','2026-06-13 23:05:16'),(244,2,'Logged into the system','2026-06-13 23:05:46'),(245,2,'Logged out of the system','2026-06-13 23:06:35'),(246,4,'Logged into the system','2026-06-13 23:12:06'),(247,4,'Logged out of the system','2026-06-13 23:12:10'),(248,4,'Logged into the system','2026-06-13 23:12:37'),(249,4,'Logged out of the system','2026-06-13 23:47:35'),(250,2,'Logged into the system','2026-06-13 23:47:49'),(251,2,'Uploaded resource: 1','2026-06-13 23:49:58'),(252,2,'Logged out of the system','2026-06-13 23:50:02'),(253,4,'Logged into the system','2026-06-13 23:50:08'),(254,4,'Rejected resource ID: 12','2026-06-13 23:51:01'),(255,4,'Logged out of the system','2026-06-13 23:51:09'),(256,3,'Logged into the system','2026-06-13 23:51:18'),(257,3,'Logged out of the system','2026-06-13 23:51:40'),(258,3,'Logged into the system','2026-06-13 23:55:58'),(259,3,'Logged out of the system','2026-06-13 23:56:12'),(260,2,'Logged into the system','2026-06-13 23:56:24'),(261,2,'Logged out of the system','2026-06-13 23:59:27'),(262,2,'Logged into the system','2026-06-13 23:59:32'),(263,2,'Logged out of the system','2026-06-13 23:59:34'),(264,4,'Logged into the system','2026-06-13 23:59:43'),(265,4,'Logged out of the system','2026-06-14 00:27:47'),(266,4,'Logged into the system','2026-06-14 00:27:53'),(267,4,'Logged out of the system','2026-06-14 00:28:33'),(268,2,'Logged into the system','2026-06-14 00:28:41'),(269,2,'Logged out of the system','2026-06-14 00:28:59'),(270,3,'Logged into the system','2026-06-14 00:29:10'),(271,3,'Logged out of the system','2026-06-14 00:29:38'),(272,3,'Logged into the system','2026-06-14 00:57:01'),(273,3,'Logged out of the system','2026-06-14 00:57:11'),(274,2,'Logged into the system','2026-06-14 00:57:21'),(275,2,'Logged out of the system','2026-06-14 00:57:43'),(276,4,'Logged into the system','2026-06-14 00:57:51'),(277,4,'Logged out of the system','2026-06-14 00:58:32'),(278,3,'Logged into the system','2026-06-14 00:58:41'),(279,3,'Logged out of the system','2026-06-14 00:58:59'),(280,4,'Logged into the system','2026-06-14 00:59:05'),(281,4,'Logged out of the system','2026-06-14 00:59:10'),(282,4,'Logged into the system','2026-06-14 02:04:06'),(283,4,'Logged out of the system','2026-06-14 02:04:11'),(284,2,'Logged into the system','2026-06-14 13:07:24'),(285,2,'Logged out of the system','2026-06-14 13:07:54'),(286,4,'Logged into the system','2026-06-14 13:08:02'),(287,4,'Logged out of the system','2026-06-14 13:08:33'),(288,3,'Logged into the system','2026-06-14 13:08:43'),(289,3,'Logged out of the system','2026-06-14 13:10:43'),(290,3,'Logged into the system','2026-06-14 19:41:52'),(291,3,'Logged out of the system','2026-06-14 19:47:18'),(292,3,'Logged into the system','2026-06-14 19:48:12'),(293,3,'Downloaded resource: Dart Programming','2026-06-14 19:48:41'),(294,3,'Logged out of the system','2026-06-14 19:48:54'),(295,3,'Logged into the system','2026-06-14 20:18:58'),(296,3,'Logged out of the system','2026-06-14 20:19:49'),(297,3,'Logged into the system','2026-06-14 20:19:53'),(298,3,'Logged out of the system','2026-06-14 20:22:38'),(299,3,'Logged into the system','2026-06-14 20:23:32'),(300,3,'Logged out of the system','2026-06-14 20:24:05'),(301,3,'Logged into the system','2026-06-14 23:36:30'),(302,3,'Logged out of the system','2026-06-14 23:37:06'),(303,4,'Logged into the system','2026-06-14 23:37:21'),(304,4,'Logged out of the system','2026-06-14 23:37:57'),(305,2,'Logged into the system','2026-06-14 23:38:04');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `resource_id` int DEFAULT NULL,
  `downloaded_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `downloads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `downloads_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` VALUES (1,3,1,'2026-05-31 08:43:49'),(2,3,3,'2026-06-02 02:20:27'),(3,2,3,'2026-06-04 03:50:52'),(4,4,4,'2026-06-04 19:59:23'),(5,4,7,'2026-06-04 20:57:54'),(6,3,5,'2026-06-11 20:49:20'),(7,3,7,'2026-06-13 13:13:32'),(8,2,5,'2026-06-13 15:55:29'),(9,3,7,'2026-06-14 19:48:41');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_analyses`
--

DROP TABLE IF EXISTS `legal_analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_analyses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `resource_type` varchar(100) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_hash` varchar(255) DEFAULT NULL,
  `license_type` varchar(100) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `permission_status` varchar(100) DEFAULT NULL,
  `attribution_available` varchar(50) DEFAULT NULL,
  `source_type` varchar(100) DEFAULT NULL,
  `intended_use` varchar(100) DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `findings` text,
  `recommendation` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_analyses`
--

LOCK TABLES `legal_analyses` WRITE;
/*!40000 ALTER TABLE `legal_analyses` DISABLE KEYS */;
INSERT INTO `legal_analyses` VALUES (1,1,'IT PROJECT','PDF','IT project Management Assignment 1 (1).pdf','ac5d5f0605499c4e9dab9a7e5d59ebc113d1f81002f1afc9601e756b2f7a0e96','GPL v3','LIMKOKWING UNIVERSITY','Permission Granted','Yes','Original Work','Teaching',10,'LOW RISK','File detected: IT project Management Assignment 1 (1).pdf\nFile type: PDF\nFile size: 0.96 MB','Safe to proceed.','2026-06-11 05:09:34'),(2,1,'research','DOCX','REASEARCH3 COVER.docx','99f7165564b8bd9c52e163788e6d56e8bebc897f9a45a65235fc89c187d80311','MIT License','LIMKOKWING UNIVERSITY','Permission Granted','Yes','Original Work','Teaching',5,'LOW RISK','File detected: REASEARCH3 COVER.docx\nFile type: DOCX\nFile size: 0.04 MB','Safe to proceed.','2026-06-11 05:49:31'),(3,1,'metho','DOCX','Final_Reformatted_9_Page_Proposal.docx','4fae5f8761af2c9e9499cd856243e73029e6ce8f4b47f6582deeab5232486177','Apache 2.0','LIMKOKWING UNIVERSITY','Permission Granted','Yes','Original Work','Teaching',5,'LOW RISK','File detected: Final_Reformatted_9_Page_Proposal.docx\nFile type: DOCX\nFile size: 0.12 MB','Safe to proceed.','2026-06-11 06:05:07'),(4,1,'EXERCISE 1','DOCX','Final_University_ERMSP_Proposal.docx','cf876367bdc9bce51861b64bc2170db7eae460601480b37c08c5d9846c4440c5','MIT License','MR DINNEH','Permission Granted','Yes','Internet Source','Teaching',25,'LOW RISK','File detected: Final_University_ERMSP_Proposal.docx\nFile type: DOCX\nFile size: 0.04 MB','Safe to proceed.','2026-06-11 09:00:32'),(5,1,'EXERCISE 1','DOCX','Final_University_ERMSP_Proposal.docx','cf876367bdc9bce51861b64bc2170db7eae460601480b37c08c5d9846c4440c5','MIT License','MR DINNEH','Permission Granted','Yes','Internet Source','Teaching',60,'MEDIUM RISK','File detected: Final_University_ERMSP_Proposal.docx\nFile type: DOCX\nFile size: 0.04 MB\nDuplicate resource detected in repository.','Manual review recommended.','2026-06-11 09:01:23'),(6,1,'CV','DOCX','Winifred_Koroma__CV (1).docx','34a7721431e18897dc760fcea1e1981f2c885194ca3f0fb1b54473d99c518397','MIT License','MR DINNEH','Permission Granted','Yes','Original Work','Teaching',5,'LOW RISK','File detected: Winifred_Koroma__CV (1).docx\nFile type: DOCX\nFile size: 0.02 MB','Safe to proceed.','2026-06-11 18:37:15'),(7,1,'CV','DOCX','Winifred_Koroma__CV (1).docx','34a7721431e18897dc760fcea1e1981f2c885194ca3f0fb1b54473d99c518397','No License','MR DINNEH','No Permission','No','Third Party Resource','Public Sharing',100,'HIGH RISK','File detected: Winifred_Koroma__CV (1).docx\nFile type: DOCX\nFile size: 0.02 MB\nDuplicate resource detected in repository.','High legal risk detected.','2026-06-11 19:33:15'),(8,1,'CV5','DOCX','Winifred_Koroma__CV (1).docx','34a7721431e18897dc760fcea1e1981f2c885194ca3f0fb1b54473d99c518397','No License','MR DINNEH','No Permission','No','Third Party Resource','Public Sharing',100,'HIGH RISK','File detected: Winifred_Koroma__CV (1).docx\nFile type: DOCX\nFile size: 0.02 MB\nDuplicate resource detected in repository.','High legal risk detected.','2026-06-11 19:38:56'),(9,1,'PROJECT ','DOCX','Revised_9_Page_Proposal.docx','7652388959c6d97694aee40c3102e07646f4afb748e387cc8d99b26379441dfe','No License','LIMKOKWING UNIVERSITY','No Permission','No','Third Party Resource','Public Sharing',100,'HIGH RISK','File detected: Revised_9_Page_Proposal.docx\nFile type: DOCX\nFile size: 0.11 MB','High legal risk detected.','2026-06-13 05:29:01'),(10,1,'NOTE 1','DOCX','Winifred_Koroma__CV (1).docx','34a7721431e18897dc760fcea1e1981f2c885194ca3f0fb1b54473d99c518397','No License','MR DINNEH','No Permission','No','Institution Resource','Public Sharing',100,'HIGH RISK','File detected: Winifred_Koroma__CV (1).docx\nFile type: DOCX\nFile size: 0.02 MB\nDuplicate resource detected in repository.','High legal risk detected.','2026-06-13 13:23:02'),(11,1,'1','Audio','20260604201346_crab_audio-current-news-278540 (1).mp3','1ed5619be80dce455317a8221025f83eca5577abdb67084bdd1a6c1d9f591aaa','MIT License','LIMKOKWING UNIVERSITY','Permission Granted','Yes','Original Work','Teaching',5,'LOW RISK','File detected: 20260604201346_crab_audio-current-news-278540 (1).mp3\nFile type: MP3\nFile size: 2.02 MB','Safe to proceed.','2026-06-13 14:18:54');
/*!40000 ALTER TABLE `legal_analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_rules`
--

DROP TABLE IF EXISTS `license_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_name` varchar(100) DEFAULT NULL,
  `commercial_use` varchar(20) DEFAULT NULL,
  `modification_allowed` varchar(20) DEFAULT NULL,
  `redistribution_allowed` varchar(20) DEFAULT NULL,
  `attribution_required` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_rules`
--

LOCK TABLES `license_rules` WRITE;
/*!40000 ALTER TABLE `license_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `category` varchar(100) DEFAULT NULL,
  `resource_type` varchar(50) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `license_type` varchar(100) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `permission_status` varchar(100) DEFAULT NULL,
  `sdg_goal` varchar(50) DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `approved` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `analysis_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'IT LAW LECTURES','Intellutual Property Rights Notes','Books','PDF','20260531084104_WEEK2-I.T_LAW_IPR_LEGAL_ISSUES_-MARCH_2026_-AUG_2026_1.pptx','Creative Commons','LIMKOKWING UNIVERSITY','Permission Granted','SDG 4',2,1,'2026-05-31 08:41:04',NULL),(3,'FUNDERMENTALS OF ENTRE','VSVCJSAVC,SAB KA,M Z,M ','NOTES','PDF','20260602021930_CleanLoopProject3Presentation-2pptx_1.pptx','Apache 2.0','LIMKOKWING UNIVERSITY','Permission Granted','SDG 4',5,1,'2026-06-02 02:19:30',NULL),(4,'HEALTH STUDIES','Clip that shows how the human anatomy looks like.','Videos','Video','20260604195800_4169-177682161.mp4','Creative Commons','PIXABAY','Permission Granted','SDG 4',2,1,'2026-06-04 19:58:01',NULL),(5,'Educational Documentary','Plain audio background for educational documentary','Audio','Audio','20260604201346_crab_audio-current-news-278540.mp3','Creative Commons','PIXABAY','Permission Granted','SDG 4',2,1,'2026-06-04 20:13:46',NULL),(6,'Dart Programming','Display of how Dart Programming structures like.','Videos','Video','20260604205528_200675-913478706_medium.mp4','MIT License','PIXABAY','Permission Granted','SDG 4',2,-1,'2026-06-04 20:55:28',NULL),(7,'Dart Programming','Preview of how the structure looks like.','Videos','Video','20260604205705_200675-913478706_medium.mp4','MIT License','PIXABAY','Permission Granted','SDG 4',2,1,'2026-06-04 20:57:05',NULL),(12,'1','a scbnbsanbncsa cbsacs','Audio','Audio','20260613234958_20260604201346_crab_audio-current-news-278540_1.mp3','MIT License','LIMKOKWING UNIVERSITY','Permission Granted','SDG 4 - Quality Education',2,-1,'2026-06-13 23:49:58',11);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Student','Teacher','Admin') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Osman Bah','bah@gmail.com','scrypt:32768:8:1$e7MkrausCIvjJvfD$fa88811bd6fdb461705d8fec93a809d56a5caf9b765cf5300bac4f2872a1b00f99ee9ab2739b2f327ab02a36450d21cb4f1170fd40632cbebd3238ecc0f12940','Teacher','2026-05-30 21:54:59'),(2,'Mr Sheku Dinneh','sheku.dkamara@Limkokwing.edu.sl','scrypt:32768:8:1$rEuYjmmtpWk5rTkO$f45cae3164e6625d35b84099a529af8c47f68bbab01ebdb21ca0aeae4bc5296fd973d8103dbee65efd228aef6aaf22835a8b5d0976f243685663443327de0979','Teacher','2026-05-31 08:36:37'),(3,'Benson Thomas','bt8056244@gmail.com','scrypt:32768:8:1$gUmnZRVlbrFSLq11$40390527c9126cedbe127f1e527fafaed5685733a7c22772051275c6b7cf3712bd4306b587bf087df8aaf59348932ed2b8cca25738bd697e3b69a9d993ce5f54','Student','2026-05-31 08:38:02'),(4,'Admin User','admin@edurights.sl','scrypt:32768:8:1$tf6EBu0cApfpwMsY$a7685f916e7719f6c3c5269ee56a9fa9e46c66d80e455368bfd9f95fda7cc477d3ac1434d65e6073c9d03cec32a23028350e98f2b53d2aab3a029a3efa8e11bf','Admin','2026-05-31 08:41:47'),(5,'Abu Turay','turay@gmail.com','scrypt:32768:8:1$XCQpXE13ueVmAjaa$a60d82aa446209a02de59b4899b483f0ac68739485e561209e0d223509f07aa065c0449ff5cf63f8140a27bb023b67e6f5883eacffdec965c12050c3a96ea35c','Teacher','2026-06-02 02:16:48'),(6,'Kenneth Olu Jones','kenneth@gmail.com','scrypt:32768:8:1$7VGzLV0UgXL2rjZ7$7a140d0efc9b7d1c6f4024fd4ca8d0352970923eceaed30f96a0c8f63cc06912fe54886394d1e00f7e18ac46d60abf195d58522c4455eda1e2a93b092c603549','Student','2026-06-12 13:04:06'),(7,'Khadijah Kubra','kubra@gmail.com','scrypt:32768:8:1$C7dinPde5EM99ETs$d0666a77e318f9c6525ea4bf28e03bf96756230384e7de10cdaee6dbe2d723ca9d561abe5c4afbf413f6e6f52257f0812d0b11a884d5136b319d9aedd14eab7a','Student','2026-06-13 02:37:25');
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

-- Dump completed on 2026-06-15  6:18:43
