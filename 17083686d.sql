-- MySQL Script generated by MySQL Workbench
-- Wed Nov 21 17:49:52 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 17083686d
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 17083686d
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `17083686d` DEFAULT CHARACTER SET utf8 ;
USE `17083686d` ;

-- -----------------------------------------------------
-- Table `17083686d`.`Tourists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Tourists` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Tourists` (
  `TouristsID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `Gender` ENUM('F', 'M', 'Other') NOT NULL,
  `Age` INT(3) NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `Username` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`TouristsID`));


-- -----------------------------------------------------
-- Table `17083686d`.`timestamps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`timestamps` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `17083686d`.`Administrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Administrator` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Administrator` (
  `AdmID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AdmID`));


-- -----------------------------------------------------
-- Table `17083686d`.`Message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Message` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Message` (
  `MID` INT NOT NULL AUTO_INCREMENT,
  `Message` VARCHAR(500) NOT NULL,
  `creat_time` TIMESTAMP NOT NULL,
  `AdmID` INT NOT NULL,
  `TouristsID` INT NOT NULL,
  PRIMARY KEY (`MID`),
  INDEX `AdmID_idx` (`AdmID` ASC) ,
  INDEX `TouristsID_idx` (`TouristsID` ASC) ,
  CONSTRAINT `msg_admin_AdmID`
    FOREIGN KEY (`AdmID`)
    REFERENCES `17083686d`.`Administrator` (`AdmID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `msg_t_TouristsID`
    FOREIGN KEY (`TouristsID`)
    REFERENCES `17083686d`.`Tourists` (`TouristsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `17083686d`.`Arrange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Arrange` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Arrange` (
  `ArrangeId` INT NOT NULL AUTO_INCREMENT,
  `ArriveDay` DATE NOT NULL,
  `LeaveDay` DATE NOT NULL,
  `Activate` CHAR(3) NOT NULL,
  `TouristsID` INT NOT NULL,
  PRIMARY KEY (`ArrangeId`),
  INDEX `TouristsID_idx` (`TouristsID` ASC) ,
  CONSTRAINT `Arrange__TouristsID`
    FOREIGN KEY (`TouristsID`)
    REFERENCES `17083686d`.`Tourists` (`TouristsID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `17083686d`.`Restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Restaurant` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Restaurant` (
  `RID` INT NOT NULL AUTO_INCREMENT,
  `RName` VARCHAR(50) NOT NULL,
  `Area` VARCHAR(50) NOT NULL,
  `AveragePrice` FLOAT NOT NULL,
  `RImage` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`RID`));


-- -----------------------------------------------------
-- Table `17083686d`.`FoodType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`FoodType` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`FoodType` (
  `FID` INT NOT NULL AUTO_INCREMENT,
  `FoodType` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`FID`));


-- -----------------------------------------------------
-- Table `17083686d`.`Restaurant_Foodtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Restaurant_Foodtype` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Restaurant_Foodtype` (
  `RID` INT NOT NULL,
  `FID` INT NOT NULL,
  PRIMARY KEY (`RID`, `FID`),
  INDEX `FID_idx` (`FID` ASC) ,
  CONSTRAINT `Restaurant_Foodtype__RID`
    FOREIGN KEY (`RID`)
    REFERENCES `17083686d`.`Restaurant` (`RID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `Restaurant_Foodtype__FID`
    FOREIGN KEY (`FID`)
    REFERENCES `17083686d`.`FoodType` (`FID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `17083686d`.`RecommandRes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`RecommandRes` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`RecommandRes` (
  `RecRID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Time` ENUM('MORN', 'EVEN') NOT NULL,
  `ArrangeId` INT NULL,
  `RID` INT NOT NULL,
  PRIMARY KEY (`RecRID`),
  INDEX `ArrangeId_idx` (`ArrangeId` ASC) ,
  INDEX `RId_idx` (`RId` ASC) ,
  CONSTRAINT `fk_RecommandRes_ArrangeId`
    FOREIGN KEY (`ArrangeId`)
    REFERENCES `17083686d`.`Arrange` (`ArrangeId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RecommandRes_RId`
    FOREIGN KEY (`RID`)
    REFERENCES `17083686d`.`Restaurant` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `17083686d`.`Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Hotel` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Hotel` (
  `HID` INT NOT NULL AUTO_INCREMENT,
  `HName` VARCHAR(50) NOT NULL,
  `Area` VARCHAR(50) NOT NULL,
  `Level` ENUM('1', '2', '3', '4', '5') NOT NULL,
  `HImage` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`HID`));


-- -----------------------------------------------------
-- Table `17083686d`.`RecommandHotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`RecommandHotel` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`RecommandHotel` (
  `RecHID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `ArrangeId` INT NULL,
  `HID` INT NOT NULL,
  PRIMARY KEY (`RecHID`),
  INDEX `ArrangeId_idx` (`ArrangeId` ASC) ,
  INDEX `HId_idx` (`HId` ASC) ,
  CONSTRAINT `fk_RecommandHotel_ArrangeId`
    FOREIGN KEY (`ArrangeId`)
    REFERENCES `17083686d`.`Arrange` (`ArrangeId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RecommandHotel_HId`
    FOREIGN KEY (`HID`)
    REFERENCES `17083686d`.`Hotel` (`HID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `17083686d`.`RoomInfor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`RoomInfor` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`RoomInfor` (
  `RMID` INT NOT NULL AUTO_INCREMENT,
  `RoomType` VARCHAR(50) NOT NULL,
  `Price` FLOAT NOT NULL,
  `Hotel_HID` INT NOT NULL,
  PRIMARY KEY (`RMID`),
  INDEX `fk_RoomInfor_Hotel1_idx` (`Hotel_HID` ASC) ,
  CONSTRAINT `fk_RoomInfor_Hotel1`
    FOREIGN KEY (`Hotel_HID`)
    REFERENCES `17083686d`.`Hotel` (`HID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `17083686d`.`Attraction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Attraction` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Attraction` (
  `AID` INT NOT NULL AUTO_INCREMENT,
  `AName` VARCHAR(50) NOT NULL,
  `Price` FLOAT NOT NULL,
  `AImage` VARCHAR(500) NOT NULL,
  `Area` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AID`));


-- -----------------------------------------------------
-- Table `17083686d`.`AttractionsType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`AttractionsType` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`AttractionsType` (
  `ATID` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ATID`));


-- -----------------------------------------------------
-- Table `17083686d`.`Attractions_Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`Attractions_Type` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`Attractions_Type` (
  `AID` INT NOT NULL,
  `ATID` INT NOT NULL,
  PRIMARY KEY (`AID`),
  INDEX `ATID_idx` (`ATID` ASC) ,
  CONSTRAINT `Attractions_Type__AID`
    FOREIGN KEY (`AID`)
    REFERENCES `17083686d`.`Attraction` (`AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Attractions_Type__ATID`
    FOREIGN KEY (`ATID`)
    REFERENCES `17083686d`.`AttractionsType` (`ATID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `17083686d`.`RecommandAttraction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `17083686d`.`RecommandAttraction` ;

CREATE TABLE IF NOT EXISTS `17083686d`.`RecommandAttraction` (
  `RecAID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Time` ENUM('MORN', 'EVEN') NOT NULL,
  `ArrangeId` INT NULL,
  `AID` INT NOT NULL,
  PRIMARY KEY (`RecAID`),
  INDEX `ArrangeId_idx` (`ArrangeId` ASC) ,
  INDEX `AId_idx` (`AId` ASC) ,
  CONSTRAINT `fk_RecommandAttraction_ArrangeId`
    FOREIGN KEY (`ArrangeId`)
    REFERENCES `17083686d`.`Arrange` (`ArrangeId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RecommandAttraction_AId`
    FOREIGN KEY (`AID`)
    REFERENCES `17083686d`.`Attraction` (`AID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `17083686d`.`Tourists`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Tourists` (`TouristsID`, `Email`, `Password`, `Gender`, `Age`, `Name`, `Username`) VALUES (00000001, '00000001@qq.com', '00000001', 'M', 023, '00000001', 'DingDing');
INSERT INTO `17083686d`.`Tourists` (`TouristsID`, `Email`, `Password`, `Gender`, `Age`, `Name`, `Username`) VALUES (00000002, '00000002@qq.com', '00000002', 'M', 44, '00000002', 'YuYu');
INSERT INTO `17083686d`.`Tourists` (`TouristsID`, `Email`, `Password`, `Gender`, `Age`, `Name`, `Username`) VALUES (00000003, '00000003@qq.com', '00000002', 'F', 25, '00000003', 'GaoGao');
INSERT INTO `17083686d`.`Tourists` (`TouristsID`, `Email`, `Password`, `Gender`, `Age`, `Name`, `Username`) VALUES (00000004, '00000004@qq.com', '00000002', 'F', 56, '00000004', 'DaiDai');
INSERT INTO `17083686d`.`Tourists` (`TouristsID`, `Email`, `Password`, `Gender`, `Age`, `Name`, `Username`) VALUES (00000005, '00000005@qq.com', '00000002', 'M', 36, '00000005', 'QinQin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Administrator`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Administrator` (`AdmID`, `Name`, `Password`) VALUES (00000006, '00000006', '00000006');
INSERT INTO `17083686d`.`Administrator` (`AdmID`, `Name`, `Password`) VALUES (00000007, '00000007', '00000007');
INSERT INTO `17083686d`.`Administrator` (`AdmID`, `Name`, `Password`) VALUES (00000008, '00000008', '00000008');
INSERT INTO `17083686d`.`Administrator` (`AdmID`, `Name`, `Password`) VALUES (00000009, '00000009', '00000009');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Message`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Message` (`MID`, `Message`, `creat_time`, `AdmID`, `TouristsID`) VALUES (1, '111', NOW(), 00000006, 00000001);
INSERT INTO `17083686d`.`Message` (`MID`, `Message`, `creat_time`, `AdmID`, `TouristsID`) VALUES (2, '222', NOW(), 00000007, 00000002);

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000001, 'Disney Restaurant', 'Disney', 500.50, 'restaurant/disney_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000002, 'Chef Mickey', 'Disneyland', 300.54, 'restaurant/chefmickey_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000003, 'Teakha', ' Victoria Peak', 100.00, 'restaurant/teakha_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000004, 'AGanShrimp ', ' Victoria Peak', 200.00, 'restaurant/aganshrimp_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000005, 'Kum Kee Restaurant', ' Hung Hom', 50.00, 'restaurant/kumkee_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000006, 'Steam Fresh', 'Hung Hom', 150.34, 'restaurant/steamfresh_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000007, 'Ajisen Ramen', ' Homantin', 100.00, 'restaurant/ajisenramen_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000008, 'Tuxedos Resturant', 'Ocean Park', 150.55, 'restaurant/tuxedos_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000009, 'Neptunes Restaurant', 'Ocean Park', 300.77, 'restaurant/neptunes_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000010, 'Hot Dog Link', 'Homantin', 50.99, 'restaurant/hotdoglink_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000011, 'The Spaghetti House', ' Mong Kok', 150.66, 'restaurant/spaghettihouse_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000012, 'Yadllie Plate', ' Mong Kok', 150.23, 'restaurant/yadlliepllate_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000013, 'Lazy Pot', 'Yau Ma Tei', 150.78, 'restaurant/lazypot_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000014, 'Haidilao Hot Pot', 'Yau Ma Tei', 100.56, 'restaurant/haidilaohotpot_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000015, 'Burgeroom', 'Causeway Bay', 100.00, 'restaurant/burgeroomy_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000016, 'Shika Teppan-Yaki', 'Causeway Bay', 500.88, 'restaurant/shikateppantaki_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000017, 'Shanghai Min 1987', 'Tsim Sha Tsui', 300.00, 'restaurant/shanghaimin_restaurant.jpg');
INSERT INTO `17083686d`.`Restaurant` (`RID`, `RName`, `Area`, `AveragePrice`, `RImage`) VALUES (00000018, 'LAB EAT Restaurant', 'Tsim Sha Tsui', 300.55, 'restaurant/labeat_restaurant.jpg');
COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`FoodType`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000001, 'Western-style ');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000002, 'Cantonese style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000003, 'Korean style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000004, 'Hong Kong style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000005, 'Japanese style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000006, 'German style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000007, 'Italian style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000008, 'Sichuan style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000009, 'American style');
INSERT INTO `17083686d`.`FoodType` (`FID`, `FoodType`) VALUES (00000010, 'Shanghai style');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Restaurant_Foodtype`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000001, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000002, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000003, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000004, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000005, 00000002);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000006, 00000003);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000007, 00000004);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000008, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000009, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000010, 00000005);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000011, 00000006);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000012, 00000007);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000013, 00000003);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000014, 00000008);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000015, 00000009);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000016, 00000004);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000017, 00000010);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000018, 00000001);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000002, 00000002);
INSERT INTO `17083686d`.`Restaurant_Foodtype` (`RID`, `FID`) VALUES (00000006, 00000009);

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000001, 'Tai Hing Hotel', 'Mong Kok', '2', 'hotel/taihing_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000002, 'Mirador Hotel', 'Tsim Sha Tsui', '2', 'hotel/mirador_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000003, 'Palazzo Holiday  Hotel', 'Causeway Bay', '2', 'hotel/palazzoholiday_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000004, 'Regal Oriental Hotel', 'Hung Hom', '3', 'hotel/regaloriental_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000005, 'Harbour Plaza Metropolis', 'Hung Hom', '4', 'hotel/harbourplazametropolis_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000006, 'Bridal Tea House  Hotel', ' Homantin', '3', 'hotel/bridalteahouse_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000007, 'Disney Explorers Lodge', 'Disneyland', '5', 'hotel/disneyland_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000008, 'Disneys Hollywood Hotel', 'Disneyland', '3', 'hotel/disneylandhollywood_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000009, 'Iclub Sheung Wan Hotel', 'Victoria Peak', '3', 'hotel/iclubsheungwan_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000010, 'Rosedale Hotel', 'Causeway Bay', '3', 'hotel/rosedale_hotel.jpg');
INSERT INTO `17083686d`.`Hotel` (`HID`, `HName`, `Area`, `Level`, `HImage`) VALUES (00000011, 'L-hotel Island South', ' Ocean park', '4', 'hotel/lhotelislandsouth_hotel.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`RoomInfor`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000001, 'Single room', 225.5, 00000001);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000002, 'Single room', 400.00, 00000002);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000003, 'Double room', 265.00, 00000003);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000004, 'Single room', 600.00, 00000004);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000005, 'Single room', 700.00, 00000005);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000006, 'Double room', 450.00, 00000006);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000007, 'Single room', 1700.00, 00000007);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000008, 'Single room', 1000.78, 00000008);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000009, 'Double room', 1000.55, 00000009);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000010, 'Single room', 800.54, 0000010);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000011, 'Single room', 700.25, 000000011);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000012, 'Double room', 650, 000000011);
INSERT INTO `17083686d`.`RoomInfor` (`RMID`, `RoomType`, `Price`, `Hotel_HID`) VALUES (00000013, 'Double room', 850.99, 00000010);

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Attraction`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000001, 'Disnyland', 500.00, 'attraction/disnyland_attraction.jpg', 'Disnyland');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000002, 'Ocean Park', 400.00, 'attraction/oceanpark_attraction.jpg', 'Ocean Park');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000003, 'Sky Wheel', 23.23, 'attraction/skywheel_attraction.jpg', ' Causeway Bay');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000004, 'Victoria Peak', 77.67, 'attraction/victoriapeak_attraction.jpg', 'Victoria Peak');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000005, 'Wax Work Museum', 300.89, 'attraction/waxworkmuseum_attraction.jpg', 'Victoria Peak');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000006, 'The Star Ferry', 10.99, 'attraction/thestarferry_attraction.jpg', 'Tsim Sha Tsui');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000007, 'Langham Place', 23.11, 'attraction/langhamplace_attraction.jpg', 'Mong Kok');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000008, 'Hong Kong Polyu', 13.22, 'attraction/hongkongpolyu_attraction.jpg', 'Hung Hom');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000009, 'Victoria Harbour', 14.55, 'attraction/victoriaharbour_attraction.jpg', 'Homantin');
INSERT INTO `17083686d`.`Attraction` (`AID`, `AName`, `Price`, `AImage`, `Area`) VALUES (00000010, 'Harbor City', 45.66, 'attraction/harborcity_attraction.jpg', 'Tsim Sha Tsui');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`AttractionsType`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`AttractionsType` (`ATID`, `Type`) VALUES (1, 'entertainment');
INSERT INTO `17083686d`.`AttractionsType` (`ATID`, `Type`) VALUES (2, 'viewing');
INSERT INTO `17083686d`.`AttractionsType` (`ATID`, `Type`) VALUES (3, 'shopping');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Attractions_Type`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000001, 1);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000002, 1);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000003, 2);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000004, 2);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000005, 2);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000006, 2);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000007, 3);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000008, 2);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000009, 2);
INSERT INTO `17083686d`.`Attractions_Type` (`AID`, `ATID`) VALUES (00000010, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`Arrange`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`Arrange` (`ArrangeId`, `ArriveDay`, `LeaveDay`, `Activate`, `TouristsID`) VALUES ('1', '2018-11-24', '2018-11-27', '0', '2');

COMMIT;



-- -----------------------------------------------------
-- Data for table `17083686d`.`RecommandAttraction`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('1', '2018-11-24', 'MORN', '1', '1');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('2', '2018-11-24', 'EVEN', '1', '2');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('3', '2018-11-24', 'MORN', '1', '3');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('4', '2018-11-25', 'MORN', '1', '4');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('5', '2018-11-25', 'EVEN', '1', '5');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('6', '2018-11-26', 'MORN', '1', '6');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('7', '2018-11-26', 'EVEN', '1', '7');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('8', '2018-11-27', 'MORN', '1', '8');
INSERT INTO `17083686d`.`RecommandAttraction` (`RecAID`, `Date`, `Time`, `ArrangeId`, `AID`) VALUES ('9', '2018-11-27', 'EVEN', '1', '9');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`RecommandRes`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('1', '2018-11-24', 'MORN', '1', '1');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('2', '2018-11-24', 'EVEN', '1', '2');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('3', '2018-11-24', 'MORN', '1', '3');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('4', '2018-11-25', 'MORN', '1', '4');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('5', '2018-11-25', 'EVEN', '1', '5');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('6', '2018-11-26', 'MORN', '1', '6');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('7', '2018-11-26', 'EVEN', '1', '7');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('8', '2018-11-27', 'MORN', '1', '8');
INSERT INTO `17083686d`.`RecommandRes` (`RecRID`, `Date`, `Time`, `ArrangeId`, `RID`) VALUES ('9', '2018-11-27', 'EVEN', '1', '9');

COMMIT;


-- -----------------------------------------------------
-- Data for table `17083686d`.`RecommandHotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `17083686d`;
INSERT INTO `17083686d`.`RecommandHotel` (`RecHID`, `Date`, `ArrangeId`, `HID`) VALUES ('1', '2018-11-24', '1', '1');
INSERT INTO `17083686d`.`RecommandHotel` (`RecHID`, `Date`, `ArrangeId`, `HID`) VALUES ('2', '2018-11-25', '1', '1');
INSERT INTO `17083686d`.`RecommandHotel` (`RecHID`, `Date`, `ArrangeId`, `HID`) VALUES ('3', '2018-11-26', '1', '2');
INSERT INTO `17083686d`.`RecommandHotel` (`RecHID`, `Date`, `ArrangeId`, `HID`) VALUES ('4', '2018-11-27', '1', '2');
COMMIT; 