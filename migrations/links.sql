-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 19, 2026 lúc 09:55 PM
-- Phiên bản máy phục vụ: 5.7.44-log
-- Phiên bản PHP: 8.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `links`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ads`
--

CREATE TABLE `ads` (
  `ad_id` int(11) NOT NULL,
  `ad_name` int(11) NOT NULL,
  `ad_utm_campaign` int(11) NOT NULL,
  `ad_utm_source` int(11) NOT NULL,
  `ad_onclick_link` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `links`
--

CREATE TABLE `links` (
  `id` int(3) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_title` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_preview_url` text COLLATE utf8mb4_unicode_ci,
  `ads_img_url` varchar(999) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_click_url` text COLLATE utf8mb4_unicode_ci,
  `ads_promoted_by` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_tracking_id` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `redirect_type` int(1) NOT NULL DEFAULT '1' COMMENT '0=redirect;1=click;2=captcha;3=pwd',
  `wait_seconds` int(9) NOT NULL DEFAULT '10' COMMENT '6 giây mặc định',
  `countdown_delay` int(9) NOT NULL DEFAULT '1000' COMMENT '900 mili-giây mặc định',
  `redirect_delay` int(9) NOT NULL DEFAULT '7500' COMMENT '7,5 giây mặc định',
  `tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_views` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tracker`
--

CREATE TABLE `tracker` (
  `id` int(11) NOT NULL,
  `ref_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_size` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `OS` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser_user_agent` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time_of_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `redirect_completed` int(1) DEFAULT NULL,
  `redirect_completed_at` datetime DEFAULT NULL,
  `coordinates` text COLLATE utf8mb4_unicode_ci,
  `isp` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `ads_tracking_id` (`ads_tracking_id`);

--
-- Chỉ mục cho bảng `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracker_FK_1` (`ref_code`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `links`
--
ALTER TABLE `links`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tracker`
--
ALTER TABLE `tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
