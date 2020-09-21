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

 Date: 16/07/2020 14:20:23
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
-- Records of customerlist
-- ----------------------------
BEGIN;
INSERT INTO `customerlist` VALUES (5, '清远市恒达房地产开发有限公司', '');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditure
-- ----------------------------
BEGIN;
INSERT INTO `expenditure` VALUES (10, '硬件', 2, '500000.00', '签约后', '有', '硬件', '500000.00', '500000.00', '1', '工行', '2', '13', '2020-04-09', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (11, '合同名称', 3, '500000.00', '签约后', '有', '', '400000.00', '400000.00', '1', '银付', '1', '11', '2019-08-10', '第1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (12, '合同名称', 3, '666666.66', '签约后', '有', '66666', '2222.00', '66.66', '1', '6666', '1', '12', '2020-04-07', '第3期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (13, '合同名称', 3, '88888.88', '签约后', '有', '88.88', '88.88', '88080.00', '1', '88', '4', '6', '2020-04-08', '第2期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (14, '合同名称二', 3, '66.33', '完成后', '有', '合同名称二', '0.00', '0.00', '14', '工行', '5', '14', '2020-04-13', '第1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (15, '3333', 3, '33333.00', '3333', '有', '3333', '0.00', '0.00', '14', '333', '4', '2', '2020-04-14', '第3期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (16, '5555', 3, '5555.00', '5555', '有', '5555', '555.00', '555.00', '9', '5555', '5', '4', '2020-04-15', '第2期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (17, '333333', 3, '330.01', '333', '无', '', '3355.30', '3355.33', '13', '33333', '4', '6', '2020-04-08', '第2期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (18, '测试', 6, '', '', '', '', '0', '0', '', '', '', '5', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (19, '22222', 6, '33000', '', '有', '333', '0', '0', '15', '', '5', '13', '', '1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (20, 'rrrrrrrrrrrr', 6, '900000', '', '有', '', '0', '0', '14', '', '4', '13', '2020-06-09', '3期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (21, 'aaa项目', 11, '800000', '', '有', '', '0', '0', '15', '', '4', '11', '2020-06-10', '3期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (22, '合同2', 11, '210000', '', '有', '', '0', '0', '14', '', '5', '8', '2020-06-03', '1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (23, '项目a', 14, '2400000', '', '有', '', '0', '0', '13', '', '3', '9', '2020-06-09', '3期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (24, '我也不知道', 14, '500000', '', '有', '', '0', '0', '11', '', '4', '13', '2020-06-16', '3期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (32, 'LED屏幕，投影机', 15, '508885', '', '有', '', '0', '0', '', '', '1', '7', '2019-04-01', '1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (33, '立体造型动画及厨卫动画', 15, '84000', '', '有', '', '0', '0', '', '', '2', '9', '2019-04-01', '1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (34, '拓展费用', 15, '5000', '', '无', '', '0', '0', '', '', '4', '16', '2020-06-09', '1期', NULL, NULL, NULL, NULL);
INSERT INTO `expenditure` VALUES (37, '餐费', 15, '1000', '', '无', '', '100', '500', '', '现金', '5', '16', '2020-06-09', '不分期', NULL, '2020-06-09', '2020-06-09', '有');
INSERT INTO `expenditure` VALUES (38, '项目b', 14, '10000', '', '', '', '', '', '', '', '4', '9', '2020-07-06', '1期', NULL, '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for expenditureclass
-- ----------------------------
DROP TABLE IF EXISTS `expenditureclass`;
CREATE TABLE `expenditureclass` (
  `id` int(11) NOT NULL,
  `expenditureClass` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `csid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditureclass
-- ----------------------------
BEGIN;
INSERT INTO `expenditureclass` VALUES (1, '硬件类', '1');
INSERT INTO `expenditureclass` VALUES (2, '软体类', '2');
INSERT INTO `expenditureclass` VALUES (3, '工程类', '3');
INSERT INTO `expenditureclass` VALUES (4, '业务类', '4');
INSERT INTO `expenditureclass` VALUES (5, '拓展费', '5');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditureData
-- ----------------------------
BEGIN;
INSERT INTO `expenditureData` VALUES (19, '2222', 19, '55555', '开工后', '有', '', '4000', '1000', '', '2020-05-06', '2020-05-20', '第2期', NULL, NULL, NULL);
INSERT INTO `expenditureData` VALUES (21, '11111111', 20, '12000', '', '有', '', '0', '0', '', NULL, NULL, '第1期', NULL, NULL, NULL);
INSERT INTO `expenditureData` VALUES (22, '222222222', 20, '78000', '', '有', '', '0', '50000', '', '2020-06-12', NULL, '第2期', NULL, NULL, NULL);
INSERT INTO `expenditureData` VALUES (23, '', 21, '200000', '开工后', '有', '', '1000', '10000', '', '2020-06-09', '2020-06-30', '第1期', NULL, NULL, NULL);
INSERT INTO `expenditureData` VALUES (24, '', 21, '27222', '', '有', '', '0', '22220', '', '2020-06-10', NULL, '第2期', NULL, NULL, NULL);
INSERT INTO `expenditureData` VALUES (25, '', 23, '800000', '开工后', '有', '', '', '800000', '', '2020-06-16', NULL, '第1期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (26, '', 23, '800000', '', '', '', '', '300000', '', '2020-06-10', NULL, '第2期', '14', NULL, '不计发票');
INSERT INTO `expenditureData` VALUES (27, '', 23, '800000', '', '', '', '', '500000', '', '2020-06-10', NULL, '第3期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (29, '', 23, '', '', '', '', '', '300000', '', '2020-06-04', NULL, '第3期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (34, '', 24, '100000', '', '有', '', '', '50000', '', '2020-06-16', NULL, '第1期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (35, '', 24, '200000', '', '有', '', '', '30000', '', '2020-06-11', '', '第2期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (36, '', 24, '200000', '', '有', '', '', '100000', '', '2020-06-17', '', '第3期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (37, '', 24, '', '', '', '', '', '40000', '', '2020-06-19', NULL, '第1期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (38, '', 24, '', '', '', '', '50000', '', '', '', '2020-06-16', '第1期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (39, '', 31, '30000', '', '有', '', '30000', '30000', '', '2020-06-16', '2020-06-16', '第1期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (40, '', 31, '30000', '', '有', '', '20000', '20000', '', '2020-06-16', '2020-06-16', '第2期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (41, '', 31, '', '', '', '', '10000', '10000', '', '2020-06-16', '2020-06-16', '第2期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (42, '', 23, '', '', '', '', '80000', '', '', NULL, '2020-06-17', '第2期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (43, '', 23, '', '', '', '', '80000', '', '', NULL, '2020-06-17', '第2期', '14', NULL, NULL);
INSERT INTO `expenditureData` VALUES (45, 'LED屏幕，投影机', 32, '101777', '开始后', '有', '', '101777', '101777', '', '2019-04-15', '2019-04-23', '第1期', '15', NULL, '有');
INSERT INTO `expenditureData` VALUES (47, '', 32, '101777', '', '有', '', '101777', '101777', '', '2020-06-16', '2020-06-22', '第3期', '15', NULL, '不计发票');
INSERT INTO `expenditureData` VALUES (48, '', 32, '101777', '', '有', '', '101777', '101777', '', '2020-06-16', '2020-06-22', '第4期', '15', NULL, '不计发票');
INSERT INTO `expenditureData` VALUES (49, '', 32, '101777', '', '有', '', '101777', '101777', '', '2020-06-16', '2020-06-22', '第5期', '15', NULL, '不计发票');
INSERT INTO `expenditureData` VALUES (50, '立体造型动画及厨卫动画', 33, '25200', '', '有', '', '77333', '25200', '', '2019-04-15', '2020-05-01', '第1期', '15', NULL, NULL);
INSERT INTO `expenditureData` VALUES (51, '立体造型动画及厨卫动画', 33, '25200', '', '有', '', '', '25200', '', '2019-04-15', '2020-05-01', '第2期', '15', NULL, NULL);
INSERT INTO `expenditureData` VALUES (52, '立体造型动画及厨卫动画', 33, '33600', '', '有', '', '', '23600', '', '2019-08-30', '2020-05-01', '第3期', '15', NULL, NULL);
INSERT INTO `expenditureData` VALUES (53, '', 33, '', '', '有', '', '', '3333', '', '2020-06-02', '', '第1期', '15', '9', NULL);
INSERT INTO `expenditureData` VALUES (54, '吃饭', 34, '2000', '', '无', '', '1000', '1000', '', '2020-06-27', '', '第1期', '15', '16', '有');
INSERT INTO `expenditureData` VALUES (56, '', 34, '1000', '', '无', '', '', '1000', '', '2020-06-27', '', '第2期', '15', '16', '不计发票');
INSERT INTO `expenditureData` VALUES (57, '', 34, '2000', '', '无', '', '2000', '2000', '', '2020-06-27', '2020-06-21', '第3期', '15', '16', '不计发票');
INSERT INTO `expenditureData` VALUES (58, '', 34, '', '', '', '', '', '500', '', '2020-06-22', NULL, '第1期', '15', '16', '有');
INSERT INTO `expenditureData` VALUES (66, '', 24, '', '', '', '', '', '', '', '', '', '第4期', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (67, '', 24, '', '', '', '', '', '', '', '', '', '第5期', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (68, '', 24, '', '', '', '', '', '10000', '', '', '', '第1期', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (69, '', 24, '100', '', '', '', '', '1000', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (70, '', 24, '100', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (71, '', 24, '100', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (72, '', 24, '100', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (73, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (74, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (75, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (76, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (77, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (78, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (79, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (80, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (81, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (82, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (83, '', 24, '', '', '', '', '', '100', '', '', '', '', '14', '13', NULL);
INSERT INTO `expenditureData` VALUES (84, '', 38, '10000', '', '', '', '', '10000', '', '', '', '第1期', '14', '9', NULL);
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
  `ContractDate` varchar(255) DEFAULT NULL,
  `ExpenditureBudget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `complete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `CustomerNameid` varchar(255) DEFAULT NULL,
  `Receivables` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expenditure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of projectlist
-- ----------------------------
BEGIN;
INSERT INTO `projectlist` VALUES (6, '11111', '1111222', '4', '1111', '2020-04-11 00:00:00', '1111', '1', '广州诚品置业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (9, '66666', '', '3', '6666.66', '2020-03-28 00:00:00', '', '1', '金融街重庆裕隆实业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (10, '3333', '', '2', '3333', '2020-04-12 00:00:00', '333', '1', '佛山市南海区景元房地产有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (11, 'gzfagxgxg', '', '3', '788676', '2020-06-09 00:00:00', '222222', '1', '金融街重庆裕隆实业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (12, 'gshdshkj', '', '3', '2000099', '2020-05-31 00:00:00', '', '1', '金融街重庆裕隆实业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (13, '0000', '', '', '900000', '2020-05-13', '300000', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (14, '金融街', '暂无', '5', '5000001', '2020-05-04', '3050000', '0', '清远市恒达房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (15, '时代水岸', '', '5', '4919277', '2019-05-19', '30000', '1', '清远市恒达房地产开发有限公司', NULL, NULL);
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of receivables
-- ----------------------------
BEGIN;
INSERT INTO `receivables` VALUES (1, '6666', 6, '', '', '有', '', NULL, NULL, '', NULL, NULL, '1期', NULL);
INSERT INTO `receivables` VALUES (5, '项目一期', 2, '1000000.00', '签约后', '有', '项目一期', '1000000.00', '1000000.00', '工行', '2020-04-14', '2020-04-14', NULL, NULL);
INSERT INTO `receivables` VALUES (6, '第一期', 3, '562786.00', '2019-12-20', '有', '', '0.00', '0.00', '银行', NULL, NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (7, '第二期', 3, '422089.00', '20191230', '有', '', '0.00', '0.00', '银行', NULL, NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (8, '第三期', 3, '379880.00', '2222222', '有', '', '0.00', '0.00', '银行', NULL, NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (9, '质保金', 3, '42208.00', '2222222', '有', '', '0.00', '0.00', '银行', NULL, NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (10, '合同名称', 3, '33.33', '合同名称', '有', '合同名称', '0.00', '0.00', '合同名称', NULL, NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (11, '项目一', 3, '99999.33', '签约后', '有', '项目一', '22222.00', '22222.00', '工行', '2020-04-08', '2020-04-07', '第1期', NULL);
INSERT INTO `receivables` VALUES (12, '项目一', 3, '333.33', '333', '有', '项目一', '3333.22', '2222.02', '333', '2020-04-22', '2020-04-22', '第2期', NULL);
INSERT INTO `receivables` VALUES (13, 'qqq', 6, '55.66', '', '有', '', '0', '0', '', NULL, NULL, '第3期', NULL);
INSERT INTO `receivables` VALUES (14, '随便', 6, '1133.33', '', '有', '', '100', '200', '', '2020-05-19', '2020-05-27', '第2期', NULL);
INSERT INTO `receivables` VALUES (15, 'aaa', 6, '333.33', '开工后', '', '', '0', '0', '', NULL, NULL, '', NULL);
INSERT INTO `receivables` VALUES (16, 'wwww', 1, '1222', '', '', '', '100.02', '100', '下一', NULL, NULL, '保质金', NULL);
INSERT INTO `receivables` VALUES (17, '3333', 1, '111111', '', '', '', '0', '1222', '33333', NULL, NULL, '第2期', NULL);
INSERT INTO `receivables` VALUES (18, '11111', 1, '', '', '', '', '0', '1', '', NULL, NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (19, '333', 20, '11188888', '', '有', '', '0', '10000', '333', '2020-06-29', NULL, '', NULL);
INSERT INTO `receivables` VALUES (20, 'eeeeeeeeeeeeee', 22, '300000', '', '', '', '0', '1000', '', '2020-06-11', NULL, '第1期', NULL);
INSERT INTO `receivables` VALUES (21, 'qqqqqqq', 22, '150000', '', '有', '', '100', '10000', '', '2020-06-11', '2020-06-20', '第2期', NULL);
INSERT INTO `receivables` VALUES (25, 'tuqiqiqii', 26, '1500000', '签约后', '有', '', '1200000', '1200000', '', '2020-06-15', '2020-06-16', '第1期', '14');
INSERT INTO `receivables` VALUES (28, '', 26, '', '', '', '', '', '100000', '', '2020-06-16', ' ', '第1期', '14');
INSERT INTO `receivables` VALUES (32, '', 26, '', '', '', '', '', '80000', '', '2020-06-09', ' ', '第1期', '14');
INSERT INTO `receivables` VALUES (37, 'eeeeee', 26, '1500000', '一期验收后', '有', '', '1200000', '1200000', 'eee', '2020-06-08', '2020-06-09', '第2期', '14');
INSERT INTO `receivables` VALUES (40, '', 26, '', '', '', '', '300000', '', '', '', '2020-06-10', '第2期', '14');
INSERT INTO `receivables` VALUES (48, '', 25, '1000000', '开工后', '有', '', '800000', '500000', '', '2020-06-10', '2020-06-10', '第1期', '14');
INSERT INTO `receivables` VALUES (49, '', 25, '1000000', '', '', '', '1000000', '1000000', '', '2020-06-10', '2020-06-10', '第2期', '14');
INSERT INTO `receivables` VALUES (51, '', 25, '', '', '有', '', '', '100000', '', '2020-06-12', '', '第1期', '14');
INSERT INTO `receivables` VALUES (52, '', 25, '', '', '有', '', '', '200000', '', '2020-06-15', '', '第1期', '14');
INSERT INTO `receivables` VALUES (53, '', 25, '', '', '', '', '100000', '', '', '', '2020-06-16', '第1期', '14');
INSERT INTO `receivables` VALUES (54, '', 25, '', '', '', '', '', '2000', '', '2020-06-12', '', '第1期', '14');
INSERT INTO `receivables` VALUES (55, '品牌馆软装设计与布置合同(大迈)F04', 27, '2035942.15', '工程验收合格后90个工作日内付', '有', '', '2035942.15', '2035942.15', '', '2019-10-18', '2019-09-29', '第1期', '15');
INSERT INTO `receivables` VALUES (56, '', 27, '107154.85', '质保金', '有', '', '', '0', '', '2020-07-07', '', '一年质保金', '15');
INSERT INTO `receivables` VALUES (57, '时代水岸（清远）品牌馆合同【大迈】F01-F08', 28, '2637371', '工程验收合格后90个工作日内付', '有', '', '2637371', '1000000', '', '2019-10-25', '2019-10-10', '第1期', '15');
INSERT INTO `receivables` VALUES (58, '', 28, '138809', '质保金', '有', '', '', '', '', NULL, '', '一年质保金', '15');
INSERT INTO `receivables` VALUES (59, '', 28, '', '', '有', '', '', '637371', '', '2019-10-25', '', '第1期', '15');
INSERT INTO `receivables` VALUES (60, '', 28, '', '', '有', '', '', '100000', '', '2019-10-25', '', '第1期', '15');
INSERT INTO `receivables` VALUES (61, '哈哈哈哈哈', 31, '55555', '王', '有', '', '', '55555', '银行', '2020-07-15', '', '第1期', '13');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of RevenueContract
-- ----------------------------
BEGIN;
INSERT INTO `RevenueContract` VALUES (20, '222', '2020-06-18', '222', '有', '6666', '6', '5期', '22.22', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (21, 'hjcbcxcxcnb', '2020-06-12', '', '有', '', '11', '1期', '33333333', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (22, 'tttttttt', '2020-06-11', '', '', '', '11', '', '660000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (23, 'gsdhshjas', '2020-06-03', '', '有', '', '12', '', '1000000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (24, 'GSGDSJDJSJ', '2020-06-05', '', '有', '', '12', '', '1200000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (25, '金融街展厅', '2020-06-08', '', '有', '', '14', '2期', '2000000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (27, '品牌馆软装设计与布置合同(大迈)F04', '2019-05-20', '', '有', '', '15', '1期', '2143097', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `RevenueContract` VALUES (28, '时代水岸（清远）品牌馆合同【大迈】F01-F08', '2019-09-02', '', '有', '', '15', '1期', '2776180', NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplierlist
-- ----------------------------
BEGIN;
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
INSERT INTO `supplierlist` VALUES (15, '深圳市言', '', 1);
INSERT INTO `supplierlist` VALUES (16, '欧小姐', '', 2);
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
  `AmountMoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `projectId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------
BEGIN;
INSERT INTO `transaction` VALUES (1, 1, 2, NULL, '20000', '20000', '0');
INSERT INTO `transaction` VALUES (2, 1, 3, NULL, '300000', '300000', '0');
INSERT INTO `transaction` VALUES (3, 1, 3, NULL, '100000', '100000', '0');
INSERT INTO `transaction` VALUES (4, 1, 4, NULL, '2000', '2000', '0');
INSERT INTO `transaction` VALUES (5, 1, 6, NULL, '3111111', '3111111', '0');
INSERT INTO `transaction` VALUES (6, 1, 5, NULL, '1000', '0', '0');
INSERT INTO `transaction` VALUES (7, 1, 4, NULL, '5000000', '5000000', '0');
INSERT INTO `transaction` VALUES (8, 1, 4, NULL, '5936856', '5936856', '0');
INSERT INTO `transaction` VALUES (9, 1, 4, NULL, '5936856', '5936856', '0');
INSERT INTO `transaction` VALUES (10, 1, 8, NULL, '50000', '0', '0');
INSERT INTO `transaction` VALUES (11, 1, 9, NULL, '0', '0', '0');
INSERT INTO `transaction` VALUES (12, 1, 10, NULL, '500000', '500000', '2');
INSERT INTO `transaction` VALUES (13, 1, 5, NULL, '1000000', '1000000', '2');
INSERT INTO `transaction` VALUES (14, 1, 11, NULL, '400000', '400000', '3');
INSERT INTO `transaction` VALUES (15, 1, 11, NULL, '400000', '400000', '3');
INSERT INTO `transaction` VALUES (16, 1, 12, NULL, '67', '2222', '3');
INSERT INTO `transaction` VALUES (17, 1, 13, NULL, '88080', '89', '3');
INSERT INTO `transaction` VALUES (18, 1, 11, NULL, '22222', '22222', '3');
INSERT INTO `transaction` VALUES (19, 1, 11, NULL, '22222', '22222', '3');
INSERT INTO `transaction` VALUES (20, 1, 10, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (21, 1, 9, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (22, 1, 8, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (23, 1, 7, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (24, 1, 6, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (25, 1, 13, NULL, '88080', '89', '3');
INSERT INTO `transaction` VALUES (26, 1, 12, NULL, '67', '2222', '3');
INSERT INTO `transaction` VALUES (27, 1, 11, NULL, '400000', '400000', '3');
INSERT INTO `transaction` VALUES (28, 1, 13, NULL, '88080', '89', '3');
INSERT INTO `transaction` VALUES (29, 1, 12, NULL, '67', '2222', '3');
INSERT INTO `transaction` VALUES (30, 1, 11, NULL, '400000', '400000', '3');
INSERT INTO `transaction` VALUES (31, 1, 13, NULL, '88080', '89', '3');
INSERT INTO `transaction` VALUES (32, 1, 12, NULL, '67', '2222', '3');
INSERT INTO `transaction` VALUES (33, 1, 13, NULL, '88080', '89', '3');
INSERT INTO `transaction` VALUES (34, 1, 12, NULL, '67', '2222', '3');
INSERT INTO `transaction` VALUES (35, 1, 11, NULL, '400000', '400000', '3');
INSERT INTO `transaction` VALUES (36, 1, 14, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (37, 1, 16, NULL, '0', '0', '3');
INSERT INTO `transaction` VALUES (38, 1, 16, NULL, '555', '555', '3');
INSERT INTO `transaction` VALUES (39, 1, 16, NULL, '555', '555', '3');
INSERT INTO `transaction` VALUES (40, 1, 17, NULL, '3355', '3355', '3');
INSERT INTO `transaction` VALUES (41, 1, 17, NULL, '3355', '3355', '3');
INSERT INTO `transaction` VALUES (42, 1, 12, NULL, '0', '3333', '3');
INSERT INTO `transaction` VALUES (43, 1, 12, NULL, '2222', '3333', '3');
INSERT INTO `transaction` VALUES (44, 1, 12, NULL, '2222', '3333', '3');
INSERT INTO `transaction` VALUES (45, NULL, NULL, '2020-04-08 00:53:17', NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (46, 1, 13, '2020-04-08 00:58:21', '0', '0', '6');
INSERT INTO `transaction` VALUES (47, 1, 13, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (48, 1, 14, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (49, 1, 14, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (50, 1, 14, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (51, 1, 14, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (52, 1, 14, NULL, '100', '100', '6');
INSERT INTO `transaction` VALUES (53, 1, 14, NULL, '200', '100', '6');
INSERT INTO `transaction` VALUES (54, 1, 15, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (55, 1, 14, NULL, '200', '100', '6');
INSERT INTO `transaction` VALUES (56, 1, 13, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (57, 1, 14, NULL, '200', '100', '6');
INSERT INTO `transaction` VALUES (58, 1, 15, NULL, '0', '0', '6');
INSERT INTO `transaction` VALUES (59, 1, 1, NULL, NULL, NULL, '6');
INSERT INTO `transaction` VALUES (60, 1, 1, NULL, NULL, NULL, '6');
INSERT INTO `transaction` VALUES (61, 1, 1, NULL, NULL, NULL, '6');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
