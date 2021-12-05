CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	5.7.34

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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `subtype` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `info` text,
  `info_detail` text,
  `hours` text,
  `location` varchar(45) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `wdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `guide` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle`
--

LOCK TABLES `lifestyle` WRITE;
/*!40000 ALTER TABLE `lifestyle` DISABLE KEYS */;
INSERT INTO `lifestyle` VALUES (1,'spa','씨메르','오션스파 씨메르','탁 트인 하늘과 바다의 화려한 경관을 자랑하는 하이앤드 오션스파<br>하늘과 바다가 맞닿은 듯한 오션스파 씨메르에서 지금껏 느껴보지 못한 영혼의 휴식을 경험해보시기 바랍니다.','해맑게(brilliant) 힐링, 오션스파 씨메르에 들어서면 걸음걸음 차분한 향기가 코끝을 건드립니다. 맑은 해수가 출렁이는 스파 마다 각기 다른 재료가 만들어내는 힐링의 향입니다.<br>끝없이 펼쳐진 수평선을 바라보며 불어오는 해풍을 만끽하는 것도, 저마다의 향을 뿜는 스파 마다 몸을 담그며 건강한 효과를 만끽하는 묘미도, 버블매트에 기대 탄산처럼 웃음을 터뜨리는 것도 씨메르에서 남길 수 있는 추억입니다.<br><br>달밤의 편안함(relaxed), 초롱초롱이 줄을 잇는 조명이 발길을 비춰주는 덕에 밤의 씨메르는 맨발에 가벼운 차림으로 찾아도 낯설지 않습니다.<br>향나무와 동백나무 사이로 온천 흐르는 소리와 아득한 파도소리가 들리고, 따스한 스파의 결이 몸의 구석구석 편안함을 채워줍니다. 달밤의 아득함으로 채워진 바다와 은은한 야경이 펼쳐진 가운데 아쿠아 바에서 맛보는 이국적인 음료와 홈메이드 메뉴는 온몸의 감각을 깨워줍니다.','[1부] 08:00 ~ 11:10<br>[2부] 11:30 ~ 14:40<br>[3부] 15:00 ~ 18:10<br>[4부] 18:30 ~ 21:50<br>키즈존 10:00 ~ 18:00 (우천시 휴장)<br>아쿠아바 FOOD 11:30 ~ 19:40 / BEVERAGE 11:30 ~ 21:00<br><br>[7.16 ~ 8.31 기간]<br>[1부] 08:00 ~ 10:30<br>[2부] 10:50 ~ 13:20<br>[3부] 13:40 ~ 16:10<br>[4부] 16:30 ~ 19:00<br>[5부] 19:20 ~ 21:50<br>키즈존 10:00 ~ 18:00 (우천시 휴장)<br>아쿠아바 FOOD 11:00 ~ 19:40 / BEVERAGE 11:00 ~ 21:40','본관 4F','051-749-2358','2021-07-14 11:29:53','2021-07-14 11:29:53','※ 오션스파 씨메르 운영 안내<br><br>사회적 거리두기 참여 및 쾌적하고 안전한 오션스파 씨메르 이용을 위해 4부제 (7.16~8.31 : 5부제)로 운영하오니 양해 부탁드립니다.<br><br>* 각 부 종료 시 모든 고객이 퇴장 후 20분간 방역 및 클리닝을 실시합니다.<br><br>* 각 부 시간별 적정 인원이 초과되면 부득이 하게 입장이 제한 됩니다.<br><br>* 객실 예약 시 등록 된 인원 수 만큼 입장이 가능합니다.<br><br>* 사회적 거리두기 일환으로 락커 대여를 제한하고 있으니 객실에서 수영복으로 갈아 입으시고 이용바랍니다.<br><br>* 스낵바 운영을 중단하오니 양해바랍니다.'),(2,'spa','풀','야외 오션스파 풀','하늘 위의 작은 바다, 야외 오션스파 풀','유쾌한(Delightful) 오후, 호텔 위 바다 한 채가 둥실 떠있는 느낌의 야외 오션스파 풀입니다. 이 곳에서는 휴양지 특유의 유쾌한 분위기와 바다의 낭만이 열두 달 내내 흐릅니다.<br>아득한 바다와 여유롭게 맞닿아있는 인피니티 스파 풀, 해변의 시원함이 눈에 가득 담기는 선 베드 존, 눈이 펑펑 내리는 한겨울에도 맘껏 수영을 즐길 수 있는 따스함까지. 햇살이 쏟아지는 시간, 이국의 휴양지 느낌이 물씬 풍겨오는 매력적인 야외 오션스파 풀을 만나보세요.<br><br>컬러풀(colorful)한 즐거움, 해가 지고 밤을 만나면 본연의 화려함을 한 가득 보여주는 밤의 오션스파 풀입니다. 엷은 달이 하늘에 오르는 시간, 메인 풀에서는 블루와 그린의 조명이 파도 치듯 활기를 불어넣습니다. 인피티니 스파 풀에서는 밤바다의 흥분을 만끽할 수 있고, 흥취를 돋우는 한 잔과 프라이빗 한 시간을 보내기 좋은 풀사이드 바가 곁에 있습니다. 오션스파 풀이 안겨주는 흥겨움에 잠시 쉬고 싶을 땐 포근한 선 베드에 누워 휴식을 취해도 좋겠죠. 별이 총총한 밤, 오션풀의 특별한 즐거움에 흠뻑 빠져보세요.','[1부] 08:00 ~ 11:10<br>[2부] 11:30 ~ 14:40<br>[3부] 15:00 ~ 18:10<br>[4부] 18:30 ~ 21:50<br><br>[7.16 ~ 8.31 기간]<br>[1부] 08:00 ~ 10:30<br>[2부] 10:50 ~ 13:20<br>[3부] 13:40 ~ 16:10<br>[4부] 16:30 ~ 19:00<br>[5부] 19:20 ~ 21:50<br>루프탑 08:00 ~ 20:00 (성인전용)<br><br>[ 7. 2 ~ 7. 28 풀사이드 바]<br>FOOD 11:30 ~ 19:30 / BEV 11:30 ~ 19:30<br><br>[ 7. 29 ~ 8. 31 풀사이드 바]<br>FOOD 11:00 ~ 19:40 / BEV 08:00 ~ 21:00','신관 4F','051-749-2350 / 2358','2021-07-14 11:33:10','2021-07-14 11:33:10','※ 오션풀 운영 안내<br><br>사회적 거리두기 참여 및 쾌적하고 안전한 오션풀 이용을 위해 4부제 (7.16~8.31 : 5부제)로 운영하오니 양해 부탁드립니다.<br><br>* 각 부 종료 시 모든 고객이 퇴장 후 20분간 방역 및 클리닝을 실시합니다.<br>* 각 부 시간별 적정 인원이 초과되면 부득이 하게 입장이 제한 됩니다.<br>* 객실 예약 시 등록 된 인원 수 만큼 입장이 가능합니다.<br>* 사회적 거리두기 일환으로 락커 대여를 제한하고 있으니 객실에서 수영복으로 갈아 입으시고 이용바랍니다.'),(3,'spa','사우나','실내 사우나','해운대의 풍부한 온천수를 이용한 사우나로 수질 뿐만 아니라 바다가 한눈에 들어오는 빼어난 자연경관을 선사해드립니다.','옥돌베드, 자쿠지탕, 건·습식 사우나 등 다양한 시설과 세심한 서비스로 여유로운 시간을 전해드립니다.<br>남녀 사우나 모두 고급스러운 인테리어와 더불어 건강식을 선보이는 스낵 라운지를 함께 갖추고 있어 편안한 만족감을 드립니다.','06:00 ~ 22:00<br><br>* 대상 : 14세 이상 출입가능','남자 사우나 : 본관 4F<br>여자 사우나 : 신관 4F','051-749-2358','2021-07-14 11:37:03','2021-07-14 11:37:03','06:00 ~ 22:00<br><br>* 대상 : 14세 이상 출입가능'),(4,'spa','피트니스','피트니스 클럽','건강한 하루를 호텔에서도 유지할 수 있게 도와드립니다.','스포츠 과학을 토대로 개발된 최신식 시설과 전문 트레이너 및 강사들의 지도 아래 개인 맞춤 운동 프로그램으로 활기찬 라이프 스타일을 디자인 해드립니다.','06:00 ~ 22:00<br><br>* 대상 : 20세 이상 출입가능','본관 4F(남자 고객 전용)<br>신관 4F','051-749-2354','2021-07-14 11:38:28','2021-07-14 11:38:28',''),(5,'spa','리트리트 스파','순다리 리트리트 스파','최고급 천연성분 화장품과 오리엔탈 테라피로 홀리스틱 웰니스를 제시하는 스파 브랜드','최고의 미를 자랑하는 미국 슈퍼모델 크리스티 털링턴(Christy Turlington)이 직접 디렉팅한 브랜드 SUNDARI는 최고급 천연성분 화장품과 오리엔탈 테라피로<br>홀리스틱 웰니스를 제시하는 스파 브랜드 입니다. <br>오리지널 제품 컬렉션과 고대 인도의 지혜에서 전해진 독특한 식물성분과 현대과학의 만남으로 이루어진 압비얀가, 마르마 테라피를 선보입니다.<br>인생이란 긴 여행을 통해 균형 잡힌 마음, 몸, 정신을 소유하기 위한 라이프 스타일을 위해 탄생한 순다리 리트리트 스파로 진정한 아름다움을 위한 여행을 시작해보세요.','스파 및 테라피 08:00 ~ 23:00<br>헤어 및 네일 10:00 ~ 19:30','신관 5F','051-743-6105','2021-07-14 11:46:16','2021-07-14 11:46:16',''),(6,'kidsvillage','BMW 키즈 드라이빙','BMW 키즈 드라이빙','어린이들의 교통 안전 의식을 높이기 위한 다양한 교통 법규를 재미있는 스토리텔링으로 알려드립니다.','BMW 키즈 드라이빙 존에서는 어린이들의 교통 안전 의식을 높이기 위해 교통표지판 읽기, 교통사고 발생 상황 교육 등 다양한 교통 법규를 재미있는 <br>스토리텔링으로 알려드립니다. 실제 도로 상황을 재현한 모의 도로에서 어린이용 BMW 키즈 모빌리티를 직접 운전하거나, 보행자 역할극을 하며 <br>올바른 대처 능력을 자연스럽게 습득할 수 있습니다.','[화, 수, 목요일]<br>1회차 10:00 ~ 10:40<br>2회차 11:00 ~ 11:40<br>3회차 15:30 ~ 16:10<br>자율주행 12:00 ~ 13:00 / 14:00 ~ 15:00 / 17:00 ~ 18:00<br><br>* 7월 6/7/8/13/14/15일 (화,수,목요일) 자율주행 17:00~18:00 은 호텔 내부사정으로 인해 운영하지 않습니다.<br><br>[금, 토, 일, 월요일]<br>1회차 10:00 ~ 10:40<br>2회차 11:00 ~ 11:40<br>3회차 15:30 ~ 16:10<br>4회차 16:30 ~ 17:10<br>자율주행 17:30 ~ 18:30<br><br>[7.16 ~ 8.21 기간]<br>1회차 10:00 ~ 10:40<br>2회차 11:00 ~ 11:40<br>탑기어 파라다이스 1부 12:00~12:50<br>3회차 15:30 ~ 16:10<br>탑기어 파라다이스 2부 17:00~17:50<br>자율주행 18:30~19:30<br><br>* 사전예약에 한하며 투숙당 1회 한정<br><br>* 자율주행은 20분간 순차적 체험 (선착순)<br><br>* 대상 : 5~7세 (15~17년생)<br><br>* 투숙객 한정','신관 B1','051-742-2121','2021-07-14 12:34:50','2021-07-14 12:34:50',''),(7,'kidsvillage','PLAY LAB','PLAY LAB','본격 취향저격 가족놀이 체험공간! 파라다이스 키즈 빌리지 PLAY LAB','PLAY LAB(플레이 랩)은 콘솔 게임과 더불어 슈팅, 보드, 액션, 스포츠 등의 아케이드 엑티비티 게임 콘텐츠들로 구비되어 있어 남녀노소 모두가 즐길 수 있는 패밀리 엔터테인먼트 공간입니다.','10:00 ~ 19:00<br>(점검 시간 : 13:00 ~ 14:00)<br><br>[7.16 ~ 8.21 기간]<br>10:00 ~ 22:00<br>(점검 시간 : 13:00 ~ 14:00)','신관 B1','051-742-2121','2021-07-14 12:59:39','2021-07-14 12:59:39',''),(8,'kidsvillage','하바 키즈 라운지','하바 키즈 라운지','독일 명품 원목 키즈 교구 브랜드 HABA를 만나 볼 수 있는 키즈 라운지 입니다.','나무 블록 쌓기, 동물 모양 블록 쌓기, 미끄럼틀 등 클래식한 장난감부터 기하학적인 입체 퍼즐까지 프리미엄 교구 놀이 체험을 할 수 있습니다.','10:00 ~ 19:00<br>(점검 시간 : 13:00 ~ 14:00)<br><br>[7.16 ~ 8.21 기간]<br>10:00 ~ 20:00<br>(점검 시간 : 13:00 ~ 14:00)','신관 B1','051-742-2121','2021-07-14 13:00:51','2021-07-14 13:00:51',''),(9,'kidsvillage','웅진 북클럽','웅진 북클럽','국내 최고 교육문화기업인 웅진 씽크빅','연령대(1~13세)에 맞는 유명 도서와 독서 학습 디지털 콘텐츠 약 1만여 개가 탑재된 웅진 북클럽 북패드를 체험해 보세요.','10:00 ~ 19:00<br>(점검 시간 : 13:00 ~ 14:00)<br><br>[7.16 ~ 8.21 기간]<br>10:00 ~ 20:00<br>(점검 시간 : 13:00 ~ 14:00)','신관 B1','051-742-2121','2021-07-14 13:01:50','2021-07-14 13:01:50',''),(10,'kidsvillage','가족형키즈카페 키즈앤 패밀리','가족형키즈카페 키즈앤 패밀리','아이들에게 창의력과 상상력을 보다 재미있게 즐기며 키워나갈 수 있는 공간','부모들에게는 육아의 쉼터이며, 아이들과 즐겁게 놀이활동을 체험 할 수 있는 가족형키즈카페 키즈앤 패밀리가 파라다이스호텔 부산에 입점했습니다<br>디지털미디어 컨셉으로 상상 속 환상의 세계를 탐험하고 창의적인 예술적 표현력을 발휘하며 디지털에 대한 자유로운 상상력을 자극시킬 수 있는 공간으로 초대합니다','휴장 (추후 공지시 까지)','본관 1F','070-5180-9030','2021-07-14 13:49:55','2021-07-14 02:49:06','');
/*!40000 ALTER TABLE `lifestyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifestyle_facility`
--

DROP TABLE IF EXISTS `lifestyle_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle_facility` (
  `lifeFacility_no` int(11) NOT NULL AUTO_INCREMENT,
  `lifeFacility_image_name` varchar(45) DEFAULT NULL,
  `lifeFacility_image_size` int(11) DEFAULT NULL,
  `lifeFacility_title` varchar(45) DEFAULT NULL,
  `lifeFacility_info` text,
  `lifestyle_no` int(11) NOT NULL,
  PRIMARY KEY (`lifeFacility_no`),
  KEY `fk_lifestyle_facility_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_facility_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle_facility`
--

LOCK TABLES `lifestyle_facility` WRITE;
/*!40000 ALTER TABLE `lifestyle_facility` DISABLE KEYS */;
INSERT INTO `lifestyle_facility` VALUES (1,'spa-cimer3.jpg',90747,'Infinity Spa','오션스파 씨메르의 대표공간 인피니티 스파. 꿈꿔왔던 눈부신 태양과 조우하고 동경해온 푸른 하늘과 하나가 되며 평생 잊지 못할 드넓은 바다가 눈 앞에 펼쳐집니다.',1),(2,'spa-cimer4.jpg',96395,'Aqua Bar','오션스파 씨메르의 아쿠아 바에서는 다양하고 수준 높은 다이닝을 즐기실 수 있습니다.',1),(3,'spa-cimer5.jpg',93332,'청옥사우나','지친 일상에 힘이 되어줄 오션스파 씨메르의 청옥사우나. 이 곳을 방문한 당신은 새로운 활기와 따뜻한 온기를 언제나 사계절 내내 경험 하실 수 있습니다.',1),(4,'spa-pool6.jpg',80366,'Infinity Pool','일상의 경계를 벗어나, 바다가까이 머무르다, Infinity pool. 해운대의 풍부한 온천수로 구성된 스파 공간',2),(5,'spa-pool7.jpg',85453,'Poolside Bar','새롭게 선보이는 프라이빗한 휴양공간, 오션풀 라운지',2),(6,'spa-pool8.jpg',80646,'Sunbed Zone','고급스럽게 태양을 마주하는 방법, 럭셔리 썬베드 존',2),(7,'spa-pool9.jpg',95410,'Rooftop','더욱 가까워진 해운대 바다의 조망을 감상할 수 있도록<br>설계한 오션 포토존과 럭셔리 태닝존에서는 여유롭고<br>이국적인 해변 리조트 분위기를 느끼 실 수 있습니다.',2),(8,'spa-sauna3.jpg',199786,'남자사우나','건·습식 사우나, 원적외선 사우나, 자쿠지(전신, 발, 어깨), 스낵바, 파우더룸',3),(9,'spa-sauna4.jpg',258910,'여자사우나','건·습식 사우나, 하노끼(전신), 여성전용 노천온천, 스낵바, 수면실, 파우더룸',3),(10,'spa-fitness3.jpg',668815,'다양한 기구 & 에어로빅 센터','러닝머신, 근력강화 기구, 스텝, 웨이트 등 신관 에어로빅 센터 (뷰티바벨, 스텝박스, 매트, 짐볼 등을 비치해 두고 있습니다.)',4),(11,'spa-retreat4.jpg',160168,'미스트룸','동양식 좌훈요법으로 탄생한 여성전용 한방스팀을 체험하실 수 있습니다.',5),(12,'spa-retreat5.jpg',175005,'하노끼 커플룸','천연 히노끼 원목을 사용한 욕조에서 연인과 함께하는 스파로 독특한 일본 사케 입욕이 가능합니다.',5),(13,'spa-retreat6.jpg',94575,'리테일샵','미국의 최고급 코스메틱 과학으로 탄생한 순다리 오리지널 정품을 판매합니다.',5),(14,'spa-retreat7.jpg',106271,'1인 히노끼룸','풋스파, 샤워, 바디 트리트먼트와 바디 스파, 메이크업까지 독립된 공간에서 원스톱 서비스를 제공하며, 시원한 바다 전망이 주는 풍부한 공간감이 매력포인트입니다.',5),(15,'spa-retreat8.jpg',105127,'월풀 커플룸','사랑하는 여인과 환상적인 바다를 바라보며 즐기는 월풀스파, 풋스파와 바디 트리트먼트, 메이크업까지 편안하게 이용하실 수 있는 공간입니다.',5);
/*!40000 ALTER TABLE `lifestyle_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifestyle_image`
--

DROP TABLE IF EXISTS `lifestyle_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle_image` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `lifestyle_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_lifestyle_image_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_image_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle_image`
--

LOCK TABLES `lifestyle_image` WRITE;
/*!40000 ALTER TABLE `lifestyle_image` DISABLE KEYS */;
INSERT INTO `lifestyle_image` VALUES (1,'spa-cimer1.jpg',632333,1),(2,'spa-cimer2.jpg',428265,1),(3,'spa-pool1.jpg',393828,2),(4,'spa-pool2.jpg',471082,2),(5,'spa-pool3.jpg',510350,2),(6,'spa-pool4.jpg',482893,2),(7,'spa-pool5.jpg',539422,2),(8,'spa-sauna1.jpg',752489,3),(9,'spa-sauna2.jpg',582399,3),(10,'spa-fitness1.jpg',667701,4),(11,'spa-fitness2.jpg',668815,4),(12,'spa-retreat1.jpg',473310,5),(13,'spa-retreat2.jpg',452428,5),(14,'spa-retreat3.jpg',480743,5),(15,'kidsvillage-driving1.jpg',514717,6),(16,'kidsvillage-driving2.jpg',429735,6),(17,'kidsvillage-driving3.jpg',351210,6),(18,'kidsvillage-driving4.jpg',403023,6),(19,'kidsvillage-driving5.jpg',413716,6),(20,'kidsvillage-driving6.jpg',566521,6),(21,'kidsvillage-playlab1.jpg',494358,7),(22,'kidsvillage-rounge1.jpg',453377,8),(23,'kidsvillage-rounge2.jpg',426212,8),(24,'kidsvillage-rounge3.jpg',471604,8),(25,'kidsvillage-book1.jpg',470025,9),(26,'kidsvillage-book2.jpg',471136,9),(27,'kidsvillage-family1.jpg',399957,10),(28,'kidsvillage-family2.jpg',633605,10),(29,'kidsvillage-family3.jpg',871017,10),(30,'kidsvillage-family4.jpg',510716,10);
/*!40000 ALTER TABLE `lifestyle_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifestyle_price`
--

DROP TABLE IF EXISTS `lifestyle_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifestyle_price` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `price_type` varchar(100) DEFAULT NULL,
  `price` text,
  `lifestyle_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_lifestyle_price_lifestyle1_idx` (`lifestyle_no`),
  CONSTRAINT `fk_lifestyle_price_lifestyle1` FOREIGN KEY (`lifestyle_no`) REFERENCES `lifestyle` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifestyle_price`
--

LOCK TABLES `lifestyle_price` WRITE;
/*!40000 ALTER TABLE `lifestyle_price` DISABLE KEYS */;
INSERT INTO `lifestyle_price` VALUES (1,'성인','33,000',1),(2,'어린이','16,500',1),(3,'성인','33,000',2),(4,'어린이','16,500',2),(5,'성인','46,200',3),(6,'','객실 투숙객에 한하여 무료이용',4),(7,'시그너쳐 바디 트리트먼트(90분)','250,000',5),(8,'시그너쳐 바디&훼이셜 트리트먼트(120분)','340,000',5),(9,'커플 스파 트리트먼트(150분)','780,000',5),(10,'백&훼이셜 트리트먼트 (90분)','250,000',5),(11,'','무료',6),(12,'','무료',7),(13,'','무료',8),(14,'','무료',9),(15,'','[어린이 / 1시간 기준]<br> 12개월 미만 : 무료<br>12개월 이상 : 15,000원<br><br>[보호자 / 시간 제한 없음]<br>7,000원<br><br>[추가요금]<br>10분당 2,500원',10);
/*!40000 ALTER TABLE `lifestyle_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `sno` int(11) DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','admin123!','관리자','1999-09-09','','dojh5555@gmail.com','min','ad','08792','서울 관악구 낙성대역길 8  (봉천동)','아무로 123',NULL,'2021-07-11 03:51:11','가입',10,0),(2,'subadmin','admin123!','서브관리자','1988-08-08','01011234567','dojh555@gmail.com','','','05408','서울 강동구 성내동 441-2 ','아무주소',NULL,'2021-07-13 12:36:09','대기',8,0),(3,'user1','user123!','김지연','1998-05-22','01012345678','wasupvelo@gmail.com','JiYeon','Kim','06326','서울 강남구 선릉로 8  (개포동, 래미안블레스티지)','123','N','2021-07-14 01:39:53','가입',1,1),(4,'user2','user123!','이연수','1988-08-08','01011234567','wasupvelo@gmail.com','','','06326','서울 강동구 성내동 441-2 ','2층',NULL,'2021-07-14 10:36:09','가입',1,2),(5,'user3','user123!','강진호','1988-08-08','01011234567','wasupvelo@gmail.com','','','06326','서울 강동구 성내동 441-2 ','3층',NULL,'2021-07-14 10:36:09','가입',1,0),(6,'user4','user123!','임민호','1988-08-08','01011234567','wasupvelo@gmail.com','','','06326','서울 강동구 성내동 441-2 ','4층',NULL,'2021-07-14 10:36:09','가입',1,0),(7,'user5','user123!','신동훈','1971-02-11','01045457878','wasupvelo@gmail.com','','','06281','서울 강남구 남부순환로 2907  (대치동)','565',NULL,'2021-07-14 07:14:44','대기',8,0),(8,'user6','user123!','홍길동','1971-02-11','01045457878','wasupvelo@gmail.com','','','06281','서울 강남구 남부순환로 1234  (대치동)','565',NULL,'2021-07-14 07:14:44','가입',1,1),(9,'user7','user123!','신지연','1951-03-11','01045457878','wasupvelo@gmail.com','','','06281','서울 구로구 남부순환로 2907  (독산동)','22',NULL,'2021-07-14 07:14:44','가입',1,1),(10,'user8','user123!','임동훈','1971-04-11','01045457878','wasupvelo@gmail.com','','','06281','서울 강남구 남부순환로 1234  (대치동)','76',NULL,'2021-07-14 07:14:44','가입',1,1),(11,'user9','user123!','임민호','1973-05-12','01045457878','wasupvelo@gmail.com','','','06281','서울 구로구 남부순환로 1234  (독산동)','877',NULL,'2021-07-14 07:14:44','가입',1,0),(12,'user10','user123!','곽진주','1976-02-11','01045457878','wasupvelo@gmail.com','','','06281','서울 강남구 남부순환로 3432  (대치동)','66',NULL,'2021-07-14 07:14:44','가입',1,1),(13,'user11','user123!','강민지','1972-08-15','01045457878','wasupvelo@gmail.com','','','06281','서울 구로구 남부순환로 2345  (독산동)','808',NULL,'2021-07-14 07:14:44','가입',1,2),(14,'user12','user123!','이숙영','1998-10-14','01045457878','wasupvelo@gmail.com','','','06281','서울 강남구 남부순환로 2345  (대치동)','99',NULL,'2021-07-14 07:14:44','가입',1,1),(15,'user13','user123!','양진주','1981-12-13','01045457878','wasupvelo@gmail.com','','','06281','서울 구로구 남부순환로 657  (독산동)','123',NULL,'2021-07-14 07:14:44','가입',1,1),(16,'user14','user123!','민경훈','1974-11-21','01045457878','wasupvelo@gmail.com','','','06281','서울 구로구 남부순환로 2907  (독산동)','1',NULL,'2021-07-14 07:14:44','가입',1,1),(17,'user15','user123!','강누리','1972-02-11','01045457878','wasupvelo@gmail.com','','','06281','서울 강남구 남부순환로 2907  (대치동)','2',NULL,'2021-07-14 07:14:44','가입',1,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_detail`
--

DROP TABLE IF EXISTS `point_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_detail`
--

LOCK TABLES `point_detail` WRITE;
/*!40000 ALTER TABLE `point_detail` DISABLE KEYS */;
INSERT INTO `point_detail` VALUES (1,3,1,3000,1,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(2,3,1,3000,2,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(3,3,1,3000,3,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(4,3,1,3000,4,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(5,3,1,3000,5,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(6,3,1,3000,6,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(7,3,1,3000,7,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(8,3,1,3000,8,'2021-07-14 00:00:00','2022-07-14 00:00:00'),(9,3,1,45738,9,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(10,4,1,22411,10,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(11,5,1,20632,11,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(12,6,1,18854,12,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(13,8,1,19565,13,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(14,9,1,23834,14,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(15,10,1,24190,15,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(16,3,1,20328,16,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(17,4,1,22869,17,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(18,16,1,24190,18,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(19,15,1,22767,19,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(20,14,1,18854,20,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(21,12,1,19921,21,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(22,4,1,21054,22,'2021-07-19 00:00:00','2022-07-19 00:00:00'),(23,13,1,22411,23,'2021-07-19 00:00:00','2022-07-19 00:00:00');
/*!40000 ALTER TABLE `point_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_event`
--

DROP TABLE IF EXISTS `point_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_event`
--

LOCK TABLES `point_event` WRITE;
/*!40000 ALTER TABLE `point_event` DISABLE KEYS */;
INSERT INTO `point_event` VALUES (1,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(2,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(3,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(4,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(5,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(6,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(7,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(8,1,3000,'2021-07-14 00:00:00','2021-08-14 00:00:00',3,1),(9,1,45738,'2021-07-19 00:00:00','2021-08-19 00:00:00',3,1),(10,1,22411,'2021-07-19 00:00:00','2021-08-19 00:00:00',4,2),(11,1,20632,'2021-07-19 00:00:00','2021-08-19 00:00:00',5,3),(12,1,18854,'2021-07-19 00:00:00','2021-08-19 00:00:00',6,4),(13,1,19565,'2021-07-19 00:00:00','2021-08-19 00:00:00',8,5),(14,1,23834,'2021-07-19 00:00:00','2021-08-19 00:00:00',9,6),(15,1,24190,'2021-07-19 00:00:00','2021-08-19 00:00:00',10,7),(16,1,20328,'2021-07-19 00:00:00','2021-08-19 00:00:00',3,8),(17,1,22869,'2021-07-19 00:00:00','2021-08-19 00:00:00',4,9),(18,1,24190,'2021-07-19 00:00:00','2021-08-19 00:00:00',16,10),(19,1,22767,'2021-07-19 00:00:00','2021-08-19 00:00:00',15,11),(20,1,18854,'2021-07-19 00:00:00','2021-08-19 00:00:00',14,12),(21,1,19921,'2021-07-19 00:00:00','2021-08-19 00:00:00',12,13),(22,1,21054,'2021-07-19 00:00:00','2021-08-19 00:00:00',4,14),(23,1,22411,'2021-07-19 00:00:00','2021-08-19 00:00:00',13,15);
/*!40000 ALTER TABLE `point_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(20) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `contents` varchar(100) DEFAULT NULL,
  `wdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `writer` int(11) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastaurants_attach`
--

DROP TABLE IF EXISTS `rastaurants_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rastaurants_attach` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `rt_adm_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_rastaurants_attach_restaurants_adm1_idx` (`rt_adm_no`),
  CONSTRAINT `fk_rastaurants_attach_restaurants_adm1` FOREIGN KEY (`rt_adm_no`) REFERENCES `restaurants_adm` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastaurants_attach`
--

LOCK TABLES `rastaurants_attach` WRITE;
/*!40000 ALTER TABLE `rastaurants_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastaurants_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2021-07-19 03:00:00','2021-07-23','2021-07-24',1,1,0,0,0,1,NULL,NULL,NULL,NULL,1200000,252000,72600,0,0,0,1524600,1524600,'김지연','wasupvelo@gmail.com','010-2345-5678','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',1,3,63),(2,'2021-07-19 03:00:38','2021-07-29','2021-07-30',1,1,2,0,0,3,NULL,NULL,NULL,NULL,570000,119700,72600,0,15246,0,762300,747054,'이연수','wasupvelo@gmail.com','010-1234-4567','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',3,4,25),(3,'2021-07-19 03:01:12','2021-08-16','2021-08-26',1,3,0,0,0,3,NULL,NULL,NULL,NULL,520000,109200,72600,0,14036,0,701800,687764,'강진호','wasupvelo@gmail.com','010-1234-4567','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',5,5,15),(4,'2021-07-19 03:01:42','2021-08-18','2021-08-27',1,2,1,0,0,3,NULL,NULL,NULL,NULL,470000,98700,72600,0,12826,0,641300,628474,'임민호','wasupvelo@gmail.com','010-1234-4567','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',4,6,28),(5,'2021-07-19 03:03:55','2021-08-16','2021-08-20',1,3,0,1,0,4,NULL,NULL,NULL,NULL,490000,102900,72600,0,13310,0,665500,652190,'홍길동','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',3,8,1),(6,'2021-07-19 03:04:26','2021-08-17','2021-08-19',1,1,1,2,0,4,NULL,NULL,NULL,NULL,610000,128100,72600,0,16214,0,810700,794486,'신지연','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',3,9,47),(7,'2021-07-19 03:04:55','2021-07-21','2021-07-24',1,2,0,0,0,2,NULL,NULL,NULL,NULL,620000,130200,72600,0,16456,0,822800,806344,'임동훈','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',2,10,48),(8,'2021-07-19 03:05:27','2021-08-23','2021-08-26',1,2,1,1,0,4,NULL,NULL,NULL,NULL,500000,105000,72600,0,0,0,677600,677600,'김지연','wasupvelo@gmail.com','010-2345-5678','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',4,3,43),(9,'2021-07-19 03:05:51','2021-08-04','2021-08-07',1,3,0,0,0,3,NULL,NULL,NULL,NULL,570000,119700,72600,0,0,0,762300,762300,'이연수','wasupvelo@gmail.com','010-1234-4567','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',3,4,26),(10,'2021-07-19 03:06:22','2021-08-16','2021-08-19',1,2,0,0,0,2,NULL,NULL,NULL,NULL,620000,130200,72600,0,16456,0,822800,806344,'민경훈','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',2,16,44),(11,'2021-07-19 03:06:50','2021-08-02','2021-08-04',1,2,0,0,0,2,NULL,NULL,NULL,NULL,580000,121800,72600,0,15488,0,774400,758912,'양진주','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',2,15,29),(12,'2021-07-19 03:07:14','2021-08-20','2021-08-21',1,1,0,0,0,1,NULL,NULL,NULL,NULL,470000,98700,72600,0,12826,0,641300,628474,'이숙영','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',4,14,27),(13,'2021-07-19 03:07:40','2021-08-09','2021-08-14',1,2,0,0,1,3,NULL,NULL,NULL,NULL,500000,105000,72600,0,13552,0,677600,664048,'곽진주','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',2,12,2),(14,'2021-07-19 03:08:05','2021-08-10','2021-08-13',1,2,1,1,0,4,NULL,NULL,NULL,NULL,520000,109200,72600,0,0,0,701800,701800,'이연수','wasupvelo@gmail.com','010-1234-4567','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',5,4,16),(15,'2021-07-19 03:09:01','2021-08-10','2021-08-20',1,2,0,1,0,3,NULL,NULL,NULL,NULL,570000,119700,72600,0,15246,0,762300,747054,'강민지','wasupvelo@gmail.com','010-5457-7878','요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 요청사항입니다 ',0,'예약대기',3,13,70);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_adm`
--

DROP TABLE IF EXISTS `reservation_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_adm`
--

LOCK TABLES `reservation_adm` WRITE;
/*!40000 ALTER TABLE `reservation_adm` DISABLE KEYS */;
INSERT INTO `reservation_adm` VALUES (1,'시그니처 럭셔리 스위트','고급스럽고 독보적인 파라다이스호텔 부산의 시그니처 스페셜 스위트를 경험해보세요.','2021-07-14','2021-07-31',NULL,'스페셜 스위트 (성인 4인)','기본 혜택 + 조식 (성인 4인) + 라운지 파라다이스 (성인 4인 / 티타임, 해피아워) + 순다리 스파 (성인 2인)',NULL,0,'2021-07-14 00:58:54'),(2,'그린 썸머 올 인클루시브 (col. 호호당)','파라다이스에서 준비한 ‘그린 썸머 올인클루시브’ 패키지로 여름휴가를 더 시원하고 특별하게 경험해보세요.','2021-07-16','2021-08-31',NULL,'디럭스 (성인 2인 + 어린이 2인)','기본 혜택 + 조식 (성인 2인) + 150,000 리조트 머니 + 호호당 에코백',NULL,0.04,'2021-07-14 00:59:25'),(3,'썸머 라운지','오직 소수만 누릴 수 있는 명품 프라이빗 럭셔리 서비스의 모든 것!','2021-07-14','2021-08-31',NULL,'디럭스 (성인 2인 + 어린이 2인)','기본혜택 + 라운지 파라다이스 서비스 (성인 2인) + 실내 사우나',NULL,0.06,'2021-07-14 00:59:54'),(4,'썸머 모닝 패밀리 밀박스','호텔 셰프들이 직접 엄선한 품격 있고 영양 가득한 메뉴와 룸서비스만의 여유 그리고 더 안전한 언택트 다이닝을 지금 객실에서 만나보세요.','2021-07-16','2021-08-31',NULL,'디럭스 (성인 2인 + 어린이 2인)','기본 혜택 + 패밀리 모닝 밀박스 (성인 2인 + 어린이 2인)',NULL,0.22,'2021-07-14 01:00:23'),(5,'치휴 레몬 썸머','시원하고 푸른 하늘을 닮은 해운대 바다와 여름 휴가의 신나는 경험과 즐거움까지 모두 만끽 할 수 있는 치휴 레몬 썸머  패키지를 만나보세요.','2021-07-16','2021-08-31',NULL,'디럭스 (성인 2인 + 어린이 2인) / 프리미엄 디럭스ㆍ스위트 (성인 3인 + 어린이 1인)','[A타입] 기본 혜택 + 소프트 음료|\r\n[B타입] 기본 혜택 + 소프트 음료 + 조식 (성인 2인)|\r\n* 스위트 예약 고객에게 [랑방 \"걸 인 카프리\" 프래그런스] 를 제공해 드립니다. (소진시 까지)',NULL,0.34,'2021-07-14 01:00:51');
/*!40000 ALTER TABLE `reservation_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_attach`
--

DROP TABLE IF EXISTS `reservation_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_attach` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `size` int(11) NOT NULL,
  `rsv_adm` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_attach_room_adm1_idx` (`rsv_adm`),
  CONSTRAINT `fk_attach_room_adm1` FOREIGN KEY (`rsv_adm`) REFERENCES `reservation_adm` (`rezAdm_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_attach`
--

LOCK TABLES `reservation_attach` WRITE;
/*!40000 ALTER TABLE `reservation_attach` DISABLE KEYS */;
INSERT INTO `reservation_attach` VALUES (1,'thum_list6.jpg',139641,1),(2,'thum_list4.jpg',130887,2),(3,'thum_list3.jpg',134481,3),(4,'thum_list2.jpg',127772,4),(5,'thum_list1.jpg',156660,5);
/*!40000 ALTER TABLE `reservation_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_promotion`
--

DROP TABLE IF EXISTS `reservation_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_promotion`
--

LOCK TABLES `reservation_promotion` WRITE;
/*!40000 ALTER TABLE `reservation_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'nyx','2021-07-16','Dinner','2021-07-14 07:07:41',2,0,0,0,0,'김지연','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(2,'nam','2021-07-30','Dinner','2021-07-14 07:08:45',1,2,0,0,0,'이연수','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(3,'sakca','2021-08-13','Lunch','2021-07-14 07:09:04',2,1,0,0,0,'이연수','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(4,'nyx','2021-07-16','Dinner','2021-07-14 07:10:33',1,2,1,0,0,'강진호','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(5,'nam','2021-07-16','Lunch','2021-07-14 07:11:52',1,1,0,0,0,'임민호','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(6,'sakca','2021-09-10','Dinner','2021-07-14 07:12:10',1,2,2,0,0,'임민호','010-1324-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(7,'sakca','2021-08-06','Lunch','2021-07-14 07:12:33',1,0,2,0,0,'임민호','010-1123-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(8,'nam','2021-07-16','Lunch','2021-07-14 07:23:53',1,2,0,0,0,'곽진주','010-1111-1111','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(9,'nam','2021-08-12','Dinner','2021-07-14 07:24:14',1,1,1,0,0,'곽진주','010-1222-2222','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(10,'sakca','2021-08-19','Lunch','2021-07-14 07:25:01',1,2,1,0,0,'강민지','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(11,'nam','2021-07-22','Dinner','2021-07-14 07:25:28',1,2,0,0,0,'강민지','010-1234-1234','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(12,'nyx','2021-08-26','Dinner','2021-07-14 07:25:52',1,2,0,0,0,'이숙영','010-1212-1231','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(13,'nyx','2021-09-07','Lunch','2021-07-14 07:26:09',1,1,0,0,0,'이숙영','010-1111-1111','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(14,'sakca','2021-08-19','Lunch','2021-07-14 07:26:29',3,1,0,0,0,'이숙영','010-1111-1111','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(15,'sakca','2021-07-22','Lunch','2021-07-14 07:27:06',1,1,0,0,0,'양진주','010-1111-1111','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL),(16,'nam','2021-07-21','Lunch','2021-07-14 07:27:24',2,0,0,0,0,'양진주','010-1231-1231','wasupvelo@gmail.com','요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항요청사항','예약대기',NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_adm`
--

DROP TABLE IF EXISTS `restaurants_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_adm`
--

LOCK TABLES `restaurants_adm` WRITE;
/*!40000 ALTER TABLE `restaurants_adm` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rez_adm_room_type`
--

DROP TABLE IF EXISTS `rez_adm_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rez_adm_room_type`
--

LOCK TABLES `rez_adm_room_type` WRITE;
/*!40000 ALTER TABLE `rez_adm_room_type` DISABLE KEYS */;
INSERT INTO `rez_adm_room_type` VALUES (1,1,3,'스위트','ㆍ조식 (성인 3인)<br>ㆍ소프트 음료<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈 드라이빙<br>ㆍHABA &amp; 웅진북클럽'),(2,2,1,'디럭스','ㆍ소프트 음료<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈 드라이빙<br>ㆍHABA &amp; 웅진북클럽'),(3,3,1,'디럭스','ㆍ소프트 음료<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈 드라이빙<br>ㆍHABA &amp; 웅진북클럽'),(4,4,1,'디럭스','ㆍ소프트 음료<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈 드라이빙<br>ㆍHABA &amp; 웅진북클럽'),(5,5,2,'프리미엄 디럭스','ㆍ조식 (성인 3인)<br>ㆍ소프트 음료<br>ㆍ오션스파 씨메르<br>ㆍ야외 오션스파 풀<br>ㆍBMW 키즈 드라이빙<br>ㆍHABA &amp; 웅진북클럽');
/*!40000 ALTER TABLE `rez_adm_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_detail`
--

DROP TABLE IF EXISTS `room_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_detail` (
  `roomdetail_no` int(11) NOT NULL AUTO_INCREMENT,
  `room_view` varchar(10) DEFAULT NULL,
  `room_location` varchar(2) DEFAULT NULL,
  `room_bedtype` varchar(2) DEFAULT NULL,
  `room_price` int(11) DEFAULT NULL,
  `room_thumb_name` varchar(45) DEFAULT NULL,
  `room_thumb_size` int(11) DEFAULT NULL,
  `room_type_no` int(11) NOT NULL,
  PRIMARY KEY (`roomdetail_no`),
  KEY `fk_room_detail_room_type1_idx` (`room_type_no`),
  CONSTRAINT `fk_room_detail_room_type1` FOREIGN KEY (`room_type_no`) REFERENCES `room_type` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `room_detail_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_room_image_room_detail1_idx` (`room_detail_no`),
  CONSTRAINT `fk_room_image_room_detail1` FOREIGN KEY (`room_detail_no`) REFERENCES `room_detail` (`roomdetail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `adult_cnt` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `wdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(4) DEFAULT '예약대기',
  `room_number` int(11) DEFAULT NULL,
  `room_detail_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_rooms_room_detail1_idx` (`room_detail_no`),
  CONSTRAINT `fk_rooms_room_detail1` FOREIGN KEY (`room_detail_no`) REFERENCES `room_detail` (`roomdetail_no`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'예약중',101,1),(2,'예약중',102,1),(3,'예약대기',103,1),(4,'예약대기',104,1),(5,'예약대기',105,1),(6,'예약대기',106,2),(7,'예약대기',107,2),(8,'예약대기',108,2),(9,'예약대기',109,2),(10,'예약대기',110,3),(11,'예약대기',111,3),(12,'예약대기',112,3),(13,'예약대기',113,3),(14,'예약대기',114,3),(15,'예약중',115,4),(16,'예약중',116,4),(17,'예약대기',117,4),(18,'예약대기',118,5),(19,'예약대기',119,5),(20,'예약대기',120,5),(21,'예약대기',121,6),(22,'예약대기',122,6),(23,'예약대기',309,6),(24,'예약대기',310,6),(25,'예약중',311,7),(26,'예약중',312,7),(27,'예약중',127,7),(28,'예약중',128,8),(29,'예약중',129,8),(30,'예약대기',201,8),(31,'예약대기',202,8),(32,'예약대기',203,9),(33,'예약대기',204,9),(34,'예약대기',205,9),(35,'예약대기',206,9),(36,'예약대기',207,9),(37,'예약대기',208,10),(38,'예약대기',209,10),(39,'예약대기',210,10),(40,'예약대기',211,10),(41,'예약대기',212,10),(42,'예약대기',213,10),(43,'예약중',214,11),(44,'예약중',215,11),(45,'예약대기',216,11),(46,'예약대기',217,11),(47,'예약중',218,12),(48,'예약중',219,12),(49,'예약대기',301,13),(50,'예약대기',302,13),(51,'예약대기',303,13),(52,'예약대기',304,13),(53,'예약대기',305,13),(54,'예약대기',306,14),(55,'예약대기',307,14),(56,'예약대기',308,14),(57,'예약대기',401,15),(58,'예약대기',402,15),(59,'예약대기',403,15),(60,'예약대기',404,15),(61,'예약대기',405,15),(62,'예약대기',406,15),(63,'예약중',309,16),(64,'예약대기',310,16),(65,'예약대기',311,16),(66,'예약대기',407,17),(67,'예약대기',408,17),(68,'예약대기',409,17),(69,'예약대기',410,17),(70,'예약중',411,7);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rqna`
--

DROP TABLE IF EXISTS `rqna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rqna` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `reponse` varchar(100) NOT NULL,
  `wdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `writer` int(11) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rqna`
--

LOCK TABLES `rqna` WRITE;
/*!40000 ALTER TABLE `rqna` DISABLE KEYS */;
/*!40000 ALTER TABLE `rqna` ENABLE KEYS */;
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

-- Dump completed on 2021-07-19 12:11:21
