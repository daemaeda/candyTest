<?php

use Candy\Base\Controller;

Class ReviewController extends Controller
{
    public function __construct()
    {
        parent::__construct();
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
        $reviewInput = Input::post();
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
