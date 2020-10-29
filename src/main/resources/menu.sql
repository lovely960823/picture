/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : pictures

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-10-29 20:10:30
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
  `minipath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '首页', null, null, null, '1', '/static/images/skin1.png', null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('2', '0', '老刘老余', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('3', '0', '刘老师', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('4', '0', '小马小刘', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('5', '0', '回收站', null, null, null, '1', null, null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('343', '4', '开封游玩', null, null, null, '1', '/95cf63bb-0887-4e72-ad59-d75b005ca2d9.png', null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('345', '346', 'a1', null, null, null, '0', '/6feaeb47-b21b-4cb2-9a54-c700cf0bd6c8.jpg', null, '0', null, null, null, null, null, '1', null);
INSERT INTO `menu` VALUES ('346', '343', '新建相册', null, null, null, '1', '/303a15bc-95db-4935-86b1-ad553bf9a09d.png', null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('347', '343', '龙王视频', '/video/22191603367460612.png', null, null, '3', '/video/22191603367460612.mp4', null, '0', null, null, null, null, null, '1', null);
INSERT INTO `menu` VALUES ('348', '346', '帅', null, null, null, '0', '/64b7746a-8bc1-40d9-9de1-0c7538cd069b.jpg', null, '0', null, '', '20201022', '', '  ', '1', null);
INSERT INTO `menu` VALUES ('350', '2', '1b205b8a76884c40e0f23609154b8ed', null, null, null, '0', '/4ef59c90-e5ef-4704-ba7c-71a2e633f962.jpg', null, '0', null, null, null, null, null, '1', '/minipic/4ef59c90-e5ef-4704-ba7c-71a2e633f962.jpg');
INSERT INTO `menu` VALUES ('351', '2', '12', null, null, null, '0', '/c9ae6df7-11b5-41fe-92f5-f7bc167b3b12.jpg', null, '0', null, null, null, null, null, '1', '/minipic/c9ae6df7-11b5-41fe-92f5-f7bc167b3b12.jpg');
INSERT INTO `menu` VALUES ('352', '2', '2be80af5383ab3f3d75d24affb5161d', null, null, null, '0', '/3932e707-1490-4e7d-88d9-86e5f7c90b7c.jpg', null, '0', null, null, null, null, null, '1', '/minipic/3932e707-1490-4e7d-88d9-86e5f7c90b7c.jpg');
INSERT INTO `menu` VALUES ('353', '2', '81eb9043679a2db84b8c9f4209af62a', null, null, null, '0', '/81c41d11-c44c-4938-bb73-d447fdba11bb.jpg', null, '0', null, null, null, null, null, '1', '/minipic/81c41d11-c44c-4938-bb73-d447fdba11bb.jpg');
INSERT INTO `menu` VALUES ('354', '2', '94dd992f3f17704059c4746ec61d97e', null, null, null, '0', '/ac32a412-28a0-47ed-b5b9-21212584ac47.jpg', null, '0', null, null, null, null, null, '1', '/minipic/ac32a412-28a0-47ed-b5b9-21212584ac47.jpg');
INSERT INTO `menu` VALUES ('355', '2', '44e52b48d78005485a3272186e6f0e3', null, null, null, '0', '/f301f05d-7b06-4812-bd16-d5b4ef59dcae.jpg', null, '0', null, null, null, null, null, '1', '/minipic/f301f05d-7b06-4812-bd16-d5b4ef59dcae.jpg');
INSERT INTO `menu` VALUES ('356', '2', '111', null, null, null, '0', '/7acda17f-e9a7-4201-a3e8-501511056dff.jpg', null, '0', null, null, null, null, null, '1', '/minipic/7acda17f-e9a7-4201-a3e8-501511056dff.jpg');
INSERT INTO `menu` VALUES ('357', '2', '2745bf0ae1df83289233ec65462ef9c', null, null, null, '0', '/cbd864d0-cc74-40bf-98d4-6a992e5d4697.jpg', null, '0', null, null, null, null, null, '1', '/minipic/cbd864d0-cc74-40bf-98d4-6a992e5d4697.jpg');
INSERT INTO `menu` VALUES ('358', '2', '1233', null, null, null, '0', '/34174434-7026-4d19-831b-11bb1025dbc9.jpg', null, '0', null, null, null, null, null, '1', '/minipic/34174434-7026-4d19-831b-11bb1025dbc9.jpg');
INSERT INTO `menu` VALUES ('359', '2', '123', null, null, null, '0', '/5ab681c0-70ec-4f6b-aa58-23be920a0d45.jpg', null, '0', null, null, null, null, null, '1', '/minipic/5ab681c0-70ec-4f6b-aa58-23be920a0d45.jpg');
INSERT INTO `menu` VALUES ('360', '2', '121ee66f3126753cb6f9ca7621c3167', null, null, null, '0', '/d71b6255-a3d5-48e7-a3d6-014a4e7a704e.jpg', null, '0', null, null, null, null, null, '1', '/minipic/d71b6255-a3d5-48e7-a3d6-014a4e7a704e.jpg');
INSERT INTO `menu` VALUES ('361', '2', '1234', null, null, null, '0', '/5f93e037-8bf2-47bb-b698-bb98ac9dd78f.jpg', null, '0', null, null, null, null, null, '1', '/minipic/5f93e037-8bf2-47bb-b698-bb98ac9dd78f.jpg');
INSERT INTO `menu` VALUES ('362', '2', '484dfaa1446cd75df427f6bb28b9015', null, null, null, '0', '/4823ccca-8304-4ab8-9d26-dfa715a429a5.jpg', null, '0', null, null, null, null, null, '1', '/minipic/4823ccca-8304-4ab8-9d26-dfa715a429a5.jpg');
INSERT INTO `menu` VALUES ('363', '2', 'e96d5521547e9a446f7f545b7be85d7', null, null, null, '0', '/481c4335-e191-4f98-9bf1-94e930c7f378.jpg', null, '0', null, null, null, null, null, '1', '/minipic/481c4335-e191-4f98-9bf1-94e930c7f378.jpg');
INSERT INTO `menu` VALUES ('364', '2', 'e627d5a93cd8a5ca36d052a265a4a2e', null, null, null, '0', '/1eda16f9-20f7-4a61-9ddc-df47c8dacd64.jpg', null, '0', null, null, null, null, null, '1', '/minipic/1eda16f9-20f7-4a61-9ddc-df47c8dacd64.jpg');
INSERT INTO `menu` VALUES ('365', '2', 'fd3f34b0750ae04ec2fa9dac930413a', null, null, null, '0', '/7074084e-5871-44cd-bf9d-35fab6047dda.jpg', null, '0', null, null, null, null, null, '1', '/minipic/7074084e-5871-44cd-bf9d-35fab6047dda.jpg');
INSERT INTO `menu` VALUES ('366', '2', 'e0ba15b71332ce0f948850c2b19bd73', null, null, null, '0', '/3c201708-8ce2-4984-9be5-d76ca8d3d3f8.jpg', null, '0', null, null, null, null, null, '1', '/minipic/3c201708-8ce2-4984-9be5-d76ca8d3d3f8.jpg');
INSERT INTO `menu` VALUES ('367', '2', 'dce758015ced4e599266f7bd4b96c9e', null, null, null, '0', '/d5b2a04b-6c90-4c44-889f-bdf3cb0c3bb3.jpg', null, '0', null, null, null, null, null, '1', '/minipic/d5b2a04b-6c90-4c44-889f-bdf3cb0c3bb3.jpg');
INSERT INTO `menu` VALUES ('368', '2', 'e96d5521547e9a446f7f545b7be85d7', null, null, null, '0', '/35d3f418-e1e5-43a0-a535-371945dd3f25.jpg', null, '0', null, null, null, null, null, '1', '/minipic/35d3f418-e1e5-43a0-a535-371945dd3f25.jpg');
INSERT INTO `menu` VALUES ('369', '2', 'e0ba15b71332ce0f948850c2b19bd73', null, null, null, '0', '/0a1944da-51d6-44bd-8d20-82c6817de24d.jpg', null, '0', null, null, null, null, null, '1', '/minipic/0a1944da-51d6-44bd-8d20-82c6817de24d.jpg');
INSERT INTO `menu` VALUES ('370', '2', 'fd3f34b0750ae04ec2fa9dac930413a', null, null, null, '0', '/bce90bf4-40ab-4d19-aaa1-f8f84e2149b5.jpg', null, '0', null, null, null, null, null, '1', '/minipic/bce90bf4-40ab-4d19-aaa1-f8f84e2149b5.jpg');
INSERT INTO `menu` VALUES ('371', '2', 'dce758015ced4e599266f7bd4b96c9e', null, null, null, '0', '/2df7fb6f-e56b-4534-8b18-09f47dcc7fd6.jpg', null, '0', null, null, null, null, null, '1', '/minipic/2df7fb6f-e56b-4534-8b18-09f47dcc7fd6.jpg');
INSERT INTO `menu` VALUES ('372', '2', 'e627d5a93cd8a5ca36d052a265a4a2e', null, null, null, '0', '/9510a340-49c9-4c47-b373-66e6e030559b.jpg', null, '0', null, null, null, null, null, '1', '/minipic/9510a340-49c9-4c47-b373-66e6e030559b.jpg');
INSERT INTO `menu` VALUES ('373', '2', 'e96d5521547e9a446f7f545b7be85d7', null, null, null, '0', '/545ed603-e6ee-4115-91dd-8682e892c3c9.jpg', null, '0', null, null, null, null, null, '1', '/minipic/545ed603-e6ee-4115-91dd-8682e892c3c9.jpg');
INSERT INTO `menu` VALUES ('374', '2', 'e627d5a93cd8a5ca36d052a265a4a2e', null, null, null, '0', '/1e9756ff-9912-4d8d-ad5a-9987014b59ea.jpg', null, '0', null, null, null, null, null, '1', '/minipic/1e9756ff-9912-4d8d-ad5a-9987014b59ea.jpg');
INSERT INTO `menu` VALUES ('375', '2', 'fd3f34b0750ae04ec2fa9dac930413a', null, null, null, '0', '/506fdf57-e652-43c8-ae08-effa86616813.jpg', null, '0', null, null, null, null, null, '1', '/minipic/506fdf57-e652-43c8-ae08-effa86616813.jpg');
INSERT INTO `menu` VALUES ('376', '2', 'e0ba15b71332ce0f948850c2b19bd73', null, null, null, '0', '/f94520fc-7d86-48a7-b19f-3339a916dfaf.jpg', null, '0', null, null, null, null, null, '1', '/minipic/f94520fc-7d86-48a7-b19f-3339a916dfaf.jpg');
INSERT INTO `menu` VALUES ('377', '2', 'dce758015ced4e599266f7bd4b96c9e', null, null, null, '0', '/824d72da-bcb4-460d-b764-3ae0512b071c.jpg', null, '0', null, null, null, null, null, '1', '/minipic/824d72da-bcb4-460d-b764-3ae0512b071c.jpg');
INSERT INTO `menu` VALUES ('378', '', '111', null, null, null, '1', '/static/images/ic_moren.png', null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('379', '2', '122', null, null, null, '1', '/94a816f6-6d13-4749-8e53-1edc1ae92ef8.png', null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('380', '379', '2495066f527ca40ed0736577f2beb566', '/video/28011603970025184.png', null, null, '3', '/video/28011603970025184.mp4', null, '0', null, null, null, null, null, '1', null);
INSERT INTO `menu` VALUES ('381', '2', '2495066f527ca40ed0736577f2beb566', '/video/27861603970046405.png', null, null, '3', '/video/27861603970046405.mp4', null, '0', null, null, null, null, null, '1', null);
INSERT INTO `menu` VALUES ('382', '379', '23', null, null, null, '1', '/static/images/ic_moren.png', null, '0', null, null, null, null, null, 'true', null);
INSERT INTO `menu` VALUES ('383', '382', '44e52b48d78005485a3272186e6f0e3', null, null, null, '0', '/4332419b-29f3-40ca-ba34-254f62e836d7.jpg', null, '0', null, null, null, null, null, '1', null);
INSERT INTO `menu` VALUES ('384', '379', '1b205b8a76884c40e0f23609154b8ed', null, null, null, '0', '/132ad10e-3941-434e-b660-c856d5220b0c.jpg', null, '0', null, null, null, null, null, '1', null);
INSERT INTO `menu` VALUES ('385', '2', 'e96d5521547e9a446f7f545b7be85d7', null, null, null, '0', '/16642282-37cf-4262-b84d-5b7791c422d1.jpg', null, '0', null, null, null, null, null, '1', '/minipic/16642282-37cf-4262-b84d-5b7791c422d1.jpg');
INSERT INTO `menu` VALUES ('386', '2', 'dce758015ced4e599266f7bd4b96c9e', null, null, null, '0', '/98f79ac9-2ea9-4afa-8a71-33dbe4a09e45.jpg', null, '0', null, null, null, null, null, '1', '/minipic/98f79ac9-2ea9-4afa-8a71-33dbe4a09e45.jpg');
INSERT INTO `menu` VALUES ('387', '2', 'e0ba15b71332ce0f948850c2b19bd73', null, null, null, '0', '/9c4b78db-7972-4015-8a13-bb1f2f1437c0.jpg', null, '0', null, null, null, null, null, '1', '/minipic/9c4b78db-7972-4015-8a13-bb1f2f1437c0.jpg');
INSERT INTO `menu` VALUES ('388', '2', 'e627d5a93cd8a5ca36d052a265a4a2e', null, null, null, '0', '/3d26be79-888c-4640-be6b-b1a54d8bb84b.jpg', null, '0', null, null, null, null, null, '1', '/minipic/3d26be79-888c-4640-be6b-b1a54d8bb84b.jpg');
INSERT INTO `menu` VALUES ('389', '2', 'fd3f34b0750ae04ec2fa9dac930413a', null, null, null, '0', '/6dbd05f4-09a6-404c-aa56-78ed825f4903.jpg', null, '0', null, null, null, null, null, '1', '/minipic/6dbd05f4-09a6-404c-aa56-78ed825f4903.jpg');
INSERT INTO `menu` VALUES ('390', '2', 'e96d5521547e9a446f7f545b7be85d7', null, null, null, '0', '/af6280d4-8b1b-4730-ba7a-273004a9e526.jpg', null, '0', null, null, null, null, null, '1', '/minipic/af6280d4-8b1b-4730-ba7a-273004a9e526.jpg');
INSERT INTO `menu` VALUES ('391', '2', 'e0ba15b71332ce0f948850c2b19bd73', null, null, null, '0', '/261213f8-adef-4cad-b130-67b71a18e4e6.jpg', null, '0', null, null, null, null, null, '1', '/minipic/261213f8-adef-4cad-b130-67b71a18e4e6.jpg');
INSERT INTO `menu` VALUES ('392', '2', 'e627d5a93cd8a5ca36d052a265a4a2e', null, null, null, '0', '/faad6732-6919-4fd3-b291-cd1c2bd6bc28.jpg', null, '0', null, null, null, null, null, '1', '/minipic/faad6732-6919-4fd3-b291-cd1c2bd6bc28.jpg');
INSERT INTO `menu` VALUES ('393', '2', 'fd3f34b0750ae04ec2fa9dac930413a', null, null, null, '0', '/971332ef-a850-4dac-9c59-f5dba6f19e12.jpg', null, '0', null, null, null, null, null, '1', '/minipic/971332ef-a850-4dac-9c59-f5dba6f19e12.jpg');
INSERT INTO `menu` VALUES ('394', '2', 'dce758015ced4e599266f7bd4b96c9e', null, null, null, '0', '/12b3a1ef-a94f-4547-8bae-75c551b803ae.jpg', null, '0', null, null, null, null, null, '1', '/minipic/12b3a1ef-a94f-4547-8bae-75c551b803ae.jpg');
INSERT INTO `menu` VALUES ('395', '2', '1b205b8a76884c40e0f23609154b8ed', null, null, null, '0', '/0a8c16c3-a544-4203-bc3f-5f45f4b2f39d.jpg', null, '0', null, null, null, null, null, '1', '/minipic/0a8c16c3-a544-4203-bc3f-5f45f4b2f39d.jpg');
INSERT INTO `menu` VALUES ('396', '2', '12', null, null, null, '0', '/093a835a-8662-4317-bdfe-07f315e55a3c.jpg', null, '0', null, null, null, null, null, '1', '/minipic/093a835a-8662-4317-bdfe-07f315e55a3c.jpg');
INSERT INTO `menu` VALUES ('397', '2', '2be80af5383ab3f3d75d24affb5161d', null, null, null, '0', '/19bc97e8-9502-4d6f-9097-ce6937d0a153.jpg', null, '0', null, null, null, null, null, '1', '/minipic/19bc97e8-9502-4d6f-9097-ce6937d0a153.jpg');
INSERT INTO `menu` VALUES ('398', '2', '81eb9043679a2db84b8c9f4209af62a', null, null, null, '0', '/6c792a2c-34ca-452d-8d0e-d02b3e29554d.jpg', null, '0', null, null, null, null, null, '1', '/minipic/6c792a2c-34ca-452d-8d0e-d02b3e29554d.jpg');
INSERT INTO `menu` VALUES ('399', '2', '44e52b48d78005485a3272186e6f0e3', null, null, null, '0', '/26cf8877-494f-453a-aca6-e97d7e78913d.jpg', null, '0', null, null, null, null, null, '1', '/minipic/26cf8877-494f-453a-aca6-e97d7e78913d.jpg');
