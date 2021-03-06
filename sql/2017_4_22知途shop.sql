/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.11 : Database - ztshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ztshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ztshop`;

/*Table structure for table `zt_ad` */

DROP TABLE IF EXISTS `zt_ad`;

CREATE TABLE `zt_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '广告名称',
  `img` varchar(50) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '类型',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1：已审核 -1：未通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `zt_ad` */

insert  into `zt_ad`(`id`,`name`,`img`,`url`,`type`,`status`,`create_time`,`update_time`) values (1,'皮衣','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg','www.baidu.com','1',1,'2016-12-10 14:25:22','2016-12-10 14:25:26'),(2,'半截袖','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg','www.douban.com','1',1,'2016-12-10 14:25:56','2016-12-10 14:26:01');

/*Table structure for table `zt_area` */

DROP TABLE IF EXISTS `zt_area`;

CREATE TABLE `zt_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1：国家 2：省 3：市 4：区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_area` */

/*Table structure for table `zt_cart` */

DROP TABLE IF EXISTS `zt_cart`;

CREATE TABLE `zt_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `zt_cart` */

insert  into `zt_cart`(`id`,`goods_id`,`goods_num`,`user_id`,`create_time`,`update_time`) values (1,1,2,1,NULL,NULL),(5,2,8,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `zt_category` */

DROP TABLE IF EXISTS `zt_category`;

CREATE TABLE `zt_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '类名',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父类id',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '路线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_category` */

/*Table structure for table `zt_floor` */

DROP TABLE IF EXISTS `zt_floor`;

CREATE TABLE `zt_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  `desc` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0：未审核 1：已审核 -1：未通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `zt_floor` */

insert  into `zt_floor`(`id`,`sort_num`,`name`,`category_id`,`desc`,`image`,`type`,`status`,`create_time`,`update_time`) values (1,9,'吃的',1,'','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',0,1,'2016-12-10 13:21:20','2016-12-10 13:21:24'),(2,8,'用的',2,'','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',0,1,'2016-12-10 13:21:48','2016-12-10 13:21:52'),(3,7,'穿的',3,'','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',0,1,'2016-12-10 13:22:16','2016-12-10 13:22:19');

/*Table structure for table `zt_goods` */

DROP TABLE IF EXISTS `zt_goods`;

CREATE TABLE `zt_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名',
  `sn` varchar(20) NOT NULL DEFAULT '' COMMENT '商品号',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `market_price` int(11) NOT NULL DEFAULT '0' COMMENT '市场价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `img` varchar(100) NOT NULL DEFAULT '' COMMENT '主图',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1：已审核 -1：删除 0：未审核',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `zt_goods` */

insert  into `zt_goods`(`id`,`name`,`sn`,`price`,`market_price`,`stock`,`category`,`desc`,`img`,`status`,`create_time`,`update_time`) values (1,'皮衣','1',99,89,879,3,'此皮衣贼牛逼','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',1,'2016-12-10 13:46:17','2016-12-10 13:46:21'),(2,'半截袖','2',7,2,90,3,'此半截袖也牛逼','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',1,'2016-12-10 13:47:10','2016-12-10 13:47:13'),(3,'坚果','3',56,89,90,1,'wu','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',1,'2016-12-10 14:49:12','2016-12-10 14:49:21'),(4,'饮料','4',89,89,90,1,'ha','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',1,'2016-12-10 14:49:16','2016-12-10 14:49:24'),(5,'铁锹','5',12,3,3,2,'打的','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',1,'2016-12-10 14:51:06','2016-12-10 14:51:12'),(6,'镐把','6',0,0,0,2,'打的','/Public/Uploads/gg/2016-12-01/583ff49facf48.jpg',1,'2016-12-10 14:51:09','2016-12-10 14:51:15');

/*Table structure for table `zt_goods_contents` */

DROP TABLE IF EXISTS `zt_goods_contents`;

CREATE TABLE `zt_goods_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `contents` varchar(100) NOT NULL DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_goods_contents` */

/*Table structure for table `zt_goods_img` */

DROP TABLE IF EXISTS `zt_goods_img`;

CREATE TABLE `zt_goods_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品号',
  `img` varchar(100) NOT NULL DEFAULT '' COMMENT '配图',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_goods_img` */

/*Table structure for table `zt_order` */

DROP TABLE IF EXISTS `zt_order`;

CREATE TABLE `zt_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价钱',
  `order_sn` int(11) NOT NULL DEFAULT '0' COMMENT '订单号',
  `user_address_id` varchar(10) NOT NULL DEFAULT '' COMMENT '用户地址id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1进行中 -1取消订单',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 1',
  `shipping_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发货状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `shipping_time` datetime DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_order` */

/*Table structure for table `zt_order_item` */

DROP TABLE IF EXISTS `zt_order_item`;

CREATE TABLE `zt_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品号',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单号',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0未审核 1已审核 -1审核但删除',
  `good_price` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单个商品价钱',
  `price` tinyint(4) NOT NULL DEFAULT '0' COMMENT '总价',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_order_item` */

/*Table structure for table `zt_user` */

DROP TABLE IF EXISTS `zt_user`;

CREATE TABLE `zt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 1：已审核 -1：已删除 0：',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_user` */

/*Table structure for table `zt_user_address` */

DROP TABLE IF EXISTS `zt_user_address`;

CREATE TABLE `zt_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `provice` int(100) NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(100) NOT NULL DEFAULT '0' COMMENT '市',
  `area` int(100) NOT NULL DEFAULT '0' COMMENT '区',
  `user_name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_phone` varchar(100) NOT NULL DEFAULT '' COMMENT '用户密码',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0未审核 1已审核 -1审核但删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zt_user_address` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
