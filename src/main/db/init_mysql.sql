/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE = ''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS */`xx_oo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `xx_oo`;

/*Table structure for table `databasechangelog` */

DROP TABLE IF EXISTS `databasechangelog`;

CREATE TABLE `databasechangelog`
(
    `ID`            VARCHAR(255) NOT NULL,
    `AUTHOR`        VARCHAR(255) NOT NULL,
    `FILENAME`      VARCHAR(255) NOT NULL,
    `DATEEXECUTED`  DATETIME     NOT NULL,
    `ORDEREXECUTED` INT          NOT NULL,
    `EXECTYPE`      VARCHAR(10)  NOT NULL,
    `MD5SUM`        VARCHAR(35)  DEFAULT NULL,
    `DESCRIPTION`   VARCHAR(255) DEFAULT NULL,
    `COMMENTS`      VARCHAR(255) DEFAULT NULL,
    `TAG`           VARCHAR(255) DEFAULT NULL,
    `LIQUIBASE`     VARCHAR(20)  DEFAULT NULL,
    `CONTEXTS`      VARCHAR(255) DEFAULT NULL,
    `LABELS`        VARCHAR(255) DEFAULT NULL,
    `DEPLOYMENT_ID` VARCHAR(10)  DEFAULT NULL
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

/*Table structure for table `databasechangeloglock` */

DROP TABLE IF EXISTS `databasechangeloglock`;

CREATE TABLE `databasechangeloglock`
(
    `ID`          INT    NOT NULL,
    `LOCKED`      BIT(1) NOT NULL,
    `LOCKGRANTED` DATETIME     DEFAULT NULL,
    `LOCKEDBY`    VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


/*Table structure for table `sv_authority` */

DROP TABLE IF EXISTS `sv_authority`;

CREATE TABLE `sv_authority`
(
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

/*Table structure for table `sv_user` */

DROP TABLE IF EXISTS `sv_user`;

CREATE TABLE `sv_user`
(
    `id`                 bigint      NOT NULL AUTO_INCREMENT,
    `uuid`               varchar(36)      DEFAULT NULL,
    `login`              varchar(50) NOT NULL,
    `password_hash`      varchar(60)      DEFAULT NULL,
    `name`               varchar(50)      DEFAULT NULL,
    `mobile`             bigint           DEFAULT NULL,
    `email`              varchar(191)     DEFAULT NULL,
    `image_url`          varchar(256)     DEFAULT NULL,
    `is_activated`       bit(1)      NOT NULL,
    `lang_key`           varchar(10)      DEFAULT NULL,
    `activation_key`     varchar(20)      DEFAULT NULL,
    `reset_key`          varchar(20)      DEFAULT NULL,
    `created_by`         varchar(50) NOT NULL,
    `created_date`       timestamp   NULL,
    `reset_date`         timestamp   NULL DEFAULT NULL,
    `last_modified_by`   varchar(50)      DEFAULT NULL,
    `last_modified_date` timestamp   NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ux_user_login` (`login`),
    UNIQUE KEY `ux_user_email` (`email`),
    UNIQUE KEY `ux_user_mobile` (`mobile`),
    UNIQUE KEY `uuid` (`uuid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

/*Table structure for table `sv_user_authority` */

DROP TABLE IF EXISTS `sv_user_authority`;

CREATE TABLE `sv_user_authority`
(
    `user_id`        bigint      NOT NULL,
    `authority_name` varchar(50) NOT NULL,
    PRIMARY KEY (`user_id`, `authority_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO xx_oo.sv_authority (name)
VALUES ('ROLE_ADMIN'),
       ('ROLE_USER');
INSERT INTO xx_oo.sv_user (id, uuid, login, password_hash, name, mobile, email, image_url, is_activated, lang_key,
                                activation_key, reset_key, created_by, created_date, reset_date, last_modified_by,
                                last_modified_date)
VALUES (1, '13243255324324', 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator',
        1999999999, '9999@qq.com', '1', true, 'zh_cn', 'n5aNLq1', 'aabc', 'admin', now(), now(), 'admin', now()),
       (2, '13243255324345', 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 1888888001,
        '8001@qq.com', '1', true, 'zh_cn', 'n5aNLq1', 'aabc', 'admin', now(), now(), 'admin', now());

INSERT INTO xx_oo.sv_user_authority (user_id, authority_name)
VALUES (1, 'ROLE_ADMIN'),
       (1, 'ROLE_USER'),
       (2, 'ROLE_USER');
