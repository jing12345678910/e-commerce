-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-01-29 19:09:25
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `e_commerce`
--

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL COMMENT '類別id',
  `category_main` enum('上身','下身','飾品','配件') NOT NULL COMMENT '主類別',
  `category_sub` varchar(20) NOT NULL COMMENT '類別名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`category_id`, `category_main`, `category_sub`) VALUES
(1, '上身', '秋季針織'),
(2, '上身', '各式襯衫'),
(3, '上身', '好多外套'),
(4, '上身', '冬季長袖'),
(5, '上身', '都是套裝'),
(6, '上身', '時尚連身'),
(7, '上身', '仙女洋裝'),
(8, '上身', '夏季短袖'),
(9, '上身', '涼感背心'),
(10, '上身', '舒適內衣'),
(11, '下身', '修身長褲'),
(12, '下身', '辣妹短褲'),
(13, '下身', '優雅裙類'),
(14, '下身', '舒適內褲'),
(15, '飾品', '耳飾耳飾'),
(16, '飾品', '戒指戒指'),
(17, '飾品', '項鍊項鍊'),
(18, '飾品', '髮飾髮飾'),
(19, '配件', '包包包包'),
(20, '配件', '帽子帽子'),
(21, '配件', '眼鏡眼鏡'),
(22, '配件', '圍巾圍巾'),
(23, '配件', '皮帶皮帶'),
(24, '配件', '襪子襪子'),
(25, '配件', '鞋子鞋子');

-- --------------------------------------------------------

