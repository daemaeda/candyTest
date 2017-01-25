-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017 年 1 月 25 日 13:52
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
(1, 1, 1, '林檎', '2〜3個(皮と芯とって約600g)', '2016-12-28 02:06:31', '2016-12-28 14:00:32', NULL),
(2, 1, 2, '砂糖', '70g', '2016-12-28 02:07:10', '2016-12-28 14:00:32', NULL),
(3, 1, 3, 'バター', '20g', '2016-12-28 02:07:12', '2016-12-28 14:00:32', NULL),
(4, 2, 1, 'りんご', '1玉', '2016-12-28 02:14:25', '2016-12-28 14:00:32', NULL),
(5, 2, 2, '砂糖', '大3', '2016-12-28 02:14:25', '2016-12-28 14:00:32', NULL),
(6, 2, 3, 'ココナッツオイル（オリーブオイルでも可）', '大3', '2016-12-28 02:14:26', '2016-12-28 14:00:32', NULL),
(7, 2, 4, '卵', '1個', '2016-12-28 02:14:27', '2016-12-28 14:00:32', NULL),
(8, 2, 5, '牛乳or水', '50cc', '2016-12-28 02:16:01', '2016-12-28 14:00:32', NULL),
(9, 2, 6, 'ココナッツオイル（オリーブオイルでも可）', '30cc', '2016-12-28 02:16:01', '2016-12-28 14:00:32', NULL),
(10, 2, 7, 'ホットケーキミックス ', '200g', '2016-12-28 02:16:01', '2016-12-28 14:00:32', NULL),
(11, 2, 8, '塩', 'ひとつまみ', '2016-12-28 02:16:01', '2016-12-28 14:00:32', NULL),
(12, 2, 9, 'グラノーラ（お好みで）', '大3', '2016-12-28 02:16:01', '2016-12-28 14:00:32', NULL),
(13, 3, 1, '①卵', '1個', '2016-12-28 02:16:01', '2016-12-28 14:00:32', NULL),
(14, 3, 2, '①牛乳or水', '100cc', '2016-12-28 02:16:04', '2016-12-28 14:00:32', NULL),
(15, 3, 3, '①ココナッツオイル（オリーブオイルでもOK）', '30cc', '2016-12-28 02:22:01', '2016-12-28 14:00:32', NULL),
(16, 3, 4, '②ホットケーキミックス', '200g', '2016-12-28 02:22:01', '2016-12-28 14:00:32', NULL),
(17, 3, 5, '②塩', 'ひとつまみ', '2016-12-28 02:22:01', '2016-12-28 14:00:32', NULL),
(18, 3, 6, 'マーマレードジャム', '大3', '2016-12-28 02:22:01', '2016-12-28 14:00:32', NULL),
(19, 4, 1, '薄力粉', '１４０g', '2016-12-28 02:22:01', '2016-12-28 14:00:32', NULL),
(20, 4, 2, 'アーモンドプードル ', '６０g', '2016-12-28 02:22:03', '2016-12-28 14:00:32', NULL),
(21, 4, 3, '粉砂糖', '５０g', '2016-12-28 02:35:34', '2016-12-28 14:00:32', NULL),
(22, 4, 4, 'バター', '１００g', '2016-12-28 02:35:34', '2016-12-28 14:00:32', NULL),
(23, 4, 5, 'トッピング用粉砂糖', '４０g', '2016-12-28 02:35:34', '2016-12-28 14:00:32', NULL),
(24, 5, 1, 'ロールケーキ生地', '大さじ4', '2016-12-28 02:35:34', '2016-12-28 14:00:32', NULL),
(25, 5, 2, '苺ジャム(大粒果肉)', 'お好みで', '2016-12-28 02:35:35', '2016-12-28 14:00:32', NULL),
(26, 5, 3, '食紅', '15g', '2016-12-28 02:35:35', '2016-12-28 14:00:32', NULL),
(27, 5, 4, 'ストロベリーホイップ', '150g', '2016-12-28 02:35:36', '2016-12-28 14:00:32', NULL),
(28, 16, 1, 'dwa', 'da', '2017-01-23 17:37:34', '2017-01-23 17:37:34', NULL),
(29, 17, 1, '小麦', '300g', '2017-01-23 17:45:27', '2017-01-23 17:45:27', NULL),
(30, 17, 2, '小麦', '300g', '2017-01-23 17:45:27', '2017-01-23 17:45:27', NULL),
(31, 17, 3, '小麦', '300g', '2017-01-23 17:45:27', '2017-01-23 17:45:27', NULL),
(32, 17, 4, '小麦', '300g', '2017-01-23 17:45:27', '2017-01-23 17:45:27', NULL),
(33, 18, 1, '小麦', '300g', '2017-01-23 17:45:53', '2017-01-23 17:45:53', NULL),
(34, 18, 2, '小麦', '300g', '2017-01-23 17:45:53', '2017-01-23 17:45:53', NULL),
(35, 18, 3, '小麦', '300g', '2017-01-23 17:45:53', '2017-01-23 17:45:53', NULL),
(36, 18, 4, '小麦', '300g', '2017-01-23 17:45:53', '2017-01-23 17:45:53', NULL),
(37, 19, 1, '小麦', '300g', '2017-01-23 23:12:18', '2017-01-23 23:12:18', NULL),
(38, 19, 2, '小麦', '300g', '2017-01-23 23:12:18', '2017-01-23 23:12:18', NULL),
(39, 19, 3, '小麦', '300g', '2017-01-23 23:12:18', '2017-01-23 23:12:18', NULL),
(40, 19, 4, '小麦', '300g', '2017-01-23 23:12:18', '2017-01-23 23:12:18', NULL);

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
(1, 'RIKA☆MAMA', NULL, 'test1@exp.com', '1', 'pass', NULL, NULL, '2016-12-28 02:44:44', '2016-12-28 13:59:45', NULL),
(2, 'まくど', '', 'test2@exp.com', '2', 'pass', NULL, NULL, '2016-12-28 02:56:43', '2016-12-28 13:59:54', NULL),
(5, 'まいける', NULL, 'test3@exp.com', '3', 'pas', NULL, NULL, '2016-12-28 02:57:22', '2016-12-28 13:59:54', NULL),
(8, '土佐犬', NULL, 'test4@exp.com', '4', 'pas', NULL, NULL, '2016-12-28 02:58:17', '2016-12-28 13:59:54', NULL);

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
(9, 1, 2, '2017-01-23 22:04:21', '2017-01-23 22:08:56', NULL),
(12, 1, 1, '2017-01-23 22:15:34', '2017-01-23 22:15:57', '2017-01-23 22:15:57'),
(13, 1, 1, '2017-01-23 22:16:19', '2017-01-23 22:17:39', '2017-01-23 22:17:39'),
(14, 1, 1, '2017-01-23 22:18:57', '2017-01-23 22:18:58', '2017-01-23 22:18:58'),
(15, 1, 1, '2017-01-23 22:19:05', '2017-01-23 22:19:06', '2017-01-23 22:19:06'),
(16, 1, 1, '2017-01-23 22:19:12', '2017-01-23 22:37:56', '2017-01-23 22:37:56'),
(17, 1, 18, '2017-01-23 22:53:03', '2017-01-23 23:12:02', '2017-01-23 23:12:02'),
(18, 1, 18, '2017-01-23 23:12:03', '2017-01-23 23:18:50', '2017-01-23 23:18:50'),
(19, 1, 14, '2017-01-23 23:17:34', '2017-01-23 23:17:35', '2017-01-23 23:17:35'),
(20, 1, 14, '2017-01-23 23:17:35', '2017-01-23 23:18:14', '2017-01-23 23:18:14'),
(21, 1, 14, '2017-01-23 23:18:14', '2017-01-23 23:18:15', '2017-01-23 23:18:15'),
(22, 1, 14, '2017-01-23 23:18:15', '2017-01-23 23:18:43', '2017-01-23 23:18:43'),
(23, 1, 14, '2017-01-23 23:18:44', '2017-01-23 23:18:44', NULL),
(24, 1, 18, '2017-01-23 23:18:51', '2017-01-23 23:18:51', NULL);

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
  `member_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `recipe`
--

INSERT INTO `recipe` (`id`, `title`, `clip`, `servings_for`, `thumb`, `explain`, `point`, `mistake`, `member_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ストウブ16♥︎魅惑の飴色タルトタタン♪', NULL, '1人前', NULL, '簡単なのに本格的にみえるタルトタタン（≧∇≦）お店のより美味しいかも！？バター少なめ！ピコ ココットラウンド16cm使用 ', '林檎をぎゅうぎゅうに詰めること、冷蔵庫できちんと冷やすのがポイント(*^o^*)\n取り出す時は竹串で充分に取り出しやすくしてから、ストウブの上にお皿を乗せて一気にぐるっと上下を反対にしましょう！\nストウブを揺すると綺麗に出てきます（≧∇≦）', '', 1, '2016-12-28 02:04:40', '2016-12-28 03:18:20', NULL),
(2, ' HMで簡単！ココナッツりんごケーキ ', NULL, '4人前', NULL, 'はかり不要！バター不使用！\n市販フルーツ缶でも作れます♪\n◎りんごの日持ち保存コツ付き◎ ', 'シリコンスチーマーを使うと、クッキングシートを使わずに時短となります♪\n\nりんご保存の際は、ヘタを下にして置くと日持ちします！\n\nシナモンをかけたり、紅茶の茶葉を入れてもおいしいです。（茶葉はティーバッグ2個分くらい入れてください） ', '', 2, '2016-12-28 02:05:19', '2016-12-28 03:18:36', NULL),
(3, 'HMで簡単！マーマレードココナッツケーキ', NULL, '4人前', NULL, 'はかり不要！砂糖バター不使用！\n全部入れてオーブンで焼くだけ♪\nお好みのジャムでどうぞ。', 'ホットケーキミックスに塩をひとつまみ入れると、ホットケーキミックス独特のにおいが消えます。\n\nジャムが甘いので、砂糖を入れなくてもOK！\n\n風味は変わりますがココナッツオイルがなければオリーブオイルでもOK。 ', '', 3, '2016-12-28 02:05:19', '2016-12-28 03:18:56', NULL),
(4, ' コロコロかわいいスノーボール★簡単れしぴ ', NULL, '40〜50個分', NULL, '簡単で美味しい♡プレゼントにも最適なコロコロ可愛いスノーボールはいかがでしょう♪', 'ボールの大きさはあまり大きく作らないほうが食べやすいです♡つぶの大きさを揃えて作ると更に可愛さアップですよ！ ', '', 4, '2016-12-28 02:05:19', '2016-12-28 03:18:56', NULL),
(5, '★簡単絶品♪ごろっと果実☆苺ロールケーキ', NULL, '1本分', NULL, '絶品♪生地にもクリームにも大粒果肉たっぷりの苺のロールケーキです★。\n濃厚且つ爽やかな大人のケーキに仕上がっています♪。', '★卵白は角が立つまでしっかりと泡立てて下さい。\n★卵黄はモッタリするまでハンドミキサーで泡立てて下さい。 ', '', 1, '2016-12-28 02:05:19', '2016-12-28 03:18:56', NULL),
(6, ' ラードで作る グラノーラクッキー ', NULL, '30個', NULL, '簡単✨安上がり♪\n2016.12.19カテゴリ掲載。', '', '', 2, '2016-12-28 02:05:19', '2016-12-28 03:18:56', NULL),
(7, ' クリスマスに♡スノーボールショコラ♡ ', NULL, '25個', NULL, 'さくほろスノーボールのショコラ味です♡\nクリスマスのスイーツにもピッタリ♬ ', '５で生地を丸める時は、その都度手にサラダ油をつけながら丸めるとベタつきません ', '', 3, '2016-12-28 02:05:19', '2016-12-28 03:18:56', NULL),
(8, 'サックサク！私の好きなチュイール', NULL, '直径７～８ｃ約２０個分', NULL, 'サックサク！私の好きなチュイール\n2016.10/18人気検索Top10、2016.12/17カテゴリー掲載感謝！簡単に作れてとっても美味しい♪', 'オーブンシートに生地を落とす時に、間隔を必ずあけます。焼いていると生地が広がってくるためです。\n焼き時間は目安なので、ご家庭のオーブンで様子を見てください。 ', '', 4, '2016-12-28 02:05:20', '2016-12-28 03:18:56', NULL),
(9, 'ハートのスノーボール', NULL, '20個', NULL, ' ハートで型抜きしたスノーボール！ ', '厚みがあるようにする。', '', 1, '2016-12-28 02:05:20', '2016-12-28 03:18:56', NULL),
(10, 'シュトーレン風スノーボール＊プルーンで！', NULL, '1', NULL, 'かわいいスノーボールです', '', '', 2, '2016-12-28 02:05:20', '2016-12-28 03:18:56', NULL),
(11, 'プルーンとクルミのノンオイルビスケット', NULL, '15個から20個', NULL, 'プルーンとクルミを使って作るカリカリのスパイスビスケット♪油分も卵も牛乳もナシ☆素朴な味わいお試しください〜＊＊＊', '結構べたつく生地なので、打ち粉をしながら台につかないよう様子を見ながらのばしてください！', '', 3, '2016-12-28 02:05:20', '2016-12-28 03:18:56', NULL),
(12, '香ばしザクホロ☆グラハムビスケット！ ', NULL, '1', NULL, '全粒粉×黒糖でちょっぴりヘルシーに♡\n小麦の香りがしっかり楽しめる、甘さ控えめのビスケットです(＾＾)', '◆グラハム粉が無い場合は、全量を全粒粉で代用して下さい。その場合、少し豆乳を増やして下さい。\n◆白い砂糖でもできますが、多分味気なくなると思います・・。未確認ですが（＾＾；\n◆好みで砂糖の量を増やして下さい', '', 4, '2016-12-28 02:05:20', '2016-12-28 03:18:56', NULL),
(13, '抹茶のクリームビスケット＊米粉\n', NULL, '1', NULL, 'しっとり抹茶のビスケットを和風のあしらいでおもてなしにも。', '生クリームを加えて混ぜた時に、べたべたしすぎるようなら、米粉を少量足してくださいね～。', '', 1, '2016-12-28 02:05:21', '2016-12-28 03:18:56', NULL),
(14, 'アンザックビスケット', NULL, '1', NULL, '素朴なビスケットです。\n', 'ゴールデンシロップがない場合、はちみつやメープルシロップでも代用できます。\n', '', 2, '2016-12-28 02:05:23', '2016-12-28 03:18:56', NULL),
(15, '香ばし和風ビスケット', NULL, '1', NULL, '材料少、手間なし簡単レシピ。焼いてる時から良い香り♡飽きのこない優しい味です☺', 'オーブンの癖やビスケットの厚みによって焼成時間が変わります。\n\n使用する油は癖のないもの(オリーブオイル・グレープシードオイル・太白ごま油・サラダ油)を使ってください。', '', 3, '2016-12-28 02:05:26', '2016-12-28 03:18:56', NULL),
(16, 'dwa', 'sample_1485225454.mp4', 'dwa', 'sample_1485225454.jpg', 'dwada', 'dwa', 'dwa', 1, '2017-01-23 17:37:34', '2017-01-23 17:37:34', NULL),
(17, 'レシピタイトル', '_1485225927.mp4', '３人分', '_1485225927.jpg', '説明説明説明', 'コツ', '失敗談', 1, '2017-01-23 17:45:27', '2017-01-23 17:45:27', NULL),
(18, 'レシピタイトル', 'sample_1485225952.mp4', '３人分', 'sample_1485225952.jpg', '説明説明説明', 'コツ', '失敗談', 1, '2017-01-23 17:45:53', '2017-01-23 17:45:53', NULL),
(19, 'レシピタイトル', 'sample_1485245538.mp4', '３人分', 'sample_1485245538.jpg', '説明説明説明', 'コツ', '失敗談', 1, '2017-01-23 23:12:18', '2017-01-23 23:12:18', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `review_no` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `review` (`id`, `recipe_id`, `review_no`, `reply_id`, `comment`, `member_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, 'aiueo', 1, '2017-01-22 17:46:30', '2017-01-22 17:46:30', NULL),
(2, 1, 2, NULL, 'aiueo', 2, '2017-01-22 18:12:07', '2017-01-22 18:12:07', NULL),
(3, 1, 3, NULL, 'aiueo', 1, '2017-01-22 17:47:01', '2017-01-22 17:47:01', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `member_favorite_recipe`
--
ALTER TABLE `member_favorite_recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag_recipe_relations`
--
ALTER TABLE `tag_recipe_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
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

--
-- テーブルの制約 `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `step`
--
ALTER TABLE `step`
  ADD CONSTRAINT `step_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `tag_recipe_relations`
--
ALTER TABLE `tag_recipe_relations`
  ADD CONSTRAINT `tag_recipe_relations_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tag_recipe_relations_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
