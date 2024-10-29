-- MySQL dump 10.13  Distrib 9.0.1, for macos14.4 (x86_64)
--
-- Host: localhost    Database: dispr_development
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2024-10-24 08:21:29.634600','2024-10-24 08:21:29.634600');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloc_dirigeants`
--

DROP TABLE IF EXISTS `bloc_dirigeants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloc_dirigeants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_naissance` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `nom_usuel` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `demande_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bloc_dirigeants_on_demande_id` (`demande_id`),
  CONSTRAINT `fk_rails_e2cd3d068d` FOREIGN KEY (`demande_id`) REFERENCES `demandes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloc_dirigeants`
--

LOCK TABLES `bloc_dirigeants` WRITE;
/*!40000 ALTER TABLE `bloc_dirigeants` DISABLE KEYS */;
INSERT INTO `bloc_dirigeants` VALUES (5,'gauthier','inaki','inaki gauthier','2024-10-25',7,'2024-10-24 15:16:44.579480','2024-10-24 15:16:44.579480'),(8,'GAUTHIER','Inaki','GAUTHIER','1992-07-15',8,'2024-10-25 15:00:32.148484','2024-10-25 15:00:32.148484');
/*!40000 ALTER TABLE `bloc_dirigeants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloc_materiels`
--

DROP TABLE IF EXISTS `bloc_materiels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloc_materiels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_insee_materiel` varchar(255) DEFAULT NULL,
  `materiel_occasion` tinyint(1) DEFAULT NULL,
  `annee_materiel` varchar(255) DEFAULT NULL,
  `code_niveau_utilisation_materiel` varchar(255) DEFAULT NULL,
  `code_niveau_options_materiel` varchar(255) DEFAULT NULL,
  `nombre_materiel` int DEFAULT NULL,
  `demande_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bloc_materiels_on_demande_id` (`demande_id`),
  CONSTRAINT `fk_rails_4dfc1995e6` FOREIGN KEY (`demande_id`) REFERENCES `demandes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloc_materiels`
--

LOCK TABLES `bloc_materiels` WRITE;
/*!40000 ALTER TABLE `bloc_materiels` DISABLE KEYS */;
INSERT INTO `bloc_materiels` VALUES (5,'ddd',0,'ddd','ddd','ddd',1,7,'2024-10-24 15:16:44.576159','2024-10-24 15:16:44.576159'),(8,'361212',1,'2010','NEU','NEU',1,8,'2024-10-25 15:00:32.141908','2024-10-25 15:00:32.141908');
/*!40000 ALTER TABLE `bloc_materiels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloc_plan_financements`
--

DROP TABLE IF EXISTS `bloc_plan_financements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloc_plan_financements` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `premier_loyer` varchar(255) DEFAULT NULL,
  `code_amortissement` varchar(255) DEFAULT NULL,
  `vr` varchar(255) DEFAULT NULL,
  `demande_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bloc_plan_financements_on_demande_id` (`demande_id`),
  CONSTRAINT `fk_rails_acafa7fb21` FOREIGN KEY (`demande_id`) REFERENCES `demandes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloc_plan_financements`
--

LOCK TABLES `bloc_plan_financements` WRITE;
/*!40000 ALTER TABLE `bloc_plan_financements` DISABLE KEYS */;
INSERT INTO `bloc_plan_financements` VALUES (5,'67','ajaj','anajqaj',7,'2024-10-24 15:16:44.572687','2024-10-24 15:16:44.572687'),(8,'15','L','10',8,'2024-10-25 15:00:32.134966','2024-10-25 15:00:32.134966');
/*!40000 ALTER TABLE `bloc_plan_financements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demande_responses`
--

DROP TABLE IF EXISTS `demande_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demande_responses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_demande` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `code` int DEFAULT NULL,
  `demande_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_demande_responses_on_demande_id` (`demande_id`),
  CONSTRAINT `fk_rails_f97904298a` FOREIGN KEY (`demande_id`) REFERENCES `demandes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demande_responses`
--

LOCK TABLES `demande_responses` WRITE;
/*!40000 ALTER TABLE `demande_responses` DISABLE KEYS */;
INSERT INTO `demande_responses` VALUES (1,'170715','Demande creee avec succes',201,8,'2024-10-25 15:29:20.110777','2024-10-25 15:29:20.110777');
/*!40000 ALTER TABLE `demande_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes`
--

DROP TABLE IF EXISTS `demandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demandes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reference_demande` varchar(255) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `login_vendeur` varchar(255) DEFAULT NULL,
  `duree` varchar(255) DEFAULT NULL,
  `montant` varchar(255) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `numero_siren` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `banque` varchar(255) DEFAULT 'franfinance',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes`
--

LOCK TABLES `demandes` WRITE;
/*!40000 ALTER TABLE `demandes` DISABLE KEYS */;
INSERT INTO `demandes` VALUES (7,'jdijdi3','test6','test3','56','25000','test','ORLFKFJ','2024-10-24 15:16:44.568086','2024-10-24 15:16:44.568086','franfinance'),(8,'TestInaki4','WSFL','FWSBAIL','26','5000','LF','326300167','2024-10-25 15:00:32.114620','2024-10-25 15:00:32.114620','franfinance');
/*!40000 ALTER TABLE `demandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20241024081418'),('20241024081423'),('20241024081427'),('20241024081431'),('20241024150701'),('20241025152113'),('20241025153323');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27 22:29:01
