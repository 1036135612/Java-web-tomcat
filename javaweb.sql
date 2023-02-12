# Host: localhost  (Version: 5.5.53)
# Date: 2023-02-12 19:51:45
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "dl"
#

DROP TABLE IF EXISTS `dl`;
CREATE TABLE `dl` (
  `user` varchar(255) NOT NULL DEFAULT '',
  `pwd` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "dl"
#

/*!40000 ALTER TABLE `dl` DISABLE KEYS */;
INSERT INTO `dl` VALUES ('admin','123'),('fyx','123'),('ad','456');
/*!40000 ALTER TABLE `dl` ENABLE KEYS */;

#
# Structure for table "fb"
#

DROP TABLE IF EXISTS `fb`;
CREATE TABLE `fb` (
  `bt` varchar(255) DEFAULT NULL,
  `nr` varchar(255) DEFAULT NULL,
  `sj` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "fb"
#

/*!40000 ALTER TABLE `fb` DISABLE KEYS */;
INSERT INTO `fb` VALUES ('问题标题','内容发布发布发部','2022-11-26 14:12:58'),('MySQL','按照时间倒叙查询','2022-11-26 14:09:36'),('新问题','新内容 新内容 新内容','2022-11-29 18:30:33'),('一个bug处理','什么是bug为什么出现怎么处理','2022-11-29 18:39:05'),('这是测试','本项目为基于《java应用开发》课程学习的期末考核项目，有很多不足的地方，欢迎一起借鉴学习。\r\n               ——编程小白鑫同学','2023-02-12 19:50:28');
/*!40000 ALTER TABLE `fb` ENABLE KEYS */;
