-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema library_management_systems
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library_management_systems
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library_management_systems` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `library_management_systems` ;

-- -----------------------------------------------------
-- Table `library_management_systems`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_management_systems`.`author` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(20) NOT NULL,
  `bio` VARCHAR(500) NULL DEFAULT NULL,
  `author_author_id` INT NOT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE INDEX `full_name` (`full_name` ASC) VISIBLE,
  INDEX `fk_author_author1_idx` (`author_author_id` ASC) VISIBLE,
  CONSTRAINT `fk_author_author1`
    FOREIGN KEY (`author_author_id`)
    REFERENCES `library_management_systems`.`author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library_management_systems`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_management_systems`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library_management_systems`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_management_systems`.`books` (
  `Book_id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(50) NOT NULL,
  `Author_id` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `Isbn` VARCHAR(20) NOT NULL,
  `Publisher` VARCHAR(100) NULL DEFAULT NULL,
  `year_published` YEAR NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Available_copies` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Book_id`),
  UNIQUE INDEX `Isbn` (`Isbn` ASC) VISIBLE,
  INDEX `fk_authorid` (`Author_id` ASC) VISIBLE,
  INDEX `fk_categoryid` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_authorid`
    FOREIGN KEY (`Author_id`)
    REFERENCES `library_management_systems`.`author` (`author_id`),
  CONSTRAINT `fk_categoryid`
    FOREIGN KEY (`category_id`)
    REFERENCES `library_management_systems`.`category` (`category_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library_management_systems`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_management_systems`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `mobile` VARCHAR(20) NULL DEFAULT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `Address` VARCHAR(200) NULL DEFAULT NULL,
  `Join_date` DATE NULL DEFAULT NULL,
  `Membership_Status` ENUM('Active', 'Inactive') NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `idx_user_user_id` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `mobile` (`mobile` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library_management_systems`.`transaction_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_management_systems`.`transaction_details` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `Book_id` INT NOT NULL,
  `borrow_dt` DATE NOT NULL,
  `due_dt` DATE NOT NULL,
  `return_dt` DATE NULL DEFAULT NULL,
  `book_status` ENUM('Borrowed', 'Returned', 'overdue') NULL DEFAULT 'Borrowed',
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_user` (`user_id` ASC) VISIBLE,
  INDEX `fk_book` (`Book_id` ASC) VISIBLE,
  CONSTRAINT `fk_book`
    FOREIGN KEY (`Book_id`)
    REFERENCES `library_management_systems`.`books` (`Book_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `library_management_systems`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library_management_systems`.`fines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_management_systems`.`fines` (
  `fine_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `fine_amount` DECIMAL(10,2) NOT NULL,
  `fine_status` ENUM('pending', 'paid') NULL DEFAULT NULL,
  `fined_date` DATE NOT NULL,
  `paid_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`fine_id`),
  INDEX `fk_transaction` (`transaction_id` ASC) VISIBLE,
  INDEX `fk_useri` (`user_id` ASC) VISIBLE,
  INDEX `fk_booki` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_booki`
    FOREIGN KEY (`book_id`)
    REFERENCES `library_management_systems`.`books` (`Book_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `library_management_systems`.`transaction_details` (`transaction_id`),
  CONSTRAINT `fk_useri`
    FOREIGN KEY (`user_id`)
    REFERENCES `library_management_systems`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
