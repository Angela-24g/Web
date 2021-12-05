SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 ;

drop database `hotel`;

USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`member` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(12) NULL,
  `pw` VARCHAR(20) NULL,
  `name` VARCHAR(50) NULL,
  `birth` DATE NULL,
  `tel` VARCHAR(11) NULL,
  `email` VARCHAR(64) NULL,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `post` VARCHAR(5) NULL,
  `address` VARCHAR(45) NULL,
  `detail_address` VARCHAR(45) NULL,
  `marketing` VARCHAR(1) NULL,
  `jdate` TIMESTAMP NULL DEFAULT current_timestamp,
  `state` VARCHAR(2) NULL DEFAULT '대기',
  `grade` INT NULL DEFAULT 1,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

insert into `member`(id,pw,`name`,birth,tel,email,first_name,last_name,post,address,detail_address,marketing) 
values("dbdlsghd","dbdlsghd","유인홍","19940917","0100000000","dbdlsghd@gmail.com","inhong","you",00000,"경기도 안양시 동안구","저 어느 깊은 산속옹달샘",1);

-- -----------------------------------------------------
-- Table `hotel`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`reservation` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `date_write` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_in` DATE NOT NULL,
  `check_out` DATE NOT NULL,
  `room_count` INT NOT NULL DEFAULT 1,
  `count_adult` INT NULL,
  `count_elementary` INT NULL,
  `count_child` INT NULL,
  `count_baby` INT NULL,
  `count_all` INT NOT NULL,
  `promotion_name` VARCHAR(45) NULL,
  `promotion_code` INT NULL,
  `breakfast_adult` INT NULL,
  `breakfast_child` INT NULL,
  `price_product` INT NOT NULL,
  `price_service` INT NOT NULL,
  `price_bed` INT NOT NULL,
  `price_options` INT NOT NULL,
  `price_total` INT NOT NULL,
  `member_id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NOT NULL,
  `add_requests` VARCHAR(150) NULL,
  `views` INT NULL DEFAULT 0,
  `state` VARCHAR(45) NOT NULL DEFAULT 0,
  `rsv_adm_no` INT NOT NULL,
  `writer` INT NOT NULL,
  `rooms_no` INT NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_reservation_reservation_adm1_idx` (`rsv_adm_no` ASC) VISIBLE,
  INDEX `fk_reservation_member1_idx` (`writer` ASC) VISIBLE,
  INDEX `fk_reservation_rooms1_idx` (`rooms_no` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_reservation_adm1`
    FOREIGN KEY (`rsv_adm_no`)
    REFERENCES `hotel`.`reservation_adm` (`rezAdm_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_member1`
    FOREIGN KEY (`writer`)
    REFERENCES `hotel`.`member` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_rooms1`
    FOREIGN KEY (`rooms_no`)
    REFERENCES `hotel`.`rooms` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into reservation(check_in,check_out,count_adult,count_all,`name`,tel,rsv_adm_no,writer,rooms_no,price_product,price_service,price_bed,price_options,price_total) 
values("19940917","19940918",1,1,"유인홍","10121223333",1,1,1,100,100,100,100,100);

-- -----------------------------------------------------
-- Table `hotel`.`point_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`point_event` (
  `no` INT NOT NULL auto_increment,
  `state` INT NOT NULL,
  `amount` INT NOT NULL,
  `trans_date` TIMESTAMP NOT NULL,
  `expire_date` TIMESTAMP NOT NULL,
  `member_no` INT NOT NULL,
  `reservation_no` INT NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_point_event_member1_idx` (`member_no` ASC) VISIBLE,
  INDEX `fk_point_event_reservation1_idx` (`reservation_no` ASC) VISIBLE,
  CONSTRAINT `fk_point_event_member1`
    FOREIGN KEY (`member_no`)
    REFERENCES `hotel`.`member` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_event_reservation1`
    FOREIGN KEY (`reservation_no`)
    REFERENCES `hotel`.`reservation` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `hotel`.`point_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`point_detail` (
  `no` INT NOT NULL auto_increment,
  `state` INT NOT NULL,
  `amount` INT NOT NULL,
  `point_event_no` INT NOT NULL,
  `trans_date` TIMESTAMP NOT NULL,
  `expire_date` TIMESTAMP NOT NULL,
  `member_no` int not null,
  PRIMARY KEY (`no`),
  INDEX `fk_point_detail_point_event1_idx` (`point_event_no` ASC) VISIBLE,
  CONSTRAINT `fk_point_detail_point_event1`
    FOREIGN KEY (`point_event_no`)
    REFERENCES `hotel`.`point_event` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;