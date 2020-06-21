-- Database creation 
CREATE SCHEMA `rank` ;

use `rank`;

-- 'user' table creation 
CREATE TABLE userstore (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `work_group` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`));
  
-- populating 'user' table
INSERT INTO userstore (`user_id`, `user_name`, `password`, `work_group`) VALUES ('101', 'alpha', 'alpha@RANK1', 'cashier');
INSERT INTO userstore(`user_id`, `user_name`, `password`, `work_group`) VALUES ('102', 'beta', 'beta@RANK1', 'executive');

-- 'customer' table creation
CREATE TABLE customer (
  `customer_id` BIGINT NOT NULL AUTO_INCREMENT,
  `customer_ssn` INT NOT NULL,
  `customer_name` VARCHAR(20) NOT NULL,
  `customer_address` VARCHAR(100) NOT NULL,
  `customer_dob` DATE NOT NULL,
  `customer_age` TINYINT NOT NULL,
  `customer_status` VARCHAR(20) NOT NULL,
  `customer_messages` VARCHAR(40) NOT NULL,
  `customer_create_datetime` DATETIME NOT NULL,
  `customer_update_datetime` DATETIME,
  PRIMARY KEY (`customer_id`) ,
  UNIQUE (`customer_ssn`));

-- Set autoincrement for customer_id starting from 100000000
ALTER TABLE customer AUTO_INCREMENT = 100000000;  

-- 'account' table crreation
CREATE TABLE account (
  `account_number` BIGINT NOT NULL AUTO_INCREMENT,
  `customer_id` BIGINT NOT NULL,
  `account_type` VARCHAR(20) NOT NULL,
  `account_status` VARCHAR(20) NOT NULL,
  `account_message` VARCHAR(30) NOT NULL,
  `account_balance` INT NOT NULL,
  `account_create_datetime` DATETIME NOT NULL,
  `account_update_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`account_number`));
  
-- alter table for auto increment  
ALTER TABLE account AUTO_INCREMENT = 200000000;
 
-- alter table account for business logic
ALTER TABLE account 
ADD CONSTRAINT `customer_id`
  FOREIGN KEY (`customer_id`)
  REFERENCES customer (`customer_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- 'transaction' table cretion
CREATE TABLE transactions (
  `transactions_id` BIGINT NOT NULL AUTO_INCREMENT,
  `account_number` BIGINT NOT NULL,
  `transactions_descripton` VARCHAR(15) NOT NULL,
  `transactions_date_time` DATETIME NOT NULL,
  `transactions_amount` INT NOT NULL,
  PRIMARY KEY (`transactions_id`));
  
-- alter for auto increment
ALTER TABLE transactions AUTO_INCREMENT = 300000000;   

-- 'transaction' table altered based on bussiness logic
ALTER TABLE transactions
ADD CONSTRAINT `account_number`
  FOREIGN KEY (`account_number`)
  REFERENCES account (`account_number`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

  
  