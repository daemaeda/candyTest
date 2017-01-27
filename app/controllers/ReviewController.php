<?php

use Candy\Base\Controller;

Class ReviewController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function store()
    {
        $message = '';
        $code = 0;

        $Review = new Review();
        try {
            $Review->load(Input::post());
            $Review->validate(Input::post());
            $Review->save();
            // 既にデータがある場合は物理削除 スマートではないが、データが増え続けるよりは良い
            $code = 200;
        } catch (\Exception $e) {
            $message = $e->getMessage();
            $code = 500;
        }

        if (Request::isAjax()) {
            Response::headers()->set('Content-Type', 'application/json');
            Response::setBody(json_encode(
                array(
                    'message' => $message,
                    'code' => $code,
                )
            ));
        } else {
            Response::redirect($this->siteUrl('/'));
        }
    }
}
