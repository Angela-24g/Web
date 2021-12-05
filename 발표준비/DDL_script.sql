CREATE DATABASE  IF NOT EXISTS `hotel`;
-- drop database `hotel`;
USE `hotel`;

DROP TABLE IF EXISTS `lifestyle`;
CREATE TABLE `lifestyle` (
  `no` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subtype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `lifestyle_facility`;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `lifestyle_image`;
CREATE TABLE `lifestyle_image` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `lifestyle_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_lifestyle_image_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_image_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `lifestyle_price`;
CREATE TABLE `lifestyle_price` (
  `no` int NOT NULL AUTO_INCREMENT,
  `price_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lifestyle_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_lifestyle_price_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_price_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(12) DEFAULT NULL,
  `pw` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `post` varchar(5) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `detail_address` varchar(45) DEFAULT NULL,
  `marketing` varchar(1) DEFAULT NULL,
  `jdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(2) DEFAULT '가입',
  `grade` int(11) DEFAULT '1',
  `sno` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `point_detail`;
CREATE TABLE `point_detail` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `point_event_no` int(11) NOT NULL,
  `trans_date` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_point_detail_point_event1_idx` (`point_event_no`),
  CONSTRAINT `fk_point_detail_point_event1` FOREIGN KEY (`point_event_no`) REFERENCES `point_event` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `point_event`;
CREATE TABLE `point_event` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expire_date` timestamp NULL DEFAULT NULL,
  `member_no` int(11) NOT NULL,
  `reservation_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_point_event_member1_idx` (`member_no`),
  KEY `fk_point_event_reservation1_idx` (`reservation_no`),
  CONSTRAINT `fk_point_event_member1` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_event_reservation1` FOREIGN KEY (`reservation_no`) REFERENCES `reservation` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rastaurants_attach`;
CREATE TABLE `rastaurants_attach` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `rt_adm_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_rastaurants_attach_restaurants_adm1_idx` (`rt_adm_no`),
  CONSTRAINT `fk_rastaurants_attach_restaurants_adm1` FOREIGN KEY (`rt_adm_no`) REFERENCES `restaurants_adm` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `date_write` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `room_count` int(11) NOT NULL DEFAULT '1',
  `count_adult` int(11) DEFAULT NULL,
  `count_elementary` int(11) DEFAULT NULL,
  `count_child` int(11) DEFAULT NULL,
  `count_baby` int(11) DEFAULT NULL,
  `count_all` int(11) NOT NULL,
  `promotion_name` varchar(45) DEFAULT NULL,
  `promotion_code` mediumtext,
  `breakfast_adult` int(11) DEFAULT NULL,
  `breakfast_child` int(11) DEFAULT NULL,
  `price_product` int(11) NOT NULL,
  `price_service` int(11) NOT NULL,
  `price_bed` int(11) NOT NULL,
  `price_options` int(11) NOT NULL,
  `price_member` int(11) NOT NULL,
  `price_point` int(11) NOT NULL,
  `price_total` int(11) NOT NULL,
  `price_result` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) NOT NULL,
  `add_requests` text,
  `views` int(11) DEFAULT '0',
  `state` varchar(45) NOT NULL DEFAULT '예약대기',
  `rsv_adm_no` int(11) NOT NULL,
  `writer` int(11) NOT NULL,
  `rooms_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_reservation_reservation_adm1_idx` (`rsv_adm_no`),
  KEY `fk_reservation_member1_idx` (`writer`),
  KEY `fk_reservation_rooms1_idx` (`rooms_no`),
  CONSTRAINT `fk_reservation_member1` FOREIGN KEY (`writer`) REFERENCES `member` (`no`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_reservation_adm1` FOREIGN KEY (`rsv_adm_no`) REFERENCES `reservation_adm` (`rezAdm_no`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_rooms1` FOREIGN KEY (`rooms_no`) REFERENCES `rooms` (`no`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reservation_adm`;
CREATE TABLE `reservation_adm` (
  `rezAdm_no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `title_s` text,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `thum` blob,
  `content` text,
  `benefits` text,
  `views` int(11) DEFAULT NULL,
  `pkg_rate` double DEFAULT NULL,
  `rsv_write` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rezAdm_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reservation_attach`;
CREATE TABLE `reservation_attach` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `size` int(11) NOT NULL,
  `rsv_adm` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_attach_room_adm1_idx` (`rsv_adm`),
  CONSTRAINT `fk_attach_room_adm1` FOREIGN KEY (`rsv_adm`) REFERENCES `reservation_adm` (`rezAdm_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `reservation_promotion`;
CREATE TABLE `reservation_promotion` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` int(11) NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_use` timestamp NULL DEFAULT NULL,
  `date_expriation` timestamp NULL DEFAULT NULL,
  `room_customer_no` int(11) NOT NULL,
  `room_adm_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_room_promotion_room_customer1_idx` (`room_customer_no`),
  KEY `fk_room_promotion_room_adm1_idx` (`room_adm_no`),
  CONSTRAINT `fk_room_promotion_room_adm1` FOREIGN KEY (`room_adm_no`) REFERENCES `reservation_adm` (`rezAdm_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_promotion_room_customer1` FOREIGN KEY (`room_customer_no`) REFERENCES `reservation` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(45) NOT NULL,
  `date_reserve` date DEFAULT NULL,
  `time_meal` varchar(45) DEFAULT NULL,
  `date_write` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count_adult` int(11) DEFAULT NULL,
  `count_elementary` int(11) DEFAULT NULL,
  `count_child` int(11) DEFAULT NULL,
  `count_baby` int(11) DEFAULT NULL,
  `count_all` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `add_request` text,
  `state` varchar(45) NOT NULL DEFAULT '예약대기',
  `writer` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_restaurants_member1_idx` (`writer`),
  CONSTRAINT `fk_restaurants_member1` FOREIGN KEY (`writer`) REFERENCES `member` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `restaurants_adm`;
CREATE TABLE `restaurants_adm` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `cate` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `time_lunch` timestamp NULL DEFAULT NULL,
  `time_dinner` timestamp NULL DEFAULT NULL,
  `num_of_seat` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `rt_atc_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_restaurants_adm_restaurants1_idx` (`rt_atc_no`),
  CONSTRAINT `fk_restaurants_adm_restaurants1` FOREIGN KEY (`rt_atc_no`) REFERENCES `restaurants` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rez_adm_room_type`;
CREATE TABLE `rez_adm_room_type` (
  `rez_adm_room_no` int(11) NOT NULL AUTO_INCREMENT,
  `rez_adm` int(11) DEFAULT NULL,
  `room_type` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `benefit` text,
  PRIMARY KEY (`rez_adm_room_no`),
  KEY `fk_reservation_adm_has_room_type_room_type1_idx` (`room_type`),
  KEY `fk_reservation_adm_has_room_type_reservation_adm1_idx` (`rez_adm`),
  CONSTRAINT `fk_reservation_adm_has_room_type_reservation_adm1` FOREIGN KEY (`rez_adm`) REFERENCES `reservation_adm` (`rezAdm_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_adm_has_room_type_room_type1` FOREIGN KEY (`room_type`) REFERENCES `room_type` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `room_detail`;
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

DROP TABLE IF EXISTS `room_image`;
CREATE TABLE `room_image` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `room_detail_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_room_image_room_detail1_idx` (`room_detail_no`),
  CONSTRAINT `fk_room_image_room_detail1` FOREIGN KEY (`room_detail_no`) REFERENCES `room_detail` (`roomdetail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `room_type`;
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

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `no` int NOT NULL AUTO_INCREMENT,
  `state` varchar(4) DEFAULT '예약대기',
  `room_number` int DEFAULT NULL,
  `room_detail_no` int NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_rooms_room_detail1_idx` (`room_detail_no`),
  CONSTRAINT `fk_rooms_room_detail1` FOREIGN KEY (`room_detail_no`) REFERENCES `room_detail` (`roomdetail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `qna`;
CREATE TABLE IF NOT EXISTS `hotel`.`qna` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `contents` VARCHAR(100) NOT NULL,
  `wdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `writer` INT NOT NULL,
  `qsts` VARCHAR(20) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `rqna`;
CREATE TABLE IF NOT EXISTS `hotel`.`rqna` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `response` VARCHAR(200) NOT NULL,
  `qno` INT NOT NULL,
  `subject` VARCHAR(40) NULL,
  `rdate` TIMESTAMP NOT NULL,
  `qstate` VARCHAR(20) NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_Qna_admin_QnA1_idx` (`qno` ASC),
  CONSTRAINT `fk_Qna_admin_QnA1`
    FOREIGN KEY (`qno`)
    REFERENCES `hotel`.`qna` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

