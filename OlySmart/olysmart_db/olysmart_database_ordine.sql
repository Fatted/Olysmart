-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: olysmart_database
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `codice` int NOT NULL AUTO_INCREMENT COMMENT 'il codice dell''ordine che verrà preso in carico dal corriere che effettuerà la spedizione',
  `numero` int DEFAULT NULL COMMENT 'numero dell''ordine',
  `costo_spedizione` int DEFAULT NULL COMMENT 'costo di spedizione da pagare in più per ricevere il prodotto a casa',
  `costo_totale` int DEFAULT NULL COMMENT 'costo totale dell''ordine che il compratore dovrà pagare(deve essere uguale a quello del carrello dove poi sommeremo la spedizione)',
  `data` char(45) DEFAULT NULL COMMENT 'data di effetuazione dell''ordine',
  `tipo` char(45) DEFAULT NULL COMMENT 'Reso,Confermato,Spedito,Annullato,Consegnato',
  `username` char(45) DEFAULT NULL,
  `codice_spedizione` int DEFAULT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `codice.ordine_UNIQUE` (`codice`),
  KEY `Chiavespedizione.ordine_idx` (`codice_spedizione`),
  KEY `Chiavepagamentocarrello.ordine_idx` (`costo_totale`),
  KEY `chiave_esterna.ordine->cliente_idx` (`username`),
  CONSTRAINT `chiave_esterna.ordine->cliente` FOREIGN KEY (`username`) REFERENCES `cliente` (`username`),
  CONSTRAINT `chiave_esterna.ordine->spedizione` FOREIGN KEY (`codice_spedizione`) REFERENCES `spedizione` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='l''ordine non è il carrello ma e ciò che l''utente ha effettivamente comprato che poi verrà spedito.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 19:37:58
