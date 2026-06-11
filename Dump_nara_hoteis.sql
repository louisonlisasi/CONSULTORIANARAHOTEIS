CREATE DATABASE  IF NOT EXISTS `narahoteis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `narahoteis`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: anshmmysql03    Database: narahoteis
-- ------------------------------------------------------
-- Server version	8.0.25-commercial

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '1d852943-0b7d-11ec-8741-005056b5d5bc:1-29,
813cf34f-046f-11ec-b6a2-005056b51ba0:1-546,
9e9de971-3bf3-11e7-a7b6-005056b57cad:1-3600835632:3601077533-3602728695,
9fdf9595-e5b0-11eb-847a-005056b5a1b3:1-2018302942,
ab7b9683-9300-11e7-a0af-005056b5bd0e:1-121807679,
de59293e-a212-11e6-b3b6-0021f69a14de:1-167324947';

--
-- Table structure for table `canais_venda`
--

DROP TABLE IF EXISTS `canais_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canais_venda` (
  `id_canal` int NOT NULL,
  `nome_canal` varchar(45) NOT NULL,
  `comissao_pct` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_canal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cidade_origem` varchar(45) DEFAULT NULL,
  `estado_origem` varchar(45) DEFAULT NULL,
  `faixa_etaria` varchar(45) DEFAULT NULL,
  `tipo_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionarios` int NOT NULL AUTO_INCREMENT,
  `id_unidade` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `salario` decimal(8,2) NOT NULL,
  `data_admissao` date DEFAULT NULL,
  PRIMARY KEY (`id_funcionarios`),
  KEY `id_unidade_idx` (`id_unidade`),
  CONSTRAINT `id_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidades` (`id_unidade`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_unidade` int NOT NULL,
  `id_tipo_quarto` int NOT NULL,
  `id_canal` int DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `data_checkin` datetime NOT NULL,
  `qtd_diarias` int NOT NULL,
  `num_hospedes` int NOT NULL,
  `avaliacao_hospede` decimal(8,2) DEFAULT NULL,
  `status_reserva` varchar(45) DEFAULT NULL,
  `forma_pagamento` varchar(45) DEFAULT NULL,
  `checkout` datetime NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_tipo_quarto_idx` (`id_tipo_quarto`),
  KEY `id_canal_idx` (`id_canal`),
  KEY `id_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_canal` FOREIGN KEY (`id_canal`) REFERENCES `canais_venda` (`id_canal`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `id_tipo_quarto` FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipos_quarto` (`id_tipo_quarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_quarto`
--

DROP TABLE IF EXISTS `tipos_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_quarto` (
  `id_tipo_quarto` int NOT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `capacidade_max` int NOT NULL,
  `valor_diaria_base` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_tipo_quarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `id_unidade` int NOT NULL AUTO_INCREMENT,
  `nome_unidade` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `regiao` varchar(45) DEFAULT NULL,
  `categoria_hotel` varchar(45) DEFAULT NULL,
  `num_quartos_total` int DEFAULT NULL,
  PRIMARY KEY (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-05 10:55:44
