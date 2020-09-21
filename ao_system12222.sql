/*
 Navicat Premium Data Transfer

 Source Server         : 记账系统
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : ao_system1

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 07/08/2020 16:00:13
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