--
-- 資料表結構 `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL COMMENT '顏色id',
  `color_name` varchar(5) NOT NULL COMMENT '顏色'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(1, '白'),
(2, '杏'),
(3, '淺黃'),
(4, '咖'),
(5, '深咖'),
(6, '粉'),
(7, '藍'),
(8, '深藍'),
(9, '綠'),
(10, '灰'),
(11, '黑');

-- --------------------------------------------------------

--
-- 資料表結構 `images`
--

CREATE TABLE `images` (
  `images_id` int(11) NOT NULL,
  `image_path_main` varchar(300) NOT NULL,
  `image_path_other1` varchar(300) NOT NULL,
  `image_path_other2` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `images`
--

INSERT INTO `images` (`images_id`, `image_path_main`, `image_path_other1`, `image_path_other2`) VALUES
(1, './images/02_products/01_main.jpg', './images/02_products/01_other1.jpg', './images/02_products/01_other2.jpg'),
(2, './images/02_products/02_main.jpg', './images/02_products/02_other1.jpg', './images/02_products/02_other2.jpg'),
(3, './images/02_products/03_main.jpg', './images/02_products/03_other1.jpg', './images/02_products/03_other2.jpg'),
(4, './images/02_products/04_main.jpg', './images/02_products/04_other1.jpg', './images/02_products/04_other2.jpg'),
(5, './images/02_products/05_main.jpg', './images/02_products/05_other1.jpg', './images/02_products/05_other2.jpg'),
(6, './images/02_products/06_main.jpg', './images/02_products/06_other1.jpg', './images/02_products/06_other2.jpg'),
(7, './images/02_products/07_main.jpg', './images/02_products/07_other1.jpg', './images/02_products/07_other2.jpg'),
(8, './images/02_products/08_main.jpg', './images/02_products/08_other1.jpg', './images/02_products/08_other2.jpg'),
(9, './images/02_products/09_main.jpg', './images/02_products/09_other1.jpg', './images/02_products/09_other2.jpg'),
(10, './images/02_products/10_main.jpg', './images/02_products/10_other1.jpg', './images/02_products/10_other2.jpg'),
(11, './images/02_products/11_main.jpg', './images/02_products/11_other1.jpg', './images/02_products/11_other2.jpg'),
(12, './images/02_products/12_main.jpg', './images/02_products/12_other1.jpg', './images/02_products/12_other2.jpg'),
(13, './images/02_products/13_main.jpg', './images/02_products/13_other1.jpg', './images/02_products/13_other2.jpg'),
(14, './images/02_products/14_main.jpg', './images/02_products/14_other1.jpg', './images/02_products/14_other2.jpg'),
(15, './images/02_products/15_main.jpg', './images/02_products/15_other1.jpg', './images/02_products/15_other2.jpg'),
(16, './images/02_products/16_main.jpg', './images/02_products/16_other1.jpg', './images/02_products/16_other2.jpg'),
(17, './images/02_products/17_main.jpg', './images/02_products/17_other1.jpg', './images/02_products/17_other2.jpg'),
(18, './images/02_products/18_main.jpg', './images/02_products/18_other1.jpg', './images/02_products/18_other2.jpg'),
(19, './images/02_products/19_main.jpg', './images/02_products/19_other1.jpg', './images/02_products/19_other2.jpg'),
(20, './images/02_products/20_main.jpg', './images/02_products/20_other1.jpg', './images/02_products/20_other2.jpg'),
(21, './images/02_products/21_main.jpg', './images/02_products/21_other1.jpg', './images/02_products/21_other2.jpg'),
(22, './images/02_products/22_main.jpg', './images/02_products/22_other1.jpg', './images/02_products/22_other2.jpg'),
(23, './images/02_products/23_main.jpg', './images/02_products/23_other1.jpg', './images/02_products/23_other2.jpg'),
(24, './images/02_products/24_main.jpg', './images/02_products/24_other1.jpg', './images/02_products/24_other2.jpg'),
(25, './images/02_products/25_main.jpg', './images/02_products/25_other1.jpg', './images/02_products/25_other2.jpg'),
(26, './images/02_products/26_main.jpg', './images/02_products/26_other1.jpg', './images/02_products/26_other2.jpg'),
(27, './images/02_products/27_main.jpg', './images/02_products/27_other1.jpg', './images/02_products/27_other2.jpg'),
(28, './images/02_products/28_main.jpg', './images/02_products/28_other1.jpg', './images/02_products/28_other2.jpg'),
(29, './images/02_products/29_main.jpg', './images/02_products/29_other1.jpg', './images/02_products/29_other2.jpg'),
(30, './images/02_products/30_main.jpg', './images/02_products/30_other1.jpg', './images/02_products/30_other2.jpg'),
(31, './images/02_products/31_main.jpg', './images/02_products/31_other1.jpg', './images/02_products/31_other2.jpg'),
(32, './images/02_products/32_main.jpg', './images/02_products/32_other1.jpg', './images/02_products/32_other2.jpg'),
(33, './images/02_products/33_main.jpg', './images/02_products/33_other1.jpg', './images/02_products/33_other2.jpg'),
(34, './images/02_products/34_main.jpg', './images/02_products/34_other1.jpg', './images/02_products/34_other2.jpg'),
(35, './images/02_products/35_main.jpg', './images/02_products/35_other1.jpg', './images/02_products/35_other2.jpg'),
(36, './images/02_products/36_main.jpg', './images/02_products/36_other1.jpg', './images/02_products/36_other2.jpg'),
(37, './images/02_products/37_main.jpg', './images/02_products/37_other1.jpg', './images/02_products/37_other2.jpg'),
(38, './images/02_products/38_main.jpg', './images/02_products/38_other1.jpg', './images/02_products/38_other2.jpg'),
(39, './images/02_products/39_main.jpg', './images/02_products/39_other1.jpg', './images/02_products/39_other2.jpg'),
(40, './images/02_products/40_main.jpg', './images/02_products/40_other1.jpg', './images/02_products/40_other2.jpg'),
(41, './images/02_products/41_main.jpg', './images/02_products/41_other1.jpg', './images/02_products/41_other2.jpg'),
(42, './images/02_products/42_main.jpg', './images/02_products/42_other1.jpg', './images/02_products/42_other2.jpg'),
(43, './images/02_products/43_main.jpg', './images/02_products/43_other1.jpg', './images/02_products/43_other2.jpg'),
(44, './images/02_products/44_main.jpg', './images/02_products/44_other1.jpg', './images/02_products/44_other2.jpg'),
(45, './images/02_products/45_main.jpg', './images/02_products/45_other1.jpg', './images/02_products/45_other2.jpg'),
(46, './images/02_products/46_main.jpg', './images/02_products/46_other1.jpg', './images/02_products/46_other2.jpg'),
(47, './images/02_products/47_main.jpg', './images/02_products/47_other1.jpg', './images/02_products/47_other2.jpg'),
(48, './images/02_products/48_main.jpg', './images/02_products/48_other1.jpg', './images/02_products/48_other2.jpg'),
(49, './images/02_products/49_main.jpg', './images/02_products/49_other1.jpg', './images/02_products/49_other2.jpg'),
(50, './images/02_products/50_main.jpg', './images/02_products/50_other1.jpg', './images/02_products/50_other2.jpg'),
(51, './images/02_products/51_main.jpg', './images/02_products/51_other1.jpg', './images/02_products/51_other2.jpg'),
(52, './images/02_products/52_main.jpg', './images/02_products/52_other1.jpg', './images/02_products/52_other2.jpg'),
(53, './images/02_products/53_main.jpg', './images/02_products/53_other1.jpg', './images/02_products/53_other2.jpg'),
(54, './images/02_products/54_main.jpg', './images/02_products/54_other1.jpg', './images/02_products/54_other2.jpg'),
(55, './images/02_products/55_main.jpg', './images/02_products/55_other1.jpg', './images/02_products/55_other2.jpg'),
(56, './images/02_products/56_main.jpg', './images/02_products/56_other1.jpg', './images/02_products/56_other2.jpg'),
(57, './images/02_products/57_main.jpg', './images/02_products/57_other1.jpg', './images/02_products/57_other2.jpg'),
(58, './images/02_products/58_main.jpg', './images/02_products/58_other1.jpg', './images/02_products/58_other2.jpg'),
(59, './images/02_products/59_main.jpg', './images/02_products/59_other1.jpg', './images/02_products/59_other2.jpg'),
(60, './images/02_products/60_main.jpg', './images/02_products/60_other1.jpg', './images/02_products/60_other2.jpg'),
(61, './images/02_products/61_main.jpg', './images/02_products/61_other1.jpg', './images/02_products/61_other2.jpg'),
(62, './images/02_products/62_main.jpg', './images/02_products/62_other1.jpg', './images/02_products/62_other2.jpg'),
(63, './images/02_products/63_main.jpg', './images/02_products/63_other1.jpg', './images/02_products/63_other2.jpg'),
(64, './images/02_products/64_main.jpg', './images/02_products/64_other1.jpg', './images/02_products/64_other2.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `maintainance`
--

CREATE TABLE `maintainance` (
  `mt_id` int(11) NOT NULL COMMENT '保養方式id',
  `category_sub` varchar(20) NOT NULL COMMENT '類別名稱',
  `mt_method` text NOT NULL COMMENT '保養方法'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `maintainance`
--

INSERT INTO `maintainance` (`mt_id`, `category_sub`, `mt_method`) VALUES
(1, '秋季針織', '1.深淺色請分開洗滌，以避免造成互相移染。<br>2.請放入大小適中之細網洗衣袋細中弱速水洗，以保持商品型態。<br>3.洗滌時，水溫請低於30℃；請使用中性洗劑；請勿浸泡。<br>4.請勿使用漂白劑、螢光增白劑及衣物柔軟劑，以免破壞布料。<br>5.不可濕放，以免衣物染色；請弱速輕脫水，不可烘乾，以免衣物縮水。<br>6.清洗後請快速調整商品型態並平放陰乾即可，不可擰扭，勿直接曝曬於陽光下。<br>7.不可熨燙。<br>8.穿著時，請留意避免與配件包包等他物接觸摩擦。<br>9.毛衣外套/特殊立體針織毛衣/長毛類針織毛衣等商品建議送專業乾洗 。'),
(2, '各式襯衫', '1.深淺色請分開洗滌，以避免造成互相移染。<br>2.請將商品翻面再放入大小適中之細網洗衣袋細中弱速水洗，以保持商品型態。<br>3.洗滌時，水溫請低於30℃；請使用中性洗劑；浸泡時間不宜過長。<br>4.請勿使用漂白劑、螢光增白劑及衣物柔軟劑，以免破壞布料。<br>5.不可濕放，以免衣物染色；請弱速輕脫水，不可烘乾，以免衣物縮水。<br>6.清洗後請快速調整商品型態並吊掛晾乾即可，勿直接曝曬於陽光下。<br>7.如需整燙，請以低溫墊布熨燙，溫度不可超過110℃。<br>8.穿著時，請留意避免與配件包包等他物接觸摩擦。'),
(3, '好多外套', '1.建議送專業乾洗，深淺色請分開洗滌，以避免造成互相移染。<br>2.請用乾洗溶劑清洗<br>3.請勿使用漂白劑、螢光增白劑及衣物柔軟劑，以免破壞布料。<br>4.不可烘乾，以免衣物縮水；不可濕放，以免衣物染色。<br>5.請採平放晾乾；蒸汽熨燙可能造成不可回覆的損傷。<br>6.穿著時，請留意避免與配件包包等他物接觸摩擦。');

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `mb_id` int(11) NOT NULL COMMENT '會員id\r\n會員id',
  `mb_level` varchar(10) NOT NULL COMMENT '會員等級',
  `mb_account` varchar(30) NOT NULL COMMENT '會員帳號(email)',
  `mb_password` varchar(60) NOT NULL COMMENT '會員密碼',
  `mb_name` varchar(20) DEFAULT NULL COMMENT '會員姓名',
  `mb_birthday` date DEFAULT NULL COMMENT '會員生日',
  `mb_address` varchar(60) DEFAULT NULL COMMENT '會員地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`mb_id`, `mb_level`, `mb_account`, `mb_password`, `mb_name`, `mb_birthday`, `mb_address`) VALUES
(1, 'member', 'r269@gmail.com', '$2y$10$gqEYJAd0bXCk7HnpcMKJyOqRRyKpiATaO6r9dQwi/RL7kv2Fbca.C', '孟筱青', '1993-08-08', '臺中市大甲區順天路100號'),
(2, 'vip', 'euPr@gmail.com', '$2a$10$paRkBRvvQVfBJlehpEjaQOL4eKTNYaXtgE5/LErxIAZUyPWxYmDVy', '蘇汶瑄', '1999-11-07', '桃園市平鎮區三和路28號'),
(3, 'member', 'AHWk@gmail.com', '$2a$10$vvqDNeGCymlU7ykXATVid.1GG.qS1xLWZ66c93yhPgS8iVjNf/yTi', '裴雨薰', '1995-12-20', '臺北市北投區新市街32號'),
(4, 'member', '5EQt@gmail.com', '$2a$10$3Xapn7uiYHsFosEU4nHEKeDv6sEkcelaS/DTK0Fws7k113zPJxLCK', '白可瑄', '1991-05-04', '高雄市小港區高坪二十街8號'),
(5, 'member', '82ND@gmail.com', '$2a$10$YB5IrAKlmxnKTBn.yNqe6uKxHfdwSarHyR4WFVFNU5YTpTQ9BPAxO', '古悅芊', '1997-10-31', '臺中市太平區民族街16號'),
(6, 'member', 'pKe3@gmail.com', '$2a$10$kbrOBiI9JOTEyiW6ZZLQ8eAZaywznIOkFKpqpMMwzIbeLWTENMiwu', '杜邦鈺', '1996-04-16', '宜蘭縣三星鄉尚大路34號'),
(7, 'member', 'mERa@gmail.com', '$2a$10$/9S7xcRNUo0DPTFX4Ee3eeKlQ20SttYU.EFxvBuMPM526Mzbv15.q', '許靜靜', '1992-11-29', '新竹縣寶山鄉三油一路3號'),
(8, 'member', 'KfnP@gmail.com', '$2a$10$Z2C/x9.6S6W8JXOjzvUrdOxpPQrt.CitUoVJ3N31D.vFcrwdaztOG', '紀妮萱', '1998-09-21', '臺南市安南區環館五路5號'),
(9, 'member', 'GmNZ@gmail.com', '$2a$10$BpAyNnhab6rHn1oi7gKzEeKFA3pbxQt8ISORQU3rrVMGGZ4bV84TS', '關妙焉', '1990-12-02', '新北市新店區禾和一街14號'),
(10, 'member', '6pHC@gmail.com', '$2a$10$7Bl7Oj4bk22QQEfsWhX1N.7kKU4kNlKBNZORzFvvb9I4MUpTIDQsK', '易貝兒', '1994-03-15', '臺北市南港區東新街18號'),
(11, 'admin', 'shinjin', '$2a$10$8ueHDy98hpcHv.VBN2qhye5SKoSVzqnOPN1LNBL6WL3OO5wqUqhTC', 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `od_id` int(11) NOT NULL COMMENT '訂單id',
  `mb_id` int(11) NOT NULL COMMENT '訂購會員',
  `od_date` date NOT NULL COMMENT '訂購日期',
  `od_ship_fee` int(11) NOT NULL COMMENT '運費',
  `od_price` int(11) NOT NULL COMMENT '訂單金額',
  `od_pay_method` enum('貨到付款','信用卡','LINE PAY') NOT NULL COMMENT '支付方式',
  `od_ship_add` varchar(60) NOT NULL COMMENT '運送地址',
  `od_processing` enum('撿貨中','運送中','已完成') NOT NULL COMMENT '訂單狀態'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `order`
--

INSERT INTO `order` (`od_id`, `mb_id`, `od_date`, `od_ship_fee`, `od_price`, `od_pay_method`, `od_ship_add`, `od_processing`) VALUES
(1, 1, '2023-12-25', 60, 1390, '貨到付款', ' 臺中市大甲區順天路23號', '撿貨中'),
(2, 6, '2023-03-25', 60, 1540, 'LINE PAY', '新北市新店區禾和一街14號', '已完成'),
(3, 2, '2023-10-25', 0, 3660, '信用卡', '臺北市南港區東新街18號', '已完成'),
(4, 4, '2023-08-25', 0, 3410, 'LINE PAY', '桃園市平鎮區三和路28號', '已完成'),
(5, 9, '2023-07-16', 0, 3810, '信用卡', '臺中市太平區民族街16號', '已完成'),
(6, 7, '2023-08-11', 0, 2720, '貨到付款', '臺南市安南區環館五路5號', '已完成'),
(7, 5, '2023-06-12', 0, 3210, '信用卡', '臺北市北投區新市街32號', '已完成'),
(8, 3, '2023-02-12', 0, 2570, 'LINE PAY', '宜蘭縣三星鄉尚大路34號', '已完成'),
(9, 10, '2023-12-18', 0, 2820, '貨到付款', '高雄市小港區高坪二十街8號', '撿貨中'),
(10, 8, '2023-01-01', 0, 3020, '信用卡', '新竹縣寶山鄉三油一路3號', '已完成');

-- --------------------------------------------------------

--
-- 資料表結構 `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL COMMENT '訂單id',
  `od_item_list` varchar(5) NOT NULL COMMENT '訂單品項id',
  `pd_id` int(11) NOT NULL COMMENT '商品編號',
  `od_dt_amount` int(11) NOT NULL COMMENT '訂購數量',
  `od_dt_total` int(11) NOT NULL COMMENT '金額小計(商品價格*數量)',
  `od_dt_discount` int(11) NOT NULL COMMENT '折扣'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `order_detail`
