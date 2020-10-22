/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : pictures

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-10-22 20:12:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名字',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '视频封面图',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件后缀',
  `font` varchar(255) DEFAULT NULL COMMENT '字体样式设置',
  `folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '0 图片 1文件夹 3视频',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL,
  `delflag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志',
  `mc` varchar(255) DEFAULT NULL,
  `dh` varchar(255) DEFAULT NULL,
  `sj` varchar(255) DEFAULT NULL,
  `rw` varchar(255) DEFAULT NULL,
  `bj` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '首页', null, null, null, '1', '/static/images/skin1.png', null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('2', '0', '老刘老余', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('3', '0', '刘老师', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('4', '0', '小马小刘', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('5', '0', '回收站', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('343', '4', '开封游玩', null, null, null, '1', '/c964f36f-623f-42b0-87fd-3e7613fea580.png', null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('344', '343', '1122', null, null, null, '1', '/static/images/ic_moren.png', null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('345', '344', 'a1', null, null, null, '0', '/6feaeb47-b21b-4cb2-9a54-c700cf0bd6c8.jpg', null, '0', null, null, null, null, null, '1');
INSERT INTO `menu` VALUES ('346', '343', '234', null, null, null, '1', '/8c23d025-e6ef-4e74-bae7-592e1a085d1e.png', null, '0', null, null, null, null, null, 'true');
INSERT INTO `menu` VALUES ('347', '3', '2495066f527ca40ed0736577f2beb566', '/video/22191603367460612.png', null, null, '3', '/video/22191603367460612.mp4', null, '0', null, null, null, null, null, '1');
INSERT INTO `menu` VALUES ('348', '3', '帅', null, null, null, '0', '/64b7746a-8bc1-40d9-9de1-0c7538cd069b.jpg', null, '0', null, '', '20201022', '', '  ', '1');
