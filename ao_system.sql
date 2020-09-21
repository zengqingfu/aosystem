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

 Date: 07/07/2020 15:07:36
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for expenditure
-- ----------------------------
DROP TABLE IF EXISTS `expenditure`;
CREATE TABLE `expenditure` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` varchar(254) DEFAULT NULL,
  `Receivables` varchar(254) DEFAULT NULL,
  `OtherParty` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectClass` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contractdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `projectlist` varchar(255) DEFAULT NULL,
  `kaifapiaodate` varchar(255) DEFAULT NULL,
  `daozhangdate` varchar(255) DEFAULT NULL,
  `invoicebo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
-- Table structure for expenditureData
-- ----------------------------
DROP TABLE IF EXISTS `expenditureData`;
CREATE TABLE `expenditureData` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` int(20) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` varchar(254) DEFAULT NULL,
  `Receivables` varchar(254) DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `daozhangdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kaifapiaodate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `projectlist` varchar(255) DEFAULT NULL,
  `supplielist` varchar(255) DEFAULT NULL,
  `invoicebo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `complete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `CustomerNameid` varchar(255) DEFAULT NULL,
  `Receivables` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expenditure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for receivables
-- ----------------------------
DROP TABLE IF EXISTS `receivables`;
CREATE TABLE `receivables` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` int(20) DEFAULT NULL,
  `number` varchar(254) DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` varchar(254) DEFAULT NULL,
  `Receivables` varchar(254) DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `daozhangdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `kaifapiaodate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Receivableslist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectlist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for RevenueContract
-- ----------------------------
DROP TABLE IF EXISTS `RevenueContract`;
CREATE TABLE `RevenueContract` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(255) DEFAULT NULL,
  `ReceivablesData` varchar(255) DEFAULT NULL,
  `ReceivablesMode` varchar(255) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  `Receivableslist` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `Received` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ReceivedData` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `invoiceData` varchar(255) DEFAULT NULL,
  `invoicebo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MoneyClass` int(10) DEFAULT NULL,
  `CollectMoney` int(10) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `AmountMoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
