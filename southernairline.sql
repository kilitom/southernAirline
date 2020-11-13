/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : southernairline

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-11-13 08:58:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'xutingyuan', '123456');
INSERT INTO `admin` VALUES ('2', 'lizhangrui', '123789');
INSERT INTO `admin` VALUES ('3', 'zhaohuaqi', '456789');
INSERT INTO `admin` VALUES ('4', 'lixueying', '147258');
INSERT INTO `admin` VALUES ('5', 'zhangjie', '258369');

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出发地',
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目的地',
  `origin_time` datetime NOT NULL,
  `destination_time` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `air_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班号',
  PRIMARY KEY (`flight_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98676 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES ('1', '北京市', '武汉市', '2019-03-05 01:21:30', '2019-03-05 03:21:30', '22.00', 'T124');
INSERT INTO `flight` VALUES ('2', '南昌市', '苏州市', '2019-03-07 01:21:30', '2019-03-09 05:21:30', '228.00', 'P123');
INSERT INTO `flight` VALUES ('3', '北京市', '武汉市', '2020-11-30 21:03:52', '2020-11-30 22:03:56', '1314.00', 'CT445');
INSERT INTO `flight` VALUES ('4', '武汉市', '北京市', '2020-11-11 21:04:44', '2020-11-11 21:04:48', '152.00', 'BT231');
INSERT INTO `flight` VALUES ('5', '天津市', '武汉市', '2020-11-11 14:59:37', '2020-11-11 16:59:40', '1000.00', 'BY325');
INSERT INTO `flight` VALUES ('6', '北京市', '武汉市', '2020-11-30 15:00:14', '2020-11-30 18:00:18', '1000.00', 'CR231');
INSERT INTO `flight` VALUES ('521', '北京市', '武汉市', '2020-11-30 00:00:00', '2020-11-30 00:00:00', '1314.00', 'CT444');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `air_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `origin_time` datetime NOT NULL,
  `destination_time` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态：已支付，未支付',
  `username` varchar(50) NOT NULL,
  `uid` int(50) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('10010', '1', 'NH58064', '2020-12-03 00:00:00', '2020-11-03 04:30:00', '600.00', '未支付', '', '0');
INSERT INTO `order` VALUES ('10011', '2', 'NH69846', '2020-11-03 04:00:00', '2020-11-04 08:00:00', '300.00', '未支付', '', '0');
INSERT INTO `order` VALUES ('10012', '3', 'NH32654', '2020-11-03 05:00:00', '2020-11-03 18:00:00', '600.00', '未支付', '', '0');
INSERT INTO `order` VALUES ('10013', '4', 'NH59846', '2020-11-03 12:00:00', '2020-11-03 22:00:00', '280.00', '已支付', '', '0');
INSERT INTO `order` VALUES ('12312321', '1', 'T124', '2020-11-02 00:00:00', '2020-11-09 00:00:00', '1314.00', '未支付', '', '0');
INSERT INTO `order` VALUES ('12312322', '1', 'CT445', '2020-11-30 00:00:00', '2020-11-30 00:00:00', '1314.00', '未支付', 'ddd', '2341');
INSERT INTO `order` VALUES ('160522896831258940304', '1', 'CR231', '2020-11-30 00:00:00', '2020-11-30 00:00:00', '1000.00', '未支付', '李明昌', '314354');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'root1', '女', '18954284700', '37000011112222112', '112233@qq.com', '2000-10-12');
INSERT INTO `user` VALUES ('16', 'xutingyuan', 'aaa', '男', '15011111222', '370283199901014538', 'xutingyuandada@gmail.com', '2020-11-09');
INSERT INTO `user` VALUES ('17', 'lingxiao', '1111', '男', '15650596038', '111', '1903242094@qq.com', '2020-11-25');
