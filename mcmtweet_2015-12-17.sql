# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: mcmtweet
# Generation Time: 2015-12-17 02:54:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table hashtags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hashtags`;

CREATE TABLE `hashtags` (
  `h_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(160) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tweets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tweets`;

CREATE TABLE `tweets` (
  `t_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_content` varchar(160) NOT NULL DEFAULT '',
  `timestamp` int(255) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tweets_hashtags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tweets_hashtags`;

CREATE TABLE `tweets_hashtags` (
  `th_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  PRIMARY KEY (`th_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
