/*
 Navicat Premium Data Transfer

 Source Server         : 记账系统
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : ao_system2

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 09/10/2020 11:39:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customerlist
-- ----------------------------
DROP TABLE IF EXISTS `customerlist`;
CREATE TABLE `customerlist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `CustomerName` text,
  `CustomerContent` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customerlist
-- ----------------------------
BEGIN;
INSERT INTO `customerlist` VALUES (11, '广州市大迈文化传播有限公司', '');
COMMIT;

-- ----------------------------
-- Table structure for expenditure
-- ----------------------------
DROP TABLE IF EXISTS `expenditure`;
CREATE TABLE `expenditure` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `ReceivablesData` varchar(254) DEFAULT NULL,
  `contract` varchar(254) DEFAULT NULL,
  `Remarks` varchar(254) DEFAULT NULL,
  `invoice` varchar(254) DEFAULT NULL,
  `Receivables` varchar(254) DEFAULT NULL,
  `OtherParty` varchar(254) DEFAULT NULL,
  `ReceivablesMode` varchar(254) DEFAULT NULL,
  `projectClass` varchar(254) DEFAULT NULL,
  `SupplierName` varchar(254) DEFAULT NULL,
  `contractdate` varchar(254) DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `projectlist` varchar(255) DEFAULT NULL,
  `kaifapiaodate` varchar(255) DEFAULT NULL,
  `daozhangdate` varchar(255) DEFAULT NULL,
  `invoicebo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for expenditureclass
-- ----------------------------
DROP TABLE IF EXISTS `expenditureclass`;
CREATE TABLE `expenditureclass` (
  `id` int(11) NOT NULL,
  `expenditureClass` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditureclass
-- ----------------------------
BEGIN;
INSERT INTO `expenditureclass` VALUES (1, '硬件类');
INSERT INTO `expenditureclass` VALUES (2, '软件类');
INSERT INTO `expenditureclass` VALUES (3, '工程类');
INSERT INTO `expenditureclass` VALUES (4, '业务类');
INSERT INTO `expenditureclass` VALUES (5, '拓展类');
COMMIT;

-- ----------------------------
-- Table structure for expendituredata
-- ----------------------------
DROP TABLE IF EXISTS `expendituredata`;
CREATE TABLE `expendituredata` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) DEFAULT NULL,
  `projectId` int(20) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `ReceivablesData` varchar(254) DEFAULT NULL,
  `contract` varchar(254) DEFAULT NULL,
  `Remarks` varchar(254) DEFAULT NULL,
  `invoice` varchar(254) DEFAULT NULL,
  `Receivables` varchar(254) DEFAULT NULL,
  `ReceivablesMode` varchar(254) DEFAULT NULL,
  `daozhangdate` varchar(254) DEFAULT NULL,
  `kaifapiaodate` varchar(254) DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `projectlist` varchar(255) DEFAULT NULL,
  `supplielist` varchar(255) DEFAULT NULL,
  `invoicebo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO `login` VALUES (64, 'zeng', '123456', '0', NULL, '1597811112333');
INSERT INTO `login` VALUES (65, 'bigmind', '509509', '0', NULL, '1597027203889');
INSERT INTO `login` VALUES (66, 'bigmind2', '590509', '0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for projectlist
-- ----------------------------
DROP TABLE IF EXISTS `projectlist`;
CREATE TABLE `projectlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) DEFAULT NULL,
  `projectContent` varchar(255) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `ContractAmount` varchar(255) DEFAULT NULL,
  `ContractDate` varchar(255) DEFAULT NULL,
  `ExpenditureBudget` varchar(255) DEFAULT NULL,
  `complete` varchar(255) DEFAULT '0',
  `CustomerNameid` varchar(255) DEFAULT NULL,
  `Receivables` varchar(255) DEFAULT NULL,
  `expenditure` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of projectlist
-- ----------------------------
BEGIN;
INSERT INTO `projectlist` VALUES (35, '测试', '', '', '100000', '2020-08-11', '', '1', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (36, '保利广钢', '', '', '0', '2020-02-26', '', '0', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for receivables
-- ----------------------------
DROP TABLE IF EXISTS `receivables`;
CREATE TABLE `receivables` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) DEFAULT NULL,
  `projectId` int(20) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `ReceivablesData` varchar(254) DEFAULT NULL,
  `contract` varchar(254) DEFAULT NULL,
  `Remarks` varchar(254) DEFAULT NULL,
  `invoice` varchar(254) DEFAULT NULL,
  `Receivables` varchar(254) DEFAULT NULL,
  `ReceivablesMode` varchar(254) DEFAULT NULL,
  `daozhangdate` varchar(254) DEFAULT NULL,
  `kaifapiaodate` varchar(254) DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `projectlist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for revenuecontract
-- ----------------------------
DROP TABLE IF EXISTS `revenuecontract`;
CREATE TABLE `revenuecontract` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(255) DEFAULT NULL,
  `ReceivablesData` varchar(255) DEFAULT NULL,
  `ReceivablesMode` varchar(255) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `Received` varchar(255) DEFAULT NULL,
  `ReceivedData` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `invoiceData` varchar(255) DEFAULT NULL,
  `invoicebo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for supplierlist
-- ----------------------------
DROP TABLE IF EXISTS `supplierlist`;
CREATE TABLE `supplierlist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `SupplierName` text,
  `SupplierCon` text,
  `SupplierClass` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplierlist
-- ----------------------------
BEGIN;
INSERT INTO `supplierlist` VALUES (112, '深圳市言信电子科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (113, '鸿瑞工美（深圳）实业有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (114, '广州市科驰广告制作有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (115, '惠州市瀚鑫展示制品有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (116, '广州淘影电子有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (117, '深圳艺博林科技模型设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (118, '深圳芯视安信息技术有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (119, '陈倩媚', '', 2);
INSERT INTO `supplierlist` VALUES (120, '何广鹏', '', 2);
INSERT INTO `supplierlist` VALUES (121, '王浩圳', '', 2);
INSERT INTO `supplierlist` VALUES (122, '梅志广', '', 2);
INSERT INTO `supplierlist` VALUES (123, '郑培焜', '', 2);
INSERT INTO `supplierlist` VALUES (124, '张化明', '', 2);
INSERT INTO `supplierlist` VALUES (126, '邓茂创', '', 2);
INSERT INTO `supplierlist` VALUES (127, '邓昭越', '', 2);
INSERT INTO `supplierlist` VALUES (128, '文兆麟', '', 2);
INSERT INTO `supplierlist` VALUES (129, '丁大勇', '', 2);
INSERT INTO `supplierlist` VALUES (130, '范振华', '', 2);
INSERT INTO `supplierlist` VALUES (131, '谭霖', '', 2);
COMMIT;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MoneyClass` int(10) DEFAULT NULL,
  `CollectMoney` int(10) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `AmountMoney` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
