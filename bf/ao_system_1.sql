-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-03-30 16:20:27
-- 服务器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ao_system_1`
--

-- --------------------------------------------------------

--
-- 表的结构 `customerlist`
--

CREATE TABLE `customerlist` (
  `id` int(255) NOT NULL,
  `CustomerName` text DEFAULT NULL,
  `CustomerContent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `customerlist`
--

INSERT INTO `customerlist` (`id`, `CustomerName`, `CustomerContent`) VALUES
(1, '客户1', '客户1');

-- --------------------------------------------------------

--
-- 表的结构 `expenditure`
--

CREATE TABLE `expenditure` (
  `id` int(10) NOT NULL,
  `ReceivablesName` varchar(254) DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL,
  `number` decimal(20,0) DEFAULT NULL,
  `ReceivablesData` varchar(254) DEFAULT NULL,
  `contract` varchar(254) DEFAULT NULL,
  `Remarks` varchar(254) DEFAULT NULL,
  `invoice` decimal(20,0) DEFAULT NULL,
  `Receivables` decimal(20,0) DEFAULT NULL,
  `OtherParty` varchar(254) DEFAULT NULL,
  `ReceivablesMode` varchar(254) DEFAULT NULL,
  `projectClass` varchar(254) DEFAULT NULL,
  `SupplierName` varchar(254) DEFAULT NULL,
  `contractdate` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `expenditure`
--

INSERT INTO `expenditure` (`id`, `ReceivablesName`, `projectId`, `number`, `ReceivablesData`, `contract`, `Remarks`, `invoice`, `Receivables`, `OtherParty`, `ReceivablesMode`, `projectClass`, `SupplierName`, `contractdate`) VALUES
(2, '付款1', 0, '20000', '付款', '有', '付款', '0', '0', '1', '付款', '拓展费', NULL, '2020-03-11');

-- --------------------------------------------------------

--
-- 表的结构 `expenditureclass`
--

CREATE TABLE `expenditureclass` (
  `id` int(11) NOT NULL,
  `expenditureClass` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `expenditureclass`
--

INSERT INTO `expenditureclass` (`id`, `expenditureClass`) VALUES
(1, '硬件类成本'),
(2, '软体类成本'),
(3, '工程类'),
(4, '业务类'),
(5, '拓展费');

-- --------------------------------------------------------

--
-- 表的结构 `projectlist`
--

CREATE TABLE `projectlist` (
  `id` int(11) NOT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `projectContent` varchar(255) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `ContractAmount` varchar(255) DEFAULT NULL,
  `ContractDate` datetime DEFAULT NULL,
  `ExpenditureBudget` varchar(255) DEFAULT NULL,
  `complete` varchar(255) DEFAULT NULL,
  `CustomerNameid` int(11) DEFAULT NULL,
  `Receivables` varchar(255) DEFAULT NULL,
  `expenditure` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `projectlist`
--

INSERT INTO `projectlist` (`id`, `projectName`, `projectContent`, `CustomerName`, `ContractAmount`, `ContractDate`, `ExpenditureBudget`, `complete`, `CustomerNameid`, `Receivables`, `expenditure`) VALUES
(0, '项目1', '项目1', '1', '500000', '2020-03-02 00:00:00', '200000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `receivables`
--

CREATE TABLE `receivables` (
  `id` int(20) NOT NULL,
  `ReceivablesName` varchar(254) DEFAULT NULL,
  `projectId` int(20) DEFAULT NULL,
  `number` decimal(20,2) DEFAULT NULL,
  `ReceivablesData` varchar(254) DEFAULT NULL,
  `contract` varchar(254) DEFAULT NULL,
  `Remarks` varchar(254) DEFAULT NULL,
  `invoice` decimal(20,2) DEFAULT NULL,
  `Receivables` decimal(20,2) DEFAULT NULL,
  `ReceivablesMode` varchar(254) DEFAULT NULL,
  `daozhangdate` varchar(254) DEFAULT NULL,
  `kaifapiaodate` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `receivables`
--

INSERT INTO `receivables` (`id`, `ReceivablesName`, `projectId`, `number`, `ReceivablesData`, `contract`, `Remarks`, `invoice`, `Receivables`, `ReceivablesMode`, `daozhangdate`, `kaifapiaodate`) VALUES
(2, '项目一期', 0, '500000.00', '项目一期', '有', '项目一期', '200000.00', '200000.00', '项目一期', '2020-03-18', '2020-03-17');

-- --------------------------------------------------------

--
-- 表的结构 `supplierlist`
--

CREATE TABLE `supplierlist` (
  `id` int(10) NOT NULL,
  `SupplierName` text DEFAULT NULL,
  `SupplierCon` text DEFAULT NULL,
  `SupplierClass` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `supplierlist`
--

INSERT INTO `supplierlist` (`id`, `SupplierName`, `SupplierCon`, `SupplierClass`) VALUES
(1, '供应商1', '供应商1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `transaction`
--

CREATE TABLE `transaction` (
  `id` int(10) NOT NULL,
  `MoneyClass` int(10) DEFAULT NULL,
  `CollectMone` int(10) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `AmountMoney` decimal(20,0) DEFAULT NULL,
  `invoice` decimal(20,0) DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转储表的索引
--

--
-- 表的索引 `customerlist`
--
ALTER TABLE `customerlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `expenditure`
--
ALTER TABLE `expenditure`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `expenditureclass`
--
ALTER TABLE `expenditureclass`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `projectlist`
--
ALTER TABLE `projectlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `receivables`
--
ALTER TABLE `receivables`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `supplierlist`
--
ALTER TABLE `supplierlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `customerlist`
--
ALTER TABLE `customerlist`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `expenditure`
--
ALTER TABLE `expenditure`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `receivables`
--
ALTER TABLE `receivables`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `supplierlist`
--
ALTER TABLE `supplierlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
