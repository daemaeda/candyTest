<?php

use Candy\Base\Controller;

Class RecipeController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    // getでrecipe/にアクセスされた場合
    // 検索画面
    public function index()
    {
        // title
        $this->data['title'] = 'レシピ一覧';

        // ページングのリンク
        $page = (int)Input::get('page');

        $keyword = Input::get('keyword');
        $category = Input::get('category');
        $scene = Input::get('scene');
        $tagId = Input::get('tagId');

        $this->data['inputKeyword'] = $keyword;
        $this->data['inputCategory'] = $category;
        $this->data['inputScene'] = $scene;

		$keyword = mb_convert_kana($keyword, 's');
		$aryKeyword = preg_split('/[\s]+/', $keyword, -1, PREG_SPLIT_NO_EMPTY);

        // レシピテーブル（ORM）
        $Recipe = new Recipe();
        $Tag = new Tag();
        try {
            $this->data['categoryName'] = $Tag->findTag($category);
            $this->data['sceneName'] = $Tag->findTag($scene);
            if(strlen($tagId) != 0) {
                $findTag = $Tag->findTag($tagId)->first()->toArray();
                if(CATEGORY == $findTag['type']) {
                    $category = $findTag['id'];
                    $this->data['categoryName'] = $findTag['name'];
                    $this->data['inputCategory'] = $findTag['id'];
                } else {
                    $scene = $findTag['id'];
                    $this->data['sceneName'] = $findTag['name'];
                    $this->data['inputScene'] = $findTag['id'];
                }
            }

            $this->data['categories'] = $Tag->getCategory();
            $this->data['scenes'] = $Tag->getScene();
            $findRecipes = $Recipe->findRecipe($category, $scene, $aryKeyword);
            $this->data['recipes'] = $Recipe->findByQueryPerPage($findRecipes, $page);
                $this->data['pager'] = $Recipe->paginationNav((int)$page, $this->siteUrl('recipe'))
                    ->get_html(PAGING_THEMES_PATH);
            $this->data['keyword'] = $keyword;
        } catch (\SQLiteException $e) {
            App::flash('messageError', "データベースエラーが発生しました。管理者にお問い合わせください。");
            Response::redirect($this->siteUrl('recipe'));
        }
        // /candy/app/views/recipe/index.twigをいじれば変わるよ
        App::render('recipe/index.twig', $this->data);
        // header footerはincludeフォルダの中にある
    }

    // getでrecipe/createにアクセスされた場合
    // 入力画面と確認画面はここでする。
    public function create()
    {
        $this->data['title'] = 'レシピ新規作成';

		$this->loadCss('recipe_detail.css');
		$this->loadCss('recipe_create.css');
		$this->loadJs('app/recipe.js');
        $Tag = new Tag();
        try {
            $this->data['tags'] = $Tag->all();
        } catch (\SQLiteException $e) {
            App::flash('messageError', "データベースエラーが発生しました。管理者にお問い合わせください。");
            Response::redirect($this->siteUrl('recipe'));
        }
        App::render('recipe/create.twig', $this->data);
    }

    // postでrecipe/にアクセスされた場合
    // 新規作成処理
    public function store()
    {
        // ????: 判定するものが多すぎるのて一旦flgで判定する
        $isError = false;

        //---------------------
        $input = Input::post();
        $clip = Input::file('clip');
        if (!is_uploaded_file($clip["tmp_name"]) && $clip["type"] != "video/mp4") {
            App::flash('video', 'ビデオはMP4形式のみ対応しています');
            $isError = true;
        }

        // hogehoge.mp4 -> hogehoge
        // ファイル名：filename_timestamp
        $timestamp = time();
        $clipFileName = pathinfo($clip['name'], PATHINFO_FILENAME);
        $clipUploadFileName = "{$clipFileName}_{$timestamp}";

        //----------recipeテーブル処理--------------//
        $recipeTable = [];
        $recipeTable['title'] = $input['title'];
        $recipeTable['clip'] = "{$clipUploadFileName}.mp4";
        $recipeTable['servings_for'] = $input['servings_for'];
        $recipeTable['thumb'] = "{$clipUploadFileName}.jpg";
        $recipeTable['explain'] = $input['explain'];
        $recipeTable['point'] = $input['point'];
        $recipeTable['mistake'] = $input['mistake'];
        $recipeTable['member_id'] = $_SESSION['userId'];

        $Recipe = new Recipe();
        $Recipe->load($recipeTable);
        $Recipe->validate();

        if ($Recipe->hasErrors()) {
            App::flash('recipe', $Recipe->getErrors());
            $isError = true;
        }
        //----------tagテーブル処理--------------//
        if(!isset($input['tag'])) {
            App::flash('tag', 'カテゴリを1つ以上選択してください');
            $isError = true;
        }
        //----------ingredientsテーブル処理--------------//
        $checkValue = [];
        $ingredientsTemps = [];

        $ingredientsNo = 1;
        $notInputCount = 0;
        // 入力した値を一旦格納
        for ($i = 0; $i < count($input['name']); $i++) {
            $checkValue['name'] = $input['name'][$i];
            $checkValue['quantity'] = $input['quantity'][$i];

            $temp = [];
            $temp['name'] = $checkValue['name'];
            $temp['quantity'] = $checkValue['quantity'];
            if(strlen($checkValue['name']) == 0 && $checkValue['quantity'] == 0) {
                $notInputCount++;
            }
            $ingredientsTemps[] = $temp;
        }
        
        if($notInputCount == count($ingredientsTemps)) {
            App::flash('ingredientError', '材料を1つ以上入力してください');
            $isError = true;
        }

        App::flash('ingredients', $ingredientsTemps);

        // 値チェック
        $ingredientsTables = [];
        $ingredientsError = [];
        $ingredientsErrorFlg = false;

        foreach ($ingredientsTemps as $ingredientsTemp) {
            if(strlen($ingredientsTemp['name']) != 0 && strlen($ingredientsTemp['quantity']) != 0) {
                $temp = [];
                $temp['name'] = $ingredientsTemp['name'];
                $temp['quantity'] = $ingredientsTemp['quantity'];
                $temp['ingredients_no'] = $ingredientsNo;
                $ingredientsTables[] = $temp;
                $ingredientsNo++;
                $ingredientsError[] = [];
            } else if(strlen($ingredientsTemp['name']) != 0 && strlen($ingredientsTemp['quantity'] == 0)) {
                $ingredientsError[] = "材料名と数量を入力してください";
                $ingredientsErrorFlg = true;
            } else if(strlen($ingredientsTemp['name']) == 0 && strlen($ingredientsTemp['quantity'] != 0)) {
                $ingredientsError[] = "材料名と数量を入力してください";
                $ingredientsErrorFlg = true;
            }
        }

        if($ingredientsErrorFlg) {
            App::flash('ingredientError', '入力内容に間違いがあります');
            App::flash('ingredientErrors', $ingredientsError);
            $isError = true;
        }

        //----------フォルダ作成（なければ）-------------/
        $memberId = $_SESSION['userId'];
        // TODO: 本来はCONFクラスにまとめる
        $userVideoFolderPath = VIDEO_PATH . $memberId;
        $userThumbFolderPath = THUMB_PATH . $memberId;

        // フォルダ作成
        //「$userVideoFolderPath」で指定されたディレクトリが存在するか確認
        if (!file_exists($userVideoFolderPath)) {
            //存在しないときの処理（「$userVideoFolderPath」で指定されたディレクトリを作成する）
            if (mkdir($userVideoFolderPath, 0777)) {
                //作成したディレクトリのパーミッションを確実に変更
                chmod($userVideoFolderPath, 0777);
            } else {
                App::flash('video', 'アップロード準備に失敗しました。もう一度お試しください');
                $isError = true;
            }
        }

        if (!file_exists($userThumbFolderPath)) {
            if (mkdir($userThumbFolderPath, 0777)) {
                chmod($userThumbFolderPath, 0777);
            } else {
                App::flash('video', 'アップロード準備に失敗しました。もう一度お試しください');
                $isError = true;
            }
        }

        //----------動画アップロード--------------//
        move_uploaded_file($clip['tmp_name'], "{$userVideoFolderPath}/{$clipUploadFileName}.mp4");
        $uploadFilePath = "{$userVideoFolderPath}/{$clipUploadFileName}.mp4";
        if (!file_exists($uploadFilePath)) {
            App::flash('video', 'ビデオアップロードに失敗しました。もう一度お試しください');
            $isError = true;
        }

        //----------サムネイル作成--------------//
        // http://qiita.com/tukiyo3/items/d8caac4fcf8ad5a7167b
        exec(FFMPEG_APP_PATH." -i ".$uploadFilePath." -ss 5 -vframes 1 -f image2 -s 280x158 -aspect 16:9 ".$userThumbFolderPath."/".$clipUploadFileName.".jpg");
        //-------------判定---------------
        $db = \DB::getConnection();
        try {
            if ($isError) {
                App::flash('messageError', "登録に失敗しました。入力内容をご確認ください");
                throw new \Exception;
            }

            $db->beginTransaction();
            $Recipe->save();
            $recipeId = $Recipe->getConnection()->getPdo()->lastInsertId();
            $Ingredients = new Ingredients();
            // 追加されたレシピIDを取得しつつ、安全な値のみと確定しているが、１件ずつチェックして格納する
            foreach ($ingredientsTables as $ingredientsTable) {
                $ingredientsTable['recipe_id'] = $recipeId;
                $Ingredients = $Ingredients->newInstance()->load($ingredientsTable);
                $Ingredients->validate();
                if(!$Ingredients->hasErrors()) {
                    $Ingredients->save();
                }
            }

            $TagRecipeRelations = new TagRecipeRelations();
            foreach ($input['tag'] as $tag) {
                $tagTable = [];
                $tagTable['recipe_id'] = $recipeId;
                $tagTable['tag_id'] = $tag;
                $TagRecipeRelations = $TagRecipeRelations->newInstance()->load($tagTable);
                $TagRecipeRelations->validate();
                if(!$TagRecipeRelations->hasErrors()) {
                    $TagRecipeRelations->save();
                }
            }

            $db->commit();
            App::flash('messageSuccess', "登録が完了しました");
            Response::redirect($this->siteUrl('recipe') . '/' . $recipeId);
        } catch (\Exception $e) {
            print_r($e->getMessage());
            $db->rollBack();
            App::flash('input', Input::post());
            Response::redirect($this->siteUrl('recipe/create'));
        }
    }

    // getでrecipe/:idにアクセスされた場合
    // 例：http://localhost/candy/public/recipe/10
    // 10に入った値は自動的に$idに入る
    // 詳細画面
    public function show($id)
    {
		$this->loadJs('app/review.js');
		$this->loadCss('recipe_detail.css');
        $Recipe = new Recipe();
        $MemberFav = new MemberFavoriteRecipe();
        $TagRecipeRelations = new TagRecipeRelations();
        try {
            DB::table('recipe')->where('id', $id)->increment('view');
            $findRecipe = $Recipe::findOrFail($id);
            $recipeTag = $TagRecipeRelations->getTags($id);
            $this->data['relatedVideos'] = $Recipe->findRelatedVideo($recipeTag);
            $this->data['favorite'] = $MemberFav->isFavorite($id);
            $this->data['title'] = $findRecipe->title;
            $this->data['recipe'] = $findRecipe;
            $this->data['tags'] = $recipeTag;
            App::render('recipe/show.twig', $this->data);
        } catch (\SQLiteException $e) {
            App::flash('messageError', "データベースエラーが発生しました。管理者にお問い合わせください。");
            Response::redirect($this->siteUrl('recipe'));
        } catch (Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            App::flash('messageError', "存在しないレポートが指定されました。");
            Response::redirect($this->siteUrl('recipe'));
        }
    }

    // getでrecipe/:id/editにアクセスされた場合
    // 編集画面
    public function edit($id)
    {
        $this->data['title'] = 'レシピ編集';
        View::display('recipe/input.twig', $this->data);
    }

    // putまたはpatchでrecipe/:idにアクセスされた場合
    // 更新処理
    public function update($id)
    {

    }

    // deleteでrecipe/:idにアクセスされた場合
    // 削除処理
    public function destroy($id)
    {

    }
}