<?php

use Candy\Base\Controller;

Class HomeController extends Controller
{

    public function index()
    {
        $this->data['title'] = 'Candy Clip';

		// レシピテーブル（ORM）
		$Recipe = new Recipe();
		$Tag = new Tag();
		try {
			$this->data['categories'] = $Tag->getCategory();
			$this->data['scenes'] = $Tag->getScene();
			$this->data['recipes'] = $findRecipes = $Recipe->all();
		} catch (\SQLiteException $e) {
			App::flash('messageError', "データベースエラーが発生しました。管理者にお問い合わせください。");
			Response::redirect($this->siteUrl('report'));
		}
		View::display('index.twig', $this->data);
    }
}