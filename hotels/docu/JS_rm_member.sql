CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `lifestyle`
--

DROP TABLE IF EXISTS `lifestyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle` (
  `no` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subtype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `info_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `hours` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `guide` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle`
--

LOCK TABLES `lifestyle` WRITE;
/*!40000 ALTER TABLE `lifestyle` DISABLE KEYS */;
INSERT INTO `lifestyle` VALUES (1,'spa','씨메르','오션스파 씨메르','탁 트인 하늘과 바다의 화려한 경관을 자랑하는 하이앤드 오션스파<br>하늘과 바다가 맞닿은 듯한 오션스파 씨메르에서 지금껏 느껴보지 못한 영혼의 휴식을 경험해보시기 바랍니다.',NULL,'[1부] 08:00 ~ 11:10<br>[2부] 11:30 ~ 14:40<br>[3부] 15:00 ~ 18:10<br>[4부] 18:30 ~ 21:50<br>키즈존 10:00 ~ 18:00 (우천시 휴장)<br>아쿠아바 FOOD 11:30 ~ 19:40 / BEVERAGE 11:30 ~ 21:00<br><br>[7.16 ~ 8.31 기간]<br>[1부] 08:00 ~ 10:30<br>[2부] 10:50 ~ 13:20<br>[3부] 13:40 ~ 16:10<br>[4부] 16:30 ~ 19:00<br>[5부] 19:20 ~ 21:50<br>키즈존 10:00 ~ 18:00 (우천시 휴장)<br>아쿠아바 FOOD 11:00 ~ 20:00 / BEVERAGE 08:00 ~ 22:00','본관 4F','051-749-2358','2021-07-10 14:25:48','2021-07-10 14:25:48','※ 오션스파 씨메르 운영 안내<br><br>사회적 거리두기 참여 및 쾌적하고 안전한 오션스파 씨메르 이용을 위해 4부제 (7.16~8.31 : 5부제)로 운영하오니 양해 부탁드립니다.<br><br>* 각 부 종료 시 모든 고객이 퇴장 후 20분간 방역 및 클리닝을 실시합니다.<br>* 각 부 시간별 적정 인원이 초과되면 부득이 하게 입장이 제한 됩니다.<br>* 객실 예약 시 등록 된 인원 수 만큼 입장이 가능합니다.<br>* 사회적 거리두기 일환으로 락커 대여를 제한하고 있으니 객실에서 수영복으로 갈아 입으시고 이용바랍니다.<br>* 스낵바 운영을 중단하오니 양해바랍니다.');
/*!40000 ALTER TABLE `lifestyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifestyle_facility`
--

DROP TABLE IF EXISTS `lifestyle_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle_facility` (
  `lifeFacility_no` int NOT NULL AUTO_INCREMENT,
  `lifeFacility_image_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lifeFacility_image_size` int DEFAULT NULL,
  `lifeFacility_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lifeFacility_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lifestyle_no` int NOT NULL,
  PRIMARY KEY (`lifeFacility_no`),
  KEY `fk_lifestyle_facility_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_facility_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle_facility`
--

LOCK TABLES `lifestyle_facility` WRITE;
/*!40000 ALTER TABLE `lifestyle_facility` DISABLE KEYS */;
INSERT INTO `lifestyle_facility` VALUES (1,'spa-cimer3.jpg',90747,'Infinity Spa','오션스파 씨메르의 대표공간 인피니티 스파. 꿈꿔왔던 눈부신 태양과 조우하고 동경해온 푸른 하늘과 하나가 되며 평생 잊지 못할 드넓은 바다가 눈 앞에 펼쳐집니다.',1),(2,'spa-cimer4.jpg',96395,'Aqua Bar','오션스파 씨메르의 아쿠아 바에서는 다양하고 수준 높은 다이닝을 즐기실 수 있습니다.',1),(3,'spa-cimer5.jpg',93332,'청옥사우나','지친 일상에 힘이 되어줄 오션스파 씨메르의 청옥사우나. 이 곳을 방문한 당신은 새로운 활기와 따뜻한 온기를 언제나 사계절 내내 경험 하실 수 있습니다.',1);
/*!40000 ALTER TABLE `lifestyle_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifestyle_image`
--

DROP TABLE IF EXISTS `lifestyle_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle_image` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `lifestyle_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_lifestyle_image_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_image_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle_image`
--

LOCK TABLES `lifestyle_image` WRITE;
/*!40000 ALTER TABLE `lifestyle_image` DISABLE KEYS */;
INSERT INTO `lifestyle_image` VALUES (1,'spa-cimer1.jpg',632333,1),(2,'spa-cimer2.jpg',428265,1);
/*!40000 ALTER TABLE `lifestyle_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifestyle_price`
--

DROP TABLE IF EXISTS `lifestyle_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle_price` (
  `no` int NOT NULL AUTO_INCREMENT,
  `price_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lifestyle_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_lifestyle_price_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_price_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle_price`
--

LOCK TABLES `lifestyle_price` WRITE;
/*!40000 ALTER TABLE `lifestyle_price` DISABLE KEYS */;
INSERT INTO `lifestyle_price` VALUES (1,'성인','33,000',1),(2,'어린이','16,500',1);
/*!40000 ALTER TABLE `lifestyle_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `no` int NOT NULL AUTO_INCREMENT,
  `id` varchar(12) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birth` date NOT NULL,
  `tel` varchar(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `post` varchar(5) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `detail_address` varchar(45) DEFAULT NULL,
  `marketing` varchar(1) DEFAULT NULL,
  `jdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(2) DEFAULT '가입',
  `grade` int DEFAULT '1',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','admin123!','관리자','1999-09-09','01044942234','dojh5555@gmail.com','min','ad','08792','서울 관악구 낙성대역길 8  (봉천동)','아무로 123',NULL,'2021-07-11 03:51:11','가입',10),(2,'subadmin','admin123!','서브관리자','1988-08-08','01011234567','dojh555@gmail.com','','','05408','서울 강동구 성내동 441-2 ','아무주소',NULL,'2021-07-13 12:36:09','대기',8);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `no` int NOT NULL AUTO_INCREMENT,
  `date_write` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `room_count` int NOT NULL DEFAULT '1',
  `count_adult` int DEFAULT NULL,
  `count_elementary` int DEFAULT NULL,
  `count_child` int DEFAULT NULL,
  `count_baby` int DEFAULT NULL,
  `count_all` int NOT NULL,
  `promotion_name` varchar(45) DEFAULT NULL,
  `promotion_code` int DEFAULT NULL,
  `breakfast_adult` int DEFAULT NULL,
  `breakfast_child` int DEFAULT NULL,
  `price_product` int NOT NULL,
  `price_service` int NOT NULL,
  `price_bed` int NOT NULL,
  `price_options` int NOT NULL,
  `price_total` int NOT NULL,
  `member_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) NOT NULL,
  `add_requests` varchar(150) DEFAULT NULL,
  `state` varchar(45) NOT NULL DEFAULT '0',
  `rsv_adm_no` int NOT NULL,
  `writer` int NOT NULL,
  `rooms_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_reservation_reservation_adm1_idx` (`rsv_adm_no`),
  KEY `fk_reservation_member1_idx` (`writer`),
  KEY `fk_reservation_rooms1_idx` (`rooms_no`),
  CONSTRAINT `fk_reservation_member1` FOREIGN KEY (`writer`) REFERENCES `member` (`no`),
  CONSTRAINT `fk_reservation_reservation_adm1` FOREIGN KEY (`rsv_adm_no`) REFERENCES `reservation_adm` (`rezAdm_no`),
  CONSTRAINT `fk_reservation_rooms1` FOREIGN KEY (`rooms_no`) REFERENCES `rooms` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_adm`
--

DROP TABLE IF EXISTS `reservation_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_adm` (
  `rezAdm_no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `title_s` text,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `thum` blob,
  `content` text,
  `benefits` text,
  `views` int DEFAULT '0',
  `pkg_rate` double DEFAULT '0',
  `rsv_write` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rezAdm_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_adm`
--

LOCK TABLES `reservation_adm` WRITE;
/*!40000 ALTER TABLE `reservation_adm` DISABLE KEYS */;
INSERT INTO `reservation_adm` VALUES (1,'치휴 레몬 썸머','시원하고 푸른 하늘을 닮은 해운대 바다와 여름 휴가의 신나는 경험과 즐거움까지 모두 만끽 할 수 있는 치휴 레몬 썸머  패키지를 만나보세요.','2021-07-16','2021-08-31',NULL,'디럭스 (성인 2인 + 어린이 2인) / 프리미엄 디럭스ㆍ스위트 (성인 3인 + 어린이 1인)\r\n\r\n[A타입] 기본 혜택 + 소프트 음료\r\n[B타입] 기본 혜택 + 소프트 음료 + 조식 (성인 2인)\r\n* 스위트 예약 고객에게 [랑방 \"걸 인 카프리\" 프래그런스] 를 제공해 드립니다. (소진시 까지)','[A타입] 기본 혜택 + 소프트 음료',0,0.34,'2021-07-08 12:19:29');
/*!40000 ALTER TABLE `reservation_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_attach`
--

DROP TABLE IF EXISTS `reservation_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_attach` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `size` int NOT NULL,
  `rsv_adm` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_attach_room_adm1_idx` (`rsv_adm`),
  CONSTRAINT `fk_attach_room_adm1` FOREIGN KEY (`rsv_adm`) REFERENCES `reservation_adm` (`rezAdm_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_attach`
--

LOCK TABLES `reservation_attach` WRITE;
/*!40000 ALTER TABLE `reservation_attach` DISABLE KEYS */;
INSERT INTO `reservation_attach` VALUES (1,'thum_list.jpg',156660,1);
/*!40000 ALTER TABLE `reservation_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_promotion`
--

DROP TABLE IF EXISTS `reservation_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_promotion` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` int NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_use` timestamp NULL DEFAULT NULL,
  `date_expriation` timestamp NULL DEFAULT NULL,
  `room_customer_no` int NOT NULL,
  `room_adm_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_room_promotion_room_customer1_idx` (`room_customer_no`),
  KEY `fk_room_promotion_room_adm1_idx` (`room_adm_no`),
  CONSTRAINT `fk_room_promotion_room_adm1` FOREIGN KEY (`room_adm_no`) REFERENCES `reservation_adm` (`rezAdm_no`),
  CONSTRAINT `fk_room_promotion_room_customer1` FOREIGN KEY (`room_customer_no`) REFERENCES `reservation` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_promotion`
--

LOCK TABLES `reservation_promotion` WRITE;
/*!40000 ALTER TABLE `reservation_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rez_adm_room_type`
--

DROP TABLE IF EXISTS `rez_adm_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rez_adm_room_type` (
  `rez_adm_room_no` int NOT NULL AUTO_INCREMENT,
  `rez_adm` int DEFAULT NULL,
  `room_type` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `benefit` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`rez_adm_room_no`),
  KEY `fk_reservation_adm_has_room_type_room_type1_idx` (`room_type`),
  KEY `fk_reservation_adm_has_room_type_reservation_adm1_idx` (`rez_adm`),
  CONSTRAINT `fk_reservation_adm_has_room_type_reservation_adm1` FOREIGN KEY (`rez_adm`) REFERENCES `reservation_adm` (`rezAdm_no`),
  CONSTRAINT `fk_reservation_adm_has_room_type_room_type1` FOREIGN KEY (`room_type`) REFERENCES `room_type` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rez_adm_room_type`
--

LOCK TABLES `rez_adm_room_type` WRITE;
/*!40000 ALTER TABLE `rez_adm_room_type` DISABLE KEYS */;
INSERT INTO `rez_adm_room_type` VALUES (1,1,1,'디럭스','ㆍ 소프트 음료\r\nㆍ오션스파 씨메르\r\nㆍ야외 오션스파 풀\r\nㆍBMW 키즈 드라이빙\r\nㆍHABA & 웅진북클럽'),(2,1,2,'프리미엄 디럭스','ㆍ 소프트 음료\r\nㆍ오션스파 씨메르\r\nㆍ야외 오션스파 풀\r\nㆍBMW 키즈 드라이빙\r\nㆍHABA & 웅진북클럽');
/*!40000 ALTER TABLE `rez_adm_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_detail`
--

DROP TABLE IF EXISTS `room_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_detail` (
  `roomdetail_no` int NOT NULL AUTO_INCREMENT,
  `room_view` varchar(10) DEFAULT NULL,
  `room_location` varchar(2) DEFAULT NULL,
  `room_bedtype` varchar(2) DEFAULT NULL,
  `room_price` int DEFAULT NULL,
  `room_thumb_name` varchar(45) DEFAULT NULL,
  `room_thumb_size` int DEFAULT NULL,
  `room_type_no` int NOT NULL,
  PRIMARY KEY (`roomdetail_no`),
  KEY `fk_room_detail_room_type1_idx` (`room_type_no`),
  CONSTRAINT `fk_room_detail_room_type1` FOREIGN KEY (`room_type_no`) REFERENCES `room_type` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_detail`
--

LOCK TABLES `room_detail` WRITE;
/*!40000 ALTER TABLE `room_detail` DISABLE KEYS */;
INSERT INTO `room_detail` VALUES (1,'시티','본관','더블',530000,'1555489275637.jpg',203180,1),(2,'시티','본관','트윈',530000,'1555489275637.jpg',203180,1),(3,'시티','본관','온돌',530000,'1555489275637.jpg',203180,1),(4,'오션','신관','더블',800000,'1554963881483.jpg',262531,2),(5,'시티','신관','더블',550000,'1555489275637.jpg',203180,1),(6,'시티','신관','트윈',550000,'1555489275637.jpg',203180,1),(7,'오션','신관','더블',610000,'1555488905245.jpg',249508,1),(8,'오션','신관','온돌',610000,'1555488905245.jpg',249508,1),(9,'오션 테라스','본관','더블',630000,'1555901458847.jpg',197710,1),(10,'오션 테라스','본관','트윈',630000,'1555901458847.jpg',197710,1),(11,'오션 테라스','신관','더블',650000,'1555901458847.jpg',197710,1),(12,'오션 테라스','신관','트윈',650000,'1555901458847.jpg',197710,1),(13,'오션 테라스','신관','트윈',900000,'1554963832061.jpg',222662,2),(14,'시티','본관','더블',800000,'1555901117512.jpg',250552,3),(15,'시티','본관','온돌',800000,'1555901117512.jpg',250552,3),(16,'오션 테라스','본관','더블',1200000,'1554964067066.jpg',240172,3),(17,'오션 테라스','신관','온돌',1200000,'1554964067066.jpg',240172,3);
/*!40000 ALTER TABLE `room_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_image`
--

DROP TABLE IF EXISTS `room_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_image` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `room_detail_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_room_image_room_detail1_idx` (`room_detail_no`),
  CONSTRAINT `fk_room_image_room_detail1` FOREIGN KEY (`room_detail_no`) REFERENCES `room_detail` (`roomdetail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_image`
--

LOCK TABLES `room_image` WRITE;
/*!40000 ALTER TABLE `room_image` DISABLE KEYS */;
INSERT INTO `room_image` VALUES (1,'1555489453085.jpg',351229,1),(2,'1555489454837.jpg',341948,1),(3,'1555489456820.jpg',397491,1),(4,'1555489453085.jpg',351229,2),(5,'1555489454837.jpg',341948,2),(6,'1555489456820.jpg',397491,2),(7,'1555489453085.jpg',351229,3),(8,'1555489454837.jpg',341948,3),(9,'1555489456820.jpg',397491,3),(10,'1555489782886.jpg',382418,4),(11,'1555489784898.jpg',340435,4),(12,'1555489559626.jpg',391512,5),(13,'1555489561697.jpg',420039,5),(14,'1555489563705.jpg',390874,5),(15,'1555489559626.jpg',391512,6),(16,'1555489561697.jpg',420039,6),(17,'1555489563705.jpg',390874,6),(18,'1555488907950.jpg',394076,7),(19,'1555488910257.jpg',429701,7),(20,'1555488912881.jpg',384377,7),(21,'1555488907950.jpg',394076,8),(22,'1555488910257.jpg',429701,8),(23,'1555488912881.jpg',384377,8),(24,'1554958999094.jpg',371412,9),(25,'1554958999273.jpg',336705,9),(26,'1554958999094.jpg',371412,10),(27,'1554958999273.jpg',336705,10),(28,'1555488295109.jpg',312166,11),(29,'1555488298303.jpg',360566,11),(30,'1555488301305.jpg',525904,11),(31,'1555488304105.jpg',360423,11),(32,'1555488295109.jpg',312166,12),(33,'1555488298303.jpg',360566,12),(34,'1555488301305.jpg',525904,12),(35,'1555488304105.jpg',360423,12),(36,'1554963836581.jpg',312293,13),(37,'1554963836961.jpg',308094,13),(38,'1555901135289.jpg',504861,14),(39,'1555901137058.jpg',333703,14),(40,'1555901139171.jpg',438623,14),(41,'1555901141187.jpg',375730,14),(42,'1555901143443.jpg',257922,14),(43,'1555901135289.jpg',504861,15),(44,'1555901137058.jpg',333703,15),(45,'1555901139171.jpg',438623,15),(46,'1555901141187.jpg',375730,15),(47,'1555901143443.jpg',257922,15),(48,'1554964071599.jpg',364493,16),(49,'1554964071857.jpg',480352,16),(50,'1554963697950.jpg',372966,17),(51,'1554963698026.jpg',426792,17),(52,'1554963698078.jpg',329761,17),(53,'1554963698364.jpg',417949,17);
/*!40000 ALTER TABLE `room_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `no` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `adult_cnt` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `wdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'디럭스',2,'은은한 조명과 어우러진 다크 브라운의 조화','모던하면서도 세련된 최신 트렌드의 인테리어가 돋보이는 객실로 파라다이스만의 고급스러운 감각이 곳곳에 배어 있습니다.','2021-07-07 06:29:14','2021-07-07 06:29:14'),(2,'프리미엄 디럭스',3,'해운대 해변의 아름다운 해안선을 만끽할 수 있는 객실','더욱 여유로워진 객실, 프리미엄 디럭스룸을 만나다!<br>달맞이 고개에서 동백섬까지, 끝없이 펼쳐진 해운대 해변의 아름다운 해안선을 만끽할 수 있는 프리미엄 디럭스 오션 더블 룸.<br><br>2인용 더블 베드 & 소파 베드 1개 비치<br>뛰어난 쿠션감과 충격 흡수력으로 최상의 포근함을 자랑하는 미국 프리미엄 소파 브랜드 ‘ 아메리칸 레더’사의 소파 베드 비치.<br>편안한 소파 + 아늑한 베드의 이색적인 결합으로 공간 효율성의 극대화 하였습니다.<br><br>Ocean view<br>달맞이 고개에서 동백섬까지, 화려한 도심의 야경과 어우러져 파노라마처럼 길게 펼쳐진 해운대의 매력적인 야경을 즐기실 수 있습니다.','2021-07-08 12:38:41','2021-07-08 12:38:41'),(3,'스위트',3,'편안한 침실과 안락한 거실이 분리되어 품격 있는 휴식을 누릴 수 있는 스위트 룸','편안한 침실과 안락한 거실이 분리되어 있어 품격 있는 휴식을 누리실 수 있으며 간결하게 정돈된 다크 브라운 톤으로 본관 특유의 세련되면서도 모던한 감각이 배어 있습니다.','2021-07-12 14:49:14','2021-07-12 14:49:14');
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `no` int NOT NULL AUTO_INCREMENT,
  `state` varchar(4) DEFAULT '예약대기',
  `room_number` int DEFAULT NULL,
  `room_detail_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_rooms_room_detail1_idx` (`room_detail_no`),
  CONSTRAINT `fk_rooms_room_detail1` FOREIGN KEY (`room_detail_no`) REFERENCES `room_detail` (`roomdetail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'예약대기',101,1),(2,'예약대기',102,1),(3,'예약대기',103,1),(4,'예약대기',104,1),(5,'예약대기',105,1),(6,'예약대기',106,2),(7,'예약대기',107,2),(8,'예약대기',108,2),(9,'예약대기',109,2),(10,'예약대기',110,3),(11,'예약대기',111,3),(12,'예약대기',112,3),(13,'예약대기',113,3),(14,'예약대기',114,3),(15,'예약대기',115,4),(16,'예약대기',116,4),(17,'예약대기',117,4),(18,'예약대기',118,5),(19,'예약대기',119,5),(20,'예약대기',120,5),(21,'예약대기',121,6),(22,'예약대기',122,6),(23,'예약대기',309,6),(24,'예약대기',310,6),(25,'예약대기',311,7),(26,'예약대기',312,7),(27,'예약대기',127,7),(28,'예약대기',128,8),(29,'예약대기',129,8),(30,'예약대기',201,8),(31,'예약대기',202,8),(32,'예약대기',203,9),(33,'예약대기',204,9),(34,'예약대기',205,9),(35,'예약대기',206,9),(36,'예약대기',207,9),(37,'예약대기',208,10),(38,'예약대기',209,10),(39,'예약대기',210,10),(40,'예약대기',211,10),(41,'예약대기',212,10),(42,'예약대기',213,10),(43,'예약대기',214,11),(44,'예약대기',215,11),(45,'예약대기',216,11),(46,'예약대기',217,11),(47,'예약대기',218,12),(48,'예약대기',219,12),(49,'예약대기',301,13),(50,'예약대기',302,13),(51,'예약대기',303,13),(52,'예약대기',304,13),(53,'예약대기',305,13),(54,'예약대기',306,14),(55,'예약대기',307,14),(56,'예약대기',308,14),(57,'예약대기',401,15),(58,'예약대기',402,15),(59,'예약대기',403,15),(60,'예약대기',404,15),(61,'예약대기',405,15),(62,'예약대기',406,15),(63,'예약대기',309,16),(64,'예약대기',310,16),(65,'예약대기',311,16),(66,'예약대기',407,17),(67,'예약대기',408,17),(68,'예약대기',409,17),(69,'예약대기',410,17),(70,'예약대기',411,7);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hotel'
--

--
-- Dumping routines for database 'hotel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-14  1:00:26
