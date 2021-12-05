
USE `hotel` ;

SHOW TABLES;

SELECT * FROM reservation_adm;
-- SELECT * FROM reservation_adm 
-- WHERE date_format(date_start, '%Y-%m-%d') <= date_format("2021-07-15", '%Y-%m-%d')
-- AND date_format(date_end, '%Y-%m-%d') >= date_format("2021-08-01", '%Y-%m-%d');
-- SELECT * FROM reservation_adm WHERE date_format(date_start, '%Y-%m-%d') <= date_format('2021-08-09', '%Y-%m-%d') AND date_format(date_end, '%Y-%m-%d') >= date_format('2021-08-11', '%Y-%m-%d');

SELECT * FROM reservation_attach;

SELECT * FROM reservation_promotion;

SELECT * FROM reservation;
UPDATE reservation SET state='예약완료' WHERE no=13;

SELECT * FROM reservation_adm;
show create table reservation;
SELECT * FROM rez_adm_room_type;
 INSERT INTO `rez_adm_room_type` VALUES (1,1,1,'디럭스','ㆍ 소프트 음료\r\nㆍ오션스파 씨메르\r\nㆍ야외 오션스파 풀\r\nㆍBMW 키즈 드라이빙\r\nㆍHABA & 웅진북클럽');
 INSERT INTO `rez_adm_room_type` VALUES (2,2,2,'프리미엄 디럭스','ㆍ 소프트 음료\r\nㆍ오션스파 씨메르\r\nㆍ야외 오션스파 풀\r\nㆍBMW 키즈 드라이빙\r\nㆍHABA & 웅진북클럽');
 INSERT INTO `rez_adm_room_type` VALUES (3,3,3,'스위트','ㆍ 소프트 음료\r\nㆍ오션스파 씨메르\r\nㆍ야외 오션스파 풀\r\nㆍBMW 키즈 드라이빙\r\nㆍHABA & 웅진북클럽');

INSERT INTO `reservation` values(1, '2021-07-14', '2021-07-14', '2021-07-14', 1, 1, 1, 1, 0, 3, null, null, null, null, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, '홍길동', 'test@naver.com', '010-1234-1234', '요청없음', 0, '예약대기', 1, 3, 1);

SELECT * FROM room_detail;
SELECT * FROM room_type;
 INSERT INTO `room_type` VALUES (3,'스위트',3,'해안선을 만끽할 수 있는 객실','더욱 여유로워진 객실, 스위트룸을 만나다!<br>달맞이 고개에서 동백섬까지, 끝없이 펼쳐진 해운대 해변의 아름다운 해안선을 만끽할 수 있는 스위트 오션 더블 룸.<br><br>2인용 더블 베드 & 소파 베드 1개 비치<br>뛰어난 쿠션감과 충격 흡수력으로 최상의 포근함을 자랑하는 미국 프리미엄 소파 브랜드 ‘ 아메리칸 레더’사의 소파 베드 비치.<br>편안한 소파 + 아늑한 베드의 이색적인 결합으로 공간 효율성의 극대화 하였습니다.<br><br>Ocean view<br>달맞이 고개에서 동백섬까지, 화려한 도심의 야경과 어우러져 파노라마처럼 길게 펼쳐진 해운대의 매력적인 야경을 즐기실 수 있습니다.','2021-07-09 12:38:41','2021-07-09 12:38:41');




SELECT * FROM rooms;


SELECT * FROM member;
-- INSERT INTO `member` VALUES (4,'user2','user123!','이연수','1988-08-08','01011234567','wasupvelo@gmail.com','','','06326','서울 강동구 성내동 441-2 ','2층',NULL,'2021-07-14 10:36:09','가입',1);
-- INSERT INTO `member` VALUES (5,'user3','user123!','강진호','1988-08-08','01011234567','wasupvelo@gmail.com','','','06326','서울 강동구 성내동 441-2 ','3층',NULL,'2021-07-14 10:36:09','가입',1);
-- INSERT INTO `member` VALUES (6,'user4','user123!','임민호','1988-08-08','01011234567','wasupvelo@gmail.com','','','06326','서울 강동구 성내동 441-2 ','4층',NULL,'2021-07-14 10:36:09','가입',1);





SELECT * FROM restaurants;

SELECT * FROM point_detail;
SELECT * FROM point_event;




SELECT * FROM restaurants WHERE no IN (
(SELECT no FROM restaurants WHERE no < no ORDER BY no DESC LIMIT 1),
(SELECT no FROM restaurants WHERE no > no ORDER BY no LIMIT 1)
);
SELECT * FROM restaurants WHERE no = 2;
SELECT * FROM restaurants WHERE no < 2 ORDER BY no DESC LIMIT 1;
SELECT * FROM restaurants WHERE no > 2 ORDER BY no LIMIT 1;

SELECT * FROM restaurants WHERE no IN(
(SELECT no FROM restaurants WHERE no < 2 ORDER BY no DESC LIMIT 1),
(SELECT no FROM restaurants WHERE no > 2 ORDER BY no LIMIT 1)
)




