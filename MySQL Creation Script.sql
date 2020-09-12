CREATE DATABASE  IF NOT EXISTS `sga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sga`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: sga
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `legajo_a` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` int NOT NULL,
  `genero` tinyint NOT NULL,
  `telefono` int NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  `nacimiento` date NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`legajo_a`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=100181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (100037,'Carlos','Menaier',38891236,0,1133375359,'Hipolito Yrigoyen 3248','1995-03-11',1),(100038,'Fernando','Gordillo',32152492,0,46125382,'Hemingway 312','1991-04-13',1),(100039,'Lucia','Perez',40251348,1,1132584525,'La Valle 912','1998-02-19',1),(100140,'Derek','Reese',34409117,0,555830601,'P.O. Box 661, 3976 Malesuada Rd.','1989-06-01',1),(100141,'Zephr','Farrell',18336411,1,630691636,'P.O. Box 695, 4405 Pretium Av.','2001-12-10',1),(100142,'Steven','Chambers',36145011,0,149353399,'Ap #479-4521 Nonummy. Road','1978-02-15',1),(100143,'Vivian','Whitney',42864641,0,227615367,'715-9373 Scelerisque Ave','1997-11-03',1),(100144,'Courtney','Summers',19011273,0,682611443,'Ap #902-5268 Sociosqu Street','1987-01-21',1),(100145,'Stephen','Jennings',33945840,0,543614191,'4843 Et, Ave','2000-05-31',1),(100146,'Reese','Carpenter',28096154,0,1166298068,'Ap #436-7556 Accumsan St.','1997-09-28',1),(100147,'Kelly','Mccarty',37205167,0,693881107,'Ap #315-8223 Duis Av.','2000-03-03',1),(100148,'Lunea','Sears',26663505,0,740849794,'Ap #467-7225 Et Av.','1966-03-15',1),(100149,'Brody','Austin',15524285,1,1065086204,'408-6086 Ridiculus Rd.','1980-03-09',1),(100150,'Rebecca','Rowland',10002294,0,937003015,'Ap #458-4899 Commodo Rd.','2000-07-14',1),(100151,'Gray','Long',42129069,0,831653182,'3649 Ut Av.','1987-01-21',1),(100152,'Luke','Cardenas',14362743,0,837369163,'730-7055 Quis St.','1993-01-25',1),(100153,'Lawrence','Kemp',40230800,1,1152042320,'639 Quis Avenue','1994-04-08',1),(100154,'Levi','Fulton',22370517,0,814037874,'148-6885 Mus. Street','1988-06-13',1),(100155,'Irma','Fletcher',17972311,0,350042263,'Ap #931-5898 Ante. St.','1997-05-03',1),(100156,'Upton','Gill',42442998,0,925039397,'994-6817 Mattis. Rd.','1993-05-24',1),(100157,'Sacha','Skinner',31524979,0,160285631,'P.O. Box 555, 8188 Proin Road','1997-04-07',1),(100158,'Emery','Wright',18353309,1,582140135,'817-1832 Augue Street','2000-03-07',1),(100159,'Gregory','Kinney',29213648,1,338857940,'Ap #621-2859 Eu St.','1999-09-06',1),(100160,'Brenda','Valentine',35954423,1,875758453,'P.O. Box 379, 3882 Ac St.','1997-06-07',1),(100161,'Wyoming','Blankenship',16813497,0,70176631,'847-4621 Scelerisque Avenue','1998-09-05',1),(100162,'Kendall','Stokes',22646053,1,832178713,'Ap #685-1907 Lacinia Rd.','1985-06-23',1),(100163,'Lucian','Ware',13258998,1,286760099,'849-2834 Cras Av.','1999-09-28',1),(100164,'Dieter','Mcdonald',10163213,0,249362487,'Ap #458-3225 Nunc Road','1955-06-12',1),(100165,'Orli','Moore',28814501,0,680202846,'787-6295 Aliquet Rd.','1994-09-05',1),(100166,'George','Boyle',38922233,1,667100859,'P.O. Box 695, 5564 Tincidunt Avenue','2019-10-11',1),(100167,'Howard','Maynard',35717298,0,757309276,'2240 Vehicula. Ave','1996-12-30',1),(100168,'Charles','Robbins',33923130,1,722393805,'6461 Rhoncus Av.','1999-09-20',1),(100169,'August','Osborne',17958835,0,293671474,'P.O. Box 300, 3569 Ultricies Avenue','1968-10-27',1),(100170,'Megan','Pearson',11400345,0,576948441,'Ap #132-4748 Erat St.','1996-07-27',1),(100171,'Igor','Kelley',29704887,1,212681242,'Ap #247-1574 Tempus Av.','1999-09-30',1),(100172,'Erich','Randolph',21497282,1,834645928,'2413 In St.','1986-11-21',1),(100173,'Xander','Dillon',28547040,0,320887958,'Ap #125-9426 Morbi Avenue','1982-02-27',1),(100174,'Kaden','Odom',13696708,0,467149871,'Ap #701-1538 Enim. Rd.','1987-01-03',1),(100175,'Asher','Nichols',22453998,1,367650487,'628-922 Vivamus Avenue','1973-08-13',1),(100176,'Zeph','Griffin',28084751,0,555397700,'P.O. Box 678, 7035 Elit Rd.','1985-11-01',1),(100177,'Kaitlin','Francis',22354086,1,133945006,'Ap #113-2458 Vivamus Rd.','1999-01-30',1),(100178,'Adrian','Booker',17870553,0,1013721346,'P.O. Box 854, 9320 Tellus Rd.','1995-09-29',1),(100179,'Pepe','Suarez',21212145,0,11111111,'Presidente Hipolito Yrigoyen 3248','2001-12-18',1);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_x_curso`
