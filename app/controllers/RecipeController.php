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

        // これでassetsフォルダにあるcss呼べる
        $this->loadCss('loadcss.css');

        // レシピテーブル（ORM）
        $Recipe = new Recipe();
        try {
            $findRecipes = $Recipe->newQuery()->orderBy('created_at', 'desc');
            $this->data['recipes'] = $Recipe->findByQueryPerPage($findRecipes, $page);
                $this->data['pager'] = $Recipe->paginationNav((int)$page, $this->siteUrl('recipe'))
                    ->get_html(PAGING_THEMES_PATH);
        } catch (\SQLiteException $e) {
            App::flash('messageError', "データベースエラーが発生しました。管理者にお問い合わせください。");
            Response::redirect($this->siteUrl('report'));
        }

        // /candy/app/views/recipe/index.twigをいじれば変わるよ
        View::display('recipe/index.twig', $this->data);

        // header footerはincludeフォルダの中にある
    }

    // getでrecipe/createにアクセスされた場合
    // 入力画面と確認画面はここでする。
    public function create()
    {
        $this->data['title'] = 'レシピ新規作成';
        View::display('recipe/create.twig', $this->data);
    }

    // postでrecipe/にアクセスされた場合
    // 新規作成処理
    public function store()
    {
        //---------SESSIONで取る------------
        $memberId = 1;

        // ????: 判定するものが多すぎるのて一旦flgで判定する
        $isError = false;

        //---------------------
        $recipeInput = Input::post();
        App::flash('input', Input::post());
        $clip = Input::file('clip');
        if (!is_uploaded_file($clip["tmp_name"] && $clip["type"] != "video/mp4")) {
            App::flash('video', 'ビデオはMP4形式のみ対応しています');
            $isError = true;
        }

        // hogehoge.mp4 -> hogehoge
        $clipFileName = pathinfo($clip['name'], PATHINFO_FILENAME);

        // ファイル名：filename_timestamp
        $timestamp = time();
        $clipUploadFileName = "{$clipFileName}_{$timestamp}";

        //----------recipeテーブル処理--------------//
        $Recipe = new Recipe();
        $recipeInput['member_id'] = 1;
        $recipeInput['thumb'] = "{$clipUploadFileName}.jpg";
        $recipeInput['clip'] = "{$clipUploadFileName}.mp4";
        $Recipe->load($recipeInput);
        $Recipe->validate();

        // エラーがあればこの時点で格納しておく
        if (!$Recipe->hasErrors()) {
            App::flash('recipe', $Recipe->getErrors());
            $isError = true;
        }

        //----------ingredientsテーブル処理--------------//
        $Ingredients = new Ingredients();
        $ingredientsInput = Input::post();
        $checkValue = [];
        $ingredientsInserts = [];
        $ingredientsInputError = [];
        $ingredientsNo = 1;

        // HACK: eloquant 5.3系ならまとめてvaldiationできる
        for ($i = 0; $i < count($ingredientsInput['name']); $i++) {
            $checkValue['name'] = $ingredientsInput['name'][$i];
            $checkValue['quantity'] = $ingredientsInput['quantity'][$i];
            $Ingredients->load($checkValue);
            $Ingredients->validate();

            if(!$Ingredients->hasErrors()) {
                $checkValue['ingredients_no'] = $ingredientsNo;
                $ingredientsNo++;
            }
            $ingredientsInputError[] = $Ingredients->getErrors();
            $ingredientsInserts[] = $checkValue;
        }
        App::flash('ingredients', $ingredientsInserts);

        if (count($ingredientsInputError) != 0) {
            App::flash('errorIngredients', $Recipe->getErrors());
            $isError = true;
        }

        //----------フォルダ作成（なければ）-------------/

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
        exec(FFMPEG_APP_PATH." -i ".$uploadFilePath." -ss 5 -vframes 1 -f image2 -s 320x240 ".$userThumbFolderPath."/".$clipUploadFileName.".jpg");
        if (!file_exists(THUMB_PATH.$uploadFilePath.".jpg")) {
            App::flash('video', 'サムネイル作成に失敗しました。もう一度お試しください');
            $isError = true;
        } else {
            // TODO: エラー処理
            unlink($uploadFilePath);
        }
        //-------------判定---------------

        $db = \DB::getConnection();
        try {
            // 現状ここのエラーチェックは機能をしていない
            if ($isError) {
                App::flash('messageError', "登録に失敗しました。入力内容をご確認ください");
//                throw new \Exception;
            }

            $db->beginTransaction();
            $Recipe->save();
            $recipeId = $Recipe->getConnection()->getPdo()->lastInsertId();

            // 追加されたレシピIDを取得しつつ、安全な値のみと確定しているが、１件ずつチェックして格納する
            for ($i = 0; $i < count($ingredientsInserts); $i++) {
                $ingredientsInserts[$i]['recipe_id'] = $recipeId;
                $Ingredients = $Ingredients->newInstance()->load($ingredientsInserts[$i]);
                $Ingredients->validate();

                // どちらかが入力されていれば、どちらも入力するというバリデーションは出来るが、
                // どちらも空白の場合のバリデーションが現状出来ないので、便宜的に文字数もチェックする
                if(!$Ingredients->hasErrors() && strlen($ingredientsInserts[$i]['name']) != 0 && strlen($ingredientsInserts[$i]['quantity']) != 0) {
                    $Ingredients->save();
                }
            }
            $db->commit();
            App::flash('messageSuccess', "登録が完了しました");
            Response::redirect($this->siteUrl('recipe') . '/' . $recipeId);
        } catch (\Exception $e) {
            print_r($e->getMessage());
            $db->rollBack();
//            Response::redirect($this->siteUrl('recipe/create'));
        }

    }

    // getでrecipe/:idにアクセスされた場合
    // 例：http://localhost/candy/public/recipe/10
    // 10に入った値は自動的に$idに入る
    // 詳細画面
    public function show($id)
    {
        $Recipe = new Recipe();
        try {
            $findRecipe = $Recipe::findOrFail($id);
            $this->data['title'] = $findRecipe->title;
            $this->data['recipe'] = $findRecipe;
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