--

INSERT INTO `order_detail` (`od_id`, `od_item_list`, `pd_id`, `od_dt_amount`, `od_dt_total`, `od_dt_discount`) VALUES
(1, '1.1', 1, 1, 590, -50),
(1, '1.2', 17, 1, 790, 0),
(10, '10.1', 27, 2, 1780, -50),
(10, '10.2', 59, 1, 1290, 0),
(2, '2.1', 63, 1, 790, -100),
(2, '2.2', 42, 1, 790, 0),
(3, '3.1', 22, 2, 1380, -100),
(3, '3.2', 58, 1, 1090, 0),
(3, '3.3', 55, 1, 1290, 0),
(4, '4.1', 5, 2, 1380, -50),
(4, '4.2', 62, 1, 1290, 0),
(4, '4.3', 63, 1, 790, 0),
(5, '5.1', 63, 1, 790, -50),
(5, '5.2', 19, 2, 1780, 0),
(5, '5.3', 56, 1, 1290, 0),
(6, '6.1', 37, 1, 890, -50),
(6, '6.2', 40, 1, 790, 0),
(6, '6.3', 49, 1, 1090, 0),
(7, '7.1', 50, 1, 1190, -50),
(7, '7.2', 21, 2, 1380, 0),
(7, '7.3', 24, 1, 690, 0),
(8, '8.1', 30, 1, 790, -100),
(8, '8.2', 53, 1, 1190, 0),
(8, '8.3', 8, 1, 690, 0),
(9, '9.1', 12, 1, 690, -50),
(9, '9.2', 62, 1, 1290, 0),
(9, '9.3', 35, 1, 890, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `pd_id` int(11) NOT NULL COMMENT '商品id',
  `pd_name` varchar(20) NOT NULL COMMENT '商品名稱',
  `category_id` int(11) NOT NULL COMMENT '類別',
  `pd_price` int(11) NOT NULL COMMENT '商品價格',
  `pd_size` enum('S','M','L') NOT NULL COMMENT '尺寸',
  `color_id` int(11) NOT NULL COMMENT '顏色',
  `pd_material` varchar(50) NOT NULL COMMENT '材質',
  `pd_thickness` enum('厚','薄','適中') NOT NULL COMMENT '厚薄',
  `pd_elasticity` enum('適中','無') NOT NULL COMMENT '彈性',
  `pd_description` varchar(100) NOT NULL COMMENT '商品描述',
  `mt_id` int(11) NOT NULL COMMENT '保養方式',
  `images_id` int(11) NOT NULL COMMENT 'images_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`pd_id`, `pd_name`, `category_id`, `pd_price`, `pd_size`, `color_id`, `pd_material`, `pd_thickness`, `pd_elasticity`, `pd_description`, `mt_id`, `images_id`) VALUES
(1, '輕霧紗感透肌小尖領襯衫', 2, 590, 'S', 1, '聚酯纖維 100%', '薄', '適中', '霧紗感透肌布料/小尖領設計/微寬鬆版型', 2, 1),
(2, '輕霧紗感透肌小尖領襯衫', 2, 590, 'M', 2, '聚酯纖維 100%', '薄', '適中', '霧紗感透肌布料/小尖領設計/微寬鬆版型', 2, 2),
(3, '輕霧紗感透肌小尖領襯衫', 2, 590, 'L', 6, '聚酯纖維 100%', '薄', '適中', '霧紗感透肌布料/小尖領設計/微寬鬆版型', 2, 3),
(4, '透肌感翻領澎袖襯衫', 2, 690, 'S', 1, '聚酯纖維 100%', '薄', '無', '透肌感翻領澎袖襯衫', 2, 4),
(5, '透肌感翻領澎袖襯衫', 2, 690, 'M', 4, '聚酯纖維 100%', '薄', '無', '透肌感翻領澎袖襯衫', 2, 5),
(6, '透肌感翻領澎袖襯衫', 2, 690, 'L', 3, '聚酯纖維 100%', '薄', '無', '透肌感翻領澎袖襯衫', 2, 6),
(7, '造型兔耳領片襯衫', 2, 690, 'S', 1, '聚酯纖維 100%', '適中', '無', '造型兔耳領片襯衫', 2, 7),
(8, '造型兔耳領片襯衫', 2, 690, 'M', 4, '聚酯纖維 100%', '適中', '無', '造型兔耳領片襯衫', 2, 8),
(9, '造型兔耳領片襯衫', 2, 690, 'L', 11, '聚酯纖維 100%', '適中', '無', '造型兔耳領片襯衫', 2, 9),
(10, '絲光透肌釦角領長版襯衫', 2, 690, 'S', 6, '聚酯纖維 100%', '薄', '無', '絲光透肌釦角領長版襯衫', 2, 10),
(11, '絲光透肌釦角領長版襯衫', 2, 690, 'M', 2, '聚酯纖維 100%', '薄', '無', '絲光透肌釦角領長版襯衫', 2, 11),
(12, '絲光透肌釦角領長版襯衫', 2, 690, 'L', 8, '聚酯纖維 100%', '薄', '無', '絲光透肌釦角領長版襯衫', 2, 12),
(13, '簍空麻感針織罩衫', 2, 790, 'S', 2, '亞克力纖維 75% 尼龍 25%', '適中', '適中', '簍空麻感針織罩衫', 2, 13),
(14, '簍空麻感針織罩衫', 2, 790, 'M', 11, '亞克力纖維 75% 尼龍 25%', '適中', '適中', '簍空麻感針織罩衫', 2, 14),
(15, '簍空麻感針織罩衫', 2, 790, 'L', 4, '亞克力纖維 75% 尼龍 25%', '適中', '適中', '簍空麻感針織罩衫', 2, 15),
(16, '復古寬鬆緹花襯衫', 2, 790, 'S', 1, '聚酯纖維 100%', '薄', '無', '復古寬鬆緹花襯衫', 2, 16),
(17, '復古寬鬆緹花襯衫', 2, 790, 'M', 2, '聚酯纖維 100%', '薄', '無', '復古寬鬆緹花襯衫', 2, 17),
(18, '復古寬鬆緹花襯衫', 2, 790, 'L', 11, '聚酯纖維 100%', '薄', '無', '復古寬鬆緹花襯衫', 2, 18),
(19, '條紋長版開襟襯衫洋裝', 2, 890, 'S', 1, '棉 62% 聚酯纖維 35% 彈性纖維 3%', '適中', '無', '條紋長版開襟襯衫洋裝', 2, 19),
(20, '條紋長版開襟襯衫洋裝', 2, 890, 'M', 10, '棉 62% 聚酯纖維 35% 彈性纖維 3%', '適中', '無', '條紋長版開襟襯衫洋裝', 2, 20),
(21, '霧光皺皺柔滑長袖襯衫', 2, 690, 'M', 2, '聚酯纖維 100%', '適中', '適中', '霧光皺皺柔滑長袖襯衫', 2, 21),
(22, '率性挺感短版襯衫', 2, 690, 'M', 1, '棉 100%', '適中', '無', '率性挺感短版襯衫', 2, 22),
(23, '率性挺感短版襯衫', 2, 690, 'L', 7, '棉 100%', '適中', '無', '率性挺感短版襯衫', 2, 23),
(24, '慵懶感V領針織上衣', 1, 690, 'S', 2, '亞克力纖維 34% 尼龍 44% 聚酯纖維 22%', '適中', '適中', '慵懶感V領針織上衣', 1, 24),
(25, '慵懶感V領針織上衣', 1, 690, 'M', 4, '亞克力纖維 34% 尼龍 44% 聚酯纖維 22%', '適中', '適中', '慵懶感V領針織上衣', 1, 25),
(26, '慵懶感V領針織上衣', 1, 690, 'L', 7, '亞克力纖維 34% 尼龍 44% 聚酯纖維 22%', '適中', '適中', '慵懶感V領針織上衣', 1, 26),
(27, '立體華夫格紋開釦針織', 1, 890, 'S', 2, '聚酯纖維 100%', '厚', '適中', '立體華夫格紋開釦針織', 1, 27),
(28, '立體華夫格紋開釦針織', 1, 890, 'M', 9, '聚酯纖維 100%', '厚', '適中', '立體華夫格紋開釦針織', 1, 28),
(29, '暖暖麻花圓領針織毛衣', 1, 790, 'M', 6, '聚酯纖維 100%', '厚', '適中', '暖暖麻花圓領針織毛衣', 1, 29),
(30, '暖暖麻花圓領針織毛衣', 1, 790, 'S', 1, '亞克力纖維 40% 尼龍 30% 聚酯纖維 30%', '厚', '適中', '暖暖麻花圓領針織毛衣', 1, 30),
(31, '暖暖麻花圓領針織毛衣', 1, 790, 'M', 2, '亞克力纖維 40% 尼龍 30% 聚酯纖維 30%', '厚', '適中', '暖暖麻花圓領針織毛衣', 1, 31),
(32, '暖暖麻花圓領針織毛衣', 1, 790, 'L', 10, '亞克力纖維 40% 尼龍 30% 聚酯纖維 30%', '厚', '適中', '暖暖麻花圓領針織毛衣', 1, 32),
(33, '開襟坑條針織上衣', 1, 890, 'S', 11, '尼龍 10% 聚丙烯腈纖維 90%', '適中', '適中', '開襟坑條針織上衣', 1, 33),
(34, '開襟坑條針織上衣', 1, 890, 'M', 10, '尼龍 10% 聚丙烯腈纖維 90%', '適中', '適中', '開襟坑條針織上衣', 1, 34),
(35, '開襟坑條針織上衣', 1, 890, 'L', 4, '尼龍 10% 聚丙烯腈纖維 90%', '適中', '適中', '開襟坑條針織上衣', 1, 35),
(36, '復古圖型V領針織背心', 1, 890, 'S', 11, '聚丙烯腈纖維 100%', '厚', '適中', '復古圖型V領針織背心', 1, 36),
(37, '復古圖型V領針織背心', 1, 890, 'M', 10, '聚丙烯腈纖維 100%', '厚', '適中', '復古圖型V領針織背心', 1, 37),
(38, '復古圖型V領針織背心', 1, 890, 'L', 5, '聚丙烯腈纖維 100%', '厚', '適中', '復古圖型V領針織背心', 1, 38),
(39, '圓領短版針織短袖上衣', 1, 790, 'S', 2, '亞克力纖維 44% 聚酯纖維 26% 尼龍 25% 羊毛 5%', '適中', '適中', '圓領短版針織短袖上衣', 1, 39),
(40, '圓領短版針織短袖上衣', 1, 790, 'M', 4, '亞克力纖維 44% 聚酯纖維 26% 尼龍 25% 羊毛 5%', '適中', '適中', '圓領短版針織短袖上衣', 1, 40),
(41, '圓領短版針織短袖上衣', 1, 790, 'L', 7, '亞克力纖維 44% 聚酯纖維 26% 尼龍 25% 羊毛 5%', '適中', '適中', '圓領短版針織短袖上衣', 1, 41),
(42, '簍空格紋短版針織上衣', 1, 790, 'S', 2, '亞克力纖維 100%', '適中', '適中', '簍空格紋短版針織上衣', 1, 42),
(43, '簍空格紋短版針織上衣', 1, 790, 'M', 11, '亞克力纖維 100%', '適中', '適中', '簍空格紋短版針織上衣', 1, 43),
(44, '簍空格紋短版針織上衣', 1, 790, 'L', 4, '亞克力纖維 100%', '適中', '適中', '簍空格紋短版針織上衣', 1, 44),
(45, '簍空麻感針織罩衫', 1, 790, 'S', 2, '亞克力纖維 75% 尼龍 25%', '適中', '適中', '簍空麻感針織罩衫', 1, 45),
(46, '簍空麻感針織罩衫', 1, 790, 'M', 11, '亞克力纖維 75% 尼龍 25%', '適中', '適中', '簍空麻感針織罩衫', 1, 46),
(47, '簍空麻感針織罩衫', 1, 790, 'L', 4, '亞克力纖維 75% 尼龍 25%', '適中', '適中', '簍空麻感針織罩衫', 1, 47),
(48, '翻領配色開襟針織外套', 3, 1090, 'M', 2, '亞克力纖維 55% 棉 45%', '厚', '適中', '翻領配色開襟針織外套', 3, 48),
(49, '翻領配色開襟針織外套', 3, 1090, 'L', 11, '亞克力纖維 55% 棉 45%', '厚', '適中', '翻領配色開襟針織外套', 3, 49),
(50, '無領排釦西裝外套', 3, 1190, 'S', 2, '主布:聚酯纖維 71% 嫘縈 22% 彈性纖維 7% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', '無領排釦西裝外套', 3, 50),
(51, '無領排釦西裝外套', 3, 1190, 'M', 9, '主布:聚酯纖維 71% 嫘縈 22% 彈性纖維 7% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', '無領排釦西裝外套', 3, 51),
(52, '俐落雙釦西裝外套', 3, 1190, 'S', 2, '主布:聚酯纖維 100% 裡布:聚酯纖維 97% 彈性纖維 3%', '適中', '無', '俐落雙釦西裝外套', 3, 52),
(53, '俐落雙釦西裝外套', 3, 1190, 'M', 11, '主布:聚酯纖維 100% 裡布:聚酯纖維 97% 彈性纖維 3%', '適中', '無', '俐落雙釦西裝外套', 3, 53),
(54, '俐落雙釦西裝外套', 3, 1190, 'L', 10, '主布:聚酯纖維 100% 裡布:聚酯纖維 97% 彈性纖維 3%', '適中', '無', '俐落雙釦西裝外套', 3, 54),
(55, '簡約無領單釦西裝外套', 3, 1290, 'S', 1, '主布:聚酯纖維 97% 彈性纖維 3% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', '簡約無領單釦西裝外套', 3, 55),
(56, '簡約無領單釦西裝外套', 3, 1290, 'M', 10, '主布:聚酯纖維 97% 彈性纖維 3% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', '簡約無領單釦西裝外套', 3, 56),
(57, '簡約無領單釦西裝外套', 3, 1290, 'L', 9, '主布:聚酯纖維 97% 彈性纖維 3% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', '簡約無領單釦西裝外套', 3, 57),
(58, '涼感系列-翻領短袖西裝外套', 3, 1090, 'S', 10, '聚酯纖維 100%', '適中', '無', '涼感系列-翻領短袖西裝外套', 3, 58),
(59, 'pingping-俐落雙釦短版西裝外套', 3, 1290, 'S', 10, '主布:聚酯纖維 80% 嫘縈 20% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', 'pingping-俐落雙釦短版西裝外套', 3, 59),
(60, 'pingping-俐落雙釦短版西裝外套', 3, 1290, 'M', 4, '主布:聚酯纖維 80% 嫘縈 20% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', 'pingping-俐落雙釦短版西裝外套', 3, 60),
(61, 'pingping-俐落雙釦短版西裝外套', 3, 1290, 'L', 5, '主布:聚酯纖維 80% 嫘縈 20% 裡布:聚酯纖維 95% 彈性纖維 5%', '適中', '無', 'pingping-俐落雙釦短版西裝外套', 3, 61),
(62, 'oversize雙排釦男友西裝外套', 3, 1290, 'S', 7, '聚酯纖維 95% 彈性纖維 5% 裡布:棉 95% 彈性纖維 5%', '適中', '無', 'oversize雙排釦男友西裝外套', 3, 62),
(63, '水洗工裝感多口袋外套', 3, 790, 'S', 2, '棉 100%', '厚', '無', '水洗工裝感多口袋外套', 3, 63),
(64, '霧光皺皺柔滑長袖襯衫', 2, 690, 'M', 11, '聚酯纖維 100%', '適中', '適中', '霧光皺皺柔滑長袖襯衫', 2, 64);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `子類別` (`category_sub`);

--
-- 資料表索引 `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- 資料表索引 `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`images_id`);