--

DROP TABLE IF EXISTS `alumnos_x_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos_x_curso` (
  `id_curso` smallint NOT NULL,
  `legajo_a` int NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '0',
  `parcial1` tinyint DEFAULT NULL,
  `parcial2` tinyint DEFAULT NULL,
  `recu1` tinyint DEFAULT NULL,
  `recu2` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_curso`,`legajo_a`),
  KEY `legajo_a_idx` (`legajo_a`),
  CONSTRAINT `id_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  CONSTRAINT `legajo_a` FOREIGN KEY (`legajo_a`) REFERENCES `alumnos` (`legajo_a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_x_curso`
--

LOCK TABLES `alumnos_x_curso` WRITE;
/*!40000 ALTER TABLE `alumnos_x_curso` DISABLE KEYS */;
INSERT INTO `alumnos_x_curso` VALUES (10034,100037,0,2,NULL,NULL,NULL),(10034,100038,0,2,2,NULL,NULL),(10034,100039,0,1,NULL,1,NULL),(10034,100149,0,NULL,NULL,NULL,NULL),(10034,100173,0,NULL,NULL,NULL,NULL),(10034,100177,0,NULL,NULL,NULL,NULL),(10035,100037,0,NULL,NULL,NULL,NULL),(10035,100038,0,NULL,NULL,NULL,NULL),(10035,100039,0,NULL,NULL,NULL,NULL),(10036,100039,0,NULL,NULL,NULL,NULL),(10036,100141,0,NULL,NULL,NULL,NULL),(10036,100142,0,NULL,NULL,NULL,NULL),(10036,100149,0,NULL,NULL,NULL,NULL),(10036,100155,0,NULL,NULL,NULL,NULL),(10036,100157,0,NULL,NULL,NULL,NULL),(10036,100161,0,NULL,NULL,NULL,NULL),(10037,100038,0,NULL,NULL,NULL,NULL),(10037,100142,0,NULL,NULL,NULL,NULL),(10037,100149,0,NULL,NULL,NULL,NULL),(10037,100152,0,NULL,NULL,NULL,NULL),(10037,100178,0,NULL,NULL,NULL,NULL),(10038,100146,0,2,NULL,NULL,NULL),(10038,100149,0,6,NULL,NULL,NULL),(10038,100155,0,10,NULL,NULL,NULL),(10038,100158,0,6,NULL,NULL,NULL),(10038,100161,0,NULL,NULL,NULL,NULL),(10038,100173,0,8,NULL,NULL,NULL),(10038,100178,0,NULL,NULL,NULL,NULL),(10039,100149,0,NULL,NULL,NULL,NULL),(10039,100178,0,2,NULL,NULL,NULL),(10039,100179,0,8,NULL,NULL,NULL);
/*!40000 ALTER TABLE `alumnos_x_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alumnoscurso`
--

DROP TABLE IF EXISTS `alumnoscurso`;
/*!50001 DROP VIEW IF EXISTS `alumnoscurso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnoscurso` AS SELECT 
 1 AS `legajo_a`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alumnosotros`
--

DROP TABLE IF EXISTS `alumnosotros`;
/*!50001 DROP VIEW IF EXISTS `alumnosotros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnosotros` AS SELECT 
 1 AS `legajo_a`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alumnostodos`
--

DROP TABLE IF EXISTS `alumnostodos`;
/*!50001 DROP VIEW IF EXISTS `alumnostodos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnostodos` AS SELECT 
 1 AS `legajo_a`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `dni`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` smallint NOT NULL AUTO_INCREMENT,
  `id_materia` smallint NOT NULL,
  `legajo_p` mediumint NOT NULL,
  `periodo` year NOT NULL,
  `cuatrimestre` tinyint NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `id_materia_idx` (`id_materia`),
  KEY `legajo_p_idx` (`legajo_p`),
  CONSTRAINT `id_materia` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  CONSTRAINT `legajo_p` FOREIGN KEY (`legajo_p`) REFERENCES `profesores` (`legajo_p`)
) ENGINE=InnoDB AUTO_INCREMENT=10040 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (10034,2813,10007,2019,1),(10035,8127,10010,2019,0),(10036,1945,10008,2018,1),(10037,9125,10009,2020,0),(10038,8125,10007,2019,1),(10039,3751,10012,2019,1);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id_materia` smallint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=9126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1945,'Elementos de Investigación Operativa'),(2311,'Laboratorio de Computacióon  II'),(2356,'Programación II'),(2518,'Programación'),(2813,'Programación III'),(3751,'Sistemas de Procesamiento de Datos'),(5214,'Laboratorio de Computacióon  IV'),(8125,'Laboratorio de Computacióon I'),(8127,'Diseño y Administracion de Bases de Datos'),(9124,'Ingles I'),(9125,'Ingles II');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `legajo_p` mediumint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` int NOT NULL,
  `clave` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  `nacimiento` date NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`legajo_p`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (10007,'Batata','Chernarus',42251384,'123','0',47617208,'Calle Falsa 123','1989-02-06',1),(10008,'Martin','Antolini',25123945,'123','0',1182694532,'Av Garbanzo 251','1979-05-24',1),(10009,'Marta','Lopez',29124857,'123','1',1167491234,'Esmeralda 241','1972-09-12',1),(10010,'Pablo','Solowieczyk',18524913,'123','0',1185423961,'Hemingway 312','1991-04-07',1),(10011,'Raul','Franade',21524852,'123','0',11524895,'Mandioca 2548','1981-02-05',1),(10012,'Maartin','Longedo',20202020,'1234','0',123123123,'CALLE 8','1950-03-31',1);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `alumnoscurso`
--

/*!50001 DROP VIEW IF EXISTS `alumnoscurso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnoscurso` AS select `axc`.`legajo_a` AS `legajo_a` from (`alumnos_x_curso` `axc` join `alumnos` `a` on((`axc`.`legajo_a` = `a`.`legajo_a`))) where (`axc`.`id_curso` = 10034) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alumnosotros`
--

/*!50001 DROP VIEW IF EXISTS `alumnosotros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnosotros` AS select `axc`.`legajo_a` AS `legajo_a` from (`alumnos_x_curso` `axc` join `cursos` `c` on((`axc`.`id_curso` = `c`.`id_curso`))) where ((`c`.`id_materia` = 2813) and (`c`.`periodo` = 2019) and (`c`.`cuatrimestre` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alumnostodos`
--

/*!50001 DROP VIEW IF EXISTS `alumnostodos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnostodos` AS select `a`.`legajo_a` AS `legajo_a`,`a`.`nombre` AS `nombre`,`a`.`apellido` AS `apellido`,`a`.`dni` AS `dni` from `alumnos` `a` where (`a`.`activo` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-12 18:38:41
