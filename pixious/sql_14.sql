/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - pixious
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`pixious` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pixious`;

/*Table structure for table `applied_hiring` */

DROP TABLE IF EXISTS `applied_hiring`;

CREATE TABLE `applied_hiring` (
  `applied_hiring_id` int(11) NOT NULL AUTO_INCREMENT,
  `hiring_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`applied_hiring_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `applied_hiring` */

insert  into `applied_hiring`(`applied_hiring_id`,`hiring_id`,`sender_id`,`type`) values (1,1,2,'creator');

/*Table structure for table `bugs` */

DROP TABLE IF EXISTS `bugs`;

CREATE TABLE `bugs` (
  `bugs_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bug_heading` varchar(30) DEFAULT NULL,
  `bug_description` varchar(250) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bugs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bugs` */

insert  into `bugs`(`bugs_id`,`sender_id`,`date`,`bug_heading`,`bug_description`,`type`,`reply_date`,`reply`) values (1,2,NULL,'gjhn','jnk','type','0000-00-00',''),(2,2,'2022-12-14','heading bug','dsf','creator','0000-00-00','pending');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(250) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

insert  into `comment`(`comment_id`,`comment`,`sender_id`,`movie_id`,`date`,`type`,`reply_date`,`reply`) values (1,'test',2,101,NULL,NULL,'2022-12-14','sdad'),(2,'dddddddddd',2,101,'2022-12-14','creator','0000-00-00','pending');

/*Table structure for table `creator` */

DROP TABLE IF EXISTS `creator`;

CREATE TABLE `creator` (
  `creator_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `creator` */

insert  into `creator`(`creator_id`,`user_id`,`status`,`date`) values (2,2,NULL,NULL);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `feedback` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(250) DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`sender_id`,`feedback`,`date`,`reply`,`reply_date`,`type`) values (1,100,'abcd',NULL,'xdgd','0000-00-00',NULL),(2,2,'okkk','2022-12-14','dfsdf','0000-00-00','creator');

/*Table structure for table `film_course` */

DROP TABLE IF EXISTS `film_course`;

CREATE TABLE `film_course` (
  `film_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_course_banner` varchar(200) DEFAULT NULL,
  `film_course_poster` varchar(200) DEFAULT NULL,
  `film_course_video` varchar(200) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`film_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `film_course` */

/*Table structure for table `followers` */

DROP TABLE IF EXISTS `followers`;

CREATE TABLE `followers` (
  `followers_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`followers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `followers` */

insert  into `followers`(`followers_id`,`from_id`,`type`,`to_id`,`date`,`status`) values (1,2,'creator',2,'2022-12-14','unfollowed');

/*Table structure for table `hiring` */

DROP TABLE IF EXISTS `hiring`;

CREATE TABLE `hiring` (
  `hiring_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hiring_description` varchar(250) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hiring_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `hiring` */

insert  into `hiring`(`hiring_id`,`user_id`,`hiring_description`,`subject`) values (1,2,'dfs','asd');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (1,'admin','123','admin'),(2,'user','1234','user');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `message` */

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `director_name` varchar(30) DEFAULT NULL,
  `movie` varchar(250) DEFAULT NULL,
  `movie_status` varchar(250) DEFAULT NULL,
  `movie_poster` varchar(100) DEFAULT NULL,
  `movie_banner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

/*Data for the table `movie` */

insert  into `movie`(`movie_id`,`movie_name`,`description`,`creator_id`,`director_name`,`movie`,`movie_status`,`movie_poster`,`movie_banner`) values (101,'mm','we',2,'director','ed','rejected',NULL,NULL);

/*Table structure for table `movie_promo` */

DROP TABLE IF EXISTS `movie_promo`;

CREATE TABLE `movie_promo` (
  `promo_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `video` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `movie_promo` */

/*Table structure for table `movie_promo_request` */

DROP TABLE IF EXISTS `movie_promo_request`;

CREATE TABLE `movie_promo_request` (
  `promo_request_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `sender_id` int(10) DEFAULT NULL,
  `movie_id` int(10) DEFAULT NULL,
  `movie_name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `promo_status` varchar(50) DEFAULT NULL,
  `poster` varchar(250) DEFAULT NULL,
  `banner` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`promo_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `movie_promo_request` */

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `IFSC` int(10) DEFAULT NULL,
  `acc_no` int(20) DEFAULT NULL,
  `amount` int(100) DEFAULT NULL,
  `holder_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

/*Table structure for table `playlist` */

DROP TABLE IF EXISTS `playlist`;

CREATE TABLE `playlist` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`playlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `playlist` */

insert  into `playlist`(`playlist_id`,`movie_id`,`sender_id`,`type`) values (1,101,2,'creator'),(2,101,2,'creator'),(3,101,2,'creator'),(4,101,2,'creator'),(5,101,2,'creator'),(6,101,2,'creator'),(7,101,2,'creator');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(30) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `sender_id` int(10) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

insert  into `rating`(`rating_id`,`rating`,`review`,`movie_id`,`sender_id`,`type`,`date`) values (1,'4','good',101,2,'creator',NULL),(2,'2','pending',101,2,'creator','2022-12-14'),(3,'jdfoihsdifj','pending',101,2,'creator','2022-12-14');

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `reported_id` int(10) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `reported_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `report` */

insert  into `report`(`report_id`,`sender_id`,`reported_id`,`type`,`reported_type`) values (1,2,2,'creator','comment'),(2,2,2,'creator','comment'),(3,2,2,'creator','comment'),(4,2,2,'creator','comment');

/*Table structure for table `share` */

DROP TABLE IF EXISTS `share`;

CREATE TABLE `share` (
  `share_id` int(10) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `share` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `user_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`name`,`email`,`phone`,`photo`,`user_status`) values (2,'dfcg','a@gmail.com',6262,NULL,'active'),(100,'abcd','b@gmail.com',2345,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
