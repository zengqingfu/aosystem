/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : ao_system2

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 21/07/2020 17:04:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customerlist
-- ----------------------------
DROP TABLE IF EXISTS `customerlist`;
CREATE TABLE `customerlist`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `CustomerName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CustomerContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customerlist
-- ----------------------------
INSERT INTO `customerlist` VALUES (6, '长沙启誉房地产开发有限公司', '');
INSERT INTO `customerlist` VALUES (7, '海丰县骏宏房地产开发有限公司', '');
INSERT INTO `customerlist` VALUES (8, '金融街控股股份有限公司', '');
INSERT INTO `customerlist` VALUES (9, '广东省集美设计工程有限公司', '');
INSERT INTO `customerlist` VALUES (10, '贵阳美承房地产开发有限公司', '');

-- ----------------------------
-- Table structure for expenditure
-- ----------------------------
DROP TABLE IF EXISTS `expenditure`;
CREATE TABLE `expenditure`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectId` int(10) NULL DEFAULT NULL,
  `number` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivables` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OtherParty` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectClass` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SupplierName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contractdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivableslist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectlist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kaifapiaodate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `daozhangdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoicebo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expenditure
-- ----------------------------
INSERT INTO `expenditure` VALUES (38, '采购屏幕并安装', 16, '126335', '', '有', '', '', '', '', '银行', '1', '17', '2020-03-24', NULL, NULL, '', '', '');
INSERT INTO `expenditure` VALUES (40, '邓媛媛', 16, '683.99', '', '无', '', '', '683.99', '', '现金', '1', '42', '2020-04-11', '不分期', NULL, '', '2020-04-11', '不计发票');
INSERT INTO `expenditure` VALUES (41, '设备款', 16, '7487', '', '无', '合计数：59861，平摊8个项目', '7487', '7487', '', '现金', '1', '43', '2020-04-15', '不分期', NULL, '2020-07-14', '2020-04-15', '');
INSERT INTO `expenditure` VALUES (42, '设备款', 16, '18310', '', '无', '', '18310', '18310', '', '现金', '1', '44', '2020-04-26', '不分期', NULL, '2020-07-14', '2020-04-26', '');
INSERT INTO `expenditure` VALUES (43, '流量卡', 16, '599', '', '无', '', '', '599', '', '现金', '1', '44', '2020-05-06', '不分期', NULL, NULL, '2020-05-06', '不计发票');
INSERT INTO `expenditure` VALUES (44, '补设备', 16, '4089.9', '', '无', '', '4089.9', '4089.9', '', '现金', '1', '45', '2020-05-29', '不分期', NULL, '2020-07-14', '2020-05-29', '有');
INSERT INTO `expenditure` VALUES (45, '影片后期制作', 16, '30000', '', '有', '', '', '', '', '银行', '2', '26', '2020-03-27', '1期', NULL, '2020-07-14', '2020-05-29', '有');
INSERT INTO `expenditure` VALUES (46, '影片脚本', 16, '2000', '', '无', '', '2000', '2000', '', '现金', '2', '29', '2020-03-27', '不分期', NULL, '2020-07-14', '2020-03-27', '');
INSERT INTO `expenditure` VALUES (47, '视频展项制作', 16, '35000', '', '有', '', '', '', '', '银行', '2', '18', '2020-05-25', '2期', NULL, '2020-07-14', '2020-03-27', '');
INSERT INTO `expenditure` VALUES (48, '配音费用', 16, '3700', '', '无', '', '3700', '3700', '', '银行', '2', '46', '2020-04-01', '不分期', NULL, '2020-07-14', '2020-06-18', '');
INSERT INTO `expenditure` VALUES (49, '模型制作', 16, '56286', '', '有', '', '', '', '', '银行', '3', '19', '2020-03-19', '5期', NULL, '2020-07-14', '2020-06-18', '');
INSERT INTO `expenditure` VALUES (50, '模型拆装', 16, '1500', '', '有', '', '', '', '', '银行', '3', '19', '2020-05-25', '1期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (51, '施工图设计', 16, '12000', '', '有', '', '12000', '12000', '', '银行', '3', '27', '2020-02-08', '不分期', NULL, '2020-07-14', '2020-06-12', '');
INSERT INTO `expenditure` VALUES (52, '室内标识物料', 16, '20000', '', '有', '', '', '', '', '银行', '3', '20', '2020-04-21', '2期', NULL, '2020-07-14', '2020-06-12', '');
INSERT INTO `expenditure` VALUES (53, '界字', 16, '11100', '', '有', '', '', '11100', '', '银行', '3', '38', '2020-03-24', '不分期', NULL, NULL, '2020-06-08', '');
INSERT INTO `expenditure` VALUES (54, '谭霖工程报价', 16, '100000', '', '无', '', '', '', '', '银行', '3', '33', '2020-05-29', '1期', NULL, NULL, '2020-06-08', '');
INSERT INTO `expenditure` VALUES (55, '工程工具', 16, '570.5', '', '无', '', '', '570.5', '', '现金', '3', '47', '2020-03-29', '不分期', NULL, NULL, '2020-06-01', '不计发票');
INSERT INTO `expenditure` VALUES (56, '加班打车', 16, '86', '', '无', '', '', '86', '', '现金', '4', '48', '2019-10-21', '不分期', NULL, NULL, '2019-10-21', '不计发票');
INSERT INTO `expenditure` VALUES (57, '安猪、芊芊高铁票', 16, '1336', '', '无', '', '1336', '1336', '', '现金', '4', '42', '2019-11-01', '不分期', NULL, '2020-07-15', '2019-11-01', '');
INSERT INTO `expenditure` VALUES (58, '差旅', 16, '293.46', '', '无', '', '', '293.46', '', '现金', '4', '49', '2019-11-08', '不分期', NULL, NULL, '2019-11-08', '不计发票');
INSERT INTO `expenditure` VALUES (59, '差旅', 16, '280.25', '', '无', '', '', '280.25', '', '现金', '4', '50', '2019-11-08', '不分期', NULL, NULL, '2019-11-08', '不计发票');
INSERT INTO `expenditure` VALUES (60, '加班打车', 16, '131', '', '无', '', '', '131', '', '现金', '4', '48', '2020-02-15', '不分期', NULL, NULL, '2020-02-15', '不计发票');
INSERT INTO `expenditure` VALUES (61, '何广鹏车票', 16, '314', '', '无', '', '314', '314', '', '现金', '4', '42', '2020-03-18', '不分期', NULL, '2020-07-15', '2020-03-18', '');
INSERT INTO `expenditure` VALUES (62, '高铁（谭霖、何广鹏）', 16, '628', '', '无', '', '628', '628', '', '现金', '4', '42', '2020-04-01', '不分期', NULL, '2020-07-15', '2020-04-01', '');
INSERT INTO `expenditure` VALUES (63, '差旅', 16, '365', '', '无', '', '', '365', '', '现金', '4', '47', '2020-04-01', '不分期', NULL, '2020-07-15', '2020-04-01', '不计发票');
INSERT INTO `expenditure` VALUES (64, '高铁（谭霖、何广鹏）', 16, '628', '', '无', '', '628', '628', '', '现金', '4', '42', '2020-04-11', '不分期', NULL, '2020-07-15', '2020-04-11', '有');
INSERT INTO `expenditure` VALUES (65, '车票（安猪、兆麟）', 16, '942', '', '无', '', '942', '942', '', '现金', '4', '42', '2020-04-24', '不分期', NULL, '2020-07-15', '2020-04-24', '有');
INSERT INTO `expenditure` VALUES (66, '差旅', 16, '693', '', '无', '', '', '693', '', '现金', '4', '44', '2020-05-06', '不分期', NULL, '2020-07-15', '2020-05-06', '不计发票');
INSERT INTO `expenditure` VALUES (67, '差旅', 16, '1814', '', '无', '', '', '1814', '', '现金', '4', '51', '2020-05-26', '不分期', NULL, '2020-07-15', '2020-05-26', '不计发票');
INSERT INTO `expenditure` VALUES (68, '差旅', 16, '392.19', '', '无', '', '', '392.19', '', '现金', '4', '49', '2020-06-01', '不分期', NULL, '2020-07-15', '2020-06-01', '不计发票');
INSERT INTO `expenditure` VALUES (69, '差旅', 16, '8258.33', '', '无', '36天', '', '8258.33', '', '现金', '4', '47', '2020-06-01', '不分期', NULL, '2020-07-15', '2020-06-01', '不计发票');
INSERT INTO `expenditure` VALUES (70, '餐饮及路油费', 16, '1321.75', '', '无', '', '', '1321.75', '', '现金', '4', '52', '2020-06-01', '不分期', NULL, '2020-07-15', '2020-06-01', '不计发票');
INSERT INTO `expenditure` VALUES (71, '差旅', 16, '1917', '', '无', '', '', '1917', '', '现金', '4', '45', '2020-05-29', '不分期', NULL, '', '2020-05-29', '不计发票');
INSERT INTO `expenditure` VALUES (72, '高铁票（安猪）', 16, '628', '', '无', '', '628', '628', '', '现金', '4', '42', '2020-07-07', '不分期', NULL, '2020-07-15', '2020-07-07', '有');
INSERT INTO `expenditure` VALUES (73, '差旅', 16, '935.4', '', '无', '', '935.4', '935.4', '', '现金', '4', '50', '2020-07-07', '不分期', NULL, '2020-07-15', '2020-07-07', '不计发票');
INSERT INTO `expenditure` VALUES (74, '采购屏幕并安装', 17, '162470', '', '有', '', '', '', '', '银行', '1', '17', '2020-05-07', '5期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (75, '屏幕新增', 17, '28600', '', '有', '', '', '', '', '银行', '1', '17', '2020-06-22', '5期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (76, 'IT设备', 17, '2589', '', '无', '', '2589', '2589', '', '现金', '1', '43', '2019-11-01', '不分期', NULL, '2020-07-16', '2019-11-01', '');
INSERT INTO `expenditure` VALUES (77, '电脑设备', 17, '30493', '', '无', '', '30493', '30493', '', '现金', '1', '44', '2020-06-23', '不分期', NULL, '2020-07-16', '2020-06-23', '');
INSERT INTO `expenditure` VALUES (78, '影片后期制作', 17, '22000', '', '有', '', '', '', '', '银行', '2', '26', '2020-03-27', '2期', NULL, '2020-07-16', '2020-06-23', '');
INSERT INTO `expenditure` VALUES (79, '互动展项', 17, '20000', '', '有', '', '', '', '', '银行', '2', '35', '2020-04-17', '2期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (80, '配音费用', 17, '200', '', '无', '', '200', '200', '', '银行', '2', '46', '2020-06-18', '不分期', NULL, '2020-07-16', '2020-06-18', '');
INSERT INTO `expenditure` VALUES (81, '模型制作', 17, '82400', '', '有', '', '', '', '', '银行', '3', '19', '2020-04-03', '5期', NULL, '2020-07-16', '2020-06-18', '');
INSERT INTO `expenditure` VALUES (82, '空调设备供应及安装', 17, '56461.72', '', '有', '', '', '', '', '银行', '3', '37', '2020-04-30', '3期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (83, '电视机', 17, '9798', '', '无', '', '9798', '9798', '', '现金', '3', '42', '2020-03-22', '不分期', NULL, '2020-07-16', '2020-04-01', '');
INSERT INTO `expenditure` VALUES (84, '瓷砖', 17, '40', '', '无', '', '', '40', '', '现金', '3', '47', '2020-04-01', '不分期', NULL, NULL, '2020-04-01', '不计发票');
INSERT INTO `expenditure` VALUES (85, '谭霖工程报价', 17, '180000', '', '无', '', '', '', '', '银行', '3', '33', '2020-05-29', '2期', NULL, NULL, '2020-04-01', '不计发票');
INSERT INTO `expenditure` VALUES (86, '水晶柱体定做', 17, '2780', '', '无', '', '2780', '2780', '', '现金', '3', '42', '2020-02-15', '不分期', NULL, '2020-07-16', '2020-04-11', '');
INSERT INTO `expenditure` VALUES (87, '施工图设计', 17, '15500', '', '有', '', '15500', '15500', '', '银行', '3', '27', '2020-02-15', '不分期', NULL, '2020-07-16', '2020-06-12', '');
INSERT INTO `expenditure` VALUES (88, '室内标识物料', 17, '21000', '', '有', '', '', '', '', '银行', '3', '20', '2020-04-21', '2期', NULL, '2020-07-16', '2020-06-12', '');
INSERT INTO `expenditure` VALUES (89, '拆原中岛柜', 17, '1586.2', '', '有', '', '', '', '', '银行', '3', '21', '2020-06-28', '不分期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (90, '水晶柱体修改', 17, '300', '', '无', '', '', '300', '', '现金', '3', '42', '2020-04-14', '不分期', NULL, '', '2020-04-14', '不计发票');
INSERT INTO `expenditure` VALUES (91, '淑惠、安猪、丹娜高铁票', 17, '361', '', '无', '', '361', '361', '', '现金', '4', '42', '2019-10-21', '不分期', NULL, '2020-07-16', '2019-11-05', '有');
INSERT INTO `expenditure` VALUES (92, '差旅', 17, '238', '', '无', '', '', '238', '', '现金', '4', '50', '2019-10-21', '不分期', NULL, '2020-07-16', '2019-11-08', '不计发票');
INSERT INTO `expenditure` VALUES (93, '车费', 17, '59', '', '无', '', '', '59', '', '现金', '4', '53', '2019-10-21', '不分期', NULL, '2020-07-16', '2019-11-29', '不计发票');
INSERT INTO `expenditure` VALUES (94, '停车费', 17, '27', '', '无', '', '', '27', '', '现金', '4', '47', '2020-03-24', '不分期', NULL, '', '2020-04-01', '不计发票');
INSERT INTO `expenditure` VALUES (95, '差旅', 17, '1668', '', '无', '', '1668', '1668', '', '现金', '4', '44', '2020-03-29', '不分期', NULL, '2020-07-16', '2020-05-06', '有');
INSERT INTO `expenditure` VALUES (96, '高铁票（安猪）', 17, '300', '', '无', '', '300', '300', '', '现金', '4', '42', '2020-05-26', '不分期', NULL, '2020-07-16', '2020-06-18', '有');
INSERT INTO `expenditure` VALUES (97, '餐饮', 17, '366.4', '', '无', '', '366.4', '366.4', '', '现金', '4', '50', '2020-05-26', '不分期', NULL, '2020-07-16', '2020-07-07', '有');
INSERT INTO `expenditure` VALUES (98, '三维模型制作', 19, '43500', '', '有', '', '', '', '', '银行', '2', '39', '2020-02-21', '2期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (99, '加班打车', 19, '151.42', '', '无', '', '151.42', '151.42', '', '现金', '4', '54', '2019-12-29', '不分期', NULL, '2020-07-20', '2020-01-08', '');
INSERT INTO `expenditure` VALUES (100, '视频素材', 19, '313', '', '无', '', '', '313', '', '现金', '2', '55', '2019-12-28', '不分期', NULL, '', '2019-12-31', '不计发票');
INSERT INTO `expenditure` VALUES (101, '打车', 19, '252.14', '', '无', '', '252.14', '252.14', '', '现金', '4', '29', '2019-01-01', '不分期', NULL, '2020-07-20', '2019-12-17', '有');
INSERT INTO `expenditure` VALUES (102, '购买硬盘', 19, '503', '', '无', '', '503', '503', '', '现金', '1', '51', '2020-01-12', '不分期', NULL, '2020-07-20', '2020-01-16', '有');
INSERT INTO `expenditure` VALUES (103, '稿费', 19, '5000', '', '无', '', '5000', '5000', '', '现金', '2', '29', '2020-01-17', '不分期', NULL, '2020-07-20', '2020-01-17', '有');
INSERT INTO `expenditure` VALUES (104, '视频素材', 19, '656', '', '无', '', '', '656', '', '现金', '2', '54', '2020-02-24', '不分期', NULL, '2020-07-20', '2020-02-28', '不计发票');
INSERT INTO `expenditure` VALUES (105, '脚本', 19, '2000', '', '无', '', '2000', '2000', '', '现金', '2', '29', '2020-02-24', '不分期', NULL, '2020-07-20', '2020-02-24', '有');
INSERT INTO `expenditure` VALUES (106, '视频素材', 19, '511', '', '无', '', '', '511', '', '现金', '2', '55', '2020-04-08', '不分期', NULL, '2020-07-20', '2020-04-08', '不计发票');
INSERT INTO `expenditure` VALUES (107, '加班打车', 19, '1035.94', '', '无', '26天', '1035.94', '1035.94', '', '现金', '4', '54', '2020-02-15', '不分期', NULL, '2020-07-20', '2020-04-09', '有');
INSERT INTO `expenditure` VALUES (108, '视频素材', 19, '156', '', '无', '', '', '156', '', '现金', '2', '54', '2020-02-27', '不分期', NULL, '2020-07-20', '2020-04-09', '不计发票');
INSERT INTO `expenditure` VALUES (109, '加班打车', 19, '750.52', '', '无', '22天', '750.52', '750.52', '', '现金', '4', '54', '2020-05-28', '不分期', NULL, '2020-07-20', '2020-05-28', '有');
INSERT INTO `expenditure` VALUES (110, '配音费用', 19, '5200', '', '无', '', '5200', '5200', '', '银行', '2', '46', '2019-12-27', '不分期', NULL, '2020-07-20', '2020-06-18', '有');
INSERT INTO `expenditure` VALUES (111, '多媒体视频制作', 20, '180000', '', '有', '', '', '', '', '银行', '2', '23', '2020-01-07', '3期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (112, '多媒体策划', 20, '140000', '', '有', '', '', '', '', '银行', '2', '32', '2020-01-14', '3期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (113, '多媒体软件', 20, '380000', '', '有', '', '', '', '', '银行', '2', '35', '2020-03-27', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (114, '后台软件', 20, '208000', '', '有', '', '', '', '', '银行', '2', '35', '2020-03-27', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (115, '数据系统软件', 20, '200000', '', '有', '', '', '', '', '银行', '2', '35', '2020-03-27', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (116, '视频制作', 20, '68000', '', '有', '', '', '', '', '银行', '2', '18', '2020-04-14', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (117, '视频制作、VR互动', 20, '385000', '', '有', '', '', '', '', '银行', '2', '18', '2020-07-13', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (118, '三折幕+地幕视频制作', 20, '70000', '', '有', '', '', '', '', '银行', '2', '18', '2020-07-13', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (119, '三维沉浸式影片', 20, '165000', '', '有', '', '', '', '', '银行', '2', '36', '2020-06-04', '4期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (120, '视频制作服务', 20, '145000', '', '有', '', '', '', '', '银行', '2', '28', '2020-06-24', '3期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (121, '实景拍摄', 20, '25000', '', '有', '', '', '25000', '', '现金', '2', '56', '2020-03-27', '不分期', NULL, '', '2020-04-13', '不计发票');
INSERT INTO `expenditure` VALUES (122, '拍摄费用', 20, '26698', '', '无', '', '', '26698', '', '现金', '2', '56', '2020-04-20', '不分期', NULL, '', '2020-04-20', '不计发票');
INSERT INTO `expenditure` VALUES (123, '序厅方案脚本', 20, '7500', '', '无', '', '7500', '7500', '', '现金', '2', '29', '2020-04-24', '不分期', NULL, '2020-07-21', '2020-04-24', '有');
INSERT INTO `expenditure` VALUES (124, '尾厅脚本', 20, '4000', '', '无', '', '4000', '4000', '', '现金', '2', '31', '2020-04-24', '不分期', NULL, '2020-07-21', '2020-04-24', '有');
INSERT INTO `expenditure` VALUES (125, '视频素材购买', 20, '31512', '', '有', '', '31512', '31512', '', '银行', '2', '28', '2020-04-20', '不分期', NULL, '2020-07-21', '2020-04-20', '有');

-- ----------------------------
-- Table structure for expenditureclass
-- ----------------------------
DROP TABLE IF EXISTS `expenditureclass`;
CREATE TABLE `expenditureclass`  (
  `id` int(11) NOT NULL,
  `expenditureClass` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expenditureclass
-- ----------------------------
INSERT INTO `expenditureclass` VALUES (1, '硬件类');
INSERT INTO `expenditureclass` VALUES (2, '软件类');
INSERT INTO `expenditureclass` VALUES (3, '工程类');
INSERT INTO `expenditureclass` VALUES (4, '业务类');
INSERT INTO `expenditureclass` VALUES (5, '拓展类');

-- ----------------------------
-- Table structure for expendituredata
-- ----------------------------
DROP TABLE IF EXISTS `expendituredata`;
CREATE TABLE `expendituredata`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectId` int(20) NULL DEFAULT NULL,
  `number` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivables` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `daozhangdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kaifapiaodate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivableslist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectlist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplielist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoicebo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expendituredata
-- ----------------------------
INSERT INTO `expendituredata` VALUES (59, '', 38, '63167.5', '签订10个工作日内预付款50%', '有', '', '', '', '银行', '', '', '第1期', '16', '17', NULL);
INSERT INTO `expendituredata` VALUES (60, '', 38, '25267', '安装完成付进度款20%', '有', '', '', '', '银行', '', '', '第2期', '16', '17', NULL);
INSERT INTO `expendituredata` VALUES (61, '', 38, '12633.5', '正常运作付进度款10%', '有', '', '', '', '银行', '', '', '第3期', '16', '17', NULL);
INSERT INTO `expendituredata` VALUES (62, '', 38, '12633.5', '验收合格付结算款10%', '有', '', '', '', '银行', '', '', '第4期', '16', '17', NULL);
INSERT INTO `expendituredata` VALUES (63, '', 38, '6316.75', '验收合格满一年付5%', '有', '', '', '', '银行', '', '', '第5期', '16', '17', NULL);
INSERT INTO `expendituredata` VALUES (64, '', 38, '6316.75', '验收合格满两年付5%', '有', '', '', '', '银行', '', '', '一年质保金', '16', '17', NULL);
INSERT INTO `expendituredata` VALUES (65, '', 39, '683.99', '', '无', '', '', '683.99', '现金', '2020-04-11', '', '', '16', '42', '不计发票');
INSERT INTO `expendituredata` VALUES (66, '', 45, '30000', '', '有', '', '30000', '30000', '银行', '2020-05-25', '2020-07-14', '', '16', '26', NULL);
INSERT INTO `expendituredata` VALUES (67, '', 47, '21000', '', '有', '', '', '', '银行', '', '', '第1期', '16', '18', NULL);
INSERT INTO `expendituredata` VALUES (68, '', 47, '14000', '', '有', '', '', '', '银行', '', '', '第2期', '16', '18', NULL);
INSERT INTO `expendituredata` VALUES (69, '', 49, '16885.8', '签订10工作日内预付款30%', '有', '', '16885.8', '16885.8', '银行', '2020-03-23', '2020-07-14', '第1期', '16', '19', NULL);
INSERT INTO `expendituredata` VALUES (70, '', 49, '11257.2', '进场安装前付20%进度款', '有', '', '11257.2', '11257.2', '银行', '2020-06-08', '2020-07-14', '第2期', '16', '19', NULL);
INSERT INTO `expendituredata` VALUES (71, '', 49, '11257.2', '正常运作后付20%进度款', '有', '', '11257.2', '11257.2', '银行', '2020-06-08', '2020-07-14', '第3期', '16', '19', NULL);
INSERT INTO `expendituredata` VALUES (72, '', 49, '14071.5', '验收合格后付25%结算款', '有', '', '', '', '银行', NULL, NULL, '第4期', '16', '19', NULL);
INSERT INTO `expendituredata` VALUES (73, '', 49, '2814.3', '验收合格满1年付5%保修金', '有', '', '', '', '银行', NULL, NULL, '一年质保金', '16', '19', NULL);
INSERT INTO `expendituredata` VALUES (74, '', 50, '1500', '', '有', '', '', '', '银行', '', '', '第1期', '16', '19', NULL);
INSERT INTO `expendituredata` VALUES (75, '', 52, '10000', '定金', '有', '', '', '', '银行', '', '', '第1期', '16', '20', NULL);
INSERT INTO `expendituredata` VALUES (76, '', 52, '10000', '尾款', '有', '', '', '', '银行', '', '', '第2期', '16', '20', NULL);
INSERT INTO `expendituredata` VALUES (77, '', 74, '48741', '签订10工作日内预付款30%', '有', '', '', '', '银行', '', '', '第1期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (78, '', 74, '32494', '安装完成付进度款20%', '有', '', '', '', '银行', '', '', '第2期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (79, '', 74, '32494', '正常运作付进度款20%', '有', '', '', '', '银行', '', '', '第3期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (80, '', 74, '32494', '验收合格付结算款20%', '有', '', '', '', '银行', '', '', '第4期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (81, '', 74, '8123.5', '验收合格满一年付5%', '有', '', '', '', '银行', '', '', '一年质保金', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (82, '', 74, '8123.5', '验收合格满两年付5%', '有', '', '', '', '银行', '', '', '二年质保金', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (83, '', 75, '8580', '签订10工作日内预付款30%', '有', '', '', '', '银行', '', '', '第1期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (84, '', 75, '5720', '安装完成付进度款20%', '有', '', '', '', '银行', '', '', '第2期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (85, '', 75, '5720', '正常运作付进度款20%', '有', '', '', '', '银行', '', '', '第3期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (86, '', 75, '5720', '验收合格付结算款20%', '有', '', '', '', '银行', '', '', '第4期', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (87, '', 75, '1430', '验收合格满一年付5%', '有', '', '', '', '银行', '', '', '一年质保金', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (88, '', 75, '1430', '验收合格满两年付5%', '有', '', '', '', '银行', '', '', '二年质保金', '17', '17', NULL);
INSERT INTO `expendituredata` VALUES (89, '', 78, '11000', '', '有', '', '', '', '银行', '', '', '第1期', '17', '26', NULL);
INSERT INTO `expendituredata` VALUES (90, '', 78, '11000', '', '有', '', '', '', '银行', '', '', '第2期', '17', '26', NULL);
INSERT INTO `expendituredata` VALUES (91, '', 79, '10000', '', '有', '', '', '', '银行', '', '', '第1期', '17', '35', NULL);
INSERT INTO `expendituredata` VALUES (92, '', 79, '10000', '', '有', '', '', '', '银行', '', '', '第2期', '17', '35', NULL);
INSERT INTO `expendituredata` VALUES (93, '', 81, '24720', '签订10工作日内预付款30%', '有', '', '24720', '24720', '银行', '2020-04-14', '2020-07-16', '第1期', '17', '19', NULL);
INSERT INTO `expendituredata` VALUES (94, '', 81, '16480', '进场安装前付20%进度款', '有', '', '16480', '16480', '银行', '2020-06-08', '2020-07-16', '第2期', '17', '19', NULL);
INSERT INTO `expendituredata` VALUES (95, '', 81, '16480', '正常运作后付20%进度款', '有', '', '16480', '16480', '银行', '2020-06-08', '2020-07-16', '第3期', '17', '19', NULL);
INSERT INTO `expendituredata` VALUES (96, '', 81, '20600', '验收合格后付25%结算款', '有', '', '', '', '银行', NULL, NULL, '第4期', '17', '19', NULL);
INSERT INTO `expendituredata` VALUES (97, '', 81, '4120', '验收合格满1年付5%保修金', '有', '', '', '', '银行', NULL, NULL, '一年质保金', '17', '19', NULL);
INSERT INTO `expendituredata` VALUES (98, '', 82, '28230.86', '合同签订时付款50%', '有', '', '28230.86', '28230.86', '银行', '2020-05-08', '2020-07-16', '第1期', '17', '37', NULL);
INSERT INTO `expendituredata` VALUES (99, '', 82, '23242.49', '设备安装完毕付40%', '有', '', '23242.49', '23242.49', '银行', '2020-06-01', '2020-07-16', '第2期', '17', '37', NULL);
INSERT INTO `expendituredata` VALUES (100, '', 82, '4988.37', '设备调试完成付10%', '有', '', '', '', '银行', NULL, NULL, '第3期', '17', '37', NULL);
INSERT INTO `expendituredata` VALUES (101, '', 85, '100000', '', '无', '', '100000', '100000', '银行', '2020-06-12', '2020-07-16', '第1期', '17', '33', NULL);
INSERT INTO `expendituredata` VALUES (102, '', 85, '80000', '', '无', '', '', '', '银行', NULL, NULL, '第2期', '17', '33', NULL);
INSERT INTO `expendituredata` VALUES (103, '', 88, '10500', '定金', '有', '', '', '', '银行', '', '', '第1期', '17', '20', NULL);
INSERT INTO `expendituredata` VALUES (104, '', 88, '10500', '余款', '有', '', '', '', '银行', '', '', '第2期', '17', '20', NULL);
INSERT INTO `expendituredata` VALUES (105, '', 98, '21750', '合同签订15个工作日内', '有', '', '21750', '21750', '银行', '2020-02-24', '2020-02-25', '第1期', '19', '39', NULL);
INSERT INTO `expendituredata` VALUES (106, '', 98, '21750', '验收流程后30个工作日内', '有', '', '21750', '21750', '银行', '2020-05-25', '2020-02-25', '第2期', '19', '39', NULL);
INSERT INTO `expendituredata` VALUES (107, '', 111, '90000', '合同签订30个工作日内', '有', '', '', '', '银行', '', '', '第1期', '20', '23', NULL);
INSERT INTO `expendituredata` VALUES (108, '', 111, '54000', '完成整体内容30个工作日内', '有', '', '', '', '银行', '', '', '第2期', '20', '23', NULL);
INSERT INTO `expendituredata` VALUES (109, '', 111, '36000', '验收通过后30个工作日内', '有', '', '', '', '银行', '', '', '第3期', '20', '23', NULL);
INSERT INTO `expendituredata` VALUES (110, '', 112, '42000', '合同签订30个工作日内', '有', '', '', '', '银行', '', '', '第1期', '20', '32', NULL);
INSERT INTO `expendituredata` VALUES (111, '', 112, '56000', '完成整体内容30个工作日内', '有', '', '', '', '银行', '', '', '第2期', '20', '32', NULL);
INSERT INTO `expendituredata` VALUES (112, '', 112, '42000', '验收通过后30个工作日内', '有', '', '', '', '银行', '', '', '第3期', '20', '32', NULL);
INSERT INTO `expendituredata` VALUES (113, '', 113, '57000', '开发定金', '有', '', '57000', '57000', '银行', '2020-03-27', '2020-06-03', '第1期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (114, '', 113, '152000', '进场调试安装前支付', '有', '', '', '', '银行', NULL, NULL, '第2期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (115, '', 113, '133000', '验收合格后30日内', '有', '', '', '', '银行', NULL, NULL, '第3期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (116, '', 113, '38000', '验收合格后120日内', '有', '', '', '', '银行', NULL, NULL, '第4期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (117, '', 114, '31200', '开发定金', '有', '', '31200', '31200', '银行', '2020-03-27', '2020-06-03', '第1期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (118, '', 114, '83200', '进场调试安装前支付', '有', '', '', '', '银行', NULL, NULL, '第2期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (119, '', 114, '72800', '验收合格后30日内', '有', '', '', '', '银行', NULL, NULL, '第3期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (120, '', 114, '20800', '验收合格后120日内', '有', '', '', '', '银行', NULL, NULL, '第4期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (121, '', 115, '30000', '开发定金', '有', '', '30000', '30000', '银行', '2020-03-27', '2020-06-03', '第1期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (122, '', 115, '80000', '进场调试安装前支付', '有', '', '80000', '80000', '银行', '2020-07-01', '2020-07-07', '第2期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (123, '', 115, '70000', '验收合格后30日内', '有', '', '70000', '70000', '银行', '2020-07-01', '2020-07-07', '第3期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (124, '', 115, '20000', '验收合格后120日内', '有', '', '', '', '银行', NULL, NULL, '第4期', '20', '35', NULL);
INSERT INTO `expendituredata` VALUES (125, '', 116, '20400', '定金', '有', '', '', '', '银行', '', '', '第1期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (126, '', 116, '13600', '提供初稿经确认付', '有', '', '', '', '银行', '', '', '第2期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (127, '', 116, '27200', '视频素材及程序制作完成', '有', '', '', '', '银行', '', '', '第3期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (128, '', 116, '6800', '验收后3个工作日内', '有', '', '', '', '银行', '', '', '第4期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (129, '', 117, '77000', '定金', '有', '', '', '', '银行', '', '', '第1期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (130, '', 117, '115500', '提供初稿经确认付', '有', '', '', '', '银行', '', '', '第2期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (131, '', 117, '154000', '视频素材及程序制作完成', '有', '', '', '', '银行', '', '', '第3期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (132, '', 117, '38500', '验收后3个工作日内', '有', '', '', '', '银行', '', '', '第4期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (133, '', 118, '14000', '定金', '有', '', '', '', '银行', '', '', '第1期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (134, '', 118, '21000', '提供初稿经确认付', '有', '', '', '', '银行', '', '', '第2期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (135, '', 118, '28000', '视频素材及程序制作完成', '有', '', '', '', '银行', '', '', '第3期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (136, '', 118, '7000', '验收后3个工作日内', '有', '', '', '', '银行', '', '', '第4期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (137, '', 119, '33000', '', '有', '', '33000', '33000', '银行', '2020-06-16', '2020-06-16', '第1期', '20', '36', NULL);
INSERT INTO `expendituredata` VALUES (138, '', 119, '49500', '', '有', '', '', '', '银行', NULL, NULL, '第2期', '20', '36', NULL);
INSERT INTO `expendituredata` VALUES (139, '', 119, '49500', '', '有', '', '', '', '银行', NULL, NULL, '第3期', '20', '36', NULL);
INSERT INTO `expendituredata` VALUES (140, '', 119, '33000', '', '有', '', '', '', '银行', NULL, NULL, '第4期', '20', '36', NULL);
INSERT INTO `expendituredata` VALUES (141, '', 120, '58000', '', '有', '', '58000', '58000', '银行', '2020-07-01', '2020-06-28', '第1期', '20', '28', NULL);
INSERT INTO `expendituredata` VALUES (142, '', 120, '43500', '', '有', '', '43500', '', '银行', NULL, '2020-06-28', '第2期', '20', '28', NULL);
INSERT INTO `expendituredata` VALUES (143, '', 120, '43500', '', '有', '', '43500', '', '银行', NULL, '2020-06-28', '第3期', '20', '28', NULL);

-- ----------------------------
-- Table structure for projectlist
-- ----------------------------
DROP TABLE IF EXISTS `projectlist`;
CREATE TABLE `projectlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CustomerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ContractAmount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ContractDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ExpenditureBudget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `CustomerNameid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivables` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expenditure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projectlist
-- ----------------------------
INSERT INTO `projectlist` VALUES (16, '长沙时代领峰', '', '6', '1406998.42', '2020-05-10 00:00:00', '', '0', '长沙启誉房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (17, '汕尾时代', '', '7', '1606328.24', '2020-05-25', '', '0', '海丰县骏宏房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (18, '哒哒哒哒哒', '', '6', '900000', '2020-07-08', '10000', '1', '长沙启誉房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (19, '金融街控股宣传片', '', '8', '350000', '2020-01-09', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (20, '郑州智慧城市', '', '9', '5348522', '2019-12-27', '', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for receivables
-- ----------------------------
DROP TABLE IF EXISTS `receivables`;
CREATE TABLE `receivables`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectId` int(20) NULL DEFAULT NULL,
  `number` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesData` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivables` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesMode` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `daozhangdate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kaifapiaodate` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivableslist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectlist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receivables
-- ----------------------------
INSERT INTO `receivables` VALUES (66, '', 31, '1195948.66', '工程全部完成后15天内，付总承包价85%工程款', '有', '', '', '', '', '', '', '第1期', '16');
INSERT INTO `receivables` VALUES (67, '', 31, '168839.81', '工程验收合格并结算后，15天内付至结算价的97%', '有', '', '', '', '', '', '', '第2期', '16');
INSERT INTO `receivables` VALUES (68, '', 31, '42209.95', '尾款', '有', '', '', '', '', '', '', '第3期', '16');
INSERT INTO `receivables` VALUES (70, '', 34, '1445695.42', '完成场地布置并经甲方验收合格后60个工作日', '有', '', '', '', '银行', '', '', '第1期', '17');
INSERT INTO `receivables` VALUES (71, '', 34, '160632.82', '质保金', '有', '', '', '', '银行', '', '', '一年质保金', '17');
INSERT INTO `receivables` VALUES (72, '', 35, '10000', '', '', '', '', '1000', '', '2020-07-15', '', '第1期', '18');
INSERT INTO `receivables` VALUES (73, '', 35, '1000', '', '', '', '', '', '现金', '', '', '第2期', '18');
INSERT INTO `receivables` VALUES (74, '', 35, '1000', '', '', '', '', '', '', '', '', '第3期', '18');
INSERT INTO `receivables` VALUES (75, '', 36, '70000', '合同签订后10个工作日内支付总金额的20%', '有', '', '70000', '70000', '银行', '2020-03-30', '2020-01-14', '第1期', '19');
INSERT INTO `receivables` VALUES (76, '', 36, '140000', '完成宣传片demo支付总金额的40%', '有', '', '', '', '银行', '', '', '第2期', '19');
INSERT INTO `receivables` VALUES (77, '', 36, '140000', '完成宣传片制作验收合格，支付总金额的40%', '有', '', '', '', '银行', '', '', '第3期', '19');
INSERT INTO `receivables` VALUES (78, '', 37, '1069704.4', '合同签订及甲方接到乙方票据凭证资料或甲方要求提供的其他资料后[7]个工作日内，甲方向乙方支付总价的[20]％', '有', '', '400000', '400000', '银行', '2020-01-06', '2019-12-27', '第1期', '20');
INSERT INTO `receivables` VALUES (79, '', 37, '1871982.7', '在乙方完成一楼视频及界面内容上屏调试完成后[7]个工作日内，甲方向乙方支付总价的[35]％', '有', '', '1871982.7', '1871982.7', '银行', '2020-06-10', '2020-06-08', '第2期', '20');
INSERT INTO `receivables` VALUES (80, '', 37, '2246379.24', '在乙方完成项目内所有多媒体软件及视频安装调试验收后[7]个工作日内，甲方向乙方支付总价的[42]％', '有', '', '', '', '银行', '', '', '第3期', '20');
INSERT INTO `receivables` VALUES (81, '', 37, '160455.66', '质保期（两年）', '有', '', '', '', '银行', '', '', '二年质保金', '20');
INSERT INTO `receivables` VALUES (82, '', 37, '', '', '', '', '128017.3', '128017.3', '', '2020-06-10', '2020-06-08', '第1期', '20');

-- ----------------------------
-- Table structure for revenuecontract
-- ----------------------------
DROP TABLE IF EXISTS `revenuecontract`;
CREATE TABLE `revenuecontract`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ReceivablesName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivablesMode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Receivableslist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Received` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReceivedData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoiceData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoicebo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of revenuecontract
-- ----------------------------
INSERT INTO `revenuecontract` VALUES (31, '时代梅溪领峰（长沙）项目营销中心品牌馆工程合同（大迈）G04', '2020-05-10', '银行', '有', '', '16', '3期', '1406998.42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (34, '时代水岸（海丰）项目品牌馆制作合同（大迈）G05', '2020-05-25', '银行', '有', '', '17', '2期', '1606328.24', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (35, '磊', '2020-07-15', '现金', '', '', '18', '3期', '444444', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (36, '2019版金融街控股宣传片委托制作协议', '2020-01-09', '银行', '有', '', '19', '3期', '350000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (37, '郑州智慧城市', '2019-12-27', '银行', '有', '', '20', '4期', '5348522', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for supplierlist
-- ----------------------------
DROP TABLE IF EXISTS `supplierlist`;
CREATE TABLE `supplierlist`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `SupplierName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SupplierCon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SupplierClass` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplierlist
-- ----------------------------
INSERT INTO `supplierlist` VALUES (17, '深圳市言信电子科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (18, '广州造所文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (19, '鸿瑞工美（深圳）实业有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (20, '广州市科驰广告制作有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (21, '惠州市瀚鑫展示制品有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (22, '广州淘影电子有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (23, '广州市极智数码科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (24, '杉浦文化传播（广州）有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (25, '魔云（广州）科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (26, '广州市三天文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (27, '广州市汉晨装饰设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (28, '上海匠馨文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (29, '李杰文', '', 3);
INSERT INTO `supplierlist` VALUES (30, '深圳艺博林科技模型设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (31, '古星娣', '', 3);
INSERT INTO `supplierlist` VALUES (32, '广州牟瓜文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (33, '谭霖', '', 1);
INSERT INTO `supplierlist` VALUES (34, '佛山市江藤文化传媒有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (35, '广州慧玥文化传播有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (36, '杭州颜一视效文化传媒有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (37, '佛山瀚森机电设备工程有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (38, '广州亚非欧广告设计有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (39, '魔叮科技（北京）有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (40, '罗春华', '', 3);
INSERT INTO `supplierlist` VALUES (41, '黄嘉沛', '', 3);
INSERT INTO `supplierlist` VALUES (42, '邓媛媛', '', 2);
INSERT INTO `supplierlist` VALUES (43, '邓昭越', '', 2);
INSERT INTO `supplierlist` VALUES (44, '文兆麟', '', 2);
INSERT INTO `supplierlist` VALUES (45, '邓茂创', '', 2);
INSERT INTO `supplierlist` VALUES (46, '北京维金传媒有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (47, '何广鹏', '', 2);
INSERT INTO `supplierlist` VALUES (48, '李剑枫', '', 2);
INSERT INTO `supplierlist` VALUES (49, '段子宜', '', 2);
INSERT INTO `supplierlist` VALUES (50, '赵汝威', '', 2);
INSERT INTO `supplierlist` VALUES (51, '欧淑惠', '', 2);
INSERT INTO `supplierlist` VALUES (52, '张化明', '', 2);
INSERT INTO `supplierlist` VALUES (53, '邓仁秀', '', 2);
INSERT INTO `supplierlist` VALUES (54, '陈志霖', '', 2);
INSERT INTO `supplierlist` VALUES (55, '潘能剑', '', 2);
INSERT INTO `supplierlist` VALUES (56, '梁智泉', '', 3);
INSERT INTO `supplierlist` VALUES (57, '上海尚等影业有限公司', '', 1);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MoneyClass` int(10) NULL DEFAULT NULL,
  `CollectMoney` int(10) NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AmountMoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
