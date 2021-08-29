DROP DATABASE IF EXISTS swap;
CREATE DATABASE swap;
use swap;
CREATE TABLE User(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    referrer_id INT,
    registration_date BIGINT DEFAULT UNIX_TIMESTAMP(),
    is_Active ENUM('0', '1') DEFAULT '0',
    CONSTRAINT `fk_user_referrer` FOREIGN KEY(`referrer_id`) REFERENCES User(`id`)
);


CREATE TABLE Ranking_User(
    id INT PRIMARY KEY AUTO_INCREMENT,
    initial_rank INT NOT NULL,
    currentRankingDay BIGINT NOT NULL);