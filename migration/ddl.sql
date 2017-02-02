-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017 年 1 月 27 日 11:41
-- サーバのバージョン： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `candy`
--
CREATE DATABASE IF NOT EXISTS `candy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `candy`;

-- --------------------------------------------------------

--
-- テーブルの構造 `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `ingredients_no` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `img_url` text,
  `mail` varchar(255) NOT NULL,
  `login_id` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `pos_code` char(7) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `member`
--

INSERT INTO `member` (`id`, `name`, `img_url`, `mail`, `login_id`, `password`, `pos_code`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ハル', NULL, 'test1@exp.com', '1', 'pass', NULL, NULL, '2016-12-28 02:44:44', '2016-12-28 13:59:45', NULL),
(2, 'モード', '', 'test2@exp.com', '2', 'pass', NULL, NULL, '2016-12-28 02:56:43', '2016-12-28 13:59:54', NULL),
(3, 'イセン', NULL, 'test3@exp.com', '3', 'pas', NULL, NULL, '2016-12-28 02:57:22', '2016-12-28 13:59:54', NULL),
(4, 'ゆみこ', NULL, 'test4@exp.com', '4', 'pas', NULL, NULL, '2016-12-28 02:58:17', '2016-12-28 13:59:54', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `member_favorite_recipe`
--

DROP TABLE IF EXISTS `member_favorite_recipe`;
CREATE TABLE `member_favorite_recipe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `recipe`
--

DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `clip` text,
  `servings_for` varchar(30) NOT NULL,
  `thumb` text,
  `explain` text NOT NULL,
  `point` text NOT NULL,
  `mistake` text NOT NULL,
  `view` bigint(20) UNSIGNED DEFAULT 0,
  `love` bigint(20) UNSIGNED DEFAULT 0,
  `video_time` time,
  `member_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `reply_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `step`
--

DROP TABLE IF EXISTS `step`;
CREATE TABLE `step` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `step_no` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `img_url` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tag`
--

INSERT INTO `tag` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ケーキ', 0, '2017-01-25 05:09:19', '2017-01-25 05:09:19', NULL),
(2, 'パン', 0, '2017-01-25 05:09:26', '2017-01-25 05:09:26', NULL),
(3, 'クッキー', 0, '2017-01-25 05:09:32', '2017-01-25 05:09:32', NULL),
(4, 'アイス・ゼリー・プリン', 0, '2017-01-25 05:10:26', '2017-01-25 05:10:26', NULL),
(5, 'チョコ', 0, '2017-01-25 05:10:33', '2017-01-25 05:10:38', NULL),
(6, '和菓子', 0, '2017-01-25 05:10:46', '2017-01-25 05:10:46', NULL),
(7, '春', 1, '2017-01-25 05:11:05', '2017-01-25 05:11:05', NULL),
(8, '夏', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:12', NULL),
(9, '秋', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:21', NULL),
(10, '冬', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:25', NULL),
(11, 'パーティー', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:36', NULL),
(12, 'バレンタイン', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:40', NULL),
(13, 'ホワイトデー', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:44', NULL),
(14, 'プレゼント', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:44', NULL),
(15, '誕生日', 1, '2017-01-25 05:11:12', '2017-01-25 05:11:44', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `tag_recipe_relations`
--

DROP TABLE IF EXISTS `tag_recipe_relations`;
CREATE TABLE `tag_recipe_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indexes for table `member_favorite_recipe`
--
ALTER TABLE `member_favorite_recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_recipe_relations`
--
ALTER TABLE `tag_recipe_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `member_favorite_recipe`
--
ALTER TABLE `member_favorite_recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tag_recipe_relations`
--
ALTER TABLE `tag_recipe_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `member_favorite_recipe`
--
ALTER TABLE `member_favorite_recipe`
  ADD CONSTRAINT `member_favorite_recipe_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `member_favorite_recipe_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
