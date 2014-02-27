-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 28, 2014 at 12:52 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `cron_job`
--

CREATE TABLE IF NOT EXISTS `cron_job` (
  `job_id` varchar(32) NOT NULL,
  `job_name` varchar(128) NOT NULL,
  `url` varchar(512) NOT NULL,
  `priority` int(11) NOT NULL,
  `intervals` int(11) NOT NULL,
  `last_run` datetime NOT NULL DEFAULT '2014-01-01 00:00:00',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cron_job`
--

INSERT INTO `cron_job` (`job_id`, `job_name`, `url`, `priority`, `intervals`, `last_run`) VALUES
('ALLJC', 'All Jamaican Chart', '/trigger/alljamaicanchart', 3, 300, '2014-02-27 14:42:57'),
('ALLJIC', 'allJamaicanIndexComposition', '/trigger/allJamaicanIndexComposition', 3, 300, '2014-02-27 14:42:57'),
('ALLJIH', 'All Jamaican Index History', '/trigger/allJamaicanIndexHistory', 3, 300, '2014-02-27 14:42:57'),
('ALLJIP', 'All Jamaican Index Performance', '/trigger/allJamaicanIndexPerformance', 3, 300, '2014-02-27 14:42:57'),
('DNEWS', 'Daily News', '/trigger/dailyNews', 3, 1200, '2014-02-27 14:42:57'),
('DQ', 'Daily Quote', '/trigger/dailyQuote', 3, 300, '2014-02-27 14:42:57'),
('DS', 'Daily Summary', '/trigger/dailysummary', 3, 300, '2014-02-27 14:42:57'),
('JSEIP', 'JSE Select Index Performance', '/trigger/jseselectindexperformance', 3, 300, '2014-02-27 14:42:57'),
('JSESC', 'JSE Select Chart', '/trigger/jseselectchart', 3, 300, '2014-02-27 14:42:57'),
('JSESIC', 'JSE Select Index Composition', '/trigger/jseSelectIndexComposition', 3, 300, '2014-02-27 14:42:57'),
('JSESIH', 'JSE Select Index History', '/trigger/jseSelectIndexHistory', 3, 300, '2014-02-27 14:42:57'),
('LS', 'Live Stock', '/trigger/livestock', 1, 60, '2014-01-01 00:00:00'),
('M', 'Market', '/trigger/market', 1, 300, '2014-02-27 14:42:57'),
('MIC', 'Main Index Composition', '/trigger/mainIndexComposition', 3, 300, '2014-02-27 14:42:57'),
('MIPER', 'Main Index Performance', '/trigger/mainIndexperformance', 3, 300, '2014-02-27 14:42:57'),
('MMIC', 'Main Market Index Chart', '/trigger/mainindexchart', 3, 300, '2014-02-27 14:42:58'),
('MMIH', 'Main Market Index History', '/trigger/mainMarketIndexHistory', 3, 300, '2014-02-27 14:42:58'),
('RSYM', 'Refresh Symbols', '/trigger/refreshSymbol', 3, 300, '2014-02-27 14:42:58'),
('XSSIC', 'crossListedIndexComposition', '/trigger/crossListedIndexComposition', 3, 300, '2014-02-27 14:42:58'),
('XSSLC', 'Cross Listed Chart', '/trigger/crosslistedchart', 3, 300, '2014-02-27 14:42:58'),
('XSSLIH', 'crossListedIndexHistory', '/trigger/crossListedIndexHistory', 3, 300, '2014-02-27 14:42:58'),
('XSSLIP', 'Cross Listed Index Performance', '/trigger/crossListedIndexPerformance', 3, 300, '2014-02-27 14:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `daily_composition`
--

CREATE TABLE IF NOT EXISTS `daily_composition` (
  `report_date` date NOT NULL,
  `index_name` varchar(32) NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `url` varchar(256) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `change` decimal(18,2) DEFAULT NULL,
  `change_perc` decimal(18,2) DEFAULT NULL,
  `volume_traded` decimal(18,2) DEFAULT NULL,
  `stock_code` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_date`,`index_name`,`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_composition`
--

INSERT INTO `daily_composition` (`report_date`, `index_name`, `symbol`, `url`, `price`, `change`, `change_perc`, `volume_traded`, `stock_code`, `date_created`) VALUES
('2014-02-26', 'ALL_JAMAICAN', 'BIL', 'controller.php?action=view_stock_charts&StockCode=7037', 2.50, 0.00, 0.00, 0.00, 7037, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'BRG', 'controller.php?action=view_stock_charts&StockCode=72', 1.80, -0.05, -2.70, 18999.00, 72, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'CAR', 'controller.php?action=view_stock_charts&StockCode=3', 35.00, 0.02, 0.06, 600.00, 3, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'CBNY', 'controller.php?action=view_stock_charts&StockCode=73', 0.06, -0.04, -40.00, 4000.00, 73, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'CCC', 'controller.php?action=view_stock_charts&StockCode=57', 4.80, 0.08, 1.69, 65916.00, 57, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'DG', 'controller.php?action=view_stock_charts&StockCode=6', 5.00, 0.00, 0.00, 831517.00, 6, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'GK', 'controller.php?action=view_stock_charts&StockCode=10', 55.00, 0.43, 0.79, 5150.00, 10, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'GLNR', 'controller.php?action=view_stock_charts&StockCode=8', 1.10, 0.00, 0.00, 0.00, 8, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'HL', 'controller.php?action=view_stock_charts&StockCode=59', 8.00, -0.10, -1.23, 4400.00, 59, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'JBG', 'controller.php?action=view_stock_charts&StockCode=70', 4.92, 0.11, 2.29, 10371.00, 70, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'JMMB', 'controller.php?action=view_stock_charts&StockCode=102', 7.45, -0.03, -0.40, 16267.00, 102, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'JP', 'controller.php?action=view_stock_charts&StockCode=12', 18.26, 0.00, 0.00, 0.00, 12, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'JSE', 'controller.php?action=view_stock_charts&StockCode=7061', 2.10, 0.00, 0.00, 0.00, 7061, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'KPREIT', 'controller.php?action=view_stock_charts&StockCode=7035', 4.00, 0.00, 0.00, 0.00, 7035, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'KW', 'controller.php?action=view_stock_charts&StockCode=81', 6.00, 0.00, 0.00, 0.00, 81, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'LIME', 'controller.php?action=view_stock_charts&StockCode=66', 0.40, 0.00, 0.00, 1519531.00, 66, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'MBICE', 'controller.php?action=view_stock_charts&StockCode=20', 17.95, 0.00, 0.00, 0.00, 20, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'MIL', 'controller.php?action=view_stock_charts&StockCode=200', 1.90, 0.00, 0.00, 2652.00, 200, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'NCBJ', 'controller.php?action=view_stock_charts&StockCode=95', 19.01, 0.01, 0.05, 1960431.00, 95, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'PAL', 'controller.php?action=view_stock_charts&StockCode=25', 95.00, 0.00, 0.00, 0.00, 25, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'PJAM', 'controller.php?action=view_stock_charts&StockCode=26', 48.80, 0.74, 1.54, 850.00, 26, '2014-02-27 03:09:52'),
('2014-02-26', 'ALL_JAMAICAN', 'PULS', 'controller.php?action=view_stock_charts&StockCode=77', 0.99, 0.00, 0.00, 0.00, 77, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'RJR', 'controller.php?action=view_stock_charts&StockCode=69', 1.36, -0.24, -15.00, 3100000.00, 69, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'S', 'controller.php?action=view_stock_charts&StockCode=31', 17.10, -0.90, -5.00, 1800.00, 31, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'SALF', 'controller.php?action=view_stock_charts&StockCode=29', 9.00, 0.00, 0.00, 0.00, 29, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'SEP', 'controller.php?action=view_stock_charts&StockCode=30', 10.92, -0.08, -0.73, 304000.00, 30, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'SGJ', 'controller.php?action=view_stock_charts&StockCode=107', 21.10, 0.44, 2.13, 264133.00, 107, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'SIJL', 'controller.php?action=view_stock_charts&StockCode=71', 25.25, -0.33, -1.29, 7500.00, 71, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'SJ', 'controller.php?action=view_stock_charts&StockCode=7070', 8.80, -0.20, -2.19, 11995.00, 7070, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'SVL', 'controller.php?action=view_stock_charts&StockCode=123', 2.40, 0.00, 0.00, 0.00, 123, '2014-02-27 03:09:53'),
('2014-02-26', 'ALL_JAMAICAN', 'XFUND', 'controller.php?action=view_stock_charts&StockCode=7067', 6.95, 0.00, 0.00, 0.00, 7067, '2014-02-27 03:09:53'),
('2014-02-26', 'CROSS_LISTED', 'FCIB', 'controller.php?action=view_stock_charts&StockCode=78', 80.00, 0.00, 0.00, 0.00, 78, '2014-02-27 03:09:49'),
('2014-02-26', 'CROSS_LISTED', 'TCL', 'controller.php?action=view_stock_charts&StockCode=86', 17.61, 0.00, 0.00, 0.00, 86, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'CAR', 'controller.php?action=view_stock_charts&StockCode=3', 35.00, 0.02, 0.06, 600.00, 3, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'CPJ', 'controller.php?action=view_stock_charts&StockCode=7053', 2.70, 0.00, 0.00, 0.00, 7053, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'DG', 'controller.php?action=view_stock_charts&StockCode=6', 5.00, 0.00, 0.00, 831517.00, 6, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'GK', 'controller.php?action=view_stock_charts&StockCode=10', 55.00, 0.43, 0.79, 5150.00, 10, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'GLNR', 'controller.php?action=view_stock_charts&StockCode=8', 1.10, 0.00, 0.00, 0.00, 8, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'JBG', 'controller.php?action=view_stock_charts&StockCode=70', 4.92, 0.11, 2.29, 10371.00, 70, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'JMMB', 'controller.php?action=view_stock_charts&StockCode=102', 7.45, -0.03, -0.40, 16267.00, 102, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'LASD', 'controller.php?action=view_stock_charts&StockCode=7043', 1.30, -0.01, -0.76, 1093460.00, 7043, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'LASF', 'controller.php?action=view_stock_charts&StockCode=7045', 1.30, 0.00, 0.00, 10000.00, 7045, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'LASM', 'controller.php?action=view_stock_charts&StockCode=7044', 1.20, -0.03, -2.44, 338154.00, 7044, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'LIME', 'controller.php?action=view_stock_charts&StockCode=66', 0.40, 0.00, 0.00, 1519531.00, 66, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'MIL', 'controller.php?action=view_stock_charts&StockCode=200', 1.90, 0.00, 0.00, 2652.00, 200, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'NCBJ', 'controller.php?action=view_stock_charts&StockCode=95', 19.01, 0.01, 0.05, 1960431.00, 95, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'SGJ', 'controller.php?action=view_stock_charts&StockCode=107', 21.10, 0.44, 2.13, 264133.00, 107, '2014-02-27 03:09:49'),
('2014-02-26', 'JSE_SELECT', 'SVL', 'controller.php?action=view_stock_charts&StockCode=123', 2.40, 0.00, 0.00, 0.00, 123, '2014-02-27 03:09:49'),
('2014-02-26', 'MAIN_INDEX', 'BIL', 'controller.php?action=view_stock_charts&StockCode=7037', 2.50, 0.00, 0.00, 0.00, 7037, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'BRG', 'controller.php?action=view_stock_charts&StockCode=72', 1.80, -0.05, -2.70, 18999.00, 72, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'CAR', 'controller.php?action=view_stock_charts&StockCode=3', 35.00, 0.02, 0.06, 600.00, 3, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'CBNY', 'controller.php?action=view_stock_charts&StockCode=73', 0.06, -0.04, -40.00, 4000.00, 73, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'CCC', 'controller.php?action=view_stock_charts&StockCode=57', 4.80, 0.08, 1.69, 65916.00, 57, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'DG', 'controller.php?action=view_stock_charts&StockCode=6', 5.00, 0.00, 0.00, 831517.00, 6, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'FCIB', 'controller.php?action=view_stock_charts&StockCode=78', 80.00, 0.00, 0.00, 0.00, 78, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'GK', 'controller.php?action=view_stock_charts&StockCode=10', 55.00, 0.43, 0.79, 5150.00, 10, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'GLNR', 'controller.php?action=view_stock_charts&StockCode=8', 1.10, 0.00, 0.00, 0.00, 8, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'HL', 'controller.php?action=view_stock_charts&StockCode=59', 8.00, -0.10, -1.23, 4400.00, 59, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'JBG', 'controller.php?action=view_stock_charts&StockCode=70', 4.92, 0.11, 2.29, 10371.00, 70, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'JMMB', 'controller.php?action=view_stock_charts&StockCode=102', 7.45, -0.03, -0.40, 16267.00, 102, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'JP', 'controller.php?action=view_stock_charts&StockCode=12', 18.26, 0.00, 0.00, 0.00, 12, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'JSE', 'controller.php?action=view_stock_charts&StockCode=7061', 2.10, 0.00, 0.00, 0.00, 7061, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'KPREIT', 'controller.php?action=view_stock_charts&StockCode=7035', 4.00, 0.00, 0.00, 0.00, 7035, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'KW', 'controller.php?action=view_stock_charts&StockCode=81', 6.00, 0.00, 0.00, 0.00, 81, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'LIME', 'controller.php?action=view_stock_charts&StockCode=66', 0.40, 0.00, 0.00, 1519531.00, 66, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'MBICE', 'controller.php?action=view_stock_charts&StockCode=20', 17.95, 0.00, 0.00, 0.00, 20, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'MIL', 'controller.php?action=view_stock_charts&StockCode=200', 1.90, 0.00, 0.00, 2652.00, 200, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'NCBJ', 'controller.php?action=view_stock_charts&StockCode=95', 19.01, 0.01, 0.05, 1960431.00, 95, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'PAL', 'controller.php?action=view_stock_charts&StockCode=25', 95.00, 0.00, 0.00, 0.00, 25, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'PJAM', 'controller.php?action=view_stock_charts&StockCode=26', 48.80, 0.74, 1.54, 850.00, 26, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'PULS', 'controller.php?action=view_stock_charts&StockCode=77', 0.99, 0.00, 0.00, 0.00, 77, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'RJR', 'controller.php?action=view_stock_charts&StockCode=69', 1.36, -0.24, -15.00, 3100000.00, 69, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'S', 'controller.php?action=view_stock_charts&StockCode=31', 17.10, -0.90, -5.00, 1800.00, 31, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'SALF', 'controller.php?action=view_stock_charts&StockCode=29', 9.00, 0.00, 0.00, 0.00, 29, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'SEP', 'controller.php?action=view_stock_charts&StockCode=30', 10.92, -0.08, -0.73, 304000.00, 30, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'SGJ', 'controller.php?action=view_stock_charts&StockCode=107', 21.10, 0.44, 2.13, 264133.00, 107, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'SIJL', 'controller.php?action=view_stock_charts&StockCode=71', 25.25, -0.33, -1.29, 7500.00, 71, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'SJ', 'controller.php?action=view_stock_charts&StockCode=7070', 8.80, -0.20, -2.19, 11995.00, 7070, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'SVL', 'controller.php?action=view_stock_charts&StockCode=123', 2.40, 0.00, 0.00, 0.00, 123, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'TCL', 'controller.php?action=view_stock_charts&StockCode=86', 17.61, 0.00, 0.00, 0.00, 86, '2014-02-27 01:31:52'),
('2014-02-26', 'MAIN_INDEX', 'XFUND', 'controller.php?action=view_stock_charts&StockCode=7067', 6.95, 0.00, 0.00, 0.00, 7067, '2014-02-27 01:31:52'),
('2014-02-27', 'ALL_JAMAICAN', 'BIL', 'controller.php?action=view_stock_charts&StockCode=7037', 2.50, 0.00, 0.00, 0.00, 7037, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'BRG', 'controller.php?action=view_stock_charts&StockCode=72', 1.80, 0.00, 0.00, 0.00, 72, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'CAR', 'controller.php?action=view_stock_charts&StockCode=3', 35.00, 0.26, 0.74, 56420.00, 3, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'CBNY', 'controller.php?action=view_stock_charts&StockCode=73', 0.06, 0.00, 0.00, 0.00, 73, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'CCC', 'controller.php?action=view_stock_charts&StockCode=57', 4.60, -0.05, -1.04, 289250.00, 57, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'DG', 'controller.php?action=view_stock_charts&StockCode=6', 5.00, 0.00, 0.00, 0.00, 6, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'GK', 'controller.php?action=view_stock_charts&StockCode=10', 55.00, 0.44, 0.80, 6416.00, 10, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'GLNR', 'controller.php?action=view_stock_charts&StockCode=8', 1.10, 0.00, 0.00, 0.00, 8, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'HL', 'controller.php?action=view_stock_charts&StockCode=59', 8.00, 0.00, 0.00, 0.00, 59, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'JBG', 'controller.php?action=view_stock_charts&StockCode=70', 4.80, -0.09, -1.83, 62787.00, 70, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'JMMB', 'controller.php?action=view_stock_charts&StockCode=102', 7.40, -0.05, -0.67, 500623.00, 102, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'JP', 'controller.php?action=view_stock_charts&StockCode=12', 18.26, 0.00, 0.00, 200.00, 12, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'JSE', 'controller.php?action=view_stock_charts&StockCode=7061', 2.10, 0.00, 0.00, 0.00, 7061, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'KPREIT', 'controller.php?action=view_stock_charts&StockCode=7035', 4.00, 0.00, 0.00, 0.00, 7035, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'KW', 'controller.php?action=view_stock_charts&StockCode=81', 6.00, 0.00, 0.00, 1410.00, 81, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'LIME', 'controller.php?action=view_stock_charts&StockCode=66', 0.43, 0.04, 10.26, 391083.00, 66, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'MBICE', 'controller.php?action=view_stock_charts&StockCode=20', 17.95, 0.00, 0.00, 0.00, 20, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'MIL', 'controller.php?action=view_stock_charts&StockCode=200', 1.90, 0.00, 0.00, 857922.00, 200, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'NCBJ', 'controller.php?action=view_stock_charts&StockCode=95', 19.01, 0.01, 0.05, 20276.00, 95, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'PAL', 'controller.php?action=view_stock_charts&StockCode=25', 95.00, 0.00, 0.00, 0.00, 25, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'PJAM', 'controller.php?action=view_stock_charts&StockCode=26', 48.80, 0.00, 0.00, 0.00, 26, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'PULS', 'controller.php?action=view_stock_charts&StockCode=77', 0.99, 0.00, 0.00, 0.00, 77, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'RJR', 'controller.php?action=view_stock_charts&StockCode=69', 1.35, -0.01, -0.74, 228.00, 69, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'S', 'controller.php?action=view_stock_charts&StockCode=31', 17.10, 0.00, 0.00, 1400.00, 31, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'SALF', 'controller.php?action=view_stock_charts&StockCode=29', 9.00, 0.00, 0.00, 0.00, 29, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'SEP', 'controller.php?action=view_stock_charts&StockCode=30', 10.92, 0.00, 0.00, 0.00, 30, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'SGJ', 'controller.php?action=view_stock_charts&StockCode=107', 21.50, 0.43, 2.04, 4412.00, 107, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'SIJL', 'controller.php?action=view_stock_charts&StockCode=71', 25.90, 0.63, 2.49, 184.00, 71, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'SJ', 'controller.php?action=view_stock_charts&StockCode=7070', 8.60, -0.08, -0.89, 44295.00, 7070, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'SVL', 'controller.php?action=view_stock_charts&StockCode=123', 2.40, 0.00, 0.00, 0.00, 123, NULL),
('2014-02-27', 'ALL_JAMAICAN', 'XFUND', 'controller.php?action=view_stock_charts&StockCode=7067', 7.15, 0.12, 1.73, 22000.00, 7067, NULL),
('2014-02-27', 'CROSS_LISTED', 'FCIB', 'controller.php?action=view_stock_charts&StockCode=78', 80.00, 0.00, 0.00, 0.00, 78, NULL),
('2014-02-27', 'CROSS_LISTED', 'TCL', 'controller.php?action=view_stock_charts&StockCode=86', 17.61, 0.00, 0.00, 0.00, 86, NULL),
('2014-02-27', 'JSE_SELECT', 'CAR', 'controller.php?action=view_stock_charts&StockCode=3', 35.00, 0.26, 0.74, 56420.00, 3, NULL),
('2014-02-27', 'JSE_SELECT', 'CPJ', 'controller.php?action=view_stock_charts&StockCode=7053', 2.70, -0.05, -1.82, 187760.00, 7053, NULL),
('2014-02-27', 'JSE_SELECT', 'DG', 'controller.php?action=view_stock_charts&StockCode=6', 5.00, 0.00, 0.00, 0.00, 6, NULL),
('2014-02-27', 'JSE_SELECT', 'GK', 'controller.php?action=view_stock_charts&StockCode=10', 55.00, 0.44, 0.80, 6416.00, 10, NULL),
('2014-02-27', 'JSE_SELECT', 'GLNR', 'controller.php?action=view_stock_charts&StockCode=8', 1.10, 0.00, 0.00, 0.00, 8, NULL),
('2014-02-27', 'JSE_SELECT', 'JBG', 'controller.php?action=view_stock_charts&StockCode=70', 4.80, -0.09, -1.83, 62787.00, 70, NULL),
('2014-02-27', 'JSE_SELECT', 'JMMB', 'controller.php?action=view_stock_charts&StockCode=102', 7.40, -0.05, -0.67, 500623.00, 102, NULL),
('2014-02-27', 'JSE_SELECT', 'LASD', 'controller.php?action=view_stock_charts&StockCode=7043', 1.30, 0.00, 0.00, 0.00, 7043, NULL),
('2014-02-27', 'JSE_SELECT', 'LASF', 'controller.php?action=view_stock_charts&StockCode=7045', 1.20, -0.10, -7.69, 11000.00, 7045, NULL),
('2014-02-27', 'JSE_SELECT', 'LASM', 'controller.php?action=view_stock_charts&StockCode=7044', 1.15, -0.04, -3.33, 10000.00, 7044, NULL),
('2014-02-27', 'JSE_SELECT', 'LIME', 'controller.php?action=view_stock_charts&StockCode=66', 0.43, 0.04, 10.26, 391083.00, 66, NULL),
('2014-02-27', 'JSE_SELECT', 'MIL', 'controller.php?action=view_stock_charts&StockCode=200', 1.90, 0.00, 0.00, 857922.00, 200, NULL),
('2014-02-27', 'JSE_SELECT', 'NCBJ', 'controller.php?action=view_stock_charts&StockCode=95', 19.01, 0.01, 0.05, 20276.00, 95, NULL),
('2014-02-27', 'JSE_SELECT', 'SGJ', 'controller.php?action=view_stock_charts&StockCode=107', 21.50, 0.43, 2.04, 4412.00, 107, NULL),
('2014-02-27', 'JSE_SELECT', 'SVL', 'controller.php?action=view_stock_charts&StockCode=123', 2.40, 0.00, 0.00, 0.00, 123, NULL),
('2014-02-27', 'MAIN_INDEX', 'BIL', 'controller.php?action=view_stock_charts&StockCode=7037', 2.50, 0.00, 0.00, 0.00, 7037, NULL),
('2014-02-27', 'MAIN_INDEX', 'BRG', 'controller.php?action=view_stock_charts&StockCode=72', 1.80, 0.00, 0.00, 0.00, 72, NULL),
('2014-02-27', 'MAIN_INDEX', 'CAR', 'controller.php?action=view_stock_charts&StockCode=3', 35.00, 0.26, 0.74, 56420.00, 3, NULL),
('2014-02-27', 'MAIN_INDEX', 'CBNY', 'controller.php?action=view_stock_charts&StockCode=73', 0.06, 0.00, 0.00, 0.00, 73, NULL),
('2014-02-27', 'MAIN_INDEX', 'CCC', 'controller.php?action=view_stock_charts&StockCode=57', 4.60, -0.05, -1.04, 289250.00, 57, NULL),
('2014-02-27', 'MAIN_INDEX', 'DG', 'controller.php?action=view_stock_charts&StockCode=6', 5.00, 0.00, 0.00, 0.00, 6, NULL),
('2014-02-27', 'MAIN_INDEX', 'FCIB', 'controller.php?action=view_stock_charts&StockCode=78', 80.00, 0.00, 0.00, 0.00, 78, NULL),
('2014-02-27', 'MAIN_INDEX', 'GK', 'controller.php?action=view_stock_charts&StockCode=10', 55.00, 0.44, 0.80, 6416.00, 10, NULL),
('2014-02-27', 'MAIN_INDEX', 'GLNR', 'controller.php?action=view_stock_charts&StockCode=8', 1.10, 0.00, 0.00, 0.00, 8, NULL),
('2014-02-27', 'MAIN_INDEX', 'HL', 'controller.php?action=view_stock_charts&StockCode=59', 8.00, 0.00, 0.00, 0.00, 59, NULL),
('2014-02-27', 'MAIN_INDEX', 'JBG', 'controller.php?action=view_stock_charts&StockCode=70', 4.80, -0.09, -1.83, 62787.00, 70, NULL),
('2014-02-27', 'MAIN_INDEX', 'JMMB', 'controller.php?action=view_stock_charts&StockCode=102', 7.40, -0.05, -0.67, 500623.00, 102, NULL),
('2014-02-27', 'MAIN_INDEX', 'JP', 'controller.php?action=view_stock_charts&StockCode=12', 18.26, 0.00, 0.00, 200.00, 12, NULL),
('2014-02-27', 'MAIN_INDEX', 'JSE', 'controller.php?action=view_stock_charts&StockCode=7061', 2.10, 0.00, 0.00, 0.00, 7061, NULL),
('2014-02-27', 'MAIN_INDEX', 'KPREIT', 'controller.php?action=view_stock_charts&StockCode=7035', 4.00, 0.00, 0.00, 0.00, 7035, NULL),
('2014-02-27', 'MAIN_INDEX', 'KW', 'controller.php?action=view_stock_charts&StockCode=81', 6.00, 0.00, 0.00, 1410.00, 81, NULL),
('2014-02-27', 'MAIN_INDEX', 'LIME', 'controller.php?action=view_stock_charts&StockCode=66', 0.43, 0.04, 10.26, 391083.00, 66, NULL),
('2014-02-27', 'MAIN_INDEX', 'MBICE', 'controller.php?action=view_stock_charts&StockCode=20', 17.95, 0.00, 0.00, 0.00, 20, NULL),
('2014-02-27', 'MAIN_INDEX', 'MIL', 'controller.php?action=view_stock_charts&StockCode=200', 1.90, 0.00, 0.00, 857922.00, 200, NULL),
('2014-02-27', 'MAIN_INDEX', 'NCBJ', 'controller.php?action=view_stock_charts&StockCode=95', 19.01, 0.01, 0.05, 20276.00, 95, NULL),
('2014-02-27', 'MAIN_INDEX', 'PAL', 'controller.php?action=view_stock_charts&StockCode=25', 95.00, 0.00, 0.00, 0.00, 25, NULL),
('2014-02-27', 'MAIN_INDEX', 'PJAM', 'controller.php?action=view_stock_charts&StockCode=26', 48.80, 0.00, 0.00, 0.00, 26, NULL),
('2014-02-27', 'MAIN_INDEX', 'PULS', 'controller.php?action=view_stock_charts&StockCode=77', 0.99, 0.00, 0.00, 0.00, 77, NULL),
('2014-02-27', 'MAIN_INDEX', 'RJR', 'controller.php?action=view_stock_charts&StockCode=69', 1.35, -0.01, -0.74, 228.00, 69, NULL),
('2014-02-27', 'MAIN_INDEX', 'S', 'controller.php?action=view_stock_charts&StockCode=31', 17.10, 0.00, 0.00, 1400.00, 31, NULL),
('2014-02-27', 'MAIN_INDEX', 'SALF', 'controller.php?action=view_stock_charts&StockCode=29', 9.00, 0.00, 0.00, 0.00, 29, NULL),
('2014-02-27', 'MAIN_INDEX', 'SEP', 'controller.php?action=view_stock_charts&StockCode=30', 10.92, 0.00, 0.00, 0.00, 30, NULL),
('2014-02-27', 'MAIN_INDEX', 'SGJ', 'controller.php?action=view_stock_charts&StockCode=107', 21.50, 0.43, 2.04, 4412.00, 107, NULL),
('2014-02-27', 'MAIN_INDEX', 'SIJL', 'controller.php?action=view_stock_charts&StockCode=71', 25.90, 0.63, 2.49, 184.00, 71, NULL),
('2014-02-27', 'MAIN_INDEX', 'SJ', 'controller.php?action=view_stock_charts&StockCode=7070', 8.60, -0.08, -0.89, 44295.00, 7070, NULL),
('2014-02-27', 'MAIN_INDEX', 'SVL', 'controller.php?action=view_stock_charts&StockCode=123', 2.40, 0.00, 0.00, 0.00, 123, NULL),
('2014-02-27', 'MAIN_INDEX', 'TCL', 'controller.php?action=view_stock_charts&StockCode=86', 17.61, 0.00, 0.00, 0.00, 86, NULL),
('2014-02-27', 'MAIN_INDEX', 'XFUND', 'controller.php?action=view_stock_charts&StockCode=7067', 7.15, 0.12, 1.73, 22000.00, 7067, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_market_history`
--

CREATE TABLE IF NOT EXISTS `daily_market_history` (
  `report_date` date NOT NULL,
  `index_name` varchar(32) NOT NULL,
  `date` varchar(45) NOT NULL,
  `value` decimal(13,2) NOT NULL,
  `change` decimal(13,2) NOT NULL,
  `change_perc` decimal(9,2) NOT NULL,
  `volume_traded` decimal(13,2) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_date`,`index_name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_market_history`
--

INSERT INTO `daily_market_history` (`report_date`, `index_name`, `date`, `value`, `change`, `change_perc`, `volume_traded`, `date_created`) VALUES
('2014-02-26', 'ALL_JAMAICAN', '2014-02-17', 84050.97, -269.61, -0.32, 25033251.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-18', 84779.65, 728.68, 0.87, 1518056.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-19', 84245.61, -534.04, -0.63, 2591851.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-20', 83939.86, -305.75, -0.36, 4165523.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-21', 84535.18, 595.32, 0.71, 5678403.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-24', 83937.40, -597.78, -0.71, 38792506.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-25', 83960.12, 22.72, 0.03, 9146823.00, '2014-02-27 01:10:49'),
('2014-02-26', 'ALL_JAMAICAN', '2014-02-26', 84045.57, 85.45, 0.10, 8130112.00, '2014-02-27 01:10:49'),
('2014-02-26', 'CROSS_LISTED', '2014-02-17', 666.80, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-18', 666.80, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-19', 666.80, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-20', 666.80, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-21', 660.58, -6.22, -0.93, 25455.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-24', 660.58, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-25', 660.58, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'CROSS_LISTED', '2014-02-26', 660.58, 0.00, 0.00, 0.00, '2014-02-27 01:10:51'),
('2014-02-26', 'JSE_SELECT', '2014-02-17', 2256.81, -8.76, -0.39, 25009327.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-18', 2279.56, 22.75, 1.01, 1811570.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-19', 2278.47, -1.09, -0.05, 2469378.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-20', 2262.83, -15.64, -0.69, 3394201.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-21', 2281.99, 19.16, 0.85, 5449270.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-24', 2265.06, -16.93, -0.74, 8834509.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-25', 2267.19, 2.13, 0.09, 9047370.00, '2014-02-27 01:10:50'),
('2014-02-26', 'JSE_SELECT', '2014-02-26', 2283.43, 16.24, 0.72, 4610652.00, '2014-02-27 01:10:50'),
('2014-02-26', 'MAIN_INDEX', '2014-02-17', 79436.55, -177.74, -0.22, 25498480.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-18', 79916.92, 480.37, 0.60, 1518056.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-19', 79564.87, -352.05, -0.44, 3452051.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-20', 79363.31, -201.56, -0.25, 4656123.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-21', 79531.75, 168.44, 0.21, 5706858.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-24', 79137.68, -394.07, -0.50, 38802506.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-25', 79152.65, 14.97, 0.02, 9479571.00, '2014-02-27 01:10:51'),
('2014-02-26', 'MAIN_INDEX', '2014-02-26', 79208.99, 56.34, 0.07, 8558832.00, '2014-02-27 01:10:51'),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-17', 84050.97, -269.61, -0.32, 25033251.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-18', 84779.65, 728.68, 0.87, 1518056.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-19', 84245.61, -534.04, -0.63, 2591851.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-20', 83939.86, -305.75, -0.36, 4165523.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-21', 84535.18, 595.32, 0.71, 5678403.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-24', 83937.40, -597.78, -0.71, 38792506.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-25', 83960.12, 22.72, 0.03, 9146823.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-26', 84045.57, 85.45, 0.10, 8130112.00, NULL),
('2014-02-27', 'ALL_JAMAICAN', '2014-02-27', 84587.33, 541.76, 0.64, 2258906.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-17', 666.80, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-18', 666.80, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-19', 666.80, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-20', 666.80, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-21', 660.58, -6.22, -0.93, 25455.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-24', 660.58, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-25', 660.58, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-26', 660.58, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'CROSS_LISTED', '2014-02-27', 660.58, 0.00, 0.00, 0.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-17', 2256.81, -8.76, -0.39, 25009327.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-18', 2279.56, 22.75, 1.01, 1811570.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-19', 2278.47, -1.09, -0.05, 2469378.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-20', 2262.83, -15.64, -0.69, 3394201.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-21', 2281.99, 19.16, 0.85, 5449270.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-24', 2265.06, -16.93, -0.74, 8834509.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-25', 2267.19, 2.13, 0.09, 9047370.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-26', 2283.43, 16.24, 0.72, 4610652.00, NULL),
('2014-02-27', 'JSE_SELECT', '2014-02-27', 2299.48, 16.05, 0.70, 1899939.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-17', 79436.55, -177.74, -0.22, 25498480.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-18', 79916.92, 480.37, 0.60, 1518056.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-19', 79564.87, -352.05, -0.44, 3452051.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-20', 79363.31, -201.56, -0.25, 4656123.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-21', 79531.75, 168.44, 0.21, 5706858.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-24', 79137.68, -394.07, -0.50, 38802506.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-25', 79152.65, 14.97, 0.02, 9479571.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-26', 79208.99, 56.34, 0.07, 8558832.00, NULL),
('2014-02-27', 'MAIN_INDEX', '2014-02-27', 79566.13, 357.14, 0.45, 2402386.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_market_perfromance`
--

CREATE TABLE IF NOT EXISTS `daily_market_perfromance` (
  `report_date` date NOT NULL,
  `index_name` varchar(32) NOT NULL,
  `volume_traded` decimal(18,2) DEFAULT NULL,
  `week_to_date` decimal(11,2) DEFAULT NULL,
  `month_to_date` decimal(11,2) DEFAULT NULL,
  `quarter_to_date` decimal(11,2) DEFAULT NULL,
  `year_to_date` decimal(11,2) DEFAULT NULL,
  `change_name` varchar(45) DEFAULT NULL,
  `change_value` varchar(32) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_date`,`index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_market_perfromance`
--

INSERT INTO `daily_market_perfromance` (`report_date`, `index_name`, `volume_traded`, `week_to_date`, `month_to_date`, `quarter_to_date`, `year_to_date`, `change_name`, `change_value`, `date_created`) VALUES
('2014-02-26', 'ALL_JAMAICAN', 8130112.00, -0.58, -1.57, 2.68, 2.68, '2013 Change', '-10.21', '2014-02-27 01:10:47'),
('2014-02-26', 'CROSS_LISTED', 0.00, 0.00, -8.80, -10.77, -10.77, '2013 Change', '-15.29', '2014-02-27 01:10:49'),
('2014-02-26', 'JSE_SELECT', 4610652.00, 0.06, 0.06, 4.93, 4.93, '2013 Change', '-12.59', '2014-02-27 01:20:20'),
('2014-02-26', 'MAIN_INDEX', 8558832.00, -0.41, -3.86, -1.77, -1.77, '2013 Change', '-12.45', '2014-02-27 01:10:49'),
('2014-02-27', 'ALL_JAMAICAN', 2258906.00, 0.06, -0.93, 3.34, 3.34, '2013 Change', '-10.21', NULL),
('2014-02-27', 'CROSS_LISTED', 0.00, 0.00, -8.80, -10.77, -10.77, '2013 Change', '-15.29', NULL),
('2014-02-27', 'JSE_SELECT', 1899939.00, 0.77, 0.77, 5.67, 5.67, '2013 Change', '-12.59', NULL),
('2014-02-27', 'MAIN_INDEX', 2402386.00, 0.04, -3.43, -1.32, -1.32, '2013 Change', '-12.45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_market_report`
--

CREATE TABLE IF NOT EXISTS `daily_market_report` (
  `report_date` date NOT NULL,
  `index_name` varchar(16) NOT NULL,
  `one_week_graph` varchar(1024) NOT NULL,
  `one_month_graph` varchar(1024) NOT NULL,
  `three_month_graph` varchar(1024) NOT NULL,
  `six_month_graph` varchar(1024) NOT NULL,
  `one_year_graph` varchar(1024) NOT NULL,
  `value_date` date NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `change` decimal(10,2) NOT NULL,
  `change_perc` decimal(10,2) NOT NULL,
  `change_dir` varchar(32) NOT NULL,
  `vol` decimal(10,2) NOT NULL,
  `market_capitalization` decimal(10,2) NOT NULL,
  `change_1969` decimal(10,2) NOT NULL,
  `wtd` decimal(10,2) NOT NULL,
  `mtd` decimal(10,2) NOT NULL,
  `qtd` decimal(10,2) NOT NULL,
  `ytd` decimal(10,2) NOT NULL,
  `wtd_direction` varchar(32) NOT NULL,
  `mtd_direction` varchar(32) NOT NULL,
  `qtd_direction` varchar(32) NOT NULL,
  `ytd_direction` varchar(32) NOT NULL,
  `change_perc_dir` varchar(32) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_date`,`index_name`),
  KEY `report_date` (`report_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_market_report`
--

INSERT INTO `daily_market_report` (`report_date`, `index_name`, `one_week_graph`, `one_month_graph`, `three_month_graph`, `six_month_graph`, `one_year_graph`, `value_date`, `value`, `change`, `change_perc`, `change_dir`, `vol`, `market_capitalization`, `change_1969`, `wtd`, `mtd`, `qtd`, `ytd`, `wtd_direction`, `mtd_direction`, `qtd_direction`, `ytd_direction`, `change_perc_dir`, `date_created`) VALUES
('2014-02-26', 'ALL_JAMAICAN', '84245.610;83939.860;84535.180;83937.400;83960.120;84045.570\nFeb 19, 2014 - 84,245.61;Feb 20, 2014 - 83,939.86;Feb 21, 2014 - 84,535.18;Feb 24, 2014 - 83,937.40;Feb 25, 2014 - 83,960.12;Feb 26, 2014 - 84,045.57\n19;20;21;24;25;26', '81538.900;81104.250;82580.180;83755.770;85382.430;83938.970;83304.430;83569.590;83718.670;83953.110;83572.850;83682.300;83591.650;83565.100;84320.580;84050.970;84779.650;84245.610;83939.860;84535.180;83937.400;83960.120;84045.570\nJan 27, 2014 - 81,538.90;Jan 28, 2014 - 81,104.25;Jan 29, 2014 - 82,580.18;Jan 30, 2014 - 83,755.77;Jan 31, 2014 - 85,382.43;Feb 03, 2014 - 83,938.97;Feb 04, 2014 - 83,304.43;Feb 05, 2014 - 83,569.59;Feb 06, 2014 - 83,718.67;Feb 07, 2014 - 83,953.11;Feb 10, 2014 - 83,572.85;Feb 11, 2014 - 83,682.30;Feb 12, 2014 - 83,591.65;Feb 13, 2014 - 83,565.10;Feb 14, 2014 - 84,320.58;Feb 17, 2014 - 84,050.97;Feb 18, 2014 - 84,779.65;Feb 19, 2014 - 84,245.61;Feb 20, 2014 - 83,939.86;Feb 21, 2014 - 84,535.18;Feb 24, 2014 - 83,937.40;Feb 25, 2014 - 83,960.12;Feb 26, 2014 - 84,045.57\n27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26', '75927.870;76514.170;78752.850;78431.710;79281.710;79477.120;79316.510;80737.350;78657.270;78571.810;77582.400;77202.680;76761.490;76879.670;77377.080;78305.800;78575.660;78902.490;79596.600;79357.400;79788.720;81850.040;82410.130;81695.230;80897.300;80359.750;81032.290;80712.270;80534.130;81249.600;81120.350;81083.430;81669.930;81207.740;80747.320;81160.930;82023.810;81413.320;81209.110;81538.900;81104.250;82580.180;83755.770;85382.430;83938.970;83304.430;83569.590;83718.670;83953.110;83572.850;83682.300;83591.650;83565.100;84320.580;84050.970;84779.650;84245.610;83939.860;84535.180;83937.400;83960.120;84045.570\nNov 28, 2013 - 75,927.87;Nov 29, 2013 - 76,514.17;Dec 02, 2013 - 78,752.85;Dec 03, 2013 - 78,431.71;Dec 04, 2013 - 79,281.71;Dec 05, 2013 - 79,477.12;Dec 06, 2013 - 79,316.51;Dec 09, 2013 - 80,737.35;Dec 10, 2013 - 78,657.27;Dec 11, 2013 - 78,571.81;Dec 12, 2013 - 77,582.40;Dec 13, 2013 - 77,202.68;Dec 16, 2013 - 76,761.49;Dec 17, 2013 - 76,879.67;Dec 18, 2013 - 77,377.08;Dec 19, 2013 - 78,305.80;Dec ', '85321.120;84269.540;85890.590;84848.720;84535.650;84970.580;85268.800;85360.920;85834.210;85883.530;85064.080;85194.580;84897.190;84944.620;84259.890;84933.870;83768.420;83746.400;83707.490;84222.540;83992.980;84371.490;85339.460;85828.920;85322.570;84194.890;83969.260;83655.660;82897.260;81616.210;82309.510;82142.910;81795.870;80796.700;80104.390;79631.260;80536.700;80507.910;79936.650;80244.640;81139.070;79401.380;79338.150;79677.090;80307.250;81499.650;79425.620;78448.760;79975.720;78607.710;78528.160;79148.110;78125.430;77642.310;76832.370;75996.400;76416.740;75674.020;75823.390;76339.890;76201.400;76477.490;76704.530;75927.870;76514.170;78752.850;78431.710;79281.710;79477.120;79316.510;80737.350;78657.270;78571.810;77582.400;77202.680;76761.490;76879.670;77377.080;78305.800;78575.660;78902.490;79596.600;79357.400;79788.720;81850.040;82410.130;81695.230;80897.300;80359.750;81032.290;80712.270;80534.130;81249.600;81120.350;81083.430;81669.930;81207.740;80747.320;81160.930;82023.810;81413.320;81209.110;8153', '78162.230;80832.810;81513.700;81444.620;81472.210;79677.670;81214.310;78919.180;79196.890;78054.120;78497.970;78601.580;78450.440;78356.970;78387.490;77704.160;78181.030;78325.370;77254.060;77474.720;77831.830;77776.940;80798.120;80186.090;78775.070;80604.280;81102.600;81672.390;81491.250;81276.710;80950.740;81138.970;81128.250;81599.690;81611.380;81977.100;81969.950;81434.500;81126.410;81895.100;82023.680;82489.340;82484.350;83274.180;83282.860;82508.010;83377.600;82831.650;83660.420;83925.360;85058.310;84628.180;84573.640;84600.900;85125.320;86149.990;86596.660;86309.820;87761.340;87949.820;88443.970;88443.290;89987.540;89814.510;89988.220;89693.890;89195.420;89512.010;89878.950;89932.440;91209.760;91534.150;90814.630;89696.440;90039.730;90562.680;90483.620;89631.980;88742.300;88512.590;88424.480;88043.020;87942.260;88893.960;89037.690;88909.200;90520.520;88233.550;88152.900;88235.870;87706.140;88174.960;89848.460;87537.580;87749.760;88586.880;87481.850;87448.450;88155.220;88054.230;88373.070;87722.150;8736', '2014-02-26', 84045.57, 85.45, 0.10, 'images/mov_up.gif', 8130112.00, 0.00, 0.00, -0.58, -1.57, 2.68, 2.68, 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', '2014-02-27 00:55:50'),
('2014-02-26', 'CROSS_LISTED', '666.800;666.800;660.580;660.580;660.580;660.580\nFeb 19, 2014 - 666.80;Feb 20, 2014 - 666.80;Feb 21, 2014 - 660.58;Feb 24, 2014 - 660.58;Feb 25, 2014 - 660.58;Feb 26, 2014 - 660.58\n19;20;21;24;25;26', '724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800;666.800;666.800;666.800;666.800;660.580;660.580;660.580;660.580\nJan 27, 2014 - 724.34;Jan 28, 2014 - 724.34;Jan 29, 2014 - 724.34;Jan 30, 2014 - 724.34;Jan 31, 2014 - 724.34;Feb 03, 2014 - 724.34;Feb 04, 2014 - 724.34;Feb 05, 2014 - 724.34;Feb 06, 2014 - 660.58;Feb 07, 2014 - 668.55;Feb 10, 2014 - 668.55;Feb 11, 2014 - 666.80;Feb 12, 2014 - 666.80;Feb 13, 2014 - 666.80;Feb 14, 2014 - 666.80;Feb 17, 2014 - 666.80;Feb 18, 2014 - 666.80;Feb 19, 2014 - 666.80;Feb 20, 2014 - 666.80;Feb 21, 2014 - 660.58;Feb 24, 2014 - 660.58;Feb 25, 2014 - 660.58;Feb 26, 2014 - 660.58\n27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26', '738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;732.310;732.310;732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800;666.800;666.800;666.800;666.800;660.580;660.580;660.580;660.580\nNov 28, 2013 - 738.46;Nov 29, 2013 - 738.46;Dec 02, 2013 - 738.46;Dec 03, 2013 - 738.46;Dec 04, 2013 - 738.46;Dec 05, 2013 - 738.46;Dec 06, 2013 - 738.46;Dec 09, 2013 - 738.46;Dec 10, 2013 - 738.46;Dec 11, 2013 - 738.46;Dec 12, 2013 - 738.46;Dec 13, 2013 - 738.46;Dec 16, 2013 - 738.46;Dec 17, 2013 - 738.46;Dec 18, 2013 - 738.46;Dec 19, 2013 - 738.46;Dec 20, 2013 - 738.46;Dec 23, 2013 - 738.46;Dec 24, 2013 - 740.28;Dec 27, 2013 - 740.28;Dec 30, 2013 - 740.28;Dec 31, 2013 - 740.28;Jan 02, 2014 - 740.28;Jan 03, 2014 - 740.28;', '793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;738.460;738.460;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;732.310;732.310;732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800;666.800;666.800;666.800;666.800;660.580;660.580;660.580;660.580\nAug 30, 2013 - 793.73;Se', '857.350;854.860;854.860;848.980;848.980;848.980;848.980;848.980;848.980;848.980;849.000;849.000;826.890;826.890;826.890;826.890;826.890;826.890;826.890;826.890;774.380;774.380;774.380;774.380;774.380;774.380;774.380;774.380;802.020;804.780;804.780;804.780;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;799.260;799.260;799.260;799.260;799.260;799.260;799.810;799.810;799.810;799.810;799.810;799.810;799.810;799.810;799.860;799.860;799.530;799.530;799.530;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.260;799.260;799.260;799.260;799.260;799.260;799.260;799.260;793.730;793.730;793.730;793.730;793.730;793.730;793.730;', '2014-02-26', 660.58, 0.00, 0.00, 'images/mov_none.gif', 0.00, 0.00, 0.00, 0.00, -8.80, -10.77, -10.77, 'images/mov_none.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_none.gif', '2014-02-27 01:10:54'),
('2014-02-26', 'JSE_SELECT', '2278.470;2262.830;2281.990;2265.060;2267.190;2283.430\nFeb 19, 2014 - 2,278.47;Feb 20, 2014 - 2,262.83;Feb 21, 2014 - 2,281.99;Feb 24, 2014 - 2,265.06;Feb 25, 2014 - 2,267.19;Feb 26, 2014 - 2,283.43\n19;20;21;24;25;26', '2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.050;2253.540;2265.570;2256.810;2279.560;2278.470;2262.830;2281.990;2265.060;2267.190;2283.430\nJan 27, 2014 - 2,222.45;Jan 28, 2014 - 2,214.76;Jan 29, 2014 - 2,229.74;Jan 30, 2014 - 2,218.74;Jan 31, 2014 - 2,281.99;Feb 03, 2014 - 2,238.46;Feb 04, 2014 - 2,233.20;Feb 05, 2014 - 2,236.90;Feb 06, 2014 - 2,251.44;Feb 07, 2014 - 2,244.11;Feb 10, 2014 - 2,250.65;Feb 11, 2014 - 2,255.24;Feb 12, 2014 - 2,255.05;Feb 13, 2014 - 2,253.54;Feb 14, 2014 - 2,265.57;Feb 17, 2014 - 2,256.81;Feb 18, 2014 - 2,279.56;Feb 19, 2014 - 2,278.47;Feb 20, 2014 - 2,262.83;Feb 21, 2014 - 2,281.99;Feb 24, 2014 - 2,265.06;Feb 25, 2014 - 2,267.19;Feb 26, 2014 - 2,283.43\n27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26', '2074.860;2093.370;2164.850;2151.310;2181.360;2188.010;2182.560;2222.960;2155.860;2153.620;2123.020;2108.740;2100.060;2099.190;2114.790;2141.230;2152.310;2156.420;2176.670;2169.380;2174.490;2176.170;2178.640;2225.440;2207.410;2189.630;2205.870;2188.410;2198.730;2230.340;2220.830;2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.050;2253.540;2265.570;2256.810;2279.560;2278.470;2262.830;2281.990;2265.060;2267.190;2283.430\nNov 28, 2013 - 2,074.86;Nov 29, 2013 - 2,093.37;Dec 02, 2013 - 2,164.85;Dec 03, 2013 - 2,151.31;Dec 04, 2013 - 2,181.36;Dec 05, 2013 - 2,188.01;Dec 06, 2013 - 2,182.56;Dec 09, 2013 - 2,222.96;Dec 10, 2013 - 2,155.86;Dec 11, 2013 - 2,153.62;Dec 12, 2013 - 2,123.02;Dec 13, 2013 - 2,108.74;Dec 16, 2013 - 2,100.06;Dec 17, 2013 - 2,099.19;Dec 18, 2013 - 2,114.79;Dec 19, 2013 - 2,141.23;Dec 20, 2013 - 2,152.31;Dec 23, 2013 - 2,156.42;Dec 24, 2013 - 2,176.67;Dec 27, 20', '2353.970;2321.700;2372.660;2340.000;2330.160;2343.800;2353.080;2355.970;2370.700;2372.740;2347.060;2351.190;2342.820;2338.510;2317.110;2338.230;2301.760;2301.810;2303.520;2319.660;2312.470;2324.330;2349.680;2368.060;2354.050;2316.720;2311.920;2302.720;2283.340;2244.610;2267.130;2261.630;2250.580;2216.900;2198.350;2188.350;2215.330;2214.500;2198.010;2207.730;2236.120;2181.630;2179.650;2190.250;2208.280;2245.610;2180.640;2149.880;2198.360;2156.090;2153.600;2174.180;2140.760;2130.370;2103.820;2075.780;2088.780;2064.730;2066.220;2078.990;2076.500;2090.980;2098.280;2074.860;2093.370;2164.850;2151.310;2181.360;2188.010;2182.560;2222.960;2155.860;2153.620;2123.020;2108.740;2100.060;2099.190;2114.790;2141.230;2152.310;2156.420;2176.670;2169.380;2174.490;2176.170;2178.640;2225.440;2207.410;2189.630;2205.870;2188.410;2198.730;2230.340;2220.830;2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.24', '2144.020;2227.620;2241.890;2238.790;2238.030;2178.910;2233.620;2162.130;2166.890;2131.120;2145.210;2148.300;2146.460;2142.400;2143.480;2122.140;2123.130;2131.810;2097.190;2106.000;2126.960;2124.670;2219.750;2208.370;2175.200;2223.000;2239.130;2246.660;2242.740;2232.920;2222.510;2228.140;2225.260;2239.980;2238.360;2249.810;2249.730;2232.780;2222.870;2249.930;2253.790;2267.960;2266.900;2291.320;2291.890;2263.660;2291.130;2273.490;2299.190;2306.980;2338.510;2324.720;2318.880;2319.700;2336.760;2365.230;2383.550;2374.210;2419.710;2425.590;2441.060;2434.580;2483.290;2483.940;2487.770;2475.920;2460.020;2469.930;2478.220;2479.910;2521.470;2530.760;2507.890;2477.880;2486.120;2502.210;2500.100;2473.480;2449.230;2446.160;2439.860;2426.360;2423.280;2453.070;2459.240;2452.970;2502.530;2430.940;2428.380;2431.770;2414.400;2428.790;2473.790;2402.730;2409.370;2437.850;2402.440;2407.750;2432.400;2418.150;2430.630;2409.830;2399.600;2385.800;2380.610;2386.450;2384.320;2392.700;2389.890;2379.300;2358.190;2373.350;2366.090;2371.30', '2014-02-26', 2283.43, 16.24, 0.72, 'images/mov_up.gif', 4610652.00, 0.00, 0.00, 0.06, 0.06, 4.93, 4.93, 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', '2014-02-27 01:10:54'),
('2014-02-26', 'MAIN_INDEX', '79564.870;79363.310;79531.750;79137.680;79152.650;79208.990\nFeb 19, 2014 - 79,564.87;Feb 20, 2014 - 79,363.31;Feb 21, 2014 - 79,531.75;Feb 24, 2014 - 79,137.68;Feb 25, 2014 - 79,152.65;Feb 26, 2014 - 79,208.99\n19;20;21;24;25;26', '79854.040;79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510;79133.760;79116.250;79614.290;79436.550;79916.920;79564.870;79363.310;79531.750;79137.680;79152.650;79208.990\nJan 27, 2014 - 79,854.04;Jan 28, 2014 - 79,567.50;Jan 29, 2014 - 80,540.48;Jan 30, 2014 - 81,315.47;Jan 31, 2014 - 82,387.81;Feb 03, 2014 - 81,436.23;Feb 04, 2014 - 81,017.93;Feb 05, 2014 - 81,192.73;Feb 06, 2014 - 78,993.48;Feb 07, 2014 - 79,435.22;Feb 10, 2014 - 79,184.54;Feb 11, 2014 - 79,193.51;Feb 12, 2014 - 79,133.76;Feb 13, 2014 - 79,116.25;Feb 14, 2014 - 79,614.29;Feb 17, 2014 - 79,436.55;Feb 18, 2014 - 79,916.92;Feb 19, 2014 - 79,564.87;Feb 20, 2014 - 79,363.31;Feb 21, 2014 - 79,531.75;Feb 24, 2014 - 79,137.68;Feb 25, 2014 - 79,152.65;Feb 26, 2014 - 79,208.99\n27;28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26', '77144.570;77481.830;78769.580;78584.850;79073.800;79186.200;79093.810;79911.120;78714.600;78665.440;78096.310;77877.890;77624.110;77692.090;77978.210;78512.420;78667.650;78855.650;79337.370;79199.780;79447.880;80633.550;81002.810;80531.480;80005.430;79651.030;80094.420;79883.450;79766.010;79950.500;79865.290;79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;79854.040;79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510;79133.760;79116.250;79614.290;79436.550;79916.920;79564.870;79363.310;79531.750;79137.680;79152.650;79208.990\nNov 28, 2013 - 77,144.57;Nov 29, 2013 - 77,481.83;Dec 02, 2013 - 78,769.58;Dec 03, 2013 - 78,584.85;Dec 04, 2013 - 79,073.80;Dec 05, 2013 - 79,186.20;Dec 06, 2013 - 79,093.81;Dec 09, 2013 - 79,911.12;Dec 10, 2013 - 78,714.60;Dec 11, 2013 - 78,665.44;Dec 12, 2013 - 78,096.31;Dec 13, 2013 - 77,877.89;Dec 16, 2013 - 77,624.11;Dec 17, 2013 - 77,692.09;Dec 18, 2013 - 77,978.21;Dec 19, 2013 - 78,512.42;Dec ', '85039.910;84442.250;85363.570;84771.430;84593.490;84840.690;85010.180;85062.530;85331.520;85359.550;84893.830;84968.000;84798.970;84825.930;84436.770;84819.820;84157.440;84144.930;84122.810;84415.540;84285.070;84500.200;85050.340;85328.520;85040.740;84399.820;84271.590;84093.360;83662.330;82934.250;83328.280;83233.600;83036.360;82468.480;82075.010;81806.110;82320.710;82304.350;81979.680;82154.720;82663.070;81675.460;81639.520;81832.160;82190.300;82868.000;81689.240;81134.050;82001.880;78679.410;78634.190;78989.090;78407.850;78133.270;77667.370;77186.500;77428.290;77001.060;77086.980;77384.080;77301.920;77460.730;77591.330;77144.570;77481.830;78769.580;78584.850;79073.800;79186.200;79093.810;79911.120;78714.600;78665.440;78096.310;77877.890;77624.110;77692.090;77978.210;78512.420;78667.650;78855.650;79337.370;79199.780;79447.880;80633.550;81002.810;80531.480;80005.430;79651.030;80094.420;79883.450;79766.010;79950.500;79865.290;79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;7985', '83905.900;85308.130;85694.890;85384.570;85400.240;84380.910;85253.740;83950.070;84107.810;83458.690;83711.640;83770.500;82665.870;82612.780;82630.120;82241.970;82512.840;82594.830;81986.300;82111.640;79894.890;79863.720;81579.810;81232.160;80430.670;81469.700;81752.760;82076.410;83246.990;83252.470;83067.310;83174.230;83040.800;83308.580;83315.220;83522.960;83518.890;83214.750;83039.750;83476.380;83549.410;83813.920;83811.090;84259.730;84264.650;83824.520;84318.470;84008.360;84479.120;84629.610;85273.150;85410.860;85379.880;85395.370;85693.250;86275.280;86529.000;86366.070;87190.560;87297.620;87578.310;87577.920;88455.090;88356.800;88455.470;87778.900;87495.760;87675.590;87884.020;87914.400;88639.940;88849.670;88440.970;87805.820;88000.810;88297.860;88252.950;87769.200;87263.840;87135.910;87085.870;86853.910;86796.670;87337.260;87434.180;87361.200;88276.460;86977.410;86931.610;86978.730;86677.830;86944.140;87894.710;86582.090;86702.610;87178.110;86550.430;86531.460;86933.150;86875.750;87056.960;86687.020;8648', '2014-02-26', 79208.99, 56.34, 0.07, 'images/mov_up.gif', 8558832.00, 0.00, 0.00, -0.41, -3.86, -1.77, -1.77, 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_up.gif', '2014-02-27 01:10:55'),
('2014-02-27', 'ALL_JAMAICAN', '83939.860;84535.180;83937.400;83960.120;84045.570;84587.330\nFeb 20, 2014 - 83,939.86;Feb 21, 2014 - 84,535.18;Feb 24, 2014 - 83,937.40;Feb 25, 2014 - 83,960.12;Feb 26, 2014 - 84,045.57;Feb 27, 2014 - 84,587.33\n20;21;24;25;26;27', '81104.250;82580.180;83755.770;85382.430;83938.970;83304.430;83569.590;83718.670;83953.110;83572.850;83682.300;83591.650;83565.100;84320.580;84050.970;84779.650;84245.610;83939.860;84535.180;83937.400;83960.120;84045.570;84587.330\nJan 28, 2014 - 81,104.25;Jan 29, 2014 - 82,580.18;Jan 30, 2014 - 83,755.77;Jan 31, 2014 - 85,382.43;Feb 03, 2014 - 83,938.97;Feb 04, 2014 - 83,304.43;Feb 05, 2014 - 83,569.59;Feb 06, 2014 - 83,718.67;Feb 07, 2014 - 83,953.11;Feb 10, 2014 - 83,572.85;Feb 11, 2014 - 83,682.30;Feb 12, 2014 - 83,591.65;Feb 13, 2014 - 83,565.10;Feb 14, 2014 - 84,320.58;Feb 17, 2014 - 84,050.97;Feb 18, 2014 - 84,779.65;Feb 19, 2014 - 84,245.61;Feb 20, 2014 - 83,939.86;Feb 21, 2014 - 84,535.18;Feb 24, 2014 - 83,937.40;Feb 25, 2014 - 83,960.12;Feb 26, 2014 - 84,045.57;Feb 27, 2014 - 84,587.33\n28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26;27', '76514.170;78752.850;78431.710;79281.710;79477.120;79316.510;80737.350;78657.270;78571.810;77582.400;77202.680;76761.490;76879.670;77377.080;78305.800;78575.660;78902.490;79596.600;79357.400;79788.720;81850.040;82410.130;81695.230;80897.300;80359.750;81032.290;80712.270;80534.130;81249.600;81120.350;81083.430;81669.930;81207.740;80747.320;81160.930;82023.810;81413.320;81209.110;81538.900;81104.250;82580.180;83755.770;85382.430;83938.970;83304.430;83569.590;83718.670;83953.110;83572.850;83682.300;83591.650;83565.100;84320.580;84050.970;84779.650;84245.610;83939.860;84535.180;83937.400;83960.120;84045.570;84587.330\nNov 29, 2013 - 76,514.17;Dec 02, 2013 - 78,752.85;Dec 03, 2013 - 78,431.71;Dec 04, 2013 - 79,281.71;Dec 05, 2013 - 79,477.12;Dec 06, 2013 - 79,316.51;Dec 09, 2013 - 80,737.35;Dec 10, 2013 - 78,657.27;Dec 11, 2013 - 78,571.81;Dec 12, 2013 - 77,582.40;Dec 13, 2013 - 77,202.68;Dec 16, 2013 - 76,761.49;Dec 17, 2013 - 76,879.67;Dec 18, 2013 - 77,377.08;Dec 19, 2013 - 78,305.80;Dec 20, 2013 - 78,575.66;Dec ', '84269.540;85890.590;84848.720;84535.650;84970.580;85268.800;85360.920;85834.210;85883.530;85064.080;85194.580;84897.190;84944.620;84259.890;84933.870;83768.420;83746.400;83707.490;84222.540;83992.980;84371.490;85339.460;85828.920;85322.570;84194.890;83969.260;83655.660;82897.260;81616.210;82309.510;82142.910;81795.870;80796.700;80104.390;79631.260;80536.700;80507.910;79936.650;80244.640;81139.070;79401.380;79338.150;79677.090;80307.250;81499.650;79425.620;78448.760;79975.720;78607.710;78528.160;79148.110;78125.430;77642.310;76832.370;75996.400;76416.740;75674.020;75823.390;76339.890;76201.400;76477.490;76704.530;75927.870;76514.170;78752.850;78431.710;79281.710;79477.120;79316.510;80737.350;78657.270;78571.810;77582.400;77202.680;76761.490;76879.670;77377.080;78305.800;78575.660;78902.490;79596.600;79357.400;79788.720;81850.040;82410.130;81695.230;80897.300;80359.750;81032.290;80712.270;80534.130;81249.600;81120.350;81083.430;81669.930;81207.740;80747.320;81160.930;82023.810;81413.320;81209.110;81538.900;8110', '78162.230;80832.810;81513.700;81444.620;81472.210;79677.670;81214.310;78919.180;79196.890;78054.120;78497.970;78601.580;78450.440;78356.970;78387.490;77704.160;78181.030;78325.370;77254.060;77474.720;77831.830;77776.940;80798.120;80186.090;78775.070;80604.280;81102.600;81672.390;81491.250;81276.710;80950.740;81138.970;81128.250;81599.690;81611.380;81977.100;81969.950;81434.500;81126.410;81895.100;82023.680;82489.340;82484.350;83274.180;83282.860;82508.010;83377.600;82831.650;83660.420;83925.360;85058.310;84628.180;84573.640;84600.900;85125.320;86149.990;86596.660;86309.820;87761.340;87949.820;88443.970;88443.290;89987.540;89814.510;89988.220;89693.890;89195.420;89512.010;89878.950;89932.440;91209.760;91534.150;90814.630;89696.440;90039.730;90562.680;90483.620;89631.980;88742.300;88512.590;88424.480;88043.020;87942.260;88893.960;89037.690;88909.200;90520.520;88233.550;88152.900;88235.870;87706.140;88174.960;89848.460;87537.580;87749.760;88586.880;87481.850;87448.450;88155.220;88054.230;88373.070;87722.150;8736', '2014-02-27', 84587.33, 541.76, 0.64, 'images/mov_up.gif', 2258906.00, 0.00, 0.00, 0.06, -0.93, 3.34, 3.34, 'images/mov_up.gif', 'images/mov_down.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', NULL),
('2014-02-27', 'CROSS_LISTED', '666.800;660.580;660.580;660.580;660.580;660.580\nFeb 20, 2014 - 666.80;Feb 21, 2014 - 660.58;Feb 24, 2014 - 660.58;Feb 25, 2014 - 660.58;Feb 26, 2014 - 660.58;Feb 27, 2014 - 660.58\n20;21;24;25;26;27', '724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800;666.800;666.800;666.800;666.800;660.580;660.580;660.580;660.580;660.580\nJan 28, 2014 - 724.34;Jan 29, 2014 - 724.34;Jan 30, 2014 - 724.34;Jan 31, 2014 - 724.34;Feb 03, 2014 - 724.34;Feb 04, 2014 - 724.34;Feb 05, 2014 - 724.34;Feb 06, 2014 - 660.58;Feb 07, 2014 - 668.55;Feb 10, 2014 - 668.55;Feb 11, 2014 - 666.80;Feb 12, 2014 - 666.80;Feb 13, 2014 - 666.80;Feb 14, 2014 - 666.80;Feb 17, 2014 - 666.80;Feb 18, 2014 - 666.80;Feb 19, 2014 - 666.80;Feb 20, 2014 - 666.80;Feb 21, 2014 - 660.58;Feb 24, 2014 - 660.58;Feb 25, 2014 - 660.58;Feb 26, 2014 - 660.58;Feb 27, 2014 - 660.58\n28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26;27', '738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;732.310;732.310;732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800;666.800;666.800;666.800;666.800;660.580;660.580;660.580;660.580;660.580\nNov 29, 2013 - 738.46;Dec 02, 2013 - 738.46;Dec 03, 2013 - 738.46;Dec 04, 2013 - 738.46;Dec 05, 2013 - 738.46;Dec 06, 2013 - 738.46;Dec 09, 2013 - 738.46;Dec 10, 2013 - 738.46;Dec 11, 2013 - 738.46;Dec 12, 2013 - 738.46;Dec 13, 2013 - 738.46;Dec 16, 2013 - 738.46;Dec 17, 2013 - 738.46;Dec 18, 2013 - 738.46;Dec 19, 2013 - 738.46;Dec 20, 2013 - 738.46;Dec 23, 2013 - 738.46;Dec 24, 2013 - 740.28;Dec 27, 2013 - 740.28;Dec 30, 2013 - 740.28;Dec 31, 2013 - 740.28;Jan 02, 2014 - 740.28;Jan 03, 2014 - 740.28;Jan 06, 2014 - 740.28;', '793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;793.730;738.460;738.460;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.510;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;738.460;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;740.280;732.310;732.310;732.310;732.310;732.310;732.310;732.310;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;724.340;660.580;668.550;668.550;666.800;666.800;666.800;666.800;666.800;666.800;666.800;666.800;660.580;660.580;660.580;660.580;660.580\nSep 02, 2013 - 793.73;Se', '857.350;854.860;854.860;848.980;848.980;848.980;848.980;848.980;848.980;848.980;849.000;849.000;826.890;826.890;826.890;826.890;826.890;826.890;826.890;826.890;774.380;774.380;774.380;774.380;774.380;774.380;774.380;774.380;802.020;804.780;804.780;804.780;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;802.020;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;810.310;799.260;799.260;799.260;799.260;799.260;799.260;799.810;799.810;799.810;799.810;799.810;799.810;799.810;799.810;799.860;799.860;799.530;799.530;799.530;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.860;799.260;799.260;799.260;799.260;799.260;799.260;799.260;799.260;793.730;793.730;793.730;793.730;793.730;793.730;793.730;', '2014-02-27', 660.58, 0.00, 0.00, 'images/mov_none.gif', 0.00, 0.00, 0.00, 0.00, -8.80, -10.77, -10.77, 'images/mov_none.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_none.gif', NULL),
('2014-02-27', 'JSE_SELECT', '2262.830;2281.990;2265.060;2267.190;2283.430;2299.480\nFeb 20, 2014 - 2,262.83;Feb 21, 2014 - 2,281.99;Feb 24, 2014 - 2,265.06;Feb 25, 2014 - 2,267.19;Feb 26, 2014 - 2,283.43;Feb 27, 2014 - 2,299.48\n20;21;24;25;26;27', '2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.050;2253.540;2265.570;2256.810;2279.560;2278.470;2262.830;2281.990;2265.060;2267.190;2283.430;2299.480\nJan 28, 2014 - 2,214.76;Jan 29, 2014 - 2,229.74;Jan 30, 2014 - 2,218.74;Jan 31, 2014 - 2,281.99;Feb 03, 2014 - 2,238.46;Feb 04, 2014 - 2,233.20;Feb 05, 2014 - 2,236.90;Feb 06, 2014 - 2,251.44;Feb 07, 2014 - 2,244.11;Feb 10, 2014 - 2,250.65;Feb 11, 2014 - 2,255.24;Feb 12, 2014 - 2,255.05;Feb 13, 2014 - 2,253.54;Feb 14, 2014 - 2,265.57;Feb 17, 2014 - 2,256.81;Feb 18, 2014 - 2,279.56;Feb 19, 2014 - 2,278.47;Feb 20, 2014 - 2,262.83;Feb 21, 2014 - 2,281.99;Feb 24, 2014 - 2,265.06;Feb 25, 2014 - 2,267.19;Feb 26, 2014 - 2,283.43;Feb 27, 2014 - 2,299.48\n28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26;27', '2093.370;2164.850;2151.310;2181.360;2188.010;2182.560;2222.960;2155.860;2153.620;2123.020;2108.740;2100.060;2099.190;2114.790;2141.230;2152.310;2156.420;2176.670;2169.380;2174.490;2176.170;2178.640;2225.440;2207.410;2189.630;2205.870;2188.410;2198.730;2230.340;2220.830;2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.050;2253.540;2265.570;2256.810;2279.560;2278.470;2262.830;2281.990;2265.060;2267.190;2283.430;2299.480\nNov 29, 2013 - 2,093.37;Dec 02, 2013 - 2,164.85;Dec 03, 2013 - 2,151.31;Dec 04, 2013 - 2,181.36;Dec 05, 2013 - 2,188.01;Dec 06, 2013 - 2,182.56;Dec 09, 2013 - 2,222.96;Dec 10, 2013 - 2,155.86;Dec 11, 2013 - 2,153.62;Dec 12, 2013 - 2,123.02;Dec 13, 2013 - 2,108.74;Dec 16, 2013 - 2,100.06;Dec 17, 2013 - 2,099.19;Dec 18, 2013 - 2,114.79;Dec 19, 2013 - 2,141.23;Dec 20, 2013 - 2,152.31;Dec 23, 2013 - 2,156.42;Dec 24, 2013 - 2,176.67;Dec 27, 2013 - 2,169.38;Dec 30, 20', '2321.700;2372.660;2340.000;2330.160;2343.800;2353.080;2355.970;2370.700;2372.740;2347.060;2351.190;2342.820;2338.510;2317.110;2338.230;2301.760;2301.810;2303.520;2319.660;2312.470;2324.330;2349.680;2368.060;2354.050;2316.720;2311.920;2302.720;2283.340;2244.610;2267.130;2261.630;2250.580;2216.900;2198.350;2188.350;2215.330;2214.500;2198.010;2207.730;2236.120;2181.630;2179.650;2190.250;2208.280;2245.610;2180.640;2149.880;2198.360;2156.090;2153.600;2174.180;2140.760;2130.370;2103.820;2075.780;2088.780;2064.730;2066.220;2078.990;2076.500;2090.980;2098.280;2074.860;2093.370;2164.850;2151.310;2181.360;2188.010;2182.560;2222.960;2155.860;2153.620;2123.020;2108.740;2100.060;2099.190;2114.790;2141.230;2152.310;2156.420;2176.670;2169.380;2174.490;2176.170;2178.640;2225.440;2207.410;2189.630;2205.870;2188.410;2198.730;2230.340;2220.830;2223.280;2244.740;2221.140;2206.440;2219.920;2250.940;2228.500;2218.280;2222.450;2214.760;2229.740;2218.740;2281.990;2238.460;2233.200;2236.900;2251.440;2244.110;2250.650;2255.240;2255.05', '2144.020;2227.620;2241.890;2238.790;2238.030;2178.910;2233.620;2162.130;2166.890;2131.120;2145.210;2148.300;2146.460;2142.400;2143.480;2122.140;2123.130;2131.810;2097.190;2106.000;2126.960;2124.670;2219.750;2208.370;2175.200;2223.000;2239.130;2246.660;2242.740;2232.920;2222.510;2228.140;2225.260;2239.980;2238.360;2249.810;2249.730;2232.780;2222.870;2249.930;2253.790;2267.960;2266.900;2291.320;2291.890;2263.660;2291.130;2273.490;2299.190;2306.980;2338.510;2324.720;2318.880;2319.700;2336.760;2365.230;2383.550;2374.210;2419.710;2425.590;2441.060;2434.580;2483.290;2483.940;2487.770;2475.920;2460.020;2469.930;2478.220;2479.910;2521.470;2530.760;2507.890;2477.880;2486.120;2502.210;2500.100;2473.480;2449.230;2446.160;2439.860;2426.360;2423.280;2453.070;2459.240;2452.970;2502.530;2430.940;2428.380;2431.770;2414.400;2428.790;2473.790;2402.730;2409.370;2437.850;2402.440;2407.750;2432.400;2418.150;2430.630;2409.830;2399.600;2385.800;2380.610;2386.450;2384.320;2392.700;2389.890;2379.300;2358.190;2373.350;2366.090;2371.30', '2014-02-27', 2299.48, 16.05, 0.70, 'images/mov_up.gif', 1899939.00, 0.00, 0.00, 0.77, 0.77, 5.67, 5.67, 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', 'images/mov_up.gif', NULL),
('2014-02-27', 'MAIN_INDEX', '79363.310;79531.750;79137.680;79152.650;79208.990;79566.130\nFeb 20, 2014 - 79,363.31;Feb 21, 2014 - 79,531.75;Feb 24, 2014 - 79,137.68;Feb 25, 2014 - 79,152.65;Feb 26, 2014 - 79,208.99;Feb 27, 2014 - 79,566.13\n20;21;24;25;26;27', '79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510;79133.760;79116.250;79614.290;79436.550;79916.920;79564.870;79363.310;79531.750;79137.680;79152.650;79208.990;79566.130\nJan 28, 2014 - 79,567.50;Jan 29, 2014 - 80,540.48;Jan 30, 2014 - 81,315.47;Jan 31, 2014 - 82,387.81;Feb 03, 2014 - 81,436.23;Feb 04, 2014 - 81,017.93;Feb 05, 2014 - 81,192.73;Feb 06, 2014 - 78,993.48;Feb 07, 2014 - 79,435.22;Feb 10, 2014 - 79,184.54;Feb 11, 2014 - 79,193.51;Feb 12, 2014 - 79,133.76;Feb 13, 2014 - 79,116.25;Feb 14, 2014 - 79,614.29;Feb 17, 2014 - 79,436.55;Feb 18, 2014 - 79,916.92;Feb 19, 2014 - 79,564.87;Feb 20, 2014 - 79,363.31;Feb 21, 2014 - 79,531.75;Feb 24, 2014 - 79,137.68;Feb 25, 2014 - 79,152.65;Feb 26, 2014 - 79,208.99;Feb 27, 2014 - 79,566.13\n28;29;30;31;Feb;4;5;6;7;10;11;12;13;14;17;18;19;20;21;24;25;26;27', '77481.830;78769.580;78584.850;79073.800;79186.200;79093.810;79911.120;78714.600;78665.440;78096.310;77877.890;77624.110;77692.090;77978.210;78512.420;78667.650;78855.650;79337.370;79199.780;79447.880;80633.550;81002.810;80531.480;80005.430;79651.030;80094.420;79883.450;79766.010;79950.500;79865.290;79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;79854.040;79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510;79133.760;79116.250;79614.290;79436.550;79916.920;79564.870;79363.310;79531.750;79137.680;79152.650;79208.990;79566.130\nNov 29, 2013 - 77,481.83;Dec 02, 2013 - 78,769.58;Dec 03, 2013 - 78,584.85;Dec 04, 2013 - 79,073.80;Dec 05, 2013 - 79,186.20;Dec 06, 2013 - 79,093.81;Dec 09, 2013 - 79,911.12;Dec 10, 2013 - 78,714.60;Dec 11, 2013 - 78,665.44;Dec 12, 2013 - 78,096.31;Dec 13, 2013 - 77,877.89;Dec 16, 2013 - 77,624.11;Dec 17, 2013 - 77,692.09;Dec 18, 2013 - 77,978.21;Dec 19, 2013 - 78,512.42;Dec 20, 2013 - 78,667.65;Dec ', '84442.250;85363.570;84771.430;84593.490;84840.690;85010.180;85062.530;85331.520;85359.550;84893.830;84968.000;84798.970;84825.930;84436.770;84819.820;84157.440;84144.930;84122.810;84415.540;84285.070;84500.200;85050.340;85328.520;85040.740;84399.820;84271.590;84093.360;83662.330;82934.250;83328.280;83233.600;83036.360;82468.480;82075.010;81806.110;82320.710;82304.350;81979.680;82154.720;82663.070;81675.460;81639.520;81832.160;82190.300;82868.000;81689.240;81134.050;82001.880;78679.410;78634.190;78989.090;78407.850;78133.270;77667.370;77186.500;77428.290;77001.060;77086.980;77384.080;77301.920;77460.730;77591.330;77144.570;77481.830;78769.580;78584.850;79073.800;79186.200;79093.810;79911.120;78714.600;78665.440;78096.310;77877.890;77624.110;77692.090;77978.210;78512.420;78667.650;78855.650;79337.370;79199.780;79447.880;80633.550;81002.810;80531.480;80005.430;79651.030;80094.420;79883.450;79766.010;79950.500;79865.290;79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;79854.040;7956', '83905.900;85308.130;85694.890;85384.570;85400.240;84380.910;85253.740;83950.070;84107.810;83458.690;83711.640;83770.500;82665.870;82612.780;82630.120;82241.970;82512.840;82594.830;81986.300;82111.640;79894.890;79863.720;81579.810;81232.160;80430.670;81469.700;81752.760;82076.410;83246.990;83252.470;83067.310;83174.230;83040.800;83308.580;83315.220;83522.960;83518.890;83214.750;83039.750;83476.380;83549.410;83813.920;83811.090;84259.730;84264.650;83824.520;84318.470;84008.360;84479.120;84629.610;85273.150;85410.860;85379.880;85395.370;85693.250;86275.280;86529.000;86366.070;87190.560;87297.620;87578.310;87577.920;88455.090;88356.800;88455.470;87778.900;87495.760;87675.590;87884.020;87914.400;88639.940;88849.670;88440.970;87805.820;88000.810;88297.860;88252.950;87769.200;87263.840;87135.910;87085.870;86853.910;86796.670;87337.260;87434.180;87361.200;88276.460;86977.410;86931.610;86978.730;86677.830;86944.140;87894.710;86582.090;86702.610;87178.110;86550.430;86531.460;86933.150;86875.750;87056.960;86687.020;8648', '2014-02-27', 79566.13, 357.14, 0.45, 'images/mov_up.gif', 2402386.00, 0.00, 0.00, 0.04, -3.43, -1.32, -1.32, 'images/mov_up.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_down.gif', 'images/mov_up.gif', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_news`
--

CREATE TABLE IF NOT EXISTS `daily_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_date` date NOT NULL,
  `date_iso` date NOT NULL,
  `title` varchar(256) NOT NULL,
  `desc` varchar(2048) NOT NULL,
  `date` char(10) NOT NULL,
  `link` varchar(256) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `news_date` (`news_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `daily_news`
--

INSERT INTO `daily_news` (`id`, `news_date`, `date_iso`, `title`, `desc`, `date`, `link`, `date_created`) VALUES
(1, '2014-02-26', '2014-02-25', 'Carreras Management Changes', 'Carreras Management Changes', '02/25/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20054', '2014-02-27 01:10:46'),
(2, '2014-02-26', '2014-02-25', 'Dolphin Cove Declares Dividend', 'Dolphin Cove to pay dividend of 15 cents', '02/25/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20056', '2014-02-27 01:10:46'),
(3, '2014-02-26', '2014-02-24', 'NCBJ Trading in Shares', 'Trading in Shares', '02/24/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20049', '2014-02-27 01:10:46'),
(4, '2014-02-26', '2014-02-24', 'GraceKennedy Dividend Consideration', 'GK''s BOD will consider a dividend payment', '02/24/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20050', '2014-02-27 01:10:46'),
(5, '2014-02-26', '2014-02-21', 'PJAM Dividend Consideration', 'PJAM''s BOD will meet on February 27 to consider a dividend payment', '02/21/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20039', '2014-02-27 01:10:46'),
(6, '2014-02-26', '2014-02-21', 'Scotia Group Executive Changes', 'Hugh Wayne Powell Appointed Head of Retail Delivery, English Caribbean Region', '02/21/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20040', '2014-02-27 01:10:46'),
(7, '2014-02-26', '2014-02-20', 'General Accident Insurance Company Jamaica Limited has declared an ordinary dividend', 'The Board of Directors of General Accident Insurance Company Jamaica Limited has declared an ordinary dividend of $0.0764 per stock unit payable on April 1, 2014.', '02/20/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20029', '2014-02-27 01:10:46'),
(8, '2014-02-26', '2014-02-20', 'Sagicor Group to consider dividend payment', 'The Board of Directors of Sagicor Group Jamaica Limited has advised that at its Board Meeting scheduled for February\n28, 2014, the Directors will consider a resolution to declare an interim dividend.', '02/20/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20028', '2014-02-27 01:10:46'),
(9, '2014-02-26', '2014-02-19', 'Knutsford Express Services Appointments', 'Appointment of Director &amp; Company Secretary', '02/19/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20024', '2014-02-27 01:10:46'),
(10, '2014-02-26', '2014-02-18', 'JMMB Trading in Shares', 'JMMB Trading in Shares', '02/18/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20020', '2014-02-27 01:10:46'),
(81, '2014-02-27', '2014-02-27', 'SVL Declares Dividend', 'SVL to pay dividend of 3 cents', '02/27/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20069', '2014-02-27 19:43:01'),
(82, '2014-02-27', '2014-02-25', 'Dolphin Cove Declares Dividend', 'Dolphin Cove to pay dividend of 15 cents', '02/25/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20056', '2014-02-27 19:43:01'),
(83, '2014-02-27', '2014-02-25', 'Carreras Management Changes', 'Carreras Management Changes', '02/25/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20054', '2014-02-27 19:43:01'),
(84, '2014-02-27', '2014-02-24', 'GraceKennedy Dividend Consideration', 'GK''s BOD will consider a dividend payment', '02/24/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20050', '2014-02-27 19:43:01'),
(85, '2014-02-27', '2014-02-24', 'NCBJ Trading in Shares', 'Trading in Shares', '02/24/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20049', '2014-02-27 19:43:01'),
(86, '2014-02-27', '2014-02-21', 'PJAM Dividend Consideration', 'PJAM''s BOD will meet on February 27 to consider a dividend payment', '02/21/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20039', '2014-02-27 19:43:01'),
(87, '2014-02-27', '2014-02-21', 'Scotia Group Executive Changes', 'Hugh Wayne Powell Appointed Head of Retail Delivery, English Caribbean Region', '02/21/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20040', '2014-02-27 19:43:01'),
(88, '2014-02-27', '2014-02-20', 'General Accident Insurance Company Jamaica Limited has declared an ordinary dividend', 'The Board of Directors of General Accident Insurance Company Jamaica Limited has declared an ordinary dividend of $0.0764 per stock unit payable on April 1, 2014.', '02/20/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20029', '2014-02-27 19:43:01'),
(89, '2014-02-27', '2014-02-20', 'Sagicor Group to consider dividend payment', 'The Board of Directors of Sagicor Group Jamaica Limited has advised that at its Board Meeting scheduled for February\n28, 2014, the Directors will consider a resolution to declare an interim dividend.', '02/20/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20028', '2014-02-27 19:43:01'),
(90, '2014-02-27', '2014-02-19', 'Knutsford Express Services Appointments', 'Appointment of Director &amp; Company Secretary', '02/19/2014', 'http://www.jamstockex.com/controller.php?action=readnews&amp;ContentID=20024', '2014-02-27 19:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `daily_quote_main`
--

CREATE TABLE IF NOT EXISTS `daily_quote_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL,
  `index` varchar(64) DEFAULT NULL,
  `value` decimal(18,2) DEFAULT NULL,
  `volume` decimal(18,0) DEFAULT NULL,
  `change` decimal(18,2) DEFAULT NULL,
  `change_perc` decimal(18,2) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `daily_quote_main`
--

INSERT INTO `daily_quote_main` (`id`, `report_date`, `index`, `value`, `volume`, `change`, `change_perc`, `direction`, `date_created`) VALUES
(1, '2014-02-26', 'JSE Market Index', 79208.99, 8558832, 56.34, 0.07, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(2, '2014-02-26', 'JSE Select Index', 2283.43, 4610652, 16.24, 0.72, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(3, '2014-02-26', 'JSE All Jamaican Composite', 84045.57, 8130112, 85.45, 0.10, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(4, '2014-02-26', 'JSE Cross Listed Index', 660.58, 0, 0.00, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(5, '2014-02-26', 'JSE Junior Market Index', 742.00, 3380433, -2.16, -0.29, 'images/mov_down.gif', '2014-02-27 01:10:50'),
(6, '2014-02-26', 'JSE Combined Index', 81449.03, 11510545, 39.61, 0.05, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(7, '2014-02-26', 'JSE US Equities Index', 125.86, 0, 0.00, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(8, '2014-02-27', 'JSE Market Index', 79566.13, 2402386, 357.14, 0.45, 'images/mov_up.gif', NULL),
(9, '2014-02-27', 'JSE Select Index', 2299.48, 1899939, 16.05, 0.70, 'images/mov_up.gif', NULL),
(10, '2014-02-27', 'JSE All Jamaican Composite', 84587.33, 2258906, 541.76, 0.64, 'images/mov_up.gif', NULL),
(11, '2014-02-27', 'JSE Cross Listed Index', 660.58, 0, 0.00, 0.00, 'images/mov_none.gif', NULL),
(12, '2014-02-27', 'JSE Junior Market Index', 725.40, 845158, -16.60, -2.24, 'images/mov_down.gif', NULL),
(13, '2014-02-27', 'JSE Combined Index', 81680.59, 3104064, 231.56, 0.28, 'images/mov_up.gif', NULL),
(14, '2014-02-27', 'JSE US Equities Index', 125.86, 650, 0.00, 0.00, 'images/mov_none.gif', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_quote_ordinary_shares`
--

CREATE TABLE IF NOT EXISTS `daily_quote_ordinary_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` date DEFAULT NULL,
  `week_high_52` decimal(11,2) DEFAULT NULL,
  `week_low_52` decimal(11,2) DEFAULT NULL,
  `security` varchar(64) DEFAULT NULL,
  `prev_yr_div` decimal(11,2) DEFAULT NULL,
  `current_yr_div` decimal(11,2) DEFAULT NULL,
  `volume_non_block` decimal(18,0) DEFAULT NULL,
  `today_high` decimal(11,2) DEFAULT NULL,
  `today_low` decimal(11,2) DEFAULT NULL,
  `last_traded_price` decimal(11,2) DEFAULT NULL,
  `close_price` decimal(11,2) DEFAULT NULL,
  `change` decimal(11,2) DEFAULT NULL,
  `closing_bid` decimal(11,2) DEFAULT NULL,
  `closing_ask` decimal(11,2) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `daily_quote_ordinary_shares`
--

INSERT INTO `daily_quote_ordinary_shares` (`id`, `report_date`, `week_high_52`, `week_low_52`, `security`, `prev_yr_div`, `current_yr_div`, `volume_non_block`, `today_high`, `today_low`, `last_traded_price`, `close_price`, `change`, `closing_bid`, `closing_ask`, `direction`, `date_created`) VALUES
(1, '2014-02-26', 3.50, 2.00, 'BIL', 0.11, 0.03, 0, 0.00, 0.00, 2.50, 2.50, 0.00, 2.30, 2.50, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(2, '2014-02-26', 2.51, 1.71, 'BRG', 0.13, 0.00, 18999, 1.80, 1.80, 1.80, 1.80, -0.05, 1.80, 1.85, 'images/mov_down.gif', '2014-02-27 01:10:50'),
(3, '2014-02-26', 5.25, 0.60, 'CCC', 0.00, 0.00, 65916, 4.80, 4.80, 4.80, 4.80, 0.08, 4.80, 4.97, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(4, '2014-02-26', 61.00, 33.50, 'CAR', 6.84, 1.18, 600, 35.00, 35.00, 35.00, 35.00, 0.02, 34.65, 35.75, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(5, '2014-02-26', 0.10, 0.02, 'CBNY', 0.00, 0.00, 4000, 0.06, 0.06, 0.06, 0.06, -0.04, 0.06, 0.08, 'images/mov_down.gif', '2014-02-27 01:10:50'),
(6, '2014-02-26', 5.50, 3.80, 'DG', 0.35, 0.00, 831517, 5.00, 5.00, 5.00, 5.00, 0.00, 4.91, 5.00, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(7, '2014-02-26', 113.00, 80.00, 'FCIB', 0.03, 0.02, 0, 0.00, 0.00, 80.00, 80.00, 0.00, 80.00, 90.00, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(8, '2014-02-26', 1.26, 1.10, 'GLNR (XD)', 0.07, 0.00, 0, 0.00, 0.00, 1.10, 1.10, 0.00, 1.10, 1.15, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(9, '2014-02-26', 63.00, 47.30, 'GK', 2.18, 0.00, 5150, 55.00, 55.00, 55.00, 55.00, 0.43, 55.10, 55.50, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(10, '2014-02-26', 0.00, 3.22, 'HL', 0.13, 0.30, 4400, 8.00, 8.00, 8.00, 8.00, -0.10, 6.10, 8.00, 'images/mov_down.gif', '2014-02-27 01:10:50'),
(11, '2014-02-26', 5.30, 3.90, 'JBG', 0.14, 0.00, 10371, 4.92, 4.92, 4.92, 4.92, 0.11, 4.92, 5.00, 'images/mov_up.gif', '2014-02-27 01:10:50'),
(12, '2014-02-26', 9.50, 5.89, 'JMMB', 0.26, 0.00, 16267, 7.45, 7.45, 7.45, 7.45, -0.03, 7.21, 7.45, 'images/mov_down.gif', '2014-02-27 01:10:50'),
(13, '2014-02-26', 20.70, 15.00, 'JP', 0.20, 0.20, 0, 0.00, 0.00, 18.26, 18.26, 0.00, 18.26, 19.80, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(14, '2014-02-26', 3.25, 1.80, 'JSE', 0.00, 0.00, 0, 0.00, 0.00, 2.10, 2.10, 0.00, 1.90, 2.10, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(15, '2014-02-26', 4.51, 3.75, 'KPREIT', 0.00, 0.00, 0, 0.00, 0.00, 4.00, 4.00, 0.00, 4.05, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(16, '2014-02-26', 8.00, 5.30, 'KW', 0.18, 0.00, 0, 0.00, 0.00, 6.00, 6.00, 0.00, 5.55, 6.00, 'images/mov_none.gif', '2014-02-27 01:10:50'),
(17, '2014-02-26', 0.39, 0.13, 'LIME', 0.00, 0.00, 1519531, 0.45, 0.39, 0.40, 0.39, 0.00, 0.40, 0.48, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(18, '2014-02-26', 2.70, 1.81, 'MIL', 0.00, 0.00, 2652, 1.90, 1.90, 1.90, 1.90, 0.00, 1.90, 2.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(19, '2014-02-26', 18.00, 17.95, 'MBICE', 0.00, 0.00, 0, 0.00, 0.00, 17.95, 17.95, 0.00, 0.00, 17.50, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(20, '2014-02-26', 22.00, 16.00, 'NCBJ', 0.63, 0.32, 1960431, 19.05, 19.00, 19.01, 19.01, 0.01, 19.01, 19.30, 'images/mov_up.gif', '2014-02-27 01:10:51'),
(21, '2014-02-26', 95.00, 95.00, 'PAL', 1.75, 1.75, 0, 0.00, 0.00, 95.00, 95.00, 0.00, 45.00, 120.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(22, '2014-02-26', 57.60, 48.00, 'PJAM', 2.05, 0.00, 850, 48.80, 48.80, 48.80, 48.80, 0.74, 48.06, 48.80, 'images/mov_up.gif', '2014-02-27 01:10:51'),
(23, '2014-02-26', 1.60, 0.85, 'PULS', 0.00, 0.00, 0, 0.00, 0.00, 0.99, 0.99, 0.00, 0.87, 1.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(24, '2014-02-26', 1.90, 1.20, 'RJR', 0.00, 0.00, 3100000, 1.36, 1.35, 1.36, 1.36, -0.24, 1.35, 1.40, 'images/mov_down.gif', '2014-02-27 01:10:51'),
(25, '2014-02-26', 10.60, 8.05, 'SJ', 0.00, 0.00, 11995, 9.14, 8.80, 8.80, 8.94, -0.20, 8.80, 9.00, 'images/mov_down.gif', '2014-02-27 01:10:51'),
(26, '2014-02-26', 20.00, 14.00, 'S', 0.60, 0.91, 1800, 17.10, 17.10, 17.10, 17.10, -0.90, 17.10, 18.00, 'images/mov_down.gif', '2014-02-27 01:10:51'),
(27, '2014-02-26', 7.10, 5.07, 'XFUND', 0.00, 0.00, 0, 0.00, 0.00, 6.95, 6.95, 0.00, 6.50, 7.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(28, '2014-02-26', 10.00, 8.00, 'SALF', 0.80, 0.00, 0, 0.00, 0.00, 9.00, 9.00, 0.00, 9.00, 13.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(29, '2014-02-26', 22.84, 17.00, 'SGJ', 1.60, 0.40, 264133, 21.10, 20.70, 21.10, 21.07, 0.44, 20.70, 21.50, 'images/mov_up.gif', '2014-02-27 01:10:51'),
(30, '2014-02-26', 29.50, 22.00, 'SIJL', 1.80, 0.45, 7500, 25.60, 25.25, 25.25, 25.27, -0.33, 25.25, 25.90, 'images/mov_down.gif', '2014-02-27 01:10:51'),
(31, '2014-02-26', 15.01, 10.00, 'SEP', 0.83, 0.00, 304000, 10.92, 10.91, 10.92, 10.92, -0.08, 10.91, 11.50, 'images/mov_down.gif', '2014-02-27 01:10:51'),
(32, '2014-02-26', 3.10, 2.20, 'SVL', 0.21, 0.03, 0, 0.00, 0.00, 2.40, 2.41, 0.00, 2.40, 2.50, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(33, '2014-02-26', 18.33, 15.58, 'TCL', 0.00, 0.00, 0, 0.00, 0.00, 17.61, 17.61, 0.00, 15.00, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(34, '2014-02-27', 3.50, 2.00, 'BIL', 0.11, 0.03, 0, 0.00, 0.00, 2.50, 2.50, 0.00, 2.30, 2.50, 'images/mov_none.gif', NULL),
(35, '2014-02-27', 2.51, 1.75, 'BRG', 0.13, 0.00, 0, 0.00, 0.00, 1.80, 1.80, 0.00, 1.80, 1.85, 'images/mov_none.gif', NULL),
(36, '2014-02-27', 5.25, 0.60, 'CCC', 0.00, 0.00, 289250, 4.97, 4.60, 4.60, 4.75, -0.05, 4.60, 4.97, 'images/mov_down.gif', NULL),
(37, '2014-02-27', 61.00, 33.50, 'CAR', 6.84, 1.18, 56420, 35.50, 35.00, 35.00, 35.26, 0.26, 34.66, 35.30, 'images/mov_up.gif', NULL),
(38, '2014-02-27', 0.10, 0.02, 'CBNY', 0.00, 0.00, 0, 0.00, 0.00, 0.06, 0.06, 0.00, 0.06, 0.07, 'images/mov_none.gif', NULL),
(39, '2014-02-27', 5.50, 3.80, 'DG', 0.35, 0.00, 0, 0.00, 0.00, 5.00, 5.00, 0.00, 4.91, 5.00, 'images/mov_none.gif', NULL),
(40, '2014-02-27', 113.00, 80.00, 'FCIB', 0.03, 0.02, 0, 0.00, 0.00, 80.00, 80.00, 0.00, 80.00, 90.00, 'images/mov_none.gif', NULL),
(41, '2014-02-27', 1.26, 1.10, 'GLNR (XD)', 0.07, 0.00, 0, 0.00, 0.00, 1.10, 1.10, 0.00, 1.10, 1.20, 'images/mov_none.gif', NULL),
(42, '2014-02-27', 63.00, 47.30, 'GK', 2.18, 0.00, 6416, 55.50, 55.00, 55.00, 55.44, 0.44, 55.00, 55.50, 'images/mov_up.gif', NULL),
(43, '2014-02-27', 9.00, 3.22, 'HL', 0.13, 0.30, 0, 0.00, 0.00, 8.00, 8.00, 0.00, 6.10, 8.00, 'images/mov_none.gif', NULL),
(44, '2014-02-27', 5.30, 3.90, 'JBG', 0.14, 0.00, 62787, 4.95, 4.80, 4.80, 4.83, -0.09, 4.80, 4.95, 'images/mov_down.gif', NULL),
(45, '2014-02-27', 9.50, 5.89, 'JMMB', 0.26, 0.00, 500623, 7.40, 7.40, 7.40, 7.40, -0.05, 7.21, 7.45, 'images/mov_down.gif', NULL),
(46, '2014-02-27', 20.70, 15.00, 'JP', 0.20, 0.20, 200, 18.26, 18.26, 18.26, 18.26, 0.00, 18.26, 18.75, 'images/mov_none.gif', NULL),
(47, '2014-02-27', 3.25, 1.80, 'JSE', 0.00, 0.00, 0, 0.00, 0.00, 2.10, 2.10, 0.00, 1.90, 2.10, 'images/mov_none.gif', NULL),
(48, '2014-02-27', 4.51, 3.75, 'KPREIT', 0.00, 0.00, 0, 0.00, 0.00, 4.00, 4.00, 0.00, 4.05, 0.00, 'images/mov_none.gif', NULL),
(49, '2014-02-27', 8.00, 5.30, 'KW', 0.18, 0.00, 1410, 6.00, 6.00, 6.00, 6.00, 0.00, 5.55, 6.00, 'images/mov_none.gif', NULL),
(50, '2014-02-27', 0.40, 0.13, 'LIME', 0.00, 0.00, 391083, 0.43, 0.42, 0.43, 0.43, 0.04, 0.42, 0.44, 'images/mov_up.gif', NULL),
(51, '2014-02-27', 2.70, 1.81, 'MIL', 0.00, 0.00, 857922, 1.90, 1.90, 1.90, 1.90, 0.00, 1.90, 2.50, 'images/mov_none.gif', NULL),
(52, '2014-02-27', 18.00, 17.95, 'MBICE', 0.00, 0.00, 0, 0.00, 0.00, 17.95, 17.95, 0.00, 0.00, 17.50, 'images/mov_none.gif', NULL),
(53, '2014-02-27', 22.00, 16.00, 'NCBJ', 0.63, 0.32, 20276, 19.30, 19.01, 19.01, 19.02, 0.01, 19.01, 19.30, 'images/mov_up.gif', NULL),
(54, '2014-02-27', 95.00, 95.00, 'PAL', 1.75, 1.75, 0, 0.00, 0.00, 95.00, 95.00, 0.00, 45.00, 120.00, 'images/mov_none.gif', NULL),
(55, '2014-02-27', 57.60, 48.00, 'PJAM', 2.05, 0.00, 0, 0.00, 0.00, 48.80, 48.80, 0.00, 48.06, 48.80, 'images/mov_none.gif', NULL),
(56, '2014-02-27', 1.60, 0.85, 'PULS', 0.00, 0.00, 0, 0.00, 0.00, 0.99, 0.99, 0.00, 0.87, 1.00, 'images/mov_none.gif', NULL),
(57, '2014-02-27', 1.90, 1.20, 'RJR', 0.00, 0.00, 228, 1.35, 1.35, 1.35, 1.35, -0.01, 1.35, 1.40, 'images/mov_down.gif', NULL),
(58, '2014-02-27', 10.60, 8.05, 'SJ', 0.00, 0.00, 44295, 9.05, 8.60, 8.60, 8.86, -0.08, 8.60, 9.00, 'images/mov_down.gif', NULL),
(59, '2014-02-27', 20.00, 14.20, 'S', 0.60, 0.91, 1400, 17.10, 17.10, 17.10, 17.10, 0.00, 17.10, 18.00, 'images/mov_none.gif', NULL),
(60, '2014-02-27', 7.10, 5.07, 'XFUND', 0.00, 0.00, 22000, 7.15, 7.00, 7.15, 7.07, 0.12, 7.05, 7.20, 'images/mov_up.gif', NULL),
(61, '2014-02-27', 10.00, 8.00, 'SALF', 0.80, 0.00, 0, 0.00, 0.00, 9.00, 9.00, 0.00, 9.00, 13.00, 'images/mov_none.gif', NULL),
(62, '2014-02-27', 22.84, 17.00, 'SGJ', 1.60, 0.40, 4412, 21.50, 21.50, 21.50, 21.50, 0.43, 21.00, 21.50, 'images/mov_up.gif', NULL),
(63, '2014-02-27', 29.50, 22.00, 'SIJL', 1.80, 0.45, 184, 25.90, 25.90, 25.90, 25.90, 0.63, 25.25, 25.90, 'images/mov_up.gif', NULL),
(64, '2014-02-27', 15.01, 10.00, 'SEP', 0.83, 0.00, 0, 0.00, 0.00, 10.92, 10.92, 0.00, 10.92, 11.50, 'images/mov_none.gif', NULL),
(65, '2014-02-27', 3.10, 2.20, 'SVL', 0.21, 0.03, 0, 0.00, 0.00, 2.40, 2.41, 0.00, 2.40, 2.50, 'images/mov_none.gif', NULL),
(66, '2014-02-27', 18.33, 15.58, 'TCL', 0.00, 0.00, 0, 0.00, 0.00, 17.61, 17.61, 0.00, 15.00, 0.00, 'images/mov_none.gif', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_quote_preference_shares`
--

CREATE TABLE IF NOT EXISTS `daily_quote_preference_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` date DEFAULT NULL,
  `week_high_52` decimal(11,2) DEFAULT NULL,
  `week_low_52` decimal(11,2) DEFAULT NULL,
  `security` varchar(64) DEFAULT NULL,
  `prev_yr_div` decimal(11,2) DEFAULT NULL,
  `current_yr_div` decimal(11,2) DEFAULT NULL,
  `volume_non_block` decimal(18,0) DEFAULT NULL,
  `today_high` decimal(11,2) DEFAULT NULL,
  `today_low` decimal(11,2) DEFAULT NULL,
  `last_traded_price` decimal(11,2) DEFAULT NULL,
  `close_price` decimal(11,2) DEFAULT NULL,
  `change` decimal(11,2) DEFAULT NULL,
  `closing_bid` decimal(11,2) DEFAULT NULL,
  `closing_ask` decimal(11,2) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `daily_quote_preference_shares`
--

INSERT INTO `daily_quote_preference_shares` (`id`, `report_date`, `week_high_52`, `week_low_52`, `security`, `prev_yr_div`, `current_yr_div`, `volume_non_block`, `today_high`, `today_low`, `last_traded_price`, `close_price`, `change`, `closing_bid`, `closing_ask`, `direction`, `date_created`) VALUES
(1, '2014-02-26', 0.50, 0.50, 'CWJA5.5', 0.00, 0.00, 0, 0.00, 0.00, 0.50, 0.50, 0.00, 0.00, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(2, '2014-02-26', 0.53, 0.53, 'CWJA6', 0.00, 0.00, 0, 0.00, 0.00, 0.53, 0.53, 0.00, 0.53, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(3, '2014-02-26', 0.35, 0.35, 'JPS5D', 0.10, 0.00, 0, 0.00, 0.00, 0.35, 0.35, 0.00, 0.35, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(4, '2014-02-26', 0.39, 0.39, 'JPS7', 0.14, 0.00, 0, 0.00, 0.00, 0.39, 0.39, 0.00, 0.40, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(5, '2014-02-26', 0.00, 0.00, 'JPS9.5', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 1050.14, 0.00, 0.00, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(6, '2014-02-26', 0.36, 0.36, 'JPS5C', 0.10, 0.00, 0, 0.00, 0.00, 0.36, 0.36, 0.00, 0.36, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(7, '2014-02-26', 2.50, 2.50, 'JMMB7.25', 0.05, 0.02, 0, 0.00, 0.00, 2.50, 2.50, 0.00, 0.00, 2.50, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(8, '2014-02-26', 2.00, 2.00, 'JMMB7.5', 0.04, 0.01, 0, 0.00, 0.00, 2.00, 2.00, 0.00, 0.00, 2.00, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(9, '2014-02-26', 3.30, 2.90, 'JMMB8.75 (XD)', 0.26, 0.04, 349400, 3.01, 3.01, 3.01, 3.01, 0.01, 3.01, 3.05, 'images/mov_up.gif', '2014-02-27 01:10:51'),
(10, '2014-02-26', 3.70, 3.50, 'JMMB8.5 (XD)', 0.30, 0.05, 0, 0.00, 0.00, 3.50, 3.50, 0.00, 3.49, 3.50, 'images/mov_none.gif', '2014-02-27 01:10:51'),
(11, '2014-02-26', 0.40, 0.40, 'JPS6', 0.12, 0.00, 0, 0.00, 0.00, 0.40, 0.40, 0.00, 0.40, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:52'),
(12, '2014-02-26', 5.11, 5.03, 'PROVEN8', 0.40, 0.00, 79320, 5.09, 5.09, 5.09, 5.09, 0.00, 5.09, 0.00, 'images/mov_none.gif', '2014-02-27 01:10:52'),
(13, '2014-02-27', 0.50, 0.50, 'CWJA5.5', 0.00, 0.00, 0, 0.00, 0.00, 0.50, 0.50, 0.00, 0.00, 0.00, 'images/mov_none.gif', NULL),
(14, '2014-02-27', 0.53, 0.53, 'CWJA6', 0.00, 0.00, 0, 0.00, 0.00, 0.53, 0.53, 0.00, 0.53, 0.00, 'images/mov_none.gif', NULL),
(15, '2014-02-27', 0.35, 0.35, 'JPS5D', 0.10, 0.00, 0, 0.00, 0.00, 0.35, 0.35, 0.00, 0.35, 0.00, 'images/mov_none.gif', NULL),
(16, '2014-02-27', 0.39, 0.39, 'JPS7', 0.14, 0.00, 0, 0.00, 0.00, 0.39, 0.39, 0.00, 0.40, 0.00, 'images/mov_none.gif', NULL),
(17, '2014-02-27', 0.00, 0.00, 'JPS9.5', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 1050.14, 0.00, 0.00, 0.00, 'images/mov_none.gif', NULL),
(18, '2014-02-27', 0.36, 0.36, 'JPS5C', 0.10, 0.00, 0, 0.00, 0.00, 0.36, 0.36, 0.00, 0.36, 0.00, 'images/mov_none.gif', NULL),
(19, '2014-02-27', 2.50, 2.50, 'JMMB7.25', 0.05, 0.02, 0, 0.00, 0.00, 2.50, 2.50, 0.00, 0.00, 2.50, 'images/mov_none.gif', NULL),
(20, '2014-02-27', 2.00, 2.00, 'JMMB7.5', 0.04, 0.01, 0, 0.00, 0.00, 2.00, 2.00, 0.00, 0.00, 2.00, 'images/mov_none.gif', NULL),
(21, '2014-02-27', 3.30, 2.90, 'JMMB8.75', 0.26, 0.04, 98600, 3.01, 3.01, 3.01, 3.01, 0.00, 3.01, 3.05, 'images/mov_none.gif', NULL),
(22, '2014-02-27', 3.70, 3.50, 'JMMB8.5', 0.30, 0.05, 22200, 3.50, 3.50, 3.50, 3.50, 0.00, 3.50, 4.59, 'images/mov_none.gif', NULL),
(23, '2014-02-27', 0.40, 0.40, 'JPS6', 0.12, 0.00, 0, 0.00, 0.00, 0.40, 0.40, 0.00, 0.40, 0.00, 'images/mov_none.gif', NULL),
(24, '2014-02-27', 5.11, 5.03, 'PROVEN8', 0.40, 0.00, 22680, 5.09, 5.09, 5.09, 5.09, 0.00, 5.00, 5.09, 'images/mov_none.gif', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_quote_us_denominated_shares`
--

CREATE TABLE IF NOT EXISTS `daily_quote_us_denominated_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` date DEFAULT NULL,
  `week_high_52` decimal(11,2) DEFAULT NULL,
  `week_low_52` decimal(11,2) DEFAULT NULL,
  `security` varchar(64) DEFAULT NULL,
  `prev_yr_div` decimal(11,2) DEFAULT NULL,
  `current_yr_div` decimal(11,2) DEFAULT NULL,
  `volume_non_block` decimal(18,0) DEFAULT NULL,
  `today_high` decimal(11,2) DEFAULT NULL,
  `today_low` decimal(11,2) DEFAULT NULL,
  `last_traded_price` decimal(11,2) DEFAULT NULL,
  `close_price` decimal(11,2) DEFAULT NULL,
  `change` decimal(11,2) DEFAULT NULL,
  `closing_bid` decimal(11,2) DEFAULT NULL,
  `closing_ask` decimal(11,2) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daily_summary`
--

CREATE TABLE IF NOT EXISTS `daily_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summary_date` date DEFAULT NULL,
  `stock` varchar(20) DEFAULT NULL,
  `security` varchar(128) DEFAULT NULL,
  `volume` decimal(16,0) DEFAULT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `change` decimal(18,2) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `daily_summary`
--

INSERT INTO `daily_summary` (`id`, `summary_date`, `stock`, `security`, `volume`, `close_price`, `change`, `date_created`) VALUES
(1, '2014-02-26', 'ADVANCING', 'Caribbean Cement Company Ltd.', 65916, 4.80, 0.08, '2014-02-27 01:10:48'),
(2, '2014-02-26', 'ADVANCING', 'Carreras Limited', 600, 35.00, 0.02, '2014-02-27 01:10:48'),
(3, '2014-02-26', 'ADVANCING', 'GraceKennedy Ltd.', 5150, 55.00, 0.43, '2014-02-27 01:10:48'),
(4, '2014-02-26', 'ADVANCING', 'Jamaica Broilers Ltd.', 10371, 4.92, 0.11, '2014-02-27 01:10:48'),
(5, '2014-02-26', 'ADVANCING', 'Jamaica Money Market Brokers Limited 8.75%', 349400, 3.01, 0.01, '2014-02-27 01:10:48'),
(6, '2014-02-26', 'ADVANCING', 'National Commercial Bank of Jamaica Ltd.', 1960431, 19.01, 0.01, '2014-02-27 01:10:48'),
(7, '2014-02-26', 'ADVANCING', 'Pan-Jamaican Investment Trust Ltd.', 850, 48.80, 0.74, '2014-02-27 01:10:48'),
(8, '2014-02-26', 'ADVANCING', 'Scotia Group Jamaica', 264133, 21.07, 0.44, '2014-02-27 01:10:48'),
(9, '2014-02-26', 'DECLINING', 'Berger Paints Ltd.', 18999, 1.80, -0.05, '2014-02-27 01:10:48'),
(10, '2014-02-26', 'DECLINING', 'Ciboney Group Ltd.', 4000, 0.06, -0.04, '2014-02-27 01:10:48'),
(11, '2014-02-26', 'DECLINING', 'Hardware & Lumber', 4400, 8.00, -0.10, '2014-02-27 01:10:48'),
(12, '2014-02-26', 'DECLINING', 'Jamaica Money Market Brokers Ltd.', 16267, 7.45, -0.03, '2014-02-27 01:10:48'),
(13, '2014-02-26', 'DECLINING', 'Radio Jamaica Ltd.', 3100000, 1.36, -0.24, '2014-02-27 01:10:48'),
(14, '2014-02-26', 'DECLINING', 'Sagicor Group Jamaica Limited', 11995, 8.94, -0.20, '2014-02-27 01:10:48'),
(15, '2014-02-26', 'DECLINING', 'Sagicor Investments Jamaica Limited', 1800, 17.10, -0.90, '2014-02-27 01:10:48'),
(16, '2014-02-26', 'DECLINING', 'Scotia Investments Jamaica Ltd.', 7500, 25.27, -0.33, '2014-02-27 01:10:48'),
(17, '2014-02-26', 'DECLINING', 'Seprod Limited', 304000, 10.92, -0.08, '2014-02-27 01:10:48'),
(18, '2014-02-26', 'TRADING_FIRM', 'Desnoes and Geddes Ltd.', 831517, 5.00, 0.00, '2014-02-27 01:10:48'),
(19, '2014-02-26', 'TRADING_FIRM', 'LIME', 1519531, 0.39, 0.00, '2014-02-27 01:10:48'),
(20, '2014-02-26', 'TRADING_FIRM', 'Mayberry Investments Ltd', 2652, 1.90, 0.00, '2014-02-27 01:10:48'),
(21, '2014-02-26', 'TRADING_FIRM', 'Proven Investments Limited 8%', 79320, 5.09, 0.00, '2014-02-27 01:10:48'),
(22, '2014-02-27', 'ADVANCING', 'Carreras Limited', 56420, 35.26, 0.26, NULL),
(23, '2014-02-27', 'ADVANCING', 'GraceKennedy Ltd.', 6416, 55.44, 0.44, NULL),
(24, '2014-02-27', 'ADVANCING', 'LIME', 391083, 0.43, 0.04, NULL),
(25, '2014-02-27', 'ADVANCING', 'National Commercial Bank of Jamaica Ltd.', 20276, 19.02, 0.01, NULL),
(26, '2014-02-27', 'ADVANCING', 'Sagicor Real Estate X Fund Limited', 22000, 7.07, 0.12, NULL),
(27, '2014-02-27', 'ADVANCING', 'Scotia Group Jamaica', 4412, 21.50, 0.43, NULL),
(28, '2014-02-27', 'ADVANCING', 'Scotia Investments Jamaica Ltd.', 184, 25.90, 0.63, NULL),
(29, '2014-02-27', 'DECLINING', 'Caribbean Cement Company Ltd.', 289250, 4.75, -0.05, NULL),
(30, '2014-02-27', 'DECLINING', 'Jamaica Broilers Ltd.', 62787, 4.83, -0.09, NULL),
(31, '2014-02-27', 'DECLINING', 'Jamaica Money Market Brokers Ltd.', 500623, 7.40, -0.05, NULL),
(32, '2014-02-27', 'DECLINING', 'Radio Jamaica Ltd.', 228, 1.35, -0.01, NULL),
(33, '2014-02-27', 'DECLINING', 'Sagicor Group Jamaica Limited', 44295, 8.86, -0.08, NULL),
(34, '2014-02-27', 'TRADING_FIRM', 'Jamaica Money Market Brokers Limited 8.75%', 98600, 3.01, 0.00, NULL),
(35, '2014-02-27', 'TRADING_FIRM', 'Jamaica Money Market Brokers Ltd 8.50%', 22200, 3.50, 0.00, NULL),
(36, '2014-02-27', 'TRADING_FIRM', 'Jamaica Producers Group Ltd.', 200, 18.26, 0.00, NULL),
(37, '2014-02-27', 'TRADING_FIRM', 'Kingston Wharves Ltd.', 1410, 6.00, 0.00, NULL),
(38, '2014-02-27', 'TRADING_FIRM', 'Mayberry Investments Ltd', 857922, 1.90, 0.00, NULL),
(39, '2014-02-27', 'TRADING_FIRM', 'Proven Investments Limited 8%', 22680, 5.09, 0.00, NULL),
(40, '2014-02-27', 'TRADING_FIRM', 'Sagicor Investments Jamaica Limited', 1400, 17.10, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_summary_master`
--

CREATE TABLE IF NOT EXISTS `daily_summary_master` (
  `summary_date` date NOT NULL,
  `cache_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `summary1` varchar(512) DEFAULT NULL,
  `summary2` varchar(512) DEFAULT NULL,
  `summary_list` varchar(1024) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`summary_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_summary_master`
--

INSERT INTO `daily_summary_master` (`summary_date`, `cache_date`, `status`, `summary1`, `summary2`, `summary_list`, `date_created`) VALUES
('2014-02-26', '2014-02-26 20:10:48', 'COMPLETE', 'Overall Market activity resulted from trading in 21 \r\n  stocks of which 8 advanced, 9 \r\n  declined and\r\n  4 traded firm.', 'Market volume amounted to 8,558,832 \r\n   units valued at over $57,824,017. Radio Jamaica Ltd. \r\n  was the volume leader with 3,100,000 units (36.22%) \r\n  followed by National Commercial Bank of Jamaica Ltd. with 1,960,431 \r\n  units (22.91%) and LIME \r\n  with 1,519,531 units (17.75%).', '["The JSE Market Index advanced by 56.34 points (0.07%) to close at 79,208.99.","The JSE Select Index advanced by 16.24 points (0.72%) to close at 2,283.43.","The JSE All Jamaican Composite advanced by 85.45 points (0.10%) to close at 84,045.57.","The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 660.58.","The JSE Junior Market Index declined by 2.16 points (0.29%) to close at 742.00.","The JSE Combined Index advanced by 39.61 points (0.05%) to close at 81,449.03.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 125.86."]', '2014-02-27 01:10:48'),
('2014-02-27', '2014-02-27 13:56:16', 'COMPLETE', 'Overall Market activity resulted from trading in 19 \r\n  stocks of which 7 advanced, 5 \r\n  declined and\r\n  7 traded firm.', 'Market volume amounted to 2,402,386 \r\n   units valued at over $11,084,939. Mayberry Investments Ltd \r\n  was the volume leader with 857,922 units (35.71%) \r\n  followed by Jamaica Money Market Brokers Ltd. with 500,623 \r\n  units (20.84%) and LIME \r\n  with 391,083 units (16.28%).', '["The JSE Market Index advanced by 357.14 points (0.45%) to close at 79,566.13.","The JSE Select Index advanced by 16.05 points (0.70%) to close at 2,299.48.","The JSE All Jamaican Composite advanced by 541.76 points (0.64%) to close at 84,587.33.","The JSE Cross Listed Index  by 0.00 points (0.00%) to close at 660.58.","The JSE Junior Market Index declined by 16.60 points (2.24%) to close at 725.40.","The JSE Combined Index advanced by 231.56 points (0.28%) to close at 81,680.59.","The JSE US Equities Index  by 0.00 points (0.00%) to close at 125.86."]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `live_stock`
--

CREATE TABLE IF NOT EXISTS `live_stock` (
  `stock_data` varchar(10240) NOT NULL,
  `last_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `live_stock`
--

INSERT INTO `live_stock` (`stock_data`, `last_updated`) VALUES
('[{"lines":["MARKET SUMMARY FOR: 2014-02-27"]},{"lines":["COMBINED INDEX","3,104,064","81,680.59","mov_up.png","231.56"]},{"lines":["MAIN INDEX","2,402,386","79,566.13","mov_up.png","357.14"],"link":"#link?MAIN_INDEX"},{"lines":["ALL JAMAICAN","2,258,906","84,587.33","mov_up.png","541.76"],"link":"#link?ALL_JAMAICAN"},{"lines":["JSE SELECT","1,899,939","2,299.48","mov_up.png","16.05"],"link":"#link?JSE_SELECT"},{"lines":["CROSS LISTED","0","660.58","mov_none.png","0.00"],"link":"#link?CROSS_LISTED"},{"lines":["JSE JUNIOR","845,158","725.40","mov_down.png","16.60"]},{"lines":["US EQUITIES","650","125.86","mov_none.png","0.00"]},{"lines":["AFS","$9.10","mov_down.png","$0.90","VOL 500"],"link":"#symboldetail?7036"},{"lines":["AMG","$3.55","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7051"},{"lines":["BIL","$2.50","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7037"},{"lines":["BPOW","$9.10","mov_up.png","$0.09","VOL 5,000"],"link":"#symboldetail?7041"},{"lines":["BRG","$1.80","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?72"},{"lines":["CAR","$35.26","mov_up.png","$0.26","VOL 56,420"],"link":"#symboldetail?3"},{"lines":["CBNY","$0.06","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?73"},{"lines":["CCC","$4.75","mov_down.png","$0.05","VOL 289,250"],"link":"#symboldetail?57"},{"lines":["CFF","$2.50","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7065"},{"lines":["CHL","$15.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7046"},{"lines":["CPJ","$2.70","mov_down.png","$0.05","VOL 187,760"],"link":"#symboldetail?7053"},{"lines":["CWJA5.5","$0.50","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?42"},{"lines":["CWJA6","$0.53","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?43"},{"lines":["DCOVE","$8.32","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7047"},{"lines":["DG","$5.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?6"},{"lines":["DTL","$2.50","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7069"},{"lines":["EPLY","$380.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7062"},{"lines":["EPLY9.5","$6.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7068"},{"lines":["FCIB","$80.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?78"},{"lines":["GENAC","$1.75","mov_none.png","$0.00","VOL 5,600"],"link":"#symboldetail?7054"},{"lines":["GK","$55.44","mov_up.png","$0.44","VOL 6,416"],"link":"#symboldetail?10"},{"lines":["GLNR","$1.10","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?8"},{"lines":["HL","$8.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?59"},{"lines":["HONBUN","$3.05","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7050"},{"lines":["JAMT","$3.57","mov_down.png","$0.18","VOL 1,065"],"link":"#symboldetail?7042"},{"lines":["JBG","$4.83","mov_down.png","$0.09","VOL 62,787"],"link":"#symboldetail?70"},{"lines":["JMMB","$7.40","mov_down.png","$0.05","VOL 500,623"],"link":"#symboldetail?102"},{"lines":["JMMB7.25","$2.50","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7064"},{"lines":["JMMB7.5","$2.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7063"},{"lines":["JMMB8.5","$3.50","mov_none.png","$0.00","VOL 22,200"],"link":"#symboldetail?7048"},{"lines":["JMMB8.75","$3.01","mov_none.png","$0.00","VOL 98,600"],"link":"#symboldetail?7049"},{"lines":["JP","$18.26","mov_none.png","$0.00","VOL 200"],"link":"#symboldetail?12"},{"lines":["JPS5C","$0.36","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?39"},{"lines":["JPS5D","$0.35","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?96"},{"lines":["JPS6","$0.40","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7006"},{"lines":["JPS7","$0.39","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?41"},{"lines":["JPS9.5","$1,050.14","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7066"},{"lines":["JSE","$2.10","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7061"},{"lines":["KEX","$5.17","mov_none.png","$0.00","VOL 100"],"link":"#symboldetail?7072"},{"lines":["KLE","$1.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7057"},{"lines":["KPREIT","$4.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7035"},{"lines":["KREMI","$0.83","mov_down.png","$0.07","VOL 316,920"],"link":"#symboldetail?7060"},{"lines":["KW","$6.00","mov_none.png","$0.00","VOL 1,410"],"link":"#symboldetail?81"},{"lines":["LASD","$1.30","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7043"},{"lines":["LASF","$1.20","mov_down.png","$0.10","VOL 11,000"],"link":"#symboldetail?7045"},{"lines":["LASM","$1.16","mov_down.png","$0.04","VOL 10,000"],"link":"#symboldetail?7044"},{"lines":["LIME","$0.43","mov_up.png","$0.04","VOL 391,083"],"link":"#symboldetail?66"},{"lines":["MBICE","$17.95","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?20"},{"lines":["MDS","$2.07","mov_up.png","$0.07","VOL 161,605"],"link":"#symboldetail?7071"},{"lines":["MIL","$1.90","mov_none.png","$0.00","VOL 857,922"],"link":"#symboldetail?200"},{"lines":["MUSIC","$0.60","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7056"},{"lines":["NCBJ","$19.02","mov_up.png","$0.01","VOL 20,276"],"link":"#symboldetail?95"},{"lines":["PAL","$95.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?25"},{"lines":["PJAM","$48.80","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?26"},{"lines":["PROVEN","$0.18","mov_none.png","$0.00","VOL 650"],"link":"#symboldetail?7052"},{"lines":["PROVEN8","$5.09","mov_none.png","$0.00","VOL 22,680"],"link":"#symboldetail?7055"},{"lines":["PTL","$3.00","mov_none.png","$0.00","VOL 145,608"],"link":"#symboldetail?7059"},{"lines":["PULS","$0.99","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?77"},{"lines":["PURITY","$1.15","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?7058"},{"lines":["RJR","$1.35","mov_down.png","$0.01","VOL 228"],"link":"#symboldetail?69"},{"lines":["S","$17.10","mov_none.png","$0.00","VOL 1,400"],"link":"#symboldetail?31"},{"lines":["SALF","$9.00","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?29"},{"lines":["SEP","$10.92","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?30"},{"lines":["SGJ","$21.50","mov_up.png","$0.43","VOL 4,412"],"link":"#symboldetail?107"},{"lines":["SIJL","$25.90","mov_up.png","$0.63","VOL 184"],"link":"#symboldetail?71"},{"lines":["SJ","$8.86","mov_down.png","$0.08","VOL 44,295"],"link":"#symboldetail?7070"},{"lines":["SVL","$2.41","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?123"},{"lines":["TCL","$17.61","mov_none.png","$0.00","VOL 0"],"link":"#symboldetail?86"},{"lines":["XFUND","$7.07","mov_up.png","$0.12","VOL 22,000"],"link":"#symboldetail?7067"}]', '2014-02-27 18:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE IF NOT EXISTS `market` (
  `market_date` date NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`market_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`market_date`, `update_time`) VALUES
('2014-02-26', '2014-02-27 12:41:21'),
('2014-02-27', '2014-02-27 13:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `stock_detail`
--

CREATE TABLE IF NOT EXISTS `stock_detail` (
  `stock_code` varchar(32) NOT NULL,
  `cache_date` date NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `financial_year_end` varchar(64) DEFAULT NULL,
  `last_traded_price` varchar(16) DEFAULT NULL,
  `close_price` varchar(64) NOT NULL,
  `change` varchar(64) NOT NULL,
  `change_perc` varchar(64) NOT NULL,
  `shares_outstanding` varchar(64) NOT NULL,
  `market_value_of_shares_outstanding` varchar(64) NOT NULL,
  `bid` varchar(64) NOT NULL,
  `week_to_date` varchar(64) NOT NULL,
  `ask` varchar(64) NOT NULL,
  `month_to_date` varchar(64) NOT NULL,
  `open_previous_day_close` varchar(64) NOT NULL,
  `quarter_to_date` varchar(64) NOT NULL,
  `today_range` varchar(64) NOT NULL,
  `year_to_date` varchar(64) NOT NULL,
  `week_range_52` varchar(64) NOT NULL,
  `volume_traded` varchar(64) NOT NULL,
  `week_volume_range_52` varchar(128) NOT NULL,
  `quarterly_earning_graph` varchar(4096) NOT NULL,
  `annually_earning_graph` varchar(4096) NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_code`,`cache_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_detail`
--

INSERT INTO `stock_detail` (`stock_code`, `cache_date`, `symbol`, `financial_year_end`, `last_traded_price`, `close_price`, `change`, `change_perc`, `shares_outstanding`, `market_value_of_shares_outstanding`, `bid`, `week_to_date`, `ask`, `month_to_date`, `open_previous_day_close`, `quarter_to_date`, `today_range`, `year_to_date`, `week_range_52`, `volume_traded`, `week_volume_range_52`, `quarterly_earning_graph`, `annually_earning_graph`, `date_created`) VALUES
('1', '2014-02-26', 'BNSJ', '31-Oct', '$23.55', '$23.55', '$0.05', '0.21 %', '2,927,232,000.00', '$68,936,313,600.00', '$23.50', '71.90%', '$23.55', '-2.28%', '$23.50', '-2.28%', '$23.50 to $23.55', '-9.63%', '$17.05 to $27.89', '204,279.00 units', '0 units to 4,439,405 units', '', '', '2014-02-27 01:11:44'),
('108', '2014-02-26', 'BNSJVP', '30-Nov', '$1.13', '$1.13', '$0.00', '0.00 %', '100,000,000.00', '$113,000,000.00', '$0.00', '13.00%', '$0.00', '0.00%', '$1.13', '0.00%', '$0.00 to $0.00', '0.00%', '$1.13 to $1.13', '0.00 units', '0 units to 0 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''1999'' /><category label=''2000'' /><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /></categories><dataset seriesName=''Quarter 1''><set value=''443000000'' /><set value=''559000000'' /><set value=''734000000'' /><set value=''930000000'' /><set value=''999000000'' /><set value=''1685000000'' /><set value=''1422000000'' /><set value=''1532000000'' /><set value=''1614000000'' /><set value=''1940000000'' /><set value=''2176000000'' /><set value=''2271000000'' /><set value=''2277000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''633000000'' /><set value=''581000000'' /><set value=''818000000'' /><set value=''967000000'' /><set value=''1080000000'' /><set value=''1625000000'' /><set value=''1434000000'' /><set value=''1767000000'' /><set value=''1779000000'' /><set value=''2304000000'' /><set value=''2497000000'' /><set value=''2446000000'' /><set value=''2339883'' /></dataset><dataset seriesName=''Quarter 3''><set value=''540000000'' /><set value=''713000000'' /><set value=''819000000'' /><set value=''1016000000'' /><set value=''1577000000'' /><set value=''1284000000'' /><set value=''1433000000'' /><set value=''1685000000'' /><set value=''1610000000'' /><set value=''2117000000'' /><set value=''2844000000'' /><set value=''2017000000'' /><set value=''2104148'' /></dataset><dataset seriesName=''Quarter 4''><set value=''471000000'' /><set value=''722000000'' /><set value=''843000000'' /><set value=''957000000'' /><set value=''1801000000'' /><set value=''1262000000'' /><set value=''1597000000'' /><set value=''1815000000'' /><set value=''1848000000'' /><set value=''2259000000'' /><set value=''2135000000'' /><set value=''2565000000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''1999'' value=''2031051000'' isSliced=''1'' color=''ff3300''/><set label=''2000'' value=''2557184000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''3214178000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''3483876000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''5456670000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''5856057000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''5885586000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''6798908000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''6850617000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''8619584000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''9652000000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''9433000000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:24:05'),
('17', '2014-02-26', 'LAS', '30-Sep', '$390.00', '$390.00', '$0.00', '0.00 %', '96,000,000.00', '$37,440,000,000.00', '$341.00', '987.87%', '$0.00', '0.00%', '$390.00', '0.00%', '$0.00 to $0.00', '0.00%', '$240.00 to $410.00', '0.00 units', '0 units to 1,140,574 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''1999'' /><category label=''2000'' /><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /></categories><dataset seriesName=''Quarter 1''><set value=''70311000'' /><set value=''75813000'' /><set value=''90841000'' /><set value=''100384000'' /><set value=''94493000'' /><set value=''252636000'' /><set value=''1106638000'' /><set value=''546593000'' /><set value=''849437000'' /><set value=''935755000'' /><set value=''415822000'' /><set value=''601102000'' /><set value=''821360000'' /><set value=''722999000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''7853000'' /><set value=''25129000'' /><set value=''31657000'' /><set value=''25009000'' /><set value=''29212000'' /><set value=''168130000'' /><set value=''116281000'' /><set value=''603366000'' /><set value=''349864000'' /><set value=''242349000'' /><set value=''945027000'' /><set value=''645371000'' /><set value=''721412000'' /><set value=''866419000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''104330000'' /><set value=''166740000'' /><set value=''215440000'' /><set value=''243346000'' /><set value=''207052000'' /><set value=''268654000'' /><set value=''141024000'' /><set value=''499139000'' /><set value=''594512000'' /><set value=''1258583000'' /><set value=''1391228000'' /><set value=''363104000'' /><set value=''536711000'' /><set value=''4211793000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''357015000'' /><set value=''404297000'' /><set value=''627947000'' /><set value=''826523000'' /><set value=''612888000'' /><set value=''820306000'' /><set value=''525196000'' /><set value=''906146000'' /><set value=''871607000'' /><set value=''578444000'' /><set value=''-193134000'' /><set value=''1504612000'' /><set value=''282626000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''1999'' value=''539509000'' isSliced=''1'' color=''ff3300''/><set label=''2000'' value=''671979000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''965885000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''1195262000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''943645000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''1509726000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''1889139000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''2555244000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''2665420000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''3015131000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''2559024000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''3114189000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''2362109000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:22:53'),
('200', '2014-02-26', 'MIL', '31-Dec', '$1.90', '$1.90', '$0.00', '0.00 %', '1,201,149,291.00', '$2,282,183,652.90', '$1.90', '0.00%', '$2.00', '-5.00%', '$1.90', '-5.00%', '$1.90 to $1.90', '-5.00%', '$1.81 to $2.70', '2,652.00 units', '0 units to 11,951,507 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /></categories><dataset seriesName=''Quarter 1''><set value=''86940000'' /><set value=''157278000'' /><set value=''33573000'' /><set value=''58393000'' /><set value=''630654000'' /><set value=''135028000'' /><set value=''57595000'' /><set value=''74213000'' /><set value=''113242000'' /><set value=''-67650000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''96792000'' /><set value=''78375000'' /><set value=''23093000'' /><set value=''34695000'' /><set value=''38903000'' /><set value=''16919000'' /><set value=''-10923000'' /><set value=''121134000'' /><set value=''36179000'' /><set value=''47958000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''140927000'' /><set value=''-118491000'' /><set value=''49888000'' /><set value=''93933000'' /><set value=''96164000'' /><set value=''17449000'' /><set value=''90673000'' /><set value=''82256000'' /><set value=''114132000'' /><set value=''80202000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''53725000'' /><set value=''-29031000'' /><set value=''154649000'' /><set value=''185598000'' /><set value=''-296220000'' /><set value=''76077000'' /><set value=''37185000'' /><set value=''4519000'' /><set value=''175801000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2004'' value=''378384000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''88131000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''261203000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''372619000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''469501000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''245473000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''174530000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''282122000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''439354000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:34:39'),
('25', '2014-02-26', 'PAL', '30-Jun', '$95.00', '$95.00', '$0.00', '0.00 %', '1,437,028.00', '$136,517,660.00', '$45.00', '0.00%', '$120.00', '0.00%', '$95.00', '0.00%', '$0.00 to $0.00', '0.00%', '$95.00 to $95.00', '0.00 units', '0 units to 150 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2000'' /><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /><category label=''2014'' /></categories><dataset seriesName=''Quarter 1''><set value=''4906000'' /><set value=''6322000'' /><set value=''21342000'' /><set value=''-5632000'' /><set value=''13430000'' /><set value=''1692000'' /><set value=''9078000'' /><set value=''-1453000'' /><set value=''4712000'' /><set value=''21188000'' /><set value=''11336000'' /><set value=''22173000'' /><set value=''2619000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''4839000'' /><set value=''-2490000'' /><set value=''-4080000'' /><set value=''-8170000'' /><set value=''-386000'' /><set value=''-11182000'' /><set value=''850000'' /><set value=''-9364000'' /><set value=''4546000'' /><set value=''-14790000'' /><set value=''-8451000'' /><set value=''-8295000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 3''><set value=''-13850000'' /><set value=''9776000'' /><set value=''-8663000'' /><set value=''2463000'' /><set value=''-9100000'' /><set value=''-6890000'' /><set value=''244000'' /><set value=''3925000'' /><set value=''-5306000'' /><set value=''-14219000'' /><set value=''2658000'' /><set value=''-22113000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 4''><set value=''8164000'' /><set value=''11960000'' /><set value=''-4661000'' /><set value=''14765000'' /><set value=''-880000'' /><set value=''24050000'' /><set value=''5521000'' /><set value=''9129000'' /><set value=''5555000'' /><set value=''17899000'' /><set value=''9120000'' /><set value=''26671000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2000'' value=''4059000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''25568000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''3938000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''3426000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''3064000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''7670000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''21582000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''9401000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''10026000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''14663000'' isSliced=''1'' color=''ff3300''/><set label=''2013'' value=''14124000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:35:12'),
('31', '2014-02-26', 'S', '31-Dec', '$17.10', '$17.10', '$-0.90', '-5.00 %', '552,145,844.00', '$9,441,693,932.40', '$17.10', '-5.00%', '$18.00', '-14.50%', '$18.00', '6.88%', '$17.10 to $17.10', '6.88%', '$14.00 to $20.00', '1,800.00 units', '0 units to 5,378,510 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''1999'' /><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /></categories><dataset seriesName=''Quarter 1''><set value=''10115000'' /><set value=''15433000'' /><set value=''41669000'' /><set value=''62923000'' /><set value=''147632000'' /><set value=''273988000'' /><set value=''274668000'' /><set value=''279161000'' /><set value=''254044000'' /><set value=''349137000'' /><set value=''396906000'' /><set value=''503107000'' /><set value=''458575000'' /><set value=''6945000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''22122000'' /><set value=''71272000'' /><set value=''62982000'' /><set value=''23203000'' /><set value=''148042000'' /><set value=''322828000'' /><set value=''285399000'' /><set value=''266502000'' /><set value=''351756000'' /><set value=''373105000'' /><set value=''230954000'' /><set value=''410660000'' /><set value=''337954000'' /><set value=''330576000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''1581000'' /><set value=''61055000'' /><set value=''72511000'' /><set value=''84255000'' /><set value=''292731000'' /><set value=''222733000'' /><set value=''270837000'' /><set value=''359732000'' /><set value=''295088000'' /><set value=''388896000'' /><set value=''453678000'' /><set value=''423993000'' /><set value=''317986000'' /><set value=''319859000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''-32632000'' /><set value=''-59326000'' /><set value=''39863000'' /><set value=''171789000'' /><set value=''240779000'' /><set value=''284260000'' /><set value=''281766000'' /><set value=''307599000'' /><set value=''480044000'' /><set value=''366706000'' /><set value=''442503000'' /><set value=''382896000'' /><set value=''338161000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''1999'' value=''1186000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''88434000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''217025000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''342170000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''829184000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''1001505000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''1112670000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''1212994000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''1380932000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''1477844000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''1524041000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''1720656000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''1452676000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:31:31'),
('6', '2014-02-26', 'DG', '30-Jun', '$5.00', '$5.00', '$0.00', '0.00 %', '2,809,171,264.00', '$14,045,856,320.00', '$4.91', '0.00%', '$5.00', '-7.41%', '$5.00', '-1.96%', '$5.00 to $5.00', '-1.96%', '$3.80 to $5.50', '831,517.00 units', '0 units to 8,869,302 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /><category label=''2014'' /></categories><dataset seriesName=''Quarter 1''><set value=''1101000000'' /><set value=''783000000'' /><set value=''321134000'' /><set value=''293279000'' /><set value=''252411000'' /><set value=''292607000'' /><set value=''206528000'' /><set value=''259742000'' /><set value=''428725000'' /><set value=''175044000'' /><set value=''114727000'' /><set value=''152475000'' /><set value=''339693000'' /><set value=''367676000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''116000000'' /><set value=''56000000'' /><set value=''372631000'' /><set value=''523907000'' /><set value=''931593000'' /><set value=''538218000'' /><set value=''549711000'' /><set value=''348027000'' /><set value=''504851000'' /><set value=''349615000'' /><set value=''204617000'' /><set value=''357740000'' /><set value=''468104000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 3''><set value=''265000000'' /><set value=''319636000'' /><set value=''329232000'' /><set value=''298293000'' /><set value=''498793000'' /><set value=''445301000'' /><set value=''122107000'' /><set value=''245703000'' /><set value=''168140000'' /><set value=''120218000'' /><set value=''126152000'' /><set value=''297706000'' /><set value=''242502000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 4''><set value=''-531424000'' /><set value=''344369000'' /><set value=''305115000'' /><set value=''437479000'' /><set value=''670257000'' /><set value=''935721000'' /><set value=''543528000'' /><set value=''188977000'' /><set value=''449606000'' /><set value=''73554000'' /><set value=''633316000'' /><set value=''421637000'' /><set value=''160945000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''1999'' value=''840504000'' isSliced=''1'' color=''ff3300''/><set label=''2000'' value=''1004135000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''950576000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''1503005000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''1328112000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''1552958000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''2353054000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''2211847000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''1421874000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''1042449000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''1551323000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''789398000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''1015690000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''1229558000'' isSliced=''1'' color=''ff3300''/><set label=''2013'' value=''1211244000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:33:46'),
('6', '2014-02-27', 'DG', '30-Jun', '$5.00', '$5.00', '$0.00', '0.00 %', '2,809,171,264.00', '$14,045,856,320.00', '$4.91', '0.00%', '$5.00', '-7.41%', '$5.00', '-1.96%', '$0.00 to $0.00', '-1.96%', '$3.80 to $5.50', '0.00 units', '0 units to 8,869,302 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /><category label=''2014'' /></categories><dataset seriesName=''Quarter 1''><set value=''1101000000'' /><set value=''783000000'' /><set value=''321134000'' /><set value=''293279000'' /><set value=''252411000'' /><set value=''292607000'' /><set value=''206528000'' /><set value=''259742000'' /><set value=''428725000'' /><set value=''175044000'' /><set value=''114727000'' /><set value=''152475000'' /><set value=''339693000'' /><set value=''367676000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''116000000'' /><set value=''56000000'' /><set value=''372631000'' /><set value=''523907000'' /><set value=''931593000'' /><set value=''538218000'' /><set value=''549711000'' /><set value=''348027000'' /><set value=''504851000'' /><set value=''349615000'' /><set value=''204617000'' /><set value=''357740000'' /><set value=''468104000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 3''><set value=''265000000'' /><set value=''319636000'' /><set value=''329232000'' /><set value=''298293000'' /><set value=''498793000'' /><set value=''445301000'' /><set value=''122107000'' /><set value=''245703000'' /><set value=''168140000'' /><set value=''120218000'' /><set value=''126152000'' /><set value=''297706000'' /><set value=''242502000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 4''><set value=''-531424000'' /><set value=''344369000'' /><set value=''305115000'' /><set value=''437479000'' /><set value=''670257000'' /><set value=''935721000'' /><set value=''543528000'' /><set value=''188977000'' /><set value=''449606000'' /><set value=''73554000'' /><set value=''633316000'' /><set value=''421637000'' /><set value=''160945000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''1999'' value=''840504000'' isSliced=''1'' color=''ff3300''/><set label=''2000'' value=''1004135000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''950576000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''1503005000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''1328112000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''1552958000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''2353054000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''2211847000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''1421874000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''1042449000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''1551323000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''789398000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''1015690000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''1229558000'' isSliced=''1'' color=''ff3300''/><set label=''2013'' value=''1211244000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 23:10:29'),
('7014', '2014-02-26', 'PJAM10', '31-Dec', '$0.00', '$1.00', '$0.00', '0.00 %', '0.00', '$0.00', '$0.00', '0.00%', '$0.00', '0.00%', '$1.00', '0.00%', '$0.00 to $0.00', '0.00%', '$0.00 to $0.00', '0.00 units', '0 units to 0 units', '', '', '2014-02-27 03:41:46'),
('7033', '2014-02-26', 'SFC', '30-Nov', '$260.00', '$260.00', '$0.00', '0.00 %', '277,543,397.00', '$72,161,283,220.00', '$150.00', '0.00%', '$260.00', '0.00%', '$260.00', '0.00%', '$0.00 to $0.00', '19.27%', '$210.00 to $260.00', '0.00 units', '0 units to 448,075 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2007'' /><category label=''2008'' /></categories><dataset seriesName=''Quarter 1''><set value=''16112000'' /><set value=''20021000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''20127000'' /><set value=''25428000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''32131000'' /><set value=''28611000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''40356000'' /><set value=''50504000'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2007'' value=''108726000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''125243000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 02:55:55'),
('7033', '2014-02-27', 'SFC', '30-Nov', '$260.00', '$260.00', '$0.00', '0.00 %', '277,543,397.00', '$72,161,283,220.00', '$150.00', '0.00%', '$260.00', '0.00%', '$260.00', '0.00%', '$0.00 to $0.00', '19.27%', '$210.00 to $260.00', '0.00 units', '0 units to 448,075 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2007'' /><category label=''2008'' /></categories><dataset seriesName=''Quarter 1''><set value=''16112000'' /><set value=''20021000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''20127000'' /><set value=''25428000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''32131000'' /><set value=''28611000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''40356000'' /><set value=''50504000'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2007'' value=''108726000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''125243000'' isSliced=''1'' color=''ff3300''/></chart>', NULL),
('7043', '2014-02-26', 'LASD', '31-Mar', '$1.30', '$1.30', '$-0.01', '-0.76 %', '3,366,431,150.00', '$4,376,360,495.00', '$1.31', '0.00%', '$1.49', '-10.35%', '$1.31', '0.00%', '$1.30 to $1.30', '0.00%', '$1.25 to $18.00', '1,093,460.00 units', '0 units to 6,341,051 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /><category label=''2014'' /></categories><dataset seriesName=''Quarter 1''><set value=''34997000'' /><set value=''38971000'' /><set value=''130674000'' /><set value=''135720000'' /><set value=''164185000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''55320000'' /><set value=''39990000'' /><set value=''123020000'' /><set value=''53637000'' /><set value=''138690000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''-750000'' /><set value=''56387000'' /><set value=''124302000'' /><set value=''120634000'' /><set value=''0'' /></dataset><dataset seriesName=''Quarter 4''><set value=''8154000'' /><set value=''148803000'' /><set value=''172381000'' /><set value=''196842000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2010'' value=''97721000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''306398000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''550377000'' isSliced=''1'' color=''ff3300''/><set label=''2013'' value=''506833000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:19:57'),
('7061', '2014-02-26', 'JSE', '31-Dec', '$2.10', '$2.10', '$0.00', '0.00 %', '140,250,000.00', '$294,525,000.00', '$1.90', '0.00%', '$2.10', '0.00%', '$2.10', '16.67%', '$0.00 to $0.00', '16.67%', '$1.80 to $3.25', '0.00 units', '0 units to 929,650 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2012'' /></categories><dataset seriesName=''Quarter 1''><set value=''0'' /></dataset><dataset seriesName=''Quarter 2''><set value=''0'' /></dataset><dataset seriesName=''Quarter 3''><set value=''4835000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''0'' /></dataset></chart>', '', '2014-02-27 03:26:46'),
('7067', '2014-02-26', 'XFUND', '31-Dec', '$6.95', '$6.95', '$0.00', '0.00 %', '0.00', '$0.00', '$6.50', '-0.71%', '$7.00', '5.30%', '$6.95', '14.50%', '$0.00 to $0.00', '14.50%', '$5.07 to $7.10', '0.00 units', '0 units to 29,869,023 units', '', '', '2014-02-27 03:32:41'),
('7070', '2014-02-26', 'SJ', '31-Dec', '$8.80', '$8.94', '$-0.20', '-2.19 %', '0.00', '$0.00', '$8.80', '-1.97%', '$9.00', '-11.13%', '$9.14', '-12.09%', '$8.80 to $9.14', '-12.09%', '$8.05 to $10.60', '11,995.00 units', '0 units to 1,365,319 units', '', '', '2014-02-27 03:32:14'),
('94', '2014-02-26', 'GHL', '31-Dec', '$270.00', '$270.00', '$0.00', '0.00 %', '231,899,986.00', '$62,612,996,220.00', '$185.00', '166.01%', '$300.00', '166.01%', '$270.00', '166.01%', '$0.00 to $0.00', '166.01%', '$270.00 to $277.00', '0.00 units', '0 units to 752 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2000'' /><category label=''2001'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2007'' /><category label=''2008'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /></categories><dataset seriesName=''Quarter 1''><set value=''25906000'' /><set value=''44866000'' /><set value=''90445000'' /><set value=''532777000'' /><set value=''142184000'' /><set value=''-205150000'' /><set value=''50619000'' /><set value=''150310000'' /><set value=''89254000'' /><set value=''96975000'' /><set value=''10879000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''29648000'' /><set value=''28158000'' /><set value=''19383000'' /><set value=''81065000'' /><set value=''9493000'' /><set value=''37633000'' /><set value=''485996000'' /><set value=''66912000'' /><set value=''13197000'' /><set value=''99147000'' /><set value=''36423000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''33859000'' /><set value=''49393000'' /><set value=''733901000'' /><set value=''-14469000'' /><set value=''100206000'' /><set value=''99380000'' /><set value=''26807000'' /><set value=''-6409000'' /><set value=''141149000'' /><set value=''106179000'' /><set value=''14206000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''62392000'' /><set value=''4110000'' /><set value=''211900000'' /><set value=''170603000'' /><set value=''120341000'' /><set value=''198732000'' /><set value=''-359102000'' /><set value=''194692000'' /><set value=''17503000'' /><set value=''50231000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2000'' value=''151805000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''126527000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''1055629000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''583220000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''372224000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''130595000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''204320000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''405505000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''261103000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''352532000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 01:18:21'),
('94', '2014-02-27', 'GHL', '31-Dec', '$270.00', '$270.00', '$0.00', '0.00 %', '231,899,986.00', '$62,612,996,220.00', '$185.00', '166.01%', '$300.00', '166.01%', '$270.00', '166.01%', '$0.00 to $0.00', '166.01%', '$270.00 to $277.00', '0.00 units', '0 units to 752 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2000'' /><category label=''2001'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2007'' /><category label=''2008'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /></categories><dataset seriesName=''Quarter 1''><set value=''25906000'' /><set value=''44866000'' /><set value=''90445000'' /><set value=''532777000'' /><set value=''142184000'' /><set value=''-205150000'' /><set value=''50619000'' /><set value=''150310000'' /><set value=''89254000'' /><set value=''96975000'' /><set value=''10879000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''29648000'' /><set value=''28158000'' /><set value=''19383000'' /><set value=''81065000'' /><set value=''9493000'' /><set value=''37633000'' /><set value=''485996000'' /><set value=''66912000'' /><set value=''13197000'' /><set value=''99147000'' /><set value=''36423000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''33859000'' /><set value=''49393000'' /><set value=''733901000'' /><set value=''-14469000'' /><set value=''100206000'' /><set value=''99380000'' /><set value=''26807000'' /><set value=''-6409000'' /><set value=''141149000'' /><set value=''106179000'' /><set value=''14206000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''62392000'' /><set value=''4110000'' /><set value=''211900000'' /><set value=''170603000'' /><set value=''120341000'' /><set value=''198732000'' /><set value=''-359102000'' /><set value=''194692000'' /><set value=''17503000'' /><set value=''50231000'' /><set value=''0'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''2000'' value=''151805000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''126527000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''1055629000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''583220000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''372224000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''130595000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''204320000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''405505000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''261103000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''352532000'' isSliced=''1'' color=''ff3300''/></chart>', NULL),
('95', '2014-02-26', 'NCBJ', '30-Sep', '$19.01', '$19.01', '$0.01', '0.05 %', '2,466,762,828.00', '$46,893,161,360.28', '$19.01', '0.05%', '$19.30', '7.16%', '$19.00', '16.06%', '$19.00 to $19.05', '16.06%', '$16.00 to $22.00', '1,960,431.00 units', '0 units to 100,025,506 units', '<chart caption=''Quarterly Earnings'' xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''400'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><categories><category label=''2000'' /><category label=''2001'' /><category label=''2002'' /><category label=''2003'' /><category label=''2004'' /><category label=''2005'' /><category label=''2006'' /><category label=''2007'' /><category label=''2008'' /><category label=''2009'' /><category label=''2010'' /><category label=''2011'' /><category label=''2012'' /><category label=''2013'' /></categories><dataset seriesName=''Quarter 1''><set value=''83072000'' /><set value=''323236000'' /><set value=''167997000'' /><set value=''480914000'' /><set value=''746208000'' /><set value=''971124000'' /><set value=''1501617000'' /><set value=''1859065000'' /><set value=''1859065000'' /><set value=''2383090000'' /><set value=''2771079000'' /><set value=''3005747000'' /><set value=''2768952000'' /><set value=''2786360000'' /></dataset><dataset seriesName=''Quarter 2''><set value=''133000000'' /><set value=''338908000'' /><set value=''217155000'' /><set value=''1195049000'' /><set value=''1149337000'' /><set value=''790086000'' /><set value=''1219342000'' /><set value=''1617822000'' /><set value=''2646909000'' /><set value=''2242700000'' /><set value=''2554113000'' /><set value=''3118835000'' /><set value=''2003802000'' /><set value=''1744452000'' /></dataset><dataset seriesName=''Quarter 3''><set value=''275000000'' /><set value=''145924000'' /><set value=''806547000'' /><set value=''865551000'' /><set value=''976396000'' /><set value=''863319000'' /><set value=''1550989000'' /><set value=''1762472000'' /><set value=''2251482000'' /><set value=''2714385000'' /><set value=''2756735000'' /><set value=''3144395000'' /><set value=''2587610000'' /><set value=''2272698000'' /></dataset><dataset seriesName=''Quarter 4''><set value=''476429000'' /><set value=''-412626000'' /><set value=''768465000'' /><set value=''262877000'' /><set value=''344797000'' /><set value=''1844013000'' /><set value=''1719515000'' /><set value=''1362067000'' /><set value=''1943717000'' /><set value=''2908010000'' /><set value=''2992871000'' /><set value=''3765452000'' /><set value=''2685498000'' /><set value=''1746321000'' /></dataset></chart>', '<chart caption=''Annual Earnings''  xAxisName=''Year'' yAxisName=''Earnings'' numberPrefix=''$'' showBorder=''1'' borderColor=''134b7c'' borderAlpha=''100'' borderThickness=''3'' canvasBgColor=''f3f4f8'' canvasBgAngle=''-90'' baseFont=''Verdana'' baseFontSize=''10'' baseFontColor=''710046'' bgColor=''f3f4f8'' bgAlpha=''-90'' showValues=''0''><set label=''1999'' value=''221573000'' isSliced=''1'' color=''ff3300''/><set label=''2000'' value=''967501000'' isSliced=''1'' color=''ff3300''/><set label=''2001'' value=''395442000'' isSliced=''1'' color=''ff3300''/><set label=''2002'' value=''1960164000'' isSliced=''1'' color=''ff3300''/><set label=''2003'' value=''2804391000'' isSliced=''1'' color=''ff3300''/><set label=''2004'' value=''3216738000'' isSliced=''1'' color=''ff3300''/><set label=''2005'' value=''4468542000'' isSliced=''1'' color=''ff3300''/><set label=''2006'' value=''5486625000'' isSliced=''1'' color=''ff3300''/><set label=''2007'' value=''6601426000'' isSliced=''1'' color=''ff3300''/><set label=''2008'' value=''8701173000'' isSliced=''1'' color=''ff3300''/><set label=''2009'' value=''10248185000'' isSliced=''1'' color=''ff3300''/><set label=''2010'' value=''11074798000'' isSliced=''1'' color=''ff3300''/><set label=''2011'' value=''13034429000'' isSliced=''1'' color=''ff3300''/><set label=''2012'' value=''10045862000'' isSliced=''1'' color=''ff3300''/></chart>', '2014-02-27 03:14:42');

-- --------------------------------------------------------

--
-- Table structure for table `symbol_lookup`
--

CREATE TABLE IF NOT EXISTS `symbol_lookup` (
  `stock_code` int(11) NOT NULL,
  `symbol` varchar(64) NOT NULL,
  `institution` varchar(256) NOT NULL,
  `web_address` varchar(512) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_code`,`symbol`),
  UNIQUE KEY `symbol_UNIQUE` (`symbol`),
  UNIQUE KEY `stock_code_UNIQUE` (`stock_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `symbol_lookup`
--

INSERT INTO `symbol_lookup` (`stock_code`, `symbol`, `institution`, `web_address`, `last_updated`, `date_created`) VALUES
(1, 'BNSJ', 'The Bank of Nova Scotia Jamaica Ltd.', 'http://www.scotiabank.com.jm/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(3, 'CAR', 'Carreras Limited', 'http://www.carrerasltd.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(4, 'CMP', 'Caribbean Metal Products Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(5, 'CRTS', 'Courts Jamaica Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(6, 'DG', 'Desnoes and Geddes Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7, 'DYOL', 'Dyoll Group Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(8, 'GLNR', 'Gleaner Company', 'http://www.jamaica-gleaner.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(9, 'GYR', 'Goodyear Jamaica Ltd.', 'http://www.goodyear.com.jm/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(10, 'GK', 'GraceKennedy Ltd.', 'http://www.gracekennedy.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(12, 'JP', 'Jamaica Producers Group Ltd.', 'http://www.jpjamaica.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(17, 'LAS', 'Lascelles, deMercado and Company Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(18, 'SLJ', 'Sagicor Life Jamaica Limited', 'http://www.sagicorjamaica.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(19, 'MFP', 'Montego Freeport Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(20, 'MBICE', 'Montego Bay Ice Company', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(25, 'PAL', 'Palace Amusement Co. Ltd.', 'http://www.palaceamusement.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(26, 'PJAM', 'Pan-Jamaican Investment Trust Ltd.', 'http://www.panjam.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(27, 'PEG', 'Pegasus Hotels of Jamaica Limited', 'http://www.jamaicapegasus.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(29, 'SALF', 'Salada Foods Jamaica Limited', 'http://www.saladafoodsja.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(30, 'SEP', 'Seprod Limited', 'http://www.seprod.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(31, 'S', 'Sagicor Investments Jamaica Limited', 'http://www.sagicorinvestmentsja.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(34, 'WIPP', 'West Indies Pulp & Paper', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(39, 'JPS5C', 'J.P.S.5%  C', 'http://www.jpsco.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(41, 'JPS7', 'J.P.S. 7%', 'http://www.jpsco.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(42, 'CWJA5.5', 'Cable & Wireless Ja. 5.5%', 'http://www.cwjamaica.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(43, 'CWJA6', 'Cable & Wireless Ja. 6%', 'http://www.cwjamaica.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(57, 'CCC', 'Caribbean Cement Company Ltd.', 'http://www.caribcement.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(59, 'HL', 'Hardware & Lumber', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(65, 'FCIBJ', 'First Caribbean International Bank Jamaica', 'http://www.firstcaribbeanbank.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(66, 'LIME', 'LIME', 'http://www.time4lime.com/jm/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(69, 'RJR', 'Radio Jamaica Ltd.', 'http://www.radiojamaica.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(70, 'JBG', 'Jamaica Broilers Ltd.', 'http://www.jamaicabroilersgroup.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(71, 'SIJL', 'Scotia Investments Jamaica Ltd.', 'http://www.scotiainvestmentsjm.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(72, 'BRG', 'Berger Paints Ltd.', 'http://www.bergeronline.com/caribbean', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(73, 'CBNY', 'Ciboney Group Ltd.', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(76, 'FJI', 'First Jamaica Investments Limited', 'http://www.firstlife.com.jm/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(77, 'PULS', 'Pulse Investments', 'http://www.caribbeanfashionweek.com/pulse_profile.html', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(78, 'FCIB', 'First Caribbean International Bank', 'http://www.firstcaribbeanbank.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(81, 'KW', 'Kingston Wharves Ltd.', 'http://www.kingstonwharves.com.jm/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(86, 'TCL', 'Trinidad Cement Ltd.', 'http://www.tclgroup.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(94, 'GHL', 'Guardian Holdings Ltd.', 'http://www.guardianholdings.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(95, 'NCBJ', 'National Commercial Bank of Jamaica Ltd.', 'http://www.jncb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(96, 'JPS5D', 'J.P.S 5% D', 'http://www.jpsco.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(101, 'RBTT', 'RBTT Financial Holdings Ltd.', 'http://www.rbtt.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(102, 'JMMB', 'Jamaica Money Market Brokers Ltd.', 'http://www.jmmb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(103, 'CCMB', 'Capital & Credit Merchant Bank Ltd.', 'http://www.capital-credit.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(106, 'NCBCM11.75', 'NCB Capital Markets Limited', 'http://www.ncbcapitalmarkets.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(107, 'SGJ', 'Scotia Group Jamaica', 'http://www.scotiabank.com.jm', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(108, 'BNSJVP', 'Bank of Nova Scotia Var. Pref.', 'http://www.scotiabank.com.jm/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(109, 'MIL12', 'Mayberry Investments Ltd 12%', 'http://www.mayberryinv.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(123, 'SVL', 'Supreme Ventures Limited', 'http://www.supremeventures.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(200, 'MIL', 'Mayberry Investments Ltd', 'http://www.mayberryinv.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7000, 'JLA7.5', 'Ja. Livestock Association 7.5%', 'http://www.jlaltd.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7001, 'CTZN20', 'CitizensBank 20%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7002, 'CTZN25', 'CitizenBank 25%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7003, 'JTC5.5', 'Jamaica Telephone Co. 5.5%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7004, 'JTC6', 'Jamaica Telephone 6%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7005, 'JPS5', 'Jamaica Public Service Co. 5%', 'http://www.jpsco.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7006, 'JPS6', 'Jamaica Public Service Co. 6%', 'http://www.jpsco.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7008, 'LAS15', 'Lascelles De Mercado 15%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7009, 'LAS6', 'Lascelles De Mercado 6%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7010, 'UBJ20', 'Union Bank of Jamaica 20%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7011, 'UBJ25', 'Union Bank of Jamaica 25%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7014, 'PJAM10', 'PAN JAMAICAN 10% CCR', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7015, 'MIDAA', 'MIDA SERIES A', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7016, 'MIDAB', 'MIDA SERIES B', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7017, 'BGMN10.', 'Belize Gov. Notes 10.5%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7018, 'DMFN10', 'Dominca Fixed Notes Series A 10%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7019, 'DMFN11', 'Dominca Fixed Notes Series B 11%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7020, 'UBJCCR', 'Union Bank of Jam. CCR', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7021, 'BGMN12', 'Belize Gov. Mortgage Notes 12%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7022, 'LUCELEC', 'LUCELEC Secured Floating Rate Bonds', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7023, 'BGMN10', 'Belize Gov. Mortgage Notes 10%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7024, 'BGMN11.', 'Belize Gov.  Mortgage Notes 11.5%', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7025, 'NEVIS', 'Nevis Island Bond', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7026, 'NEVIS10', 'Nevis Island 10.5% Bond', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7027, 'JMMB12', 'Jamaica Money Market Brokers Limited 12%', 'http://www.jmmb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7028, 'JMMB12.25', 'Jamaica Money Market Brokers Limited 12.25%', 'http://www.jmmb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7029, 'JMMB12.15', 'Jamaica Money Market Brokers Limited 12.15%', 'http://www.jmmb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7030, 'PCFS12.5', 'Pan Caribbean Financial Services 12.5%', 'http://www.gopancaribbean.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7031, 'CCFG', 'Capital & Credit Financial Group Limited', 'http://www.capital-credit.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7032, 'CCMBVP', 'Capital & Credit Merchant Bank Limited', 'http://www.capital-credit.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7033, 'SFC', 'Sagicor Financial Corporation', 'http://www.sagicor.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7034, 'JSEVP', 'Jamaica Stock Exchange VP', 'http://www.jamstockex.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7035, 'KPREIT', 'Kingston Properties Limited', 'http://www.kingstonpropertiesreit.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7036, 'AFS', 'Access Financial Services Limited', 'http://www.accessfinanceonline.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7037, 'BIL', 'Barita Investments Limited', 'http://www.barita.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7038, 'BILVPA', 'Barita Investments Limited - Series A', 'http://www.baritagroup.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7039, 'BILVPB', 'Barita Investments Limited - Series B', 'http://www.baritagroup.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7041, 'BPOW', 'Blue Power Group Limited', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7042, 'JAMT', 'Jamaican Teas Limited', 'http://www.jamaicanteas.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7043, 'LASD', 'Lasco Distributors Limited', 'http://www.lascodistributors.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7044, 'LASM', 'Lasco Manufacturing Limited', 'http://www.lascojamaica.com/foodManufacturing.asp', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7045, 'LASF', 'Lasco Financial Services Limited', 'http://www.lascojamaica.com/financial.asp', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7046, 'CHL', 'Cargo Handlers Limited', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7047, 'DCOVE', 'Dolphin Cove Limited', 'http://www.dolphincovejamaica.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7048, 'JMMB8.5', 'Jamaica Money Market Brokers Ltd 8.50%', 'http://www.jmmb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7049, 'JMMB8.75', 'Jamaica Money Market Brokers Limited 8.75%', 'http://www.jmmb.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7050, 'HONBUN', 'Honey Bun (1982) Limited', 'http://www.honeybunja.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7051, 'AMG', 'AMG Packaging & Paper Company Limited', 'http://www.amgpackaging.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7052, 'PROVEN', 'Proven Investments Limited', 'http://www.weareproven.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7053, 'CPJ', 'Caribbean Producers Jamaica', 'http://www.caribbeanproducers.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7054, 'GENAC', 'General Accident Insurance Company Jamaica Limited', 'http://www.genac.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7055, 'PROVEN8', 'Proven Investments Limited 8%', 'www.weareproven.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7056, 'MUSIC', 'C2W Music Limited', 'http://c2wmusic.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7057, 'KLE', 'K.L.E. Group Limited', 'http://www.klegroupltd.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7058, 'PURITY', 'Consolidated Bakeries (Jamaica) Limited', 'http://www.purityjamaica.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7059, 'PTL', 'Paramount Trading (Jamaica) Limited', 'http://www.paramountjm.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7060, 'KREMI', 'Caribbean Cream Limited', 'http://www.caribcream.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7061, 'JSE', 'Jamaica Stock Exchange Limited', 'http://www.jamstockex.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7062, 'EPLY', 'Eppley Limited', 'http://www.eppleylimited.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7063, 'JMMB7.5', 'Jamaica Money Market Brokers Limited 7.50%', 'http://www.jmmb.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7064, 'JMMB7.25', 'Jamaica Money Market Brokers Limited 7.25%', 'http://www.jmmb.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7065, 'CFF', 'Caribbean Flavours & Fragrances Limited', 'http://caribbeanflavoursjm.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7066, 'JPS9.5', 'J.P.S. 9.5%', 'http://www.jpsco.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7067, 'XFUND', 'Sagicor Real Estate X Fund Limited', 'http://www.sagicorjamaica.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7068, 'EPLY9.5', 'Eppley Limited 9.5%', 'http://www.eppleylimited.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7069, 'DTL', 'Derrimon Trading Company Limited', 'http://www.derrimon.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7070, 'SJ', 'Sagicor Group Jamaica Limited', 'http://www.sagicorjamaica.com/', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7071, 'MDS', 'Medical Disposables & Supplies Limited', '', '2014-02-27 14:43:01', '2014-02-26 18:23:04'),
(7072, 'KEX', 'Knutsford Express Services Limited', 'http://www.knutsfordexpress.com', '2014-02-27 14:43:01', '2014-02-26 18:23:04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cron_job`
--
CREATE TABLE IF NOT EXISTS `v_cron_job` (
`job_id` varchar(32)
,`job_name` varchar(128)
,`url` varchar(512)
,`intervals` int(11)
,`last_run` datetime
,`time_to_run` datetime
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daily_composition`
--
CREATE TABLE IF NOT EXISTS `v_daily_composition` (
`report_date` date
,`index_name` varchar(32)
,`symbol` varchar(32)
,`url` varchar(256)
,`price` decimal(18,2)
,`change` decimal(18,2)
,`change_perc` decimal(18,2)
,`volume_traded` decimal(12,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daily_market_history`
--
CREATE TABLE IF NOT EXISTS `v_daily_market_history` (
`report_date` date
,`index_name` varchar(32)
,`date` varchar(45)
,`value` decimal(13,2)
,`change` decimal(13,2)
,`change_perc` decimal(9,2)
,`volume_traded` decimal(12,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daily_market_perfromance`
--
CREATE TABLE IF NOT EXISTS `v_daily_market_perfromance` (
`report_date` date
,`index_name` varchar(32)
,`volume_traded` decimal(12,0)
,`week_to_date` decimal(11,2)
,`month_to_date` decimal(11,2)
,`quarter_to_date` decimal(11,2)
,`year_to_date` decimal(11,2)
,`change_name` varchar(45)
,`change_value` varchar(32)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daily_market_report`
--
CREATE TABLE IF NOT EXISTS `v_daily_market_report` (
`report_date` date
,`index_name` varchar(16)
,`value_date` date
,`value` decimal(10,2)
,`change` decimal(10,2)
,`change_perc` decimal(10,2)
,`change_dir` varchar(32)
,`vol` decimal(12,0)
,`market_capitalization` decimal(10,2)
,`change_perc_dir` varchar(32)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daily_quote_main`
--
CREATE TABLE IF NOT EXISTS `v_daily_quote_main` (
`id` int(11)
,`report_date` date
,`index` varchar(64)
,`value` decimal(18,2)
,`volume` decimal(18,0)
,`change` decimal(18,2)
,`change_perc` decimal(18,2)
,`direction` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_index_details`
--
CREATE TABLE IF NOT EXISTS `v_index_details` (
`report_date` date
,`index_name` varchar(16)
,`value_date` date
,`value` decimal(10,2)
,`change` decimal(10,2)
,`change_perc` decimal(10,2)
,`change_dir` varchar(32)
,`vol` decimal(12,0)
,`market_capitalization` decimal(10,2)
,`change_1969` decimal(10,2)
,`wtd` decimal(10,2)
,`mtd` decimal(10,2)
,`qtd` decimal(10,2)
,`ytd` decimal(10,2)
,`wtd_direction` varchar(32)
,`mtd_direction` varchar(32)
,`qtd_direction` varchar(32)
,`ytd_direction` varchar(32)
,`change_perc_dir` varchar(32)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_stock_detail`
--
CREATE TABLE IF NOT EXISTS `v_stock_detail` (
`cache_date` date
,`stock_code` varchar(32)
,`symbol` varchar(32)
,`institution` varchar(256)
,`financial_year_end` varchar(64)
,`last_traded_price` varchar(16)
,`close_price` varchar(64)
,`change` varchar(64)
,`change_perc` varchar(64)
,`shares_outstanding` varchar(64)
,`market_value_of_shares_outstanding` varchar(64)
,`bid` varchar(64)
,`week_to_date` varchar(64)
,`ask` varchar(64)
,`month_to_date` varchar(64)
,`open_previous_day_close` varchar(64)
,`quarter_to_date` varchar(64)
,`today_range` varchar(64)
,`year_to_date` varchar(64)
,`week_range_52` varchar(64)
,`volume_traded` varchar(64)
,`week_volume_range_52` varchar(128)
,`graph_img` varchar(1)
);
-- --------------------------------------------------------

--
-- Structure for view `v_cron_job`
--
DROP TABLE IF EXISTS `v_cron_job`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cron_job` AS select `cron_job`.`job_id` AS `job_id`,`cron_job`.`job_name` AS `job_name`,`cron_job`.`url` AS `url`,`cron_job`.`intervals` AS `intervals`,`cron_job`.`last_run` AS `last_run`,(`cron_job`.`last_run` + interval `cron_job`.`intervals` second) AS `time_to_run` from `cron_job`;

-- --------------------------------------------------------

--
-- Structure for view `v_daily_composition`
--
DROP TABLE IF EXISTS `v_daily_composition`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daily_composition` AS select `daily_composition`.`report_date` AS `report_date`,`daily_composition`.`index_name` AS `index_name`,`daily_composition`.`symbol` AS `symbol`,`daily_composition`.`url` AS `url`,`daily_composition`.`price` AS `price`,`daily_composition`.`change` AS `change`,`daily_composition`.`change_perc` AS `change_perc`,cast(`daily_composition`.`volume_traded` as decimal(12,0)) AS `volume_traded` from `daily_composition`;

-- --------------------------------------------------------

--
-- Structure for view `v_daily_market_history`
--
DROP TABLE IF EXISTS `v_daily_market_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daily_market_history` AS select `daily_market_history`.`report_date` AS `report_date`,`daily_market_history`.`index_name` AS `index_name`,`daily_market_history`.`date` AS `date`,`daily_market_history`.`value` AS `value`,`daily_market_history`.`change` AS `change`,`daily_market_history`.`change_perc` AS `change_perc`,cast(`daily_market_history`.`volume_traded` as decimal(12,0)) AS `volume_traded` from `daily_market_history`;

-- --------------------------------------------------------

--
-- Structure for view `v_daily_market_perfromance`
--
DROP TABLE IF EXISTS `v_daily_market_perfromance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daily_market_perfromance` AS select `daily_market_perfromance`.`report_date` AS `report_date`,`daily_market_perfromance`.`index_name` AS `index_name`,cast(`daily_market_perfromance`.`volume_traded` as decimal(12,0)) AS `volume_traded`,`daily_market_perfromance`.`week_to_date` AS `week_to_date`,`daily_market_perfromance`.`month_to_date` AS `month_to_date`,`daily_market_perfromance`.`quarter_to_date` AS `quarter_to_date`,`daily_market_perfromance`.`year_to_date` AS `year_to_date`,`daily_market_perfromance`.`change_name` AS `change_name`,`daily_market_perfromance`.`change_value` AS `change_value` from `daily_market_perfromance`;

-- --------------------------------------------------------

--
-- Structure for view `v_daily_market_report`
--
DROP TABLE IF EXISTS `v_daily_market_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daily_market_report` AS select `daily_market_report`.`report_date` AS `report_date`,`daily_market_report`.`index_name` AS `index_name`,`daily_market_report`.`value_date` AS `value_date`,`daily_market_report`.`value` AS `value`,`daily_market_report`.`change` AS `change`,`daily_market_report`.`change_perc` AS `change_perc`,`daily_market_report`.`change_dir` AS `change_dir`,cast(`daily_market_report`.`vol` as decimal(12,0)) AS `vol`,`daily_market_report`.`market_capitalization` AS `market_capitalization`,`daily_market_report`.`change_perc_dir` AS `change_perc_dir` from `daily_market_report`;

-- --------------------------------------------------------

--
-- Structure for view `v_daily_quote_main`
--
DROP TABLE IF EXISTS `v_daily_quote_main`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daily_quote_main` AS select `daily_quote_main`.`id` AS `id`,`daily_quote_main`.`report_date` AS `report_date`,`daily_quote_main`.`index` AS `index`,`daily_quote_main`.`value` AS `value`,`daily_quote_main`.`volume` AS `volume`,`daily_quote_main`.`change` AS `change`,`daily_quote_main`.`change_perc` AS `change_perc`,(case when (`daily_quote_main`.`direction` like '%mov_up%') then 'images/mov_up.png' when (`daily_quote_main`.`direction` like '%mov_down%') then 'images/mov_down.png' when (`daily_quote_main`.`direction` like '%mov_none%') then 'images/mov_none.png' else 'images/one_pixel.png' end) AS `direction` from `daily_quote_main`;

-- --------------------------------------------------------

--
-- Structure for view `v_index_details`
--
DROP TABLE IF EXISTS `v_index_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_index_details` AS select `daily_market_report`.`report_date` AS `report_date`,`daily_market_report`.`index_name` AS `index_name`,`daily_market_report`.`value_date` AS `value_date`,`daily_market_report`.`value` AS `value`,`daily_market_report`.`change` AS `change`,`daily_market_report`.`change_perc` AS `change_perc`,`daily_market_report`.`change_dir` AS `change_dir`,cast(`daily_market_report`.`vol` as decimal(12,0)) AS `vol`,`daily_market_report`.`market_capitalization` AS `market_capitalization`,`daily_market_report`.`change_1969` AS `change_1969`,`daily_market_report`.`wtd` AS `wtd`,`daily_market_report`.`mtd` AS `mtd`,`daily_market_report`.`qtd` AS `qtd`,`daily_market_report`.`ytd` AS `ytd`,`daily_market_report`.`wtd_direction` AS `wtd_direction`,`daily_market_report`.`mtd_direction` AS `mtd_direction`,`daily_market_report`.`qtd_direction` AS `qtd_direction`,`daily_market_report`.`ytd_direction` AS `ytd_direction`,`daily_market_report`.`change_perc_dir` AS `change_perc_dir` from `daily_market_report`;

-- --------------------------------------------------------

--
-- Structure for view `v_stock_detail`
--
DROP TABLE IF EXISTS `v_stock_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stock_detail` AS select `sd`.`cache_date` AS `cache_date`,`sd`.`stock_code` AS `stock_code`,`sd`.`symbol` AS `symbol`,`sl`.`institution` AS `institution`,coalesce(`sd`.`financial_year_end`,'') AS `financial_year_end`,`sd`.`last_traded_price` AS `last_traded_price`,`sd`.`close_price` AS `close_price`,`sd`.`change` AS `change`,`sd`.`change_perc` AS `change_perc`,`sd`.`shares_outstanding` AS `shares_outstanding`,`sd`.`market_value_of_shares_outstanding` AS `market_value_of_shares_outstanding`,`sd`.`bid` AS `bid`,`sd`.`week_to_date` AS `week_to_date`,`sd`.`ask` AS `ask`,`sd`.`month_to_date` AS `month_to_date`,`sd`.`open_previous_day_close` AS `open_previous_day_close`,`sd`.`quarter_to_date` AS `quarter_to_date`,`sd`.`today_range` AS `today_range`,`sd`.`year_to_date` AS `year_to_date`,`sd`.`week_range_52` AS `week_range_52`,`sd`.`volume_traded` AS `volume_traded`,`sd`.`week_volume_range_52` AS `week_volume_range_52`,(case `sd`.`annually_earning_graph` when '' then 'n' else 'y' end) AS `graph_img` from (`stock_detail` `sd` left join `symbol_lookup` `sl` on((`sd`.`symbol` = `sl`.`symbol`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