--
-- 資料表索引 `maintainance`
--
ALTER TABLE `maintainance`
  ADD PRIMARY KEY (`mt_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mb_id`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `會員編號` (`mb_id`);

--
-- 資料表索引 `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`od_item_list`),
  ADD KEY `訂單編號` (`od_id`),
  ADD KEY `商品編號` (`pd_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pd_id`,`pd_name`,`pd_price`,`pd_size`) USING BTREE,
  ADD KEY `類別` (`category_id`),
  ADD KEY `顏色` (`color_id`),
  ADD KEY `保養方式` (`mt_id`),
  ADD KEY `images_id` (`images_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '類別id', AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顏色id', AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `images`
--
ALTER TABLE `images`
  MODIFY `images_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `maintainance`
--
ALTER TABLE `maintainance`
  MODIFY `mt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '保養方式id', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `mb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員id\r\n會員id', AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order`
--
ALTER TABLE `order`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '訂單id', AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id', AUTO_INCREMENT=83;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `會員編號` FOREIGN KEY (`mb_id`) REFERENCES `member` (`mb_id`);

--
-- 資料表的限制式 `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `商品編號` FOREIGN KEY (`pd_id`) REFERENCES `product` (`pd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `訂單編號` FOREIGN KEY (`od_id`) REFERENCES `order` (`od_id`);

--
-- 資料表的限制式 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `images_id` FOREIGN KEY (`images_id`) REFERENCES `images` (`images_id`),
  ADD CONSTRAINT `保養方式` FOREIGN KEY (`mt_id`) REFERENCES `maintainance` (`mt_id`),
  ADD CONSTRAINT `顏色` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `類別` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
