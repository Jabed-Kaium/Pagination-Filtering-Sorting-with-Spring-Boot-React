-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pagination
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Matt@gmail.com','Sam','55000'),(2,'Ann@gmail.com','Jennifer','55000'),(3,'Sam@yahoo.com','Ann','65000'),(4,'Sam@gmail.com','Ann','35000'),(5,'George@hotmail.com','Jennifer','55000'),(6,'Jennifer@gmail.com','George','35000'),(7,'Jennifer@hotmail.com','Ann','55000'),(8,'George@hotmail.com','George','35000'),(9,'Jennifer@gmail.com','Matt','25000'),(10,'Matt@gmail.com','Ann','65000'),(11,'Matt@yahoo.com','George','25000'),(12,'Ann@gmail.com','George','55000'),(13,'Matt@yahoo.com','Sam','45000'),(14,'Ann@hotmail.com','Ann','35000'),(15,'George@gmail.com','Matt','25000'),(16,'Matt@hotmail.com','Sam','45000'),(17,'Ann@yahoo.com','Ann','55000'),(18,'George@yahoo.com','Matt','45000'),(19,'George@yahoo.com','Ann','25000'),(20,'Jennifer@hotmail.com','Matt','45000'),(21,'Jennifer@yahoo.com','Sam','55000'),(22,'Sam@yahoo.com','Sam','25000'),(23,'Jennifer@gmail.com','George','35000'),(24,'Sam@yahoo.com','Ann','45000'),(25,'Matt@gmail.com','Matt','55000'),(26,'Jennifer@hotmail.com','George','45000'),(27,'Matt@hotmail.com','Sam','55000'),(28,'Sam@gmail.com','George','25000'),(29,'George@gmail.com','Matt','35000'),(30,'Jennifer@gmail.com','George','35000'),(31,'Matt@gmail.com','Matt','55000'),(32,'Jennifer@gmail.com','Sam','45000'),(33,'George@hotmail.com','Matt','55000'),(34,'Ann@hotmail.com','Jennifer','25000'),(35,'Ann@yahoo.com','Matt','45000'),(36,'George@hotmail.com','George','65000'),(37,'Matt@gmail.com','Ann','65000'),(38,'George@hotmail.com','Sam','55000'),(39,'George@gmail.com','Ann','25000'),(40,'Sam@yahoo.com','Matt','45000'),(41,'Ann@yahoo.com','Matt','45000'),(42,'Sam@gmail.com','Sam','55000'),(43,'Matt@gmail.com','Sam','35000'),(44,'Matt@hotmail.com','George','25000'),(45,'Ann@gmail.com','Ann','55000'),(46,'Sam@hotmail.com','Ann','35000'),(47,'Matt@yahoo.com','George','55000'),(48,'Ann@hotmail.com','Matt','25000'),(49,'Sam@hotmail.com','Matt','25000'),(50,'Jennifer@hotmail.com','Ann','65000'),(51,'Jennifer@yahoo.com','Ann','45000'),(52,'Ann@gmail.com','Matt','55000'),(53,'Ann@hotmail.com','Ann','55000'),(54,'Jennifer@gmail.com','Jennifer','55000'),(55,'Jennifer@gmail.com','Ann','55000'),(56,'Ann@hotmail.com','Jennifer','55000'),(57,'Ann@yahoo.com','Sam','55000'),(58,'George@yahoo.com','George','25000'),(59,'Matt@gmail.com','Matt','25000'),(60,'Jennifer@yahoo.com','Sam','45000'),(61,'Sam@hotmail.com','Ann','55000'),(62,'George@yahoo.com','Ann','45000'),(63,'George@hotmail.com','George','35000'),(64,'Jennifer@yahoo.com','George','65000'),(65,'Jennifer@gmail.com','Jennifer','35000'),(66,'George@gmail.com','George','45000'),(67,'George@yahoo.com','Sam','55000'),(68,'Ann@yahoo.com','Ann','25000'),(69,'Ann@hotmail.com','Sam','25000'),(70,'Matt@yahoo.com','Sam','45000'),(71,'George@hotmail.com','Matt','25000'),(72,'Sam@hotmail.com','Jennifer','35000'),(73,'Ann@yahoo.com','George','65000'),(74,'George@gmail.com','George','45000'),(75,'Matt@yahoo.com','George','35000'),(76,'Sam@gmail.com','Jennifer','35000'),(77,'Ann@hotmail.com','Jennifer','45000'),(78,'George@yahoo.com','Ann','25000'),(79,'Sam@yahoo.com','George','55000'),(80,'George@gmail.com','Matt','65000'),(81,'Matt@gmail.com','Matt','25000'),(82,'Jennifer@hotmail.com','Sam','65000'),(83,'George@hotmail.com','George','55000'),(84,'George@hotmail.com','George','55000'),(85,'Matt@yahoo.com','Ann','25000'),(86,'Ann@gmail.com','George','25000'),(87,'Jennifer@hotmail.com','Jennifer','55000'),(88,'Jennifer@yahoo.com','Jennifer','45000'),(89,'Jennifer@yahoo.com','Ann','45000'),(90,'Ann@yahoo.com','Matt','35000'),(91,'Matt@hotmail.com','Matt','35000'),(92,'Jennifer@hotmail.com','George','25000'),(93,'George@hotmail.com','Jennifer','65000'),(94,'Ann@hotmail.com','Ann','55000'),(95,'Jennifer@hotmail.com','George','55000'),(96,'Matt@yahoo.com','Jennifer','35000'),(97,'Jennifer@yahoo.com','Sam','25000'),(98,'Sam@yahoo.com','Ann','55000'),(99,'Sam@hotmail.com','Sam','55000'),(100,'Matt@hotmail.com','Ann','25000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (1);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-07  0:10:10
