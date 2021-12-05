use hotel;

show tables;

desc member;
select if(count(*)=1,1,0) from member where id='admin' and name='관리자' and email='dojh5555@gmail.com' and (state='가입' or state='가입') and grade>=1;
select * from room_type;
select * from room_detail;

select * from room_image;
select * from rooms;

select * from member;

select * from lifestyle;
select * from lifestyle_price;
select * from lifestyle_image;
select * from lifestyle_facility;

select * from reservation;
select * from reservation_attach;
select * from reservation_adm;
select * from reservation_attach;
select * from reservation_promotion;
select * from rez_adm_room_type;

select * from restaurants;
select * from restaurants_adm;

select * from point_detail;
select * from point_event;

select * from qna;
select * from rqna;
update point_detail set expire_date ='2021-08-22' where no=10;
select distinct room_location from room_detail where room_type_no=1 order by room_location desc;
alter table member modify marketing varchar(1) default 'N';

-- auto_increment 컬럼값 재정렬
set @CNT = 0;
update lifestyle_image set no = @CNT:=@CNT+1;

-- auto_increment 컬럼값 초기화
alter table lifestyle_image auto_increment=31;


-- auto_increment 현재값 확인
show create table lifestyle_image;

select r.no, r.rooms_no, r.name, rm.no, rm.room_number from rooms rm inner join reservation r on r.rooms_no = rm.no;


update member set marketing='Y' where no=11;


-- insert 와 update 동시에 --
-- insert into lifestyle_facility(lifeFacility_no,lifeFacility_image_name,lifeFacility_image_size,lifeFacility_title,lifeFacility_info,lifestyle_no) values
-- (1,'ss',11,'asdf','1asdg',1),
-- (2,'asds',12,'qwe','1asss',1),
-- (3,'fd',13,'sfdsa','aasdg',1)
-- on duplicate key update
-- lifeFacility_image_name=values(lifeFacility_image_name), lifeFacility_image_size=values(lifeFacility_image_size), lifeFacility_title=values(lifeFacility_title),lifeFacility_info=values(lifeFacility_info);

-- 다관계 delete 문 : 단점 - auto_increment 에 의한 pk 가 중간이 없어지고 새로 생기기만 한다. --
-- delete from lifestyle_facility where lifestyle_no=1 and lifeFacility_no not in(1);


select * from lifestyle_facility where lifestyle_no=1;
SELECT * FROM reservation_adm WHERE date_format(date_start, '%Y-%m-%d') <= date_format('2021-07-24', '%Y-%m-%d') AND date_format(date_end, '%Y-%m-%d') >= date_format('2021-07-28', '%Y-%m-%d');
select roomdetail_no from room_detail where room_type_no=1 and room_bedtype='더블';
select guide from lifestyle;
SHOW CREATE TABLE room_detail;

select * from member where state = '가입';


select roomdetail_no from room_detail where room_view="시티";
update member set tel='01045554455' where no=1;
select no from room_type where type="디럭스";
select * from rooms where room_detail_no=1 and state='예약대기' limit 1;
select if(count(*)=1,1,0) from member where no in (1,2,3);
select distinct thumbnail_name from room_detail where view = '시티';
SELECT CAST(tel AS UNSIGNED) FROM member ORDER BY tel DESC;

alter table member change rsv_adm_no rsv_adm int;

ALTER TABLE lifestyle_price
MODIFY COLUMN price text;

ALTER TABLE member
add COLUMN sno int default 0;

update member set grade = 1 where no = 1;

delete from member where no = 5;