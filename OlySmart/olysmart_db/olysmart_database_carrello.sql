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
-- Table structure for table `carrello`
--

DROP TABLE IF EXISTS `carrello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrello` (
  `codice_ordine.carrello` int NOT NULL COMMENT 'codice ordine del carrello che cobacia con il codice cell''ordine (chiave esterna)',
  `codice_prodotto.carrello` int NOT NULL COMMENT 'codice prodotto carrello che coincide con il codice del prodotto',
  `prezzo_unitario_prodotto.carrello` double NOT NULL COMMENT 'coincide con il prezzo singolo del prodotto',
  `iva.carrello` int NOT NULL COMMENT 'iva del singolo prodotto nel carrello',
  `prezzo_totale.carrello` double NOT NULL COMMENT 'prezzo totale da pagare non compreso di spedizione',
  `numero_prodotto_singolo.carrello` int NOT NULL,
  `numero_prodotti_totali.carrello` int NOT NULL,
  KEY `Chiave.esterna.carrello->ordine_idx` (`codice_ordine.carrello`),
  KEY `Chiaveprodotto.carrello_idx` (`codice_prodotto.carrello`),
  CONSTRAINT `chiave_esterna.carrello->ordine` FOREIGN KEY (`codice_ordine.carrello`) REFERENCES `ordine` (`codice.ordine`),
  CONSTRAINT `chiave_esterna.carrello->prodotto` FOREIGN KEY (`codice_prodotto.carrello`) REFERENCES `prodotto` (`codice.prodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello`
--

LOCK TABLES `carrello` WRITE;
/*!40000 ALTER TABLE `carrello` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrello` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-21 22:21:00
