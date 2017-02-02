-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017 年 2 月 02 日 20:38
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

--
-- テーブルのデータのダンプ `ingredients`
--

INSERT INTO `ingredients` (`id`, `recipe_id`, `ingredients_no`, `name`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(126, 35, 1, 'ホットケーキミックス', '100g', '2017-02-02 09:36:55', '2017-02-02 09:36:55', NULL),
(127, 35, 2, '砂糖', '15g', '2017-02-02 09:36:55', '2017-02-02 09:36:55', NULL),
(128, 35, 3, '油（オリーブオイル）', '20g', '2017-02-02 09:36:55', '2017-02-02 09:36:55', NULL),
(129, 35, 4, '牛乳', '20g', '2017-02-02 09:36:55', '2017-02-02 09:36:55', NULL),
(130, 36, 1, '薄力粉', '75g', '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(131, 36, 2, '牛乳', '60ml', '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(132, 36, 3, '水', '60ml', '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(133, 36, 4, 'バター', '50g', '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(134, 37, 1, 'ホットケーキミックス', '200g', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(135, 37, 2, 'クリームチーズ', '150g', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(136, 37, 3, 'レモン汁', '大1', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(137, 37, 4, '卵', '2個', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(138, 37, 5, '牛乳', '大2', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(139, 37, 6, 'チョコレート', '1枚', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(140, 37, 7, '●お好きなビスケット', '適量', '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(141, 38, 1, 'トルタサンドイッチロール', '１個', '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(142, 38, 2, 'チーズ', '適量', '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(143, 38, 3, '卵', '１個', '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(144, 38, 4, 'サラミ、ベーコン、ソーセージなど', '適量', '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(145, 38, 5, '生クリーム', '大１～大２', '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(146, 38, 6, '粗挽き黒胡椒', '適量', '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(147, 39, 1, '小麦粉(薄力粉)', '110ｇ', '2017-02-02 10:26:48', '2017-02-02 10:26:48', NULL),
(148, 39, 2, '砂糖(上白糖)', '40ｇ', '2017-02-02 10:26:48', '2017-02-02 10:26:48', NULL),
(149, 39, 3, 'ブラックペッパー', '3ｇ', '2017-02-02 10:26:48', '2017-02-02 10:26:48', NULL),
(150, 39, 4, 'オリーブオイル', '50ｇ', '2017-02-02 10:26:48', '2017-02-02 10:26:48', NULL),
(151, 40, 1, '薄力粉', '65g', '2017-02-02 10:34:59', '2017-02-02 10:34:59', NULL),
(152, 40, 2, '全卵', '2個', '2017-02-02 10:34:59', '2017-02-02 10:34:59', NULL),
(153, 40, 3, '砂糖', '63g', '2017-02-02 10:34:59', '2017-02-02 10:34:59', NULL),
(154, 40, 4, '無塩バター', '20g', '2017-02-02 10:34:59', '2017-02-02 10:34:59', NULL),
(155, 40, 5, '牛乳', '10g', '2017-02-02 10:35:00', '2017-02-02 10:35:00', NULL),
(156, 41, 1, '板チョコ', '3枚', '2017-02-02 10:39:27', '2017-02-02 10:39:27', NULL),
(157, 41, 2, '生クリーム', '50cc', '2017-02-02 10:39:27', '2017-02-02 10:39:27', NULL),
(158, 42, 1, '卵', '3個', '2017-02-02 10:47:15', '2017-02-02 10:47:15', NULL),
(159, 42, 2, 'グラニュー糖', '50〜60g', '2017-02-02 10:47:15', '2017-02-02 10:47:15', NULL),
(160, 42, 3, 'サラダ油', '30g', '2017-02-02 10:47:15', '2017-02-02 10:47:15', NULL),
(161, 42, 4, '薄力粉', '60g', '2017-02-02 10:47:15', '2017-02-02 10:47:15', NULL),
(162, 42, 5, 'ラム酒', '適量', '2017-02-02 10:47:16', '2017-02-02 10:47:16', NULL),
(163, 43, 1, 'りんご', '1/2個', '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(164, 43, 2, 'クルミ', '40g', '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(165, 43, 3, 'たまご', '1個', '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(166, 43, 4, 'ホットケーキミックス', '200g', '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(167, 44, 1, '薄力粉', '118g', '2017-02-02 10:54:58', '2017-02-02 10:54:58', NULL),
(168, 44, 2, 'コーンスターチ', '50g', '2017-02-02 10:54:58', '2017-02-02 10:54:58', NULL),
(169, 44, 3, '卵白', '1個ぶん', '2017-02-02 10:54:58', '2017-02-02 10:54:58', NULL),
(170, 44, 4, '砂糖', '20g', '2017-02-02 10:54:58', '2017-02-02 10:54:58', NULL),
(171, 45, 1, '1才からのレンジでケーキセット', '1箱', '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(172, 45, 2, '牛乳(スポンジ用50ml＋ホイップ用50ml)', '100ml', '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(173, 45, 3, 'いちご', '3〜5個', '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(174, 45, 4, '冷凍ベリーミックス(ブルーベリー、ラズベリー)', '好きなだけ', '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(175, 45, 5, 'にぎにぎボーロ', '24本', '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(176, 45, 6, '飾り用リボン', '適当な長さ', '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(177, 46, 1, '卵', '3コ', '2017-02-02 11:02:20', '2017-02-02 11:02:20', NULL),
(178, 46, 2, 'バナナ', '2本', '2017-02-02 11:02:20', '2017-02-02 11:02:20', NULL),
(179, 46, 3, '砂糖', '大1〜3', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(180, 46, 4, 'チョコ', '3〜5コ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(181, 46, 5, '小麦粉', '30ｇ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(182, 46, 6, 'ココア', '20ｇ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(183, 47, 1, '卵', '3コ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(184, 47, 2, 'バナナ', '2本', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(185, 47, 3, '砂糖', '大1〜3', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(186, 47, 4, 'チョコ', '3〜5コ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(187, 47, 5, '小麦粉', '30ｇ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(188, 47, 6, 'ココア', '20ｇ', '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(189, 48, 1, '食パン', '4枚', '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(190, 48, 2, 'ベビーダノンヨーグルト', '1個', '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(191, 48, 3, 'たまごボーロ', '10粒くらい', '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(192, 48, 4, 'いちご', '3粒', '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(193, 49, 1, '薄力粉', '40g', '2017-02-02 11:07:46', '2017-02-02 11:07:46', NULL),
(194, 49, 2, '卵黄', '2個', '2017-02-02 11:07:46', '2017-02-02 11:07:46', NULL),
(195, 49, 3, '砂糖', '15g', '2017-02-02 11:07:46', '2017-02-02 11:07:46', NULL),
(196, 50, 1, '薄力粉', '１６０g', '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(197, 50, 2, 'アーモンドパウダー', '４０g', '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(198, 50, 3, 'きび砂糖', '７０g', '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(199, 50, 4, '無塩バター', '１２０g', '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(200, 50, 5, '卵黄', '２個', '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(201, 50, 6, 'スライスアーモンド', '８０g', '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(202, 51, 1, '薄力粉', '30g', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(203, 51, 2, 'クリームチーズ', '200g', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(204, 51, 3, 'グラニュー糖(砂糖)', '45g', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(205, 51, 4, '卵黄', '3個分', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(206, 51, 5, '生クリーム', '90ml', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(207, 51, 6, 'プレーンヨーグルト', '70ml', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(208, 51, 7, '無塩バター', '30g', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(209, 51, 8, 'バニラエッセンス', '2〜3滴', '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL);

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
(1, 'ハル', 'c_blue.png', 'test1@exp.com', '1', 'pass', NULL, NULL, '2016-12-28 02:44:44', '2017-02-02 11:29:35', NULL),
(2, 'モード', 'c_green.png', 'test2@exp.com', '2', 'pass', NULL, NULL, '2016-12-28 02:56:43', '2017-02-02 11:29:50', NULL),
(3, 'イセン', 'c_pink.png', 'test3@exp.com', '3', 'pas', NULL, NULL, '2016-12-28 02:57:22', '2017-02-02 11:30:07', NULL),
(4, 'ゆみこ', 'c_purple.png', 'test4@exp.com', '4', 'pas', NULL, NULL, '2016-12-28 02:58:17', '2017-02-02 11:30:18', NULL);

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

--
-- テーブルのデータのダンプ `member_favorite_recipe`
--

INSERT INTO `member_favorite_recipe` (`id`, `member_id`, `recipe_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(74, 1, 51, '2017-02-02 11:34:30', '2017-02-02 11:34:30', NULL);

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
  `view` bigint(20) UNSIGNED DEFAULT '0',
  `love` bigint(20) UNSIGNED DEFAULT '0',
  `video_time` time DEFAULT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `recipe`
--

INSERT INTO `recipe` (`id`, `title`, `clip`, `servings_for`, `thumb`, `explain`, `point`, `mistake`, `view`, `love`, `video_time`, `member_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(35, 'ホットケーキミックスで簡単クッキー', '1_1486028215.mp4', '20〜25個くらい', '1_1486028215.jpg', 'サクサクの美味しいクッキーです！', 'よくこねて、薄く伸ばすとサクサクになります！ オリーブオイルを使うと美味しいです！', '焼きすぎ注意', 1, 0, NULL, 1, '2017-02-02 09:36:55', '2017-02-02 09:36:56', NULL),
(36, '生カスタードで簡単サクサクエクレア', '2_1486030417.mp4', '1', '2_1486030417.jpg', 'プレーンタイプのエクレアです！生地にココアや抹茶を入れてアレンジ色々☆', '', '', 1, 0, NULL, 1, '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(37, '食いしん坊さんのチョコレートチーズケーキ', '3_1486030853.mp4', 'スクエア型で１台分', '3_1486030853.jpg', 'もちもちしてるチョコレートケーキ寄りのチーズケーキです！\r\n簡単に出来て美味しいのでぜひお試しを！♡', 'ダマにならないようによく混ぜること！', '', 1, 0, NULL, 1, '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(38, '簡単で美味しい！かるぼパン', '4_1486031068.mp4', '１個分', '4_1486031068.jpg', 'コストコのトルタサンドイッチロールを使って簡単で美味しい食べればカルボナーラ風目玉焼きトースト', '卵は半熟状にすると手で持って食べてるととろっと落ちる場合があるので(息子が経験者) しっかり焼いた方が食べやすい ⚫レンジで加熱して食べても美味しい', '', 2, 0, NULL, 1, '2017-02-02 10:24:28', '2017-02-02 11:36:41', NULL),
(39, 'バレンタインに♡塩レモンペッパークッキー', '5_1486031207.mp4', '30枚できました', '5_1486031207.jpg', '糖質（1枚）4ｇ\r\n甘いものが苦手な彼に♡\r\nお酒にも合うおシャンティなクッキー♪\r\nふるう手間が省ける裏技あり★', '①練らない、混ぜすぎない ②焦げそうなときは温度下げる  膨らませた袋を振ることでふるいをかけたのと同じになります♪ 時短＆カットしやすさで寝かせるのは冷凍で！ 前日に仕込みができたりする場合は冷蔵庫でＯＫです(^^)/', '', 2, 0, NULL, 1, '2017-02-02 10:26:48', '2017-02-02 10:30:36', NULL),
(40, 'ケーキやさんのスポンジ', '6_1486031699.mp4', '15㎝型１台', '6_1486031699.jpg', 'パティシエのジェノワーズ生地を参考に作りました。\nとてもキレイにできました\n', 'スポンジ生地は泡立てが肝心です。\n粉は２回ふるってください。', '', 5, 0, NULL, 1, '2017-02-02 10:34:59', '2017-02-02 10:41:17', NULL),
(41, 'バレンタイン！チョコ大福', '7_1486031967.mp4', '6個', '7_1486031967.jpg', 'バレンタインにもオススメです！\r\n和と洋のミックススイーツ☆', '最後にココアパウダーを全体に\r\nまぶして出来上がり！', '', 8, 0, NULL, 2, '2017-02-02 10:39:27', '2017-02-02 11:24:01', NULL),
(42, 'クリームチーズチョコのしっとりケーキ', '8_1486032435.mp4', '25cmスクエア型', '8_1486032435.jpg', 'しっとりケーキです！簡単にできるのでぜひ！', 'クリームチーズチョコに入れるラム酒は、\r\n本当に少しで大丈夫です！', '', 1, 0, NULL, 1, '2017-02-02 10:47:15', '2017-02-02 10:47:16', NULL),
(43, '簡単サクふわ♡りんごとクルミのケーキ', '9_1486032685.mp4', 'カップ８個分程度', '9_1486032685.jpg', 'りんごは切ってそのまま、クルミが香ばしく簡単なのに贅沢なカップケーキ♡混ぜて焼くだけであっという間に出来ちゃいます♪', '最初にたまごを割った後、ボウルをスケールに乗せて、砂糖、サラダ油を測りながら入れると楽ちんです^^\r\nりんごは下ごしらえ無しでそのまま！サクサクみずみずしくてとっても美味しいです♡', '', 1, 0, NULL, 1, '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(44, '厚めのフカフカホットケーキ', '10_1486032898.mp4', '2人分…およそ 直径12cm 厚さ2.5cmが3枚', '10_1486032898.jpg', '厚みがあり柔らかいホットケーキ。\r\nスフレ系よりもパンに近いフカフカさで、ちぎるとホロッとくずれます。', 'ビニール袋に大きめの粉ふるいを入れてふるうと時短できます。\r\n\r\nボールをスケールに乗せ★を計る\r\n↓\r\nふるう\r\n↓\r\n粉をボールに戻す\r\n↓\r\nふるう\r\n↓\r\nボールに戻す\r\n↓\r\nスケールに乗せる\r\n↓\r\n卵黄など材料を投入\r\n\r\nとすると、段取りがスムーズです。', '', 3, 0, NULL, 1, '2017-02-02 10:54:58', '2017-02-02 11:36:19', NULL),
(45, '1歳のお祝い☆超簡単バースデーケーキ', '11_1486033138.mp4', '１人前', '11_1486033138.jpg', '1歳のバースデーは手作りケーキでお祝いしたかったので♪\r\n見た目もかわいいケーキです♡', '冷凍フルーツを使うときは、解凍したときの水分をふき取ったほうがいいです', '', 1, 0, NULL, 1, '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(46, 'フワッとチョコバナナケーキ', '12_1486033340.mp4', '２人前', '12_1486033340.jpg', '焼きたてはフワフワでチョコがトロトロ、バナナの風味が広がります', '今回はパウンドケーキの型にしましたが、ハート型やカップケーキ型ならバレンタインにぴったりです。', '', 3, 0, NULL, 3, '2017-02-02 11:02:20', '2017-02-02 11:14:13', NULL),
(47, 'フワッとチョコバナナケーキ', '12_1486033341.mp4', '２人前', '12_1486033341.jpg', '焼きたてはフワフワでチョコがトロトロ、バナナの風味が広がります', '今回はパウンドケーキの型にしましたが、ハート型やカップケーキ型ならバレンタインにぴったりです。', '', 6, 0, NULL, 3, '2017-02-02 11:02:21', '2017-02-02 11:37:20', NULL),
(48, '一歳 食パンで簡単お誕生日ケーキ♡', '13_1486033516.mp4', '1人前', '13_1486033516.jpg', '食パンとヨーグルトだけど、見た目はショートケーキです♡', 'コツはありませんw\r\n重ねて可愛くして完成です♡', '', 2, 0, NULL, 3, '2017-02-02 11:05:16', '2017-02-02 11:14:04', NULL),
(49, 'ふわさく紅茶のケーキ', '14_1486033666.mp4', '1人分', '14_1486033666.jpg', '紅茶の素敵な香りに囲まれながら楽しくお菓子作り！', 'コツは特にありません！香りに癒されながら、楽しく作ってください！', 'やらかしました。', 5, 0, NULL, 3, '2017-02-02 11:07:46', '2017-02-02 11:14:19', NULL),
(50, 'サクホロ★ココアアイスボックスクッキー', '15_1486034290.mp4', '約５０枚・天板２枚分', '15_1486034290.jpg', 'フードプロセッサーで生地作りするので簡単！サクっとホロッと食感の楽しいクッキーです。バレンタインやホワイトデーに♪', '●バターは使う直前まで冷凍庫でしっかり冷やしておきます。\r\n●卵黄を加えたら少しずつちゃんと生地がまとまってくるので、なかなかまとまらないからと言って水分などを足さないように！\r\n●余った卵白は料理に使ったり、冷凍してシフォンケーキ等に使って。', '', 3, 0, NULL, 1, '2017-02-02 11:18:10', '2017-02-02 11:36:11', NULL),
(51, '簡単☆シンプルベイクドチーズケーキ', '16_1486034559.mp4', '4人分', '16_1486034559.jpg', 'シンプルなベイクドチーズケーキ。\r\n程よい甘さで簡単チーズケーキです( ´﹀` )', '✿下準備をしっかりとしておきましょう。\r\n✿メレンゲは絶対に潰さないようにしてください！\r\n✿メレンゲを作るボウルや泡立て器等は全て水気を完全になくしてから作るようにしてください！でないと、泡立たなくなります(´･ω･`)', '', 13, 1, NULL, 1, '2017-02-02 11:22:39', '2017-02-02 11:35:07', NULL);

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

--
-- テーブルのデータのダンプ `review`
--

INSERT INTO `review` (`id`, `recipe_id`, `reply_id`, `comment`, `member_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, 51, NULL, 'すごいよかったです！', 1, '2017-02-02 11:26:50', '2017-02-02 11:26:50', NULL),
(22, 47, NULL, 'ふわっと出来ませんでしたが、美味しく出来ました。', 1, '2017-02-02 11:37:18', '2017-02-02 11:37:18', NULL);

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
-- テーブルのデータのダンプ `tag_recipe_relations`
--

INSERT INTO `tag_recipe_relations` (`id`, `recipe_id`, `tag_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 35, 3, '2017-02-02 09:36:56', '2017-02-02 09:36:56', NULL),
(16, 35, 12, '2017-02-02 09:36:56', '2017-02-02 09:36:56', NULL),
(17, 36, 2, '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(18, 36, 5, '2017-02-02 10:13:37', '2017-02-02 10:13:37', NULL),
(19, 37, 1, '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(20, 37, 5, '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(21, 37, 11, '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(22, 37, 15, '2017-02-02 10:20:54', '2017-02-02 10:20:54', NULL),
(23, 38, 2, '2017-02-02 10:24:28', '2017-02-02 10:24:28', NULL),
(24, 39, 3, '2017-02-02 10:26:48', '2017-02-02 10:26:48', NULL),
(25, 40, 1, '2017-02-02 10:35:00', '2017-02-02 10:35:00', NULL),
(26, 41, 5, '2017-02-02 10:39:27', '2017-02-02 10:39:27', NULL),
(27, 41, 12, '2017-02-02 10:39:27', '2017-02-02 10:39:27', NULL),
(28, 42, 1, '2017-02-02 10:47:16', '2017-02-02 10:47:16', NULL),
(29, 43, 1, '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(30, 43, 14, '2017-02-02 10:51:25', '2017-02-02 10:51:25', NULL),
(31, 44, 1, '2017-02-02 10:54:58', '2017-02-02 10:54:58', NULL),
(32, 45, 1, '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(33, 45, 14, '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(34, 45, 15, '2017-02-02 10:58:58', '2017-02-02 10:58:58', NULL),
(35, 46, 1, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(36, 46, 2, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(37, 46, 12, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(38, 46, 15, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(39, 47, 1, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(40, 47, 2, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(41, 47, 12, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(42, 47, 15, '2017-02-02 11:02:21', '2017-02-02 11:02:21', NULL),
(43, 48, 1, '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(44, 48, 14, '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(45, 48, 15, '2017-02-02 11:05:16', '2017-02-02 11:05:16', NULL),
(46, 49, 1, '2017-02-02 11:07:46', '2017-02-02 11:07:46', NULL),
(47, 49, 14, '2017-02-02 11:07:46', '2017-02-02 11:07:46', NULL),
(48, 49, 15, '2017-02-02 11:07:46', '2017-02-02 11:07:46', NULL),
(49, 50, 3, '2017-02-02 11:18:10', '2017-02-02 11:18:10', NULL),
(50, 51, 1, '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(51, 51, 12, '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL),
(52, 51, 15, '2017-02-02 11:22:39', '2017-02-02 11:22:39', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `member_favorite_recipe`
--
ALTER TABLE `member_favorite_recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
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
