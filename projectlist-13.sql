/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : dddd

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 13/10/2020 01:33:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of projectlist
-- ----------------------------
BEGIN;
INSERT INTO `projectlist` VALUES (16, '长沙时代领峰', '开票税率6%（芊芊）', '6', '1406998.42', '2020-05-10', '', '0', '长沙启誉房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (17, '汕尾时代', '开票税率6%（丹娜）', '7', '1606328.24', '2020-05-25', '', '0', '海丰县骏宏房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (18, '哒哒哒哒哒', '', '6', '900000', '2020-07-08', '10000', '1', '长沙启誉房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (19, '金融街控股宣传片', '开票税率6%（淑惠）', '8', '350000', '2020-01-09', '', '0', '金融街控股股份有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (20, '郑州智慧城市', '开票税率6%（庞梓健）', '9', '5348522', '2020-01-01', '', '0', '广东省集美设计工程有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (21, '石岗时代广纸', '报价', '', '1609755', '2020-07-01', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (22, '保利茂名奥体', '报价（丹娜）', '', '8900000', '2020-07-01', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (23, '粤西华南保利2.0', '（丹娜）', '', '10054818.72', '2020-02-28', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (24, '项目一', '', '7', '1000000', '2020-06-30', '', '1', '海丰县骏宏房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (25, '乐从美的', '', '', '22737', '2020-02-26', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (26, '时代红卫村', '开票税率6%（淑惠）', '11', '1650000', '2020-07-06', '', '0', '广州市时代红卫投资发展有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (27, '保利钟落潭', '报价（淑莹）', '', '1416181', '2020-03-25', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (28, '保利悦公馆', '报价（丹娜）', '', '940000', '2020-03-04', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (29, '保利三龙湾', '开票税率9%（丹娜）', '12', '2733918', '2020-07-01', '', '0', '佛山南海祁禹置业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (30, '金融街三水金悦郡', '报价（芊芊）', '', '740817.04', '2020-03-13', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (31, '金融街南海仙湖悦府', '报价（芊芊）', '', '770832', '2020-04-06', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (32, '保利广钢', '报价（丹娜）', '', '1980000', '2020-05-12', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (33, '保利亭角', '开票税率9%（淑莹）', '13', '870000', '2020-09-01', '', '0', '广州市保曦置业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (34, '重庆金悦府', '报价（淑莹）', '', '830000', '2020-08-04', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (35, '重庆新水土', '开票税率6%（淑莹）', '14', '223272', '2020-05-01', '', '0', '重庆金融街融迈置业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (36, '贵阳美的', '开票税率9%（石妮、庞梓健）', '15', '1503768', '2020-06-09', '', '0', '贵阳美承房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (37, '清远保利奥体', '开票税率9%（石妮）', '16', '3500000', '2020-07-01', '', '0', '清远保泓置业有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (38, '廊坊金融街金悦府', '开票税率6%,9%（淑莹）', '17', '2594050', '2020-07-23', '', '0', '北京融方企业管理服务有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (39, '广州半导体', '暂无报价（石妮、庞梓健）', '', '0', '2020-04-14', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (40, '深圳城市展厅', '暂无报价', '', '0', '2020-07-04', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (41, '佛山保利紫山', '暂无报价（丹娜）', '', '0', '2020-06-20', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (42, '美的人才小镇', '开票税率9%', '21', '3730042.62', '2020-08-18', '', '0', '21', NULL, NULL);
INSERT INTO `projectlist` VALUES (43, '北滘美的标准馆', '开票税率6%，9%（石妮）', '19', '2800000', '2020-08-31', '', '0', '美的置业集团有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (44, '青岛保利城市', '暂无报价（淑惠）', '', '0', '2020-06-24', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (45, '东莞保利天际', '报价（淑莹）', '', '3200000', '2020-08-28', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (46, '福建泉州美的', '开票税率9%（庞梓健）', '18', '1300000', '2020-08-30', '', '0', '泉州市美景房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (47, '成都金融街', '报价（淑莹）', '', '1220000', '2020-07-23', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (48, '青岛保利天际', '暂无报价', '', '0', '2020-07-18', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (49, '中山时代名著', '报价', '', '2830000', '2020-07-01', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (50, '恒大球场', '开票税率9%（梓健）', '20', '2330000', '2020-09-17', '', '0', '广州市番禺区瑞焱房地产开发有限公司', NULL, NULL);
INSERT INTO `projectlist` VALUES (51, '深圳保利清谷', '报价', '', '1610000', '2020-09-21', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (52, '中山WELL', '报价', '', '840000', '2020-09-21', '', '0', NULL, NULL, NULL);
INSERT INTO `projectlist` VALUES (53, '武汉时代', '暂无报价', '', '0', '2020-09-30', '', '0', NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
