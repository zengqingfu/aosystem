/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : ao_system1

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 01/04/2020 22:08:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customerlist
-- ----------------------------
DROP TABLE IF EXISTS `customerlist`;
CREATE TABLE `customerlist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `CustomerName` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `CustomerContent` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customerlist
-- ----------------------------
BEGIN;
INSERT INTO `customerlist` VALUES (2, '佛山市南海区景元房地产有限公司', '');
INSERT INTO `customerlist` VALUES (3, '金融街重庆裕隆实业有限公司', '');
INSERT INTO `customerlist` VALUES (4, '广州诚品置业有限公司', '');
COMMIT;

-- ----------------------------
-- Table structure for expenditure
-- ----------------------------
DROP TABLE IF EXISTS `expenditure`;
CREATE TABLE `expenditure` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL,
  `number` decimal(20,2) DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` decimal(20,2) DEFAULT NULL,
  `Receivables` decimal(20,2) DEFAULT NULL,
  `OtherParty` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectClass` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contractdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditure
-- ----------------------------
BEGIN;
INSERT INTO `expenditure` VALUES (10, '硬件', 2, 500000.00, '签约后', '有', '硬件', 500000.00, 500000.00, '1', '工行', '工程类', '深圳市言信电子科技有限公司', '2020-04-09');
INSERT INTO `expenditure` VALUES (11, '堡垒', 3, 500000.00, '2019-12-30', '有', '', 400000.00, 400000.00, '1', '银付', '硬件类成本', '深圳市言信电子科技有限公司', '2019-08-10');
INSERT INTO `expenditure` VALUES (12, '6666', 3, 666666.66, '6666', '有', '66666', 2222.00, 66.66, '1', '6666', '硬件类成本', '深圳市言信电子科技有限公司', '2020-04-07');
INSERT INTO `expenditure` VALUES (13, '88888', 3, 88888.88, '88888', '有', '88.88', 88.88, 88080.00, '1', '88', '业务类', '深圳市言信电子科技有限公司', '2020-04-08');
COMMIT;

-- ----------------------------
-- Table structure for expenditureclass
-- ----------------------------
DROP TABLE IF EXISTS `expenditureclass`;
CREATE TABLE `expenditureclass` (
  `id` int(11) NOT NULL,
  `expenditureClass` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditureclass
-- ----------------------------
BEGIN;
INSERT INTO `expenditureclass` VALUES (1, '硬件类成本');
INSERT INTO `expenditureclass` VALUES (2, '软体类成本');
INSERT INTO `expenditureclass` VALUES (3, '工程类');
INSERT INTO `expenditureclass` VALUES (4, '业务类');
INSERT INTO `expenditureclass` VALUES (5, '拓展费');
COMMIT;

-- ----------------------------
-- Table structure for projectlist
-- ----------------------------
DROP TABLE IF EXISTS `projectlist`;
CREATE TABLE `projectlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContractAmount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContractDate` datetime DEFAULT NULL,
  `ExpenditureBudget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `complete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerNameid` int(11) DEFAULT NULL,
  `Receivables` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expenditure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of projectlist
-- ----------------------------
BEGIN;
INSERT INTO `projectlist` VALUES (1, '重庆瓷器口', '0000000000', '3', '1978952', '2019-11-14 00:00:00', '1000000', NULL, 0, NULL, NULL);
INSERT INTO `projectlist` VALUES (3, '保利和府', '未完结', '4', '1456847', '2019-12-01 00:00:00', '800000', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for receivables
-- ----------------------------
DROP TABLE IF EXISTS `receivables`;
CREATE TABLE `receivables` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` int(20) DEFAULT NULL,
  `number` decimal(20,2) DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` decimal(20,2) DEFAULT NULL,
  `Receivables` decimal(20,2) DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `daozhangdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kaifapiaodate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of receivables
-- ----------------------------
BEGIN;
INSERT INTO `receivables` VALUES (5, '项目一期', 2, 1000000.00, '签约后', '有', '项目一期', 1000000.00, 1000000.00, '工行', '2020-04-14', '2020-04-14');
INSERT INTO `receivables` VALUES (6, '第一期', 3, 562786.00, '2019-12-20', '有', '', 0.00, 0.00, '银行', NULL, NULL);
INSERT INTO `receivables` VALUES (7, '第二期', 3, 422089.00, '20191230', '有', '', 0.00, 0.00, '银行', NULL, NULL);
INSERT INTO `receivables` VALUES (8, '第三期', 3, 379880.00, '2222222', '有', '', 0.00, 0.00, '银行', NULL, NULL);
INSERT INTO `receivables` VALUES (9, '质保金', 3, 42208.00, '2222222', '有', '', 0.00, 0.00, '银行', NULL, NULL);
INSERT INTO `receivables` VALUES (10, '合同名称', 3, 33.33, '合同名称', '有', '合同名称', 0.00, 0.00, '合同名称', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for supplierlist
-- ----------------------------
DROP TABLE IF EXISTS `supplierlist`;
CREATE TABLE `supplierlist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `SupplierName` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `SupplierCon` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `SupplierClass` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplierlist
-- ----------------------------
BEGIN;
INSERT INTO `supplierlist` VALUES (2, '深圳市言信电子科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (3, '广州造所文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (4, '鸿瑞工美（深圳）实业有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (5, '广州市科驰广告制作有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (6, '广州千浪建筑设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (7, '广州淘影电子有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (8, '广州市极智数码科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (9, '杉浦文化传播（广州）有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (10, '广州市三天文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (11, '广州市汉晨装饰设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (12, '深圳艺博林科技模型设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (13, '广州牟瓜文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (14, '广州慧玥文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (15, '广州亚非欧广告设计有限公司', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MoneyClass` int(10) DEFAULT NULL,
  `CollectMoney` int(10) DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AmountMoney` decimal(20,0) DEFAULT NULL,
  `invoice` decimal(20,0) DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------
BEGIN;
INSERT INTO `transaction` VALUES (1, 1, 2, NULL, 20000, 20000, 0);
INSERT INTO `transaction` VALUES (2, 1, 3, NULL, 300000, 300000, 0);
INSERT INTO `transaction` VALUES (3, 1, 3, NULL, 100000, 100000, 0);
INSERT INTO `transaction` VALUES (4, 1, 4, NULL, 2000, 2000, 0);
INSERT INTO `transaction` VALUES (5, 1, 6, NULL, 3111111, 3111111, 0);
INSERT INTO `transaction` VALUES (6, 1, 5, NULL, 1000, 0, 0);
INSERT INTO `transaction` VALUES (7, 1, 4, NULL, 5000000, 5000000, 0);
INSERT INTO `transaction` VALUES (8, 1, 4, NULL, 5936856, 5936856, 0);
INSERT INTO `transaction` VALUES (9, 1, 4, NULL, 5936856, 5936856, 0);
INSERT INTO `transaction` VALUES (10, 1, 8, NULL, 50000, 0, 0);
INSERT INTO `transaction` VALUES (11, 1, 9, NULL, 0, 0, 0);
INSERT INTO `transaction` VALUES (12, 1, 10, NULL, 500000, 500000, 2);
INSERT INTO `transaction` VALUES (13, 1, 5, NULL, 1000000, 1000000, 2);
INSERT INTO `transaction` VALUES (14, 1, 11, NULL, 400000, 400000, 3);
INSERT INTO `transaction` VALUES (15, 1, 11, NULL, 400000, 400000, 3);
INSERT INTO `transaction` VALUES (16, 1, 12, NULL, 67, 2222, 3);
INSERT INTO `transaction` VALUES (17, 1, 13, NULL, 88080, 89, 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
