/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - organ_donation
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`organ_donation` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `organ_donation`;

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_no` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `amount` int(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`bank_id`,`bank_name`,`account_no`,`ifsc_code`,`amount`,`user_id`) values (1,'SBI','1234567890','SBIN0001',100000,1),(2,'SBI','1222222222','SBIN0002',108000,2),(3,'SBI','123','sss',99631,3),(4,'SBI','222','www',100246,4),(5,'SBI','1244456679','SBIN0005',100000,5),(6,'Punjab National Bank','9999999999','PNBN0006',92000,6),(7,'Punjab National Bank','8888888888','PNBN0007',100000,7),(8,'Punjab National Bank','7777777777','PNBN0008',100000,8),(9,'Punjab National Bank','6666666666','PNBN0009',100000,9),(10,'Punjab National Bank','5555555555','PNBN00010',100000,10),(11,'Union Bank of India','4444444444','UBI00011',100000,11),(12,'Union Bank of India','3333333333','UBI00012',100000,12),(13,'Union Bank of India','2222222222','UBI00013',100000,13),(14,'Union Bank of India','1111111111','UBI00014',100000,14),(15,'Union Bank of India','1212121212','UBI00015',100000,15),(16,'Bank of Baroda','1313131313','BOBN00016',100000,16),(17,'Bank of Baroda','1411441414','BOBN00017',100000,17),(18,'Bank of Baroda','1717171717','BOBN00018',100000,18),(19,'Bank of Baroda','9876543211','BOBN00019',100000,19),(20,'Bank of Baroda','2222211111','BOBN00020',100000,20),(21,'Bank of India','1480987767','BOIN00021',100000,21),(22,'Bank of India','5678904321','BOIN00022',100000,22),(23,'Bank of India','2134567890','BOIN00023',100000,23),(24,'Bank of India','3214568900','BOIN00024',100000,24),(25,'Bank of India','4321567890','BOIN00025',100000,25),(26,'Central Bank of India','5463728190','CBIN00026',100000,26),(27,'Central Bank of India','1122334455','CBIN00027',100000,27),(28,'Central Bank of India','6677889900','CBIN00028',100000,28),(29,'Central Bank of India','1213141516','CBIN00029',100000,29),(30,'Central Bank of India','1718191011','CBIN00030',100000,30),(31,'Indian Bank','2122232425','IBN00031',100000,31),(32,'Indian Bank','2627282920','IBN00032',100000,32),(33,'Indian Bank','3132343536','IBN00033',100000,33),(34,'Indian Bank','4142434445','IBN00034',100000,34),(35,'Indian Bank','4647484940','IBN00035',100000,35),(36,'Indian Overseas Bank','5152535455','IOBN00036',100000,36),(37,'Indian Overseas Bank','5657585950','IOBN00037',100000,37),(38,'Indian Overseas Bank','6162636465','IOBN00038',100000,38),(39,'Indian Overseas Bank','6667686960','IOBN00039',100000,39),(40,'Indian Overseas Bank','7172737475','IOBN00040',100000,40),(41,'Bank of Maharashtra','7677787970','BOMN00041',100000,41),(42,'Bank of Maharashtra','8182838485','BOMN00042',100000,42),(43,'Bank of Maharashtra','8687888980','BOMN00043',100000,43),(44,'Bank of Maharashtra','9192939495','BOMN00044',100000,44),(45,'Bank of Maharashtra','9697989990','BOMN00045',100000,45),(46,'Bank of Maharashtra','0102030405','BOMN00046',100000,46),(47,'Bank of Maharashtra','0607080900','BOMN00047',100000,47),(48,'Bank of Maharashtra','1020304050','BOMN00048',100000,48),(49,'Bank of Maharashtra','6070809000','BOMN00049',100000,49),(50,'Bank of Maharashtra','1000000000','BOMN00050',100000,50);

/*Table structure for table `donor` */

DROP TABLE IF EXISTS `donor`;

CREATE TABLE `donor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `post` varchar(100) DEFAULT NULL,
  `pin` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `donor` */

insert  into `donor`(`id`,`name`,`place`,`post`,`pin`,`age`,`gender`,`email`,`phone`) values (2,'aa','ss','ss','ss','ss','ss','ss','ss'),(4,'asdf','sdf','sdf','dfg','df','dfgh','sdf','dfg'),(5,'sdfg','fghj','fgh','fgh','jfgh','jfgh','jfgh','fgh');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`lid`,`feedback`,`date`) values (1,3,'very good ','12/12/12'),(2,3,'ghnjm','2023-03-15'),(3,3,'ghjk','2023-03-15');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`log_id`,`username`,`password`,`type`) values (1,'admin@gmail.com','admin','admin'),(2,'aa','aa','rejected'),(3,'p@gmail.com','p','patient'),(4,'d@gmail.com','d','donor'),(5,'jfgh','fghj','pending'),(6,'fgh','fghj','patient');

/*Table structure for table `organ` */

DROP TABLE IF EXISTS ``;

CREATE TABLE `hair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hair` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `organ` */

insert  into `organ`(`id`,`hair type`,`description`) values (2,'stright',' very long'),(3,'curly','dries curly hair');

/*Table structure for table `patients` */

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `hname` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `post` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `patients` */

insert  into `patients`(`id`,`name`,`age`,`hname`,`place`,`post`,`email`,`phno`) values (3,'dfgh','fgh','fgh','fgh','gh','ghj','fghj'),(6,'fghjk','fgh','fgh','dfgh','fgh','fgh','fgh');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reqid` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`id`,`reqid`,`amount`,`date`,`time`) values (1,'3','1000','12/12/12','12:00'),(2,'3','123','2023-03-16','09:01:55');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hair id` varchar(100) DEFAULT NULL,
  `donorid` varchar(100) DEFAULT NULL,
  `patientid` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`id`,`hair id`,`donorid`,`patientid`,`date`,`status`) values (1,'2','2','3','2023-03-15','pending'),(2,'3','4','3','2023-03-15','pending'),(3,'3','4','3','2023-03-15','accepted'),(4,'2','4','3','2023-03-15','pending');

/*Table structure for table `willing` */

DROP TABLE IF EXISTS `willing`;

CREATE TABLE `willing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hairid` int(11) DEFAULT NULL,
  `donorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `willing` */

insert  into `willing`(`id`,`hairid`,`donorid`) values (1,2,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
