<?php

use Candy\Base\Controller;

Class HomeController extends Controller
{

    public function index()
    {
        $this->data['title'] = 'Candy Clip';

		// ページングのリンク
		$page = (int)Input::get('page');

		// レシピテーブル（ORM）
		$Recipe = new Recipe();
		$Tag = new Tag();
		try {
			$this->data['categories'] = $Tag->getCategory();
			$this->data['scenes'] = $Tag->getScene();
			$findRecipes = $Recipe->newQuery()->orderBy('created_at', 'desc')->get();
			$this->data['recipes'] = $Recipe->findByQueryPerPage($findRecipes, $page);
			$this->data['pager'] = $Recipe->paginationNav((int)$page, $this->siteUrl('recipe'))
				->get_html(PAGING_THEMES_PATH);
		} catch (\SQLiteException $e) {
			App::flash('messageError', "データベースエラーが発生しました。管理者にお問い合わせください。");
			Response::redirect($this->siteUrl('report'));
		}
		View::display('index.twig', $this->data);
    }
}