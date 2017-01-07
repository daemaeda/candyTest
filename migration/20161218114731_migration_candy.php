<?php
/**
 * Migration Task class.
 */
class MigrationCandy
{
  public function preUp()
  {
      // add the pre-migration code here
  }

  public function postUp()
  {
      // add the post-migration code here
  }

  public function preDown()
  {
      // add the pre-migration code here
  }

  public function postDown()
  {
      // add the post-migration code here
  }

  public function getUpSQL()
  {
    return <<<END
--
-- テーブルの構造 `category_l`
--

DROP TABLE IF EXISTS `category_l`;
CREATE TABLE `category_l` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `category_m`
--

DROP TABLE IF EXISTS `category_m`;
CREATE TABLE `category_m` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_l_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `category_recipe_relations`
--

DROP TABLE IF EXISTS `category_recipe_relations`;
CREATE TABLE `category_recipe_relations` (
  `id` bigint(20) NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `category_s_id` bigint(20) DEFAULT NULL,
  `category_m_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_l_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `category_s`
--

DROP TABLE IF EXISTS `category_s`;
CREATE TABLE `category_s` (
  `id` bigint(20) NOT NULL,
  `category_m_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1, 1, '林檎', '2〜3個(皮と芯とって約600g)', '2016-12-28 20:06:31', '2016-12-29 08:00:32', NULL),
(2, 1, 2, '砂糖', '70g', '2016-12-28 20:07:10', '2016-12-29 08:00:32', NULL),
(3, 1, 3, 'バター', '20g', '2016-12-28 20:07:12', '2016-12-29 08:00:32', NULL),
(4, 2, 1, 'りんご', '1玉', '2016-12-28 20:14:25', '2016-12-29 08:00:32', NULL),
(5, 2, 2, '砂糖', '大3', '2016-12-28 20:14:25', '2016-12-29 08:00:32', NULL),
(6, 2, 3, 'ココナッツオイル（オリーブオイルでも可）', '大3', '2016-12-28 20:14:26', '2016-12-29 08:00:32', NULL),
(7, 2, 4, '卵', '1個', '2016-12-28 20:14:27', '2016-12-29 08:00:32', NULL),
(8, 2, 5, '牛乳or水', '50cc', '2016-12-28 20:16:01', '2016-12-29 08:00:32', NULL),
(9, 2, 6, 'ココナッツオイル（オリーブオイルでも可）', '30cc', '2016-12-28 20:16:01', '2016-12-29 08:00:32', NULL),
(10, 2, 7, 'ホットケーキミックス ', '200g', '2016-12-28 20:16:01', '2016-12-29 08:00:32', NULL),
(11, 2, 8, '塩', 'ひとつまみ', '2016-12-28 20:16:01', '2016-12-29 08:00:32', NULL),
(12, 2, 9, 'グラノーラ（お好みで）', '大3', '2016-12-28 20:16:01', '2016-12-29 08:00:32', NULL),
(13, 3, 1, '①卵', '1個', '2016-12-28 20:16:01', '2016-12-29 08:00:32', NULL),
(14, 3, 2, '①牛乳or水', '100cc', '2016-12-28 20:16:04', '2016-12-29 08:00:32', NULL),
(15, 3, 3, '①ココナッツオイル（オリーブオイルでもOK）', '30cc', '2016-12-28 20:22:01', '2016-12-29 08:00:32', NULL),
(16, 3, 4, '②ホットケーキミックス', '200g', '2016-12-28 20:22:01', '2016-12-29 08:00:32', NULL),
(17, 3, 5, '②塩', 'ひとつまみ', '2016-12-28 20:22:01', '2016-12-29 08:00:32', NULL),
(18, 3, 6, 'マーマレードジャム', '大3', '2016-12-28 20:22:01', '2016-12-29 08:00:32', NULL),
(19, 4, 1, '薄力粉', '１４０g', '2016-12-28 20:22:01', '2016-12-29 08:00:32', NULL),
(20, 4, 2, 'アーモンドプードル ', '６０g', '2016-12-28 20:22:03', '2016-12-29 08:00:32', NULL),
(21, 4, 3, '粉砂糖', '５０g', '2016-12-28 20:35:34', '2016-12-29 08:00:32', NULL),
(22, 4, 4, 'バター', '１００g', '2016-12-28 20:35:34', '2016-12-29 08:00:32', NULL),
(23, 4, 5, 'トッピング用粉砂糖', '４０g', '2016-12-28 20:35:34', '2016-12-29 08:00:32', NULL),
(24, 5, 1, 'ロールケーキ生地', '大さじ4', '2016-12-28 20:35:34', '2016-12-29 08:00:32', NULL),
(25, 5, 2, '苺ジャム(大粒果肉)', 'お好みで', '2016-12-28 20:35:35', '2016-12-29 08:00:32', NULL),
(26, 5, 3, '食紅', '15g', '2016-12-28 20:35:35', '2016-12-29 08:00:32', NULL),
(27, 5, 4, 'ストロベリーホイップ', '150g', '2016-12-28 20:35:36', '2016-12-29 08:00:32', NULL);

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
(1, 'RIKA☆MAMA', NULL, 'test1@exp.com', '1', 'pass', NULL, NULL, '2016-12-28 20:44:44', '2016-12-29 07:59:45', NULL),
(2, 'まくど', '', 'test2@exp.com', '2', 'pass', NULL, NULL, '2016-12-28 20:56:43', '2016-12-29 07:59:54', NULL),
(5, 'まいける', NULL, 'test3@exp.com', '3', 'pas', NULL, NULL, '2016-12-28 20:57:22', '2016-12-29 07:59:54', NULL),
(8, '土佐犬', NULL, 'test4@exp.com', '4', 'pas', NULL, NULL, '2016-12-28 20:58:17', '2016-12-29 07:59:54', NULL);

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
  `member_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `recipe`
--

INSERT INTO `recipe` (`id`, `title`, `clip`, `servings_for`, `thumb`, `explain`, `point`, `mistake`, `member_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ストウブ16♥︎魅惑の飴色タルトタタン♪', NULL, '1人前', NULL, '簡単なのに本格的にみえるタルトタタン（≧∇≦）お店のより美味しいかも！？バター少なめ！ピコ ココットラウンド16cm使用 ', '林檎をぎゅうぎゅうに詰めること、冷蔵庫できちんと冷やすのがポイント(*^o^*)\n取り出す時は竹串で充分に取り出しやすくしてから、ストウブの上にお皿を乗せて一気にぐるっと上下を反対にしましょう！\nストウブを揺すると綺麗に出てきます（≧∇≦）', '', 1, '2016-12-28 20:04:40', '2016-12-28 21:18:20', NULL),
(2, ' HMで簡単！ココナッツりんごケーキ ', NULL, '4人前', NULL, 'はかり不要！バター不使用！\n市販フルーツ缶でも作れます♪\n◎りんごの日持ち保存コツ付き◎ ', 'シリコンスチーマーを使うと、クッキングシートを使わずに時短となります♪\n\nりんご保存の際は、ヘタを下にして置くと日持ちします！\n\nシナモンをかけたり、紅茶の茶葉を入れてもおいしいです。（茶葉はティーバッグ2個分くらい入れてください） ', '', 2, '2016-12-28 20:05:19', '2016-12-28 21:18:36', NULL),
(3, 'HMで簡単！マーマレードココナッツケーキ', NULL, '4人前', NULL, 'はかり不要！砂糖バター不使用！\n全部入れてオーブンで焼くだけ♪\nお好みのジャムでどうぞ。', 'ホットケーキミックスに塩をひとつまみ入れると、ホットケーキミックス独特のにおいが消えます。\n\nジャムが甘いので、砂糖を入れなくてもOK！\n\n風味は変わりますがココナッツオイルがなければオリーブオイルでもOK。 ', '', 3, '2016-12-28 20:05:19', '2016-12-28 21:18:56', NULL),
(4, ' コロコロかわいいスノーボール★簡単れしぴ ', NULL, '40〜50個分', NULL, '簡単で美味しい♡プレゼントにも最適なコロコロ可愛いスノーボールはいかがでしょう♪', 'ボールの大きさはあまり大きく作らないほうが食べやすいです♡つぶの大きさを揃えて作ると更に可愛さアップですよ！ ', '', 4, '2016-12-28 20:05:19', '2016-12-28 21:18:56', NULL),
(5, '★簡単絶品♪ごろっと果実☆苺ロールケーキ', NULL, '1本分', NULL, '絶品♪生地にもクリームにも大粒果肉たっぷりの苺のロールケーキです★。\n濃厚且つ爽やかな大人のケーキに仕上がっています♪。', '★卵白は角が立つまでしっかりと泡立てて下さい。\n★卵黄はモッタリするまでハンドミキサーで泡立てて下さい。 ', '', 1, '2016-12-28 20:05:19', '2016-12-28 21:18:56', NULL),
(6, ' ラードで作る グラノーラクッキー ', NULL, '30個', NULL, '簡単✨安上がり♪\n2016.12.19カテゴリ掲載。', '', '', 2, '2016-12-28 20:05:19', '2016-12-28 21:18:56', NULL),
(7, ' クリスマスに♡スノーボールショコラ♡ ', NULL, '25個', NULL, 'さくほろスノーボールのショコラ味です♡\nクリスマスのスイーツにもピッタリ♬ ', '５で生地を丸める時は、その都度手にサラダ油をつけながら丸めるとベタつきません ', '', 3, '2016-12-28 20:05:19', '2016-12-28 21:18:56', NULL),
(8, 'サックサク！私の好きなチュイール', NULL, '直径７～８ｃ約２０個分', NULL, 'サックサク！私の好きなチュイール\n2016.10/18人気検索Top10、2016.12/17カテゴリー掲載感謝！簡単に作れてとっても美味しい♪', 'オーブンシートに生地を落とす時に、間隔を必ずあけます。焼いていると生地が広がってくるためです。\n焼き時間は目安なので、ご家庭のオーブンで様子を見てください。 ', '', 4, '2016-12-28 20:05:20', '2016-12-28 21:18:56', NULL),
(9, 'ハートのスノーボール', NULL, '20個', NULL, ' ハートで型抜きしたスノーボール！ ', '厚みがあるようにする。', '', 1, '2016-12-28 20:05:20', '2016-12-28 21:18:56', NULL),
(10, 'シュトーレン風スノーボール＊プルーンで！', NULL, '1', NULL, 'かわいいスノーボールです', '', '', 2, '2016-12-28 20:05:20', '2016-12-28 21:18:56', NULL),
(11, 'プルーンとクルミのノンオイルビスケット', NULL, '15個から20個', NULL, 'プルーンとクルミを使って作るカリカリのスパイスビスケット♪油分も卵も牛乳もナシ☆素朴な味わいお試しください〜＊＊＊', '結構べたつく生地なので、打ち粉をしながら台につかないよう様子を見ながらのばしてください！', '', 3, '2016-12-28 20:05:20', '2016-12-28 21:18:56', NULL),
(12, '香ばしザクホロ☆グラハムビスケット！ ', NULL, '1', NULL, '全粒粉×黒糖でちょっぴりヘルシーに♡\n小麦の香りがしっかり楽しめる、甘さ控えめのビスケットです(＾＾)', '◆グラハム粉が無い場合は、全量を全粒粉で代用して下さい。その場合、少し豆乳を増やして下さい。\n◆白い砂糖でもできますが、多分味気なくなると思います・・。未確認ですが（＾＾；\n◆好みで砂糖の量を増やして下さい', '', 4, '2016-12-28 20:05:20', '2016-12-28 21:18:56', NULL),
(13, '抹茶のクリームビスケット＊米粉\n', NULL, '1', NULL, 'しっとり抹茶のビスケットを和風のあしらいでおもてなしにも。', '生クリームを加えて混ぜた時に、べたべたしすぎるようなら、米粉を少量足してくださいね～。', '', 1, '2016-12-28 20:05:21', '2016-12-28 21:18:56', NULL),
(14, 'アンザックビスケット', NULL, '1', NULL, '素朴なビスケットです。\n', 'ゴールデンシロップがない場合、はちみつやメープルシロップでも代用できます。\n', '', 2, '2016-12-28 20:05:23', '2016-12-28 21:18:56', NULL),
(15, '香ばし和風ビスケット', NULL, '1', NULL, '材料少、手間なし簡単レシピ。焼いてる時から良い香り♡飽きのこない優しい味です☺', 'オーブンの癖やビスケットの厚みによって焼成時間が変わります。\n\n使用する油は癖のないもの(オリーブオイル・グレープシードオイル・太白ごま油・サラダ油)を使ってください。', '', 3, '2016-12-28 20:05:26', '2016-12-28 21:18:56', NULL);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_l`
--
ALTER TABLE `category_l`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_m`
--
ALTER TABLE `category_m`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_l_id` (`category_l_id`);

--
-- Indexes for table `category_recipe_relations`
--
ALTER TABLE `category_recipe_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_l_id` (`category_l_id`),
  ADD KEY `category_m_id` (`category_m_id`),
  ADD KEY `category_s_id` (`category_s_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `category_s`
--
ALTER TABLE `category_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_m_id` (`category_m_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_l`
--
ALTER TABLE `category_l`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_recipe_relations`
--
ALTER TABLE `category_recipe_relations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `member_favorite_recipe`
--
ALTER TABLE `member_favorite_recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `category_m`
--
ALTER TABLE `category_m`
  ADD CONSTRAINT `category_m_ibfk_1` FOREIGN KEY (`category_l_id`) REFERENCES `category_l` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `category_recipe_relations`
--
ALTER TABLE `category_recipe_relations`
  ADD CONSTRAINT `category_recipe_relations_ibfk_1` FOREIGN KEY (`category_l_id`) REFERENCES `category_l` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_recipe_relations_ibfk_2` FOREIGN KEY (`category_m_id`) REFERENCES `category_m` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_recipe_relations_ibfk_3` FOREIGN KEY (`category_s_id`) REFERENCES `category_s` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_recipe_relations_ibfk_4` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `category_s`
--
ALTER TABLE `category_s`
  ADD CONSTRAINT `category_s_ibfk_1` FOREIGN KEY (`category_m_id`) REFERENCES `category_m` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
END;
  }


  public function getDownSQL()
  {
    return <<<END
DROP TABLE IF EXISTS `category_recipe_relations`;
DROP TABLE IF EXISTS `category_s`;
DROP TABLE IF EXISTS `category_m`;
DROP TABLE IF EXISTS `category_l`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `member_favorite_recipe`;
DROP TABLE IF EXISTS `ingredients`;
DROP TABLE IF EXISTS `schema_version`;
DROP TABLE IF EXISTS `step`;
DROP TABLE IF EXISTS `recipe`;
DROP TABLE IF EXISTS `member`;
END;
  }

}