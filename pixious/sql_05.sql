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
  `applied_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`applied_hiring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applied_hiring` */

/*Table structure for table `bugs` */

DROP TABLE IF EXISTS `bugs`;

CREATE TABLE `bugs` (
  `bugs_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bug_heading` varchar(30) DEFAULT NULL,
  `bug_description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`bugs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bugs` */

insert  into `bugs`(`bugs_id`,`user_id`,`date`,`bug_heading`,`bug_description`) values (1,1,NULL,'gjhn','jnk');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

/*Table structure for table `creator` */

DROP TABLE IF EXISTS `creator`;

CREATE TABLE `creator` (
  `creator_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `creator` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `feedback` varchar(250) DEFAULT NULL,
  `feedback_heading` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(250) DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user_id`,`feedback`,`feedback_heading`,`date`,`reply`,`reply_date`) values (1,100,'abcd','cfcffdddtr',NULL,'hmm','0000-00-00');

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

/*Table structure for table `film_report` */

DROP TABLE IF EXISTS `film_report`;

CREATE TABLE `film_report` (
  `film_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `date` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`film_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `film_report` */

insert  into `film_report`(`film_report_id`,`movie_id`,`date`) values (1,1,'100');

/*Table structure for table `followed_creator` */

DROP TABLE IF EXISTS `followed_creator`;

CREATE TABLE `followed_creator` (
  `followed_creator_id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`followed_creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `followed_creator` */

/*Table structure for table `hiring` */

DROP TABLE IF EXISTS `hiring`;

CREATE TABLE `hiring` (
  `hiring_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hiring_description` varchar(250) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hiring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hiring` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin');

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
  `movie_description` varchar(250) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `movie_poster` varchar(200) DEFAULT NULL,
  `movie_banner` varchar(200) DEFAULT NULL,
  `director_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `movie` */

insert  into `movie`(`movie_id`,`movie_name`,`movie_description`,`user_id`,`movie_poster`,`movie_banner`,`director_name`) values (100,'vgf','gf','245',NULL,NULL,NULL);

/*Table structure for table `movie_promo` */

DROP TABLE IF EXISTS `movie_promo`;

CREATE TABLE `movie_promo` (
  `promo_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `promo_description` varchar(250) DEFAULT NULL,
  `movie_id` int(30) DEFAULT NULL,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `movie_promo` */

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `upi_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

/*Table structure for table `playlist` */

DROP TABLE IF EXISTS `playlist`;

CREATE TABLE `playlist` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`playlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `playlist` */

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_description` varchar(250) DEFAULT NULL,
  `post_type` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `post` */

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_phone_no` int(11) DEFAULT NULL,
  `user_profile_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_email`,`user_phone_no`,`user_profile_pic`) values (1,'dfcg','a@gmail.com',6262,NULL),(100,'abcd','b@gmail.com',2345,NULL);

/*Table structure for table `user_report` */

DROP TABLE IF EXISTS `user_report`;

CREATE TABLE `user_report` (
  `user_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `reported_user_id` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`user_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_report` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
