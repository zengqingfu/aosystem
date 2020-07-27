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

 Date: 27/07/2020 16:15:38
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
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `expenditure` VALUES (125, '视频素材购买', 20, '31512', '', '有', '', '31512', '31512', '', '银行', '2', '57', '2020-04-20', '不分期', NULL, '2020-07-21', '2020-04-20', '有');
INSERT INTO `expenditure` VALUES (126, '视频素材费用', 20, '74', '', '无', '', '', '74', '', '现金', '2', '58', '2020-01-17', '不分期', NULL, '', '2020-01-17', '不计发票');
INSERT INTO `expenditure` VALUES (127, 'Vjshi素材费', 20, '1041', '', '无', '', '', '1041', '', '现金', '2', '54', '2020-01-10', '不分期', NULL, '', '2020-02-28', '不计发票');
INSERT INTO `expenditure` VALUES (128, '项目策划费', 20, '30000', '', '无', '', '', '30000', '', '现金', '2', '59', '2020-01-21', '不分期', NULL, '', '2020-01-21', '不计发票');
INSERT INTO `expenditure` VALUES (129, '策划费', 20, '30000', '', '无', '', '', '30000', '', '现金', '2', '59', '2020-02-20', '不分期', NULL, '', '2020-02-20', '不计发票');
INSERT INTO `expenditure` VALUES (130, '策划费', 20, '20000', '', '无', '', '', '20000', '', '现金', '2', '59', '2020-03-28', '不分期', NULL, '', '2020-03-28', '不计发票');
INSERT INTO `expenditure` VALUES (131, '素材', 20, '611', '', '无', '1月', '', '611', '', '现金', '2', '55', '2020-04-08', '不分期', NULL, '', '2020-04-08', '不计发票');
INSERT INTO `expenditure` VALUES (132, '素材', 20, '825', '', '无', '2.3月', '', '825', '', '现金', '2', '55', '2020-04-08', '不分期', NULL, '', '2020-04-08', '不计发票');
INSERT INTO `expenditure` VALUES (133, '分镜稿费', 20, '15000', '', '无', '', '', '', '', '现金', '2', '31', '2020-06-15', '2期', NULL, '', '2020-04-08', '不计发票');
INSERT INTO `expenditure` VALUES (134, '颜料及画纸', 20, '250.1', '', '无', '', '', '250.1', '', '现金', '3', '60', '2020-01-07', '不分期', NULL, '', '2020-01-17', '不计发票');
INSERT INTO `expenditure` VALUES (135, '差旅', 20, '772.98', '', '无', '', '772.98', '772.98', '', '现金', '4', '65', '2020-01-03', '不分期', NULL, '2020-07-21', '2020-01-17', '');
INSERT INTO `expenditure` VALUES (136, '机票（李总）', 20, '1612', '', '无', '', '1612', '1612', '', '现金', '4', '42', '2020-01-14', '不分期', NULL, '2020-07-21', '2020-02-15', '');
INSERT INTO `expenditure` VALUES (137, '车费', 20, '1110.41', '', '无', '28天', '1110.41', '1110.41', '', '现金', '4', '54', '2020-01-10', '不分期', NULL, '2020-07-21', '2020-04-24', '');
INSERT INTO `expenditure` VALUES (138, '招待费', 20, '3913.2', '', '无', '', '', '3913.2', '', '现金', '4', '61', '2020-05-26', '不分期', NULL, NULL, '2020-05-26', '不计发票');
INSERT INTO `expenditure` VALUES (139, '机票（李总）', 20, '1860.64', '', '无', '', '', '1860.64', '', '现金', '4', '61', '2020-06-12', '不分期', NULL, NULL, '2020-06-12', '不计发票');
INSERT INTO `expenditure` VALUES (140, '车费', 20, '111.97', '', '无', '', '111.97', '111.97', '', '现金', '4', '62', '2020-07-17', '不分期', NULL, '2020-07-21', '2020-07-17', '有');
INSERT INTO `expenditure` VALUES (141, '车费', 20, '39.56', '', '无', '', '39.56', '39.56', '', '现金', '4', '63', '2020-07-15', '不分期', NULL, '2020-07-21', '2020-07-15', '有');
INSERT INTO `expenditure` VALUES (142, '车费', 20, '38.55', '', '无', '', '38.55', '38.55', '', '现金', '4', '64', '2020-07-15', '不分期', NULL, '2020-07-21', '2020-07-15', '有');
INSERT INTO `expenditure` VALUES (143, '施工图', 21, '7000', '', '无', '', '', '7000', '', '现金', '3', '66', '2020-07-14', '不分期', NULL, '', '2020-07-14', '不计发票');
INSERT INTO `expenditure` VALUES (144, '打车费', 21, '149', '', '无', '', '149', '149', '', '现金', '4', '48', '2019-11-09', '不分期', NULL, '2020-07-22', '2020-02-15', '');
INSERT INTO `expenditure` VALUES (145, '餐费及招待', 21, '250', '', '无', '', '250', '250', '', '现金', '4', '50', '2019-11-30', '不分期', NULL, '2020-07-22', '2020-02-15', '');
INSERT INTO `expenditure` VALUES (146, '打车', 22, '137.58', '', '无', '', '137.58', '137.58', '', '现金', '4', '67', '2020-07-01', '不分期', NULL, '2020-07-22', '2020-07-15', '');
INSERT INTO `expenditure` VALUES (147, '采购屏幕并安装', 23, '463980', '', '有', '', '', '', '', '银行', '1', '17', '2020-05-20', '6期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (148, '言信新增', 23, '22990', '', '有', '', '', '', '', '银行', '1', '17', '2020-06-09', '1期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (149, '展厅互动硬件', 23, '10000', '', '无', '', '10000', '10000', '', '银行', '1', '68', '2020-03-09', '不分期', NULL, '2020-07-22', '2020-03-10', '');
INSERT INTO `expenditure` VALUES (150, 'LED报价', 23, '678191.39', '', '无', '', '', '', '', '银行', '1', '22', '2020-07-22', '2期', NULL, '2020-07-22', '2020-03-10', '');
INSERT INTO `expenditure` VALUES (151, '设备款', 23, '7482', '', '无', '59861，平摊8个项目', '7482', '7482', '', '现金', '1', '43', '2020-04-15', '不分期', NULL, '2020-07-22', '2020-04-15', '');
INSERT INTO `expenditure` VALUES (152, '设备款', 23, '91833', '', '无', '', '91833', '91833', '', '现金', '1', '44', '2020-04-26', '不分期', NULL, '2020-04-26', '2020-04-26', '');
INSERT INTO `expenditure` VALUES (153, '粤西硬件', 23, '15000', '', '无', '', '', '15000', '', '现金', '1', '61', '2020-03-26', '不分期', NULL, '2020-04-26', '2020-03-26', '不计发票');
INSERT INTO `expenditure` VALUES (154, '粤西硬件', 23, '23332.63', '', '无', '', '', '23332.63', '', '现金', '1', '61', '2020-03-31', '不分期', NULL, '2020-04-26', '2020-03-31', '不计发票');
INSERT INTO `expenditure` VALUES (155, '摄影电动轴', 23, '1970', '', '无', '', '', '1970', '', '现金', '1', '61', '2020-04-17', '不分期', NULL, '2020-04-26', '2020-04-17', '不计发票');
INSERT INTO `expenditure` VALUES (156, '粤西硬件', 23, '25477.11', '', '无', '', '', '25477.11', '', '现金', '1', '61', '2020-04-10', '不分期', NULL, '2020-04-26', '2020-04-10', '不计发票');
INSERT INTO `expenditure` VALUES (157, '互动硬件', 23, '1500', '', '无', '', '', '1500', '', '现金', '1', '69', '2020-04-10', '不分期', NULL, '2020-04-26', '2020-04-10', '不计发票');
INSERT INTO `expenditure` VALUES (158, '切屏器', 23, '189', '', '无', '', '', '189', '', '现金', '1', '44', '2020-05-12', '不分期', NULL, '2020-04-26', '2020-05-26', '不计发票');
INSERT INTO `expenditure` VALUES (159, '粤西硬件', 23, '27669.68', '', '无', '', '', '27669.68', '', '现金', '1', '61', '2020-05-04', '不分期', NULL, '2020-04-26', '2020-05-04', '不计发票');
INSERT INTO `expenditure` VALUES (160, '粤西硬件', 23, '6071.93', '', '无', '', '', '6071.93', '', '现金', '1', '61', '2020-06-12', '不分期', NULL, '2020-04-26', '2020-06-12', '不计发票');
INSERT INTO `expenditure` VALUES (161, '界面设计和动画制作', 23, '41500', '', '无', '', '', '', '', '现金', '2', '40', '2020-03-13', '3期', NULL, '2020-04-26', '2020-06-12', '不计发票');
INSERT INTO `expenditure` VALUES (162, '现场展项拍摄', 23, '3500', '', '无', '', '', '3500', '', '现金', '2', '56', '2020-03-13', '不分期', NULL, '', '2020-03-13', '不计发票');
INSERT INTO `expenditure` VALUES (163, '视频剪辑', 23, '4000', '', '无', '', '', '4000', '', '现金', '2', '70', '2020-03-24', '不分期', NULL, NULL, '2020-03-24', '不计发票');
INSERT INTO `expenditure` VALUES (164, '素材', 23, '1973.04', '', '无', '', '', '1973.04', '', '现金', '2', '54', '2020-04-07', '不分期', NULL, NULL, '2020-04-09', '不计发票');
INSERT INTO `expenditure` VALUES (165, '素材', 23, '356', '', '无', '', '', '356', '', '现金', '2', '55', '2020-04-08', '不分期', NULL, NULL, '2020-04-08', '不计发票');
INSERT INTO `expenditure` VALUES (166, '互动转盘播控系统', 23, '15000', '', '有', '', '', '', '', '银行', '2', '35', '2020-04-17', '2期', NULL, NULL, '2020-04-08', '不计发票');
INSERT INTO `expenditure` VALUES (167, '影片后期制作', 23, '18000', '', '有', '', '', '', '', '银行', '2', '26', '2020-06-05', '不分期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (168, '素材', 23, '686.45', '', '无', '', '', '686.45', '', '现金', '2', '54', '2020-04-09', '不分期', NULL, '', '2020-04-24', '不计发票');
INSERT INTO `expenditure` VALUES (169, '制作费', 23, '60200', '', '无', '', '60200', '60200', '', '银行', '2', '34', '2020-05-25', '不分期', NULL, '2020-05-25', '2020-05-25', '有');
INSERT INTO `expenditure` VALUES (170, '拍摄费（well）', 23, '37300', '', '无', '', '', '37300', '', '现金', '2', '56', '2020-06-15', '不分期', NULL, NULL, '2020-06-15', '不计发票');
INSERT INTO `expenditure` VALUES (171, '配音费用', 23, '11200', '', '无', '', '11200', '11200', '', '银行', '2', '46', '2020-03-27', '不分期', NULL, '2020-07-22', '2020-06-18', '有');
INSERT INTO `expenditure` VALUES (172, '亚克力柱3200根', 23, '12000', '', '无', '', '12000', '12000', '', '银行', '3', '71', '2020-03-09', '不分期', NULL, '2020-07-22', '2020-03-10', '有');
INSERT INTO `expenditure` VALUES (173, '谭霖报价', 23, '1680000', '', '无', '', '', '', '', '银行', '3', '33', '2020-03-09', '2期', NULL, '2020-07-22', '2020-03-10', '有');
INSERT INTO `expenditure` VALUES (174, '扶手', 23, '98.01', '', '无', '', '', '98.01', '', '现金', '3', '42', '2020-03-04', '不分期', NULL, '', '2020-03-10', '不计发票');
INSERT INTO `expenditure` VALUES (175, '新风机', 23, '1709.9', '', '无', '', '1709.9', '1709.9', '', '银行', '3', '72', '2020-03-06', '不分期', NULL, '2020-07-22', '2020-03-10', '有');
INSERT INTO `expenditure` VALUES (176, '硅藻泥', 23, '11400', '', '无', '', '', '11400', '', '银行', '3', '73', '2020-03-04', '不分期', NULL, NULL, '2020-03-04', '有');
INSERT INTO `expenditure` VALUES (177, '灯具', 23, '3324', '', '无', '', '3324', '3324', '', '银行', '3', '74', '2020-03-12', '不分期', NULL, '2020-03-12', '2020-03-12', '有');
INSERT INTO `expenditure` VALUES (178, '燃具电器', 23, '5949', '', '无', '', '5949', '5949', '', '银行', '3', '75', '2020-03-12', '不分期', NULL, '2020-03-12', '2020-03-12', '有');
INSERT INTO `expenditure` VALUES (179, '卫浴', 23, '8228', '', '无', '', '8228', '8228', '', '银行', '3', '76', '2020-03-12', '不分期', NULL, '2020-03-12', '2020-03-12', '有');
INSERT INTO `expenditure` VALUES (180, '渲染农场（嘉沛使用）', 23, '1000', '', '无', '', '', '1000', '', '现金', '3', '51', '2020-02-29', '不分期', NULL, '2020-03-12', '2020-03-03', '不计发票');
INSERT INTO `expenditure` VALUES (181, '卫浴', 23, '8512.56', '', '无', '', '8512.56', '8512.56', '', '银行', '3', '77', '2020-03-13', '不分期', NULL, '2020-03-13', '2020-03-13', '有');
INSERT INTO `expenditure` VALUES (182, '水槽、水龙头等物资', 23, '5152', '', '无', '', '5152', '5152', '', '银行', '3', '78', '2020-03-16', '不分期', NULL, '2020-03-16', '2020-03-16', '有');
INSERT INTO `expenditure` VALUES (183, '氧化铝板', 23, '151800', '', '无', '', '151800', '151800', '', '银行', '3', '79', '2020-03-20', '不分期', NULL, '2020-03-20', '2020-03-20', '有');
INSERT INTO `expenditure` VALUES (184, '样板房厨卫物料', 23, '15274.53', '', '无', '', '15274.53', '15274.53', '', '银行', '3', '80', '2020-03-20', '不分期', NULL, '2020-03-20', '2020-03-20', '有');
INSERT INTO `expenditure` VALUES (185, '样板房厨卫增加物料', 23, '450.51', '', '无', '', '450.51', '450.51', '', '银行', '3', '80', '2020-06-05', '不分期', NULL, '2020-06-05', '2020-06-05', '有');
INSERT INTO `expenditure` VALUES (186, 'PVC', 23, '5626.6', '', '无', '', '5626.6', '5626.6', '', '银行', '3', '81', '2020-03-19', '不分期', NULL, '2020-03-20', '2020-03-20', '有');
INSERT INTO `expenditure` VALUES (187, '电力轨道', 23, '526', '', '无', '', '526', '526', '', '银行', '3', '82', '2020-03-16', '不分期', NULL, '2020-03-20', '2020-03-16', '有');
INSERT INTO `expenditure` VALUES (188, '铝扣板', 23, '910.65', '', '无', '', '910.65', '910.65', '', '银行', '3', '83', '2020-03-24', '不分期', NULL, '2020-03-24', '2020-03-24', '有');
INSERT INTO `expenditure` VALUES (189, '灯具', 23, '1516.3', '', '无', '', '1516.3', '1516.3', '', '银行', '3', '74', '2020-03-26', '不分期', NULL, '2020-03-26', '2020-03-26', '有');
INSERT INTO `expenditure` VALUES (190, '门窗', 23, '19895.05', '', '无', '', '19895.05', '19895.05', '', '银行', '3', '84', '2020-03-26', '不分期', NULL, '2020-03-26', '2020-03-26', '有');
INSERT INTO `expenditure` VALUES (191, '厨房净水设备', 23, '2300', '', '无', '', '2300', '2300', '', '银行', '3', '85', '2020-03-24', '不分期', NULL, '2020-03-24', '2020-03-24', '有');
INSERT INTO `expenditure` VALUES (192, '地砖', 23, '6119.2', '', '无', '', '6119.2', '6119.2', '', '银行', '3', '86', '2020-04-02', '不分期', NULL, '2020-04-03', '2020-04-03', '有');
INSERT INTO `expenditure` VALUES (193, '玻璃', 23, '3809.8', '', '无', '', '', '3809.8', '', '银行', '3', '87', '2020-04-03', '不分期', NULL, NULL, '2020-04-03', '有');
INSERT INTO `expenditure` VALUES (194, '灯具', 23, '2580.36', '', '无', '', '2580.36', '2580.36', '', '银行', '3', '74', '2020-04-07', '不分期', NULL, '2020-04-07', '2020-04-07', '有');
INSERT INTO `expenditure` VALUES (195, '石英石', 23, '3680', '', '无', '', '3680', '3680', '', '银行', '3', '88', '2020-04-03', '不分期', NULL, '2020-04-03', '2020-04-03', '有');
INSERT INTO `expenditure` VALUES (196, '黑胡桃', 23, '5889', '', '无', '', '5889', '5889', '', '银行', '3', '89', '2020-04-15', '不分期', NULL, '2020-04-15', '2020-04-15', '有');
INSERT INTO `expenditure` VALUES (197, '水槽', 23, '972', '', '无', '', '972', '972', '', '银行', '3', '78', '2020-04-15', '不分期', NULL, '2020-04-15', '2020-04-15', '有');
INSERT INTO `expenditure` VALUES (198, '角阀', 23, '192', '', '无', '', '192', '192', '', '银行', '3', '90', '2020-04-16', '不分期', NULL, '2020-04-16', '2020-04-16', '有');
INSERT INTO `expenditure` VALUES (199, '地砖', 23, '14032.23', '', '无', '', '14032.23', '14032.23', '', '银行', '3', '86', '2020-04-16', '不分期', NULL, '2020-04-16', '2020-04-16', '有');
INSERT INTO `expenditure` VALUES (200, '地砖', 23, '184', '', '无', '', '184', '184', '', '银行', '3', '86', '2020-04-20', '不分期', NULL, '2020-07-23', '2020-04-20', '');
INSERT INTO `expenditure` VALUES (201, '玻璃', 23, '645', '', '无', '', '', '645', '', '银行', '3', '87', '2020-04-21', '不分期', NULL, NULL, '2020-04-21', '');
INSERT INTO `expenditure` VALUES (202, '玻璃', 23, '1164', '', '无', '', '', '1164', '', '银行', '3', '87', '2020-04-22', '不分期', NULL, NULL, '2020-04-22', '');
INSERT INTO `expenditure` VALUES (203, '玻璃', 23, '3020.11', '', '无', '', '', '3020.11', '', '银行', '3', '87', '2020-04-22', '不分期', NULL, NULL, '2020-04-22', '');
INSERT INTO `expenditure` VALUES (204, '开关', 23, '5524.67', '', '无', '', '5524.67', '5524.67', '', '银行', '3', '91', '2020-04-22', '不分期', NULL, '2020-07-23', '2020-04-22', '');
INSERT INTO `expenditure` VALUES (205, '厨房全景门', 23, '3400', '', '无', '', '3400', '3400', '', '银行', '3', '77', '2020-04-22', '不分期', NULL, '2020-07-23', '2020-04-22', '');
INSERT INTO `expenditure` VALUES (206, '橱柜等', 23, '10422.9', '', '无', '', '10422.9', '10422.9', '', '银行', '3', '80', '2020-04-24', '不分期', NULL, '2020-07-23', '2020-04-24', '');
INSERT INTO `expenditure` VALUES (207, '门', 23, '5467.33', '', '无', '', '5467.33', '5467.33', '', '银行', '3', '81', '2020-04-23', '不分期', NULL, '2020-07-23', '2020-04-23', '');
INSERT INTO `expenditure` VALUES (208, '射灯', 23, '564', '', '无', '', '564', '564', '', '银行', '3', '74', '2020-04-22', '不分期', NULL, '2020-07-23', '2020-04-22', '');
INSERT INTO `expenditure` VALUES (209, '地砖', 23, '668', '', '无', '', '668', '668', '', '银行', '3', '86', '2020-05-21', '不分期', NULL, '2020-07-23', '2020-05-21', '');
INSERT INTO `expenditure` VALUES (210, '电动滑轨控制系统(well)', 23, '15300', '', '无', '', '15300', '15300', '', '银行', '3', '92', '2020-06-17', '不分期', NULL, '2020-07-23', '2020-06-17', '');
INSERT INTO `expenditure` VALUES (211, '施工图设计', 23, '59800', '', '有', '', '59800', '59800', '', '银行', '3', '27', '2020-02-08', '不分期', NULL, '2020-07-23', '2020-06-12', '');
INSERT INTO `expenditure` VALUES (212, '水槽', 23, '530', '', '无', '', '530', '530', '', '银行', '3', '78', '2020-07-02', '不分期', NULL, '2020-07-23', '2020-07-02', '');
INSERT INTO `expenditure` VALUES (213, '台下盆', 23, '1380', '', '无', '', '', '1380', '', '银行', '3', '76', '2020-07-02', '不分期', NULL, NULL, '2020-07-02', '');
INSERT INTO `expenditure` VALUES (214, '投影灯（well）', 23, '332', '', '无', '', '', '332', '', '现金', '3', '93', '2020-07-02', '不分期', NULL, NULL, '2020-07-02', '不计发票');
INSERT INTO `expenditure` VALUES (215, '喷绘', 23, '31415.29', '', '无', '', '31415.29', '31415.29', '', '银行', '3', '94', '2020-04-22', '不分期', NULL, '2020-07-23', '2020-04-22', '有');
INSERT INTO `expenditure` VALUES (216, '艺术树', 23, '3800', '', '无', '', '3800', '3800', '', '现金', '3', '47', '2020-03-19', '不分期', NULL, '2020-07-23', '2020-04-01', '有');
INSERT INTO `expenditure` VALUES (217, '开关、面板', 23, '1774', '', '无', '', '', '1774', '', '现金', '3', '47', '2020-03-26', '不分期', NULL, '2020-07-23', '2020-04-01', '不计发票');
INSERT INTO `expenditure` VALUES (218, '工程道具', 23, '7334.47', '', '无', '', '', '7334.47', '', '现金', '3', '42', '2020-03-07', '不分期', NULL, '2020-07-23', '2020-03-18', '不计发票');
INSERT INTO `expenditure` VALUES (219, '工程道具', 23, '2040.3', '', '无', '', '', '2040.3', '', '现金', '3', '42', '2020-03-17', '不分期', NULL, '2020-07-23', '2020-04-01', '不计发票');
INSERT INTO `expenditure` VALUES (220, '包装材料', 23, '494', '', '无', '', '', '494', '', '现金', '3', '95', '2020-02-21', '不分期', NULL, '2020-07-23', '2020-04-06', '不计发票');
INSERT INTO `expenditure` VALUES (221, '模型', 23, '85860', '', '有', '', '', '', '', '银行', '3', '19', '2020-03-10', '5期', NULL, '', '', '');
INSERT INTO `expenditure` VALUES (222, '鸿瑞项目增项', 23, '11660', '', '有', '', '11660', '11660', '', '银行', '3', '19', '2020-04-03', '不分期', NULL, '2020-07-23', '2020-04-14', '');
INSERT INTO `expenditure` VALUES (223, '打样', 23, '4770', '', '有', '', '4770', '4770', '', '银行', '3', '19', '2020-04-14', '不分期', NULL, '2020-07-23', '2020-04-14', '');
INSERT INTO `expenditure` VALUES (224, '沙盘修改', 23, '59890', '', '有', '', '', '', '', '银行', '3', '19', '2020-07-01', '不分期', NULL, NULL, NULL, '');
INSERT INTO `expenditure` VALUES (225, '界字', 23, '19750', '', '有', '', '', '19750', '', '银行', '3', '38', '2020-03-18', '不分期', NULL, NULL, '2020-06-08', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `expendituredata` VALUES (125, '', 116, '20400', '定金', '有', '', '20400', '20400', '银行', '2020-07-20', '2020-06-10', '第1期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (126, '', 116, '13600', '提供初稿经确认付', '有', '', '13600', '13600', '银行', '2020-07-20', '2020-06-10', '第2期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (127, '', 116, '27200', '视频素材及程序制作完成', '有', '', '27200', '27200', '银行', '2020-07-20', '2020-06-10', '第3期', '20', '18', NULL);
INSERT INTO `expendituredata` VALUES (128, '', 116, '6800', '验收后3个工作日内', '有', '', '6800', '6800', '银行', '2020-07-20', '2020-06-10', '第4期', '20', '18', NULL);
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
INSERT INTO `expendituredata` VALUES (144, '', 133, '7500', '', '无', '', '', '7500', '现金', '2020-06-18', '', '第1期', '20', '31', '不计发票');
INSERT INTO `expendituredata` VALUES (145, '', 133, '7500', '', '无', '', '', '', '现金', NULL, '', '第2期', '20', '31', '不计发票');
INSERT INTO `expendituredata` VALUES (146, '', 147, '139194', '签订10工作日内预付款30%', '有', '', '', '', '银行', '', '', '第1期', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (147, '', 147, '92796', '安装完成付进度款20%', '有', '', '', '', '银行', '', '', '第2期', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (148, '', 147, '92796', '正常运作付进度款20%', '有', '', '', '', '银行', '', '', '第3期', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (149, '', 147, '92796', '验收合格付结算款20%', '有', '', '', '', '银行', '', '', '第4期', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (150, '', 147, '23199', '验收合格满一年付5%', '有', '', '', '', '银行', '', '', '一年质保金', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (151, '', 147, '23199', '验收合格满两年付5%', '有', '', '', '', '银行', '', '', '二年质保金', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (152, '', 148, '22990', '一次性付款', '有', '', '', '', '银行', '', '', '第1期', '23', '17', NULL);
INSERT INTO `expendituredata` VALUES (153, '', 150, '150000', '定金', '有', '', '150000', '150000', '银行', '2020-03-16', '2020-07-22', '第1期', '23', '22', NULL);
INSERT INTO `expendituredata` VALUES (154, '', 150, '582191.39', '', '有', '', '', '', '银行', NULL, NULL, '第2期', '23', '22', NULL);
INSERT INTO `expendituredata` VALUES (155, '', 161, '20000', '', '无', '', '', '20000', '现金', '2020-03-13', '', '第1期', '23', '40', '不计发票');
INSERT INTO `expendituredata` VALUES (156, '', 161, '11500', '', '无', '', '', '11500', '现金', '2020-05-06', '', '第2期', '23', '40', '不计发票');
INSERT INTO `expendituredata` VALUES (157, '', 161, '10000', '', '无', '', '', '', '现金', NULL, '', '第3期', '23', '40', '不计发票');
INSERT INTO `expendituredata` VALUES (158, '', 166, '7500', '', '有', '', '', '', '银行', '', '', '第1期', '23', '35', NULL);
INSERT INTO `expendituredata` VALUES (159, '', 166, '7500', '', '有', '', '', '', '银行', '', '', '第2期', '23', '35', NULL);
INSERT INTO `expendituredata` VALUES (160, '', 173, '1600000', '', '无', '', '1600000', '1600000', '银行', '2020-05-26', '2020-07-22', '第1期', '23', '33', NULL);
INSERT INTO `expendituredata` VALUES (161, '', 173, '80000', '', '无', '', '', '', '银行', NULL, NULL, '第2期', '23', '33', NULL);
INSERT INTO `expendituredata` VALUES (162, '', 221, '25758', '签订10工作日内预付款30%', '有', '', '25758', '25758', '银行', '2020-03-28', '2020-07-23', '第1期', '23', '19', NULL);
INSERT INTO `expendituredata` VALUES (163, '', 221, '17172', '进场安装前付20%进度款', '有', '', '', '', '银行', NULL, NULL, '第2期', '23', '19', NULL);
INSERT INTO `expendituredata` VALUES (164, '', 221, '17172', '正常运作后付20%进度款', '有', '', '', '', '银行', NULL, NULL, '第3期', '23', '19', NULL);
INSERT INTO `expendituredata` VALUES (165, '', 221, '21465', '验收合格后付25%结算款', '有', '', '', '', '银行', NULL, NULL, '第4期', '23', '19', NULL);
INSERT INTO `expendituredata` VALUES (166, '', 221, '4293', '验收合格满1年付5%保修金', '有', '', '', '', '银行', NULL, NULL, '一年质保金', '23', '19', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projectlist
-- ----------------------------
INSERT INTO `projectlist` VALUES (16, '长沙时代领峰', '', '6', '1406998.42', '2020-05-10 00:00:00', '', '0', '长沙启誉房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (17, '汕尾时代', '', '7', '1606328.24', '2020-05-25', '', '0', '海丰县骏宏房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (18, '哒哒哒哒哒', '', '6', '900000', '2020-07-08', '10000', '1', '长沙启誉房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (19, '金融街控股宣传片', '', '8', '350000', '2020-01-09', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (20, '郑州智慧城市', '', '9', '5348522', '2019-12-27', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (21, '石岗时代广纸', '暂无报价', '', '0', '2020-07-01', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (22, '保利茂名奥体', '暂未报价', '', '0', '2020-07-01', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (23, '粤西华南保利2.0', '', '', '8450000', '2020-02-28', '', '0', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of revenuecontract
-- ----------------------------
INSERT INTO `revenuecontract` VALUES (31, '时代梅溪领峰（长沙）项目营销中心品牌馆工程合同（大迈）G04', '2020-05-10', '银行', '有', '', '16', '3期', '1406998.42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (34, '时代水岸（海丰）项目品牌馆制作合同（大迈）G05', '2020-05-25', '银行', '有', '', '17', '2期', '1606328.24', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (35, '磊', '2020-07-15', '现金', '', '', '18', '3期', '444444', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (36, '2019版金融街控股宣传片委托制作协议', '2020-01-09', '银行', '有', '', '19', '3期', '350000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (37, '郑州智慧城市', '2019-12-27', '银行', '有', '', '20', '4期', '5348522', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `revenuecontract` VALUES (38, '粤西华南保利2.0', '', '', '', '报价', '23', '', '8450000', NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `supplierlist` VALUES (58, '刘钧晖', '', 2);
INSERT INTO `supplierlist` VALUES (59, '谢沂格', '', 3);
INSERT INTO `supplierlist` VALUES (60, '邱梓岚', '', 2);
INSERT INTO `supplierlist` VALUES (61, '李维', '', 2);
INSERT INTO `supplierlist` VALUES (62, '范鉴鹏', '', 2);
INSERT INTO `supplierlist` VALUES (63, '詹剑锋', '', 2);
INSERT INTO `supplierlist` VALUES (64, '郑晓丽', '', 2);
INSERT INTO `supplierlist` VALUES (65, '卫治汶', '', 2);
INSERT INTO `supplierlist` VALUES (66, '杨帆', '', 3);
INSERT INTO `supplierlist` VALUES (67, '陈俊鑫', '', 2);
INSERT INTO `supplierlist` VALUES (68, '广州幻硕信息科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (69, '张润华', '', 3);
INSERT INTO `supplierlist` VALUES (70, '林国超', '', 3);
INSERT INTO `supplierlist` VALUES (71, '东莞市铭诚塑胶材料有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (72, '深圳市环都新风科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (73, '洛迪环保科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (74, '佛山市璟诚恒悦照明电器有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (75, '广州林内燃具电器有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (76, '广州市家誉建材有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (77, '广东玫瑰岛卫浴有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (78, '广州市纵盈建材有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (79, '广东耀金新材料科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (80, '佛山市和筑建材贸易有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (81, '泰森日盛集团有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (82, '广州九晟科技发展有限责任公司', '', 1);
INSERT INTO `supplierlist` VALUES (83, '浙江友邦集成吊顶股份有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (84, '广东坚美定制门窗系统有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (85, '广州市鸿畅环保设备有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (86, '广州君尚建材有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (87, '佛山市荣冠玻璃建材有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (88, '广州中万石材工程有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (89, '广州圣象木业有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (90, '优达（中国）有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (91, '广州山金山戎利电气有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (92, '华视乐迅（深圳）科技有限公司', '', 1);
INSERT INTO `supplierlist` VALUES (93, '赖党旺', '', 1);
INSERT INTO `supplierlist` VALUES (94, '邹瑞', '', 1);
INSERT INTO `supplierlist` VALUES (95, '马庆幸', '', 2);

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
