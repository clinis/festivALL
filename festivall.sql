# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: festivall
# Generation Time: 2017-12-31 03:19:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bands`;

CREATE TABLE `bands` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `artists` varchar(100) DEFAULT NULL,
  `registeredon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bands` WRITE;
/*!40000 ALTER TABLE `bands` DISABLE KEYS */;

INSERT INTO `bands` (`b_id`, `name`, `artists`, `registeredon`)
VALUES
	(1,'Linda Martini','Hélio Morais, Pedro Geraldes, Cláudia Guerreiro','2016-12-02 16:21:30'),
	(2,'Approaching Solaris','Zé Luis, Zé Almeida, Joel João e Joel Melo','2016-12-02 16:21:30'),
	(4,'Queens of the Stone Age','Josh Homme and friends','2016-12-02 06:21:30'),
	(14,'Blá Blá Blá','Joel Zão, Henrique Santos, Pedro Amares','2016-12-02 06:21:30'),
	(35,'Beach House','Ana Marques, Artur Henrique, João Santiago, Pedro Vasconcelos','2016-12-06 18:02:24'),
	(38,'ABBA','Anna e John','2016-12-18 19:57:58'),
	(41,'God is an Astronaut','Torsten, Jamie','2016-12-18 21:53:20'),
	(42,'Queen','ghgh','2016-12-20 17:32:29'),
	(43,'Sensible Soccers','','2017-04-05 17:59:33');

/*!40000 ALTER TABLE `bands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `registeredon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;

INSERT INTO `events` (`e_id`, `type`, `name`, `date`, `city`, `place`, `registeredon`)
VALUES
	(1,0,'Marés Vivas 2010','2010-07-14 00:00:00','Gaia','Parque do Cais','2016-12-02 16:33:18'),
	(2,0,'Marés Vivas 2014','2016-12-18 00:00:00','Gaia','Parque do Cais','2016-12-02 16:33:18'),
	(3,1,'Gobi Bear no Savanna Caffe','2016-12-10 00:00:00','Esposende','Savanna Caffe','2016-12-02 06:33:18'),
	(11,1,'BUBA','2016-12-07 00:00:00','Aveiro','CASA','2016-12-06 19:17:10'),
	(23,0,'Festival Panda','2015-03-26 00:00:00','Lisboa','MEO Arena','2016-12-12 22:07:40'),
	(24,0,'SBSR 15','2014-07-15 00:00:00','Sesimbra','Herdade do Cabeço da Flauta','2016-12-12 22:09:01'),
	(26,1,'Festival da Juventude','2012-09-07 00:00:00','Esposende','Auditório Municipal','2016-12-13 04:00:32'),
	(29,1,'God is an Astronaut','2016-10-18 00:00:00','Porto','Hard Club','2016-12-18 21:52:05'),
	(30,1,'Sensible Soccers nas Taipas','2015-11-07 00:00:00','Caldas das Taipas','Termas das Taipas','2017-04-05 18:00:24');

/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events_bands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events_bands`;

CREATE TABLE `events_bands` (
  `pb_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  PRIMARY KEY (`pb_id`),
  KEY `b_id` (`b_id`),
  KEY `e_id` (`e_id`),
  CONSTRAINT `events_bands_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `events` (`e_id`) ON DELETE CASCADE,
  CONSTRAINT `events_bands_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `bands` (`b_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `events_bands` WRITE;
/*!40000 ALTER TABLE `events_bands` DISABLE KEYS */;

INSERT INTO `events_bands` (`pb_id`, `e_id`, `b_id`)
VALUES
	(2,24,1),
	(3,24,2),
	(4,24,4),
	(5,24,14),
	(7,23,2),
	(12,26,1),
	(13,26,2),
	(19,1,14),
	(28,29,41),
	(30,1,35),
	(31,1,1),
	(32,11,1),
	(33,23,41);

/*!40000 ALTER TABLE `events_bands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_bands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_bands`;

CREATE TABLE `user_bands` (
  `pb_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  PRIMARY KEY (`pb_id`),
  KEY `u_id` (`u_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `user_bands_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE,
  CONSTRAINT `user_bands_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `bands` (`b_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_bands` WRITE;
/*!40000 ALTER TABLE `user_bands` DISABLE KEYS */;

INSERT INTO `user_bands` (`pb_id`, `u_id`, `b_id`)
VALUES
	(7,1,2),
	(11,1,4),
	(14,2,14),
	(15,1,1),
	(17,13,4),
	(18,3,38),
	(19,3,1),
	(20,1,14);

/*!40000 ALTER TABLE `user_bands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_events`;

CREATE TABLE `user_events` (
  `pe_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  PRIMARY KEY (`pe_id`),
  KEY `u_id` (`u_id`),
  KEY `e_id` (`e_id`),
  CONSTRAINT `user_events_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE,
  CONSTRAINT `user_events_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `events` (`e_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_events` WRITE;
/*!40000 ALTER TABLE `user_events` DISABLE KEYS */;

INSERT INTO `user_events` (`pe_id`, `u_id`, `e_id`)
VALUES
	(1,1,1),
	(4,2,26),
	(6,13,29),
	(7,1,26),
	(9,3,26),
	(10,1,30);

/*!40000 ALTER TABLE `user_events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `isadmin` tinyint(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `registeredon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`u_id`, `username`, `email`, `password`, `isadmin`, `name`, `birthdate`, `city`, `registeredon`)
VALUES
	(1,'admin','1120327@isep.ipp.pt','123',1,'Dinis A.','1993-05-18','esposende','2016-12-14 14:27:21'),
	(2,'bob','bob@hotmail.com','123',0,'Luis Alves','1995-04-13','braga','2016-12-14 14:27:39'),
	(3,'ana','anainha@sapo.pt','123',0,'Ana Marques Soares','2000-12-18','porto','2016-12-14 04:27:45'),
	(13,'nene','nene@gmail.com','123',0,'Inês','2016-12-19','braga','2016-12-19 17:16:26'),
	(14,'ddd','ddsd@ccc.pt','123',0,'Dinisn','2013-12-17','braga','2016-12-20 17:34:01');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
