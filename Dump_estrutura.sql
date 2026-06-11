CREATE DATABASE  IF NOT EXISTS `narahoteis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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

--
-- Table structure for table `canais_venda`
--

DROP TABLE IF EXISTS `canais_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canais_venda` (
  `id_canal` int NOT NULL,
  `nome_canal` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `comissao_pct` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_canal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nome` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade_origem` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado_origem` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `faixa_etaria` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_cliente` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionarios` int NOT NULL,
  `id_unidade` int NOT NULL,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `cargo` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `departamento` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `salario` decimal(10,0) NOT NULL,
  `data_admissao` date DEFAULT NULL,
  PRIMARY KEY (`id_funcionarios`),
  KEY `id_unidade_idx` (`id_unidade`),
  CONSTRAINT `id_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidades` (`id_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id_cliente` int NOT NULL,
  `id_canal` int DEFAULT NULL,
  `data_checkin` datetime NOT NULL,
  `checkout` datetime NOT NULL,
  `qtd_diarias` int NOT NULL,
  `num_hospedes` int NOT NULL,
  `avaliacao_hospede` decimal(8,2) DEFAULT NULL,
  `status_reserva` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `forma_pagamento` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_tipo_quarto_idx` (`id_tipo_quarto`),
  KEY `id_canal_idx` (`id_canal`),
  KEY `id_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_canal` FOREIGN KEY (`id_canal`) REFERENCES `canais_venda` (`id_canal`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `id_tipo_quarto` FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipos_quarto` (`id_tipo_quarto`)
) ENGINE=InnoDB AUTO_INCREMENT=2458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipos_quarto`
--

DROP TABLE IF EXISTS `tipos_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_quarto` (
  `id_tipo_quarto` int NOT NULL,
  `descricao` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `capacidade_max` int NOT NULL,
  `valor_diaria_base` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_tipo_quarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `id_unidade` int NOT NULL AUTO_INCREMENT,
  `nome_unidade` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `regiao` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `categoria_hotel` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `num_quartos_total` int DEFAULT NULL,
  PRIMARY KEY (`id_unidade`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-09 10:19:54
