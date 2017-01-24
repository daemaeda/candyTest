<?php

use Candy\Base\Controller;

Class UserController extends Controller
{

    public function index()
    {
        $this->data['title'] = 'Mypage';
        
        App::render('index.twig', $this->data);
    }

    public function favorite()
    {
        $recipeId = (int) Input::put("recipe_id");
        $memberId = (int) Input::put("member_id");
        $message = '';
        $code    = 0;
        $isCountUp = null;

        $MemberFav = new MemberFavoriteRecipe();
        try {
            // 既にデータがある場合は物理削除 スマートではないが、データが増え続けるよりは良い
            $deleteFav = $MemberFav->newQuery()->where('member_id', $memberId)->where('recipe_id', $recipeId)->firstOrFail();
            $deleteFav->delete();
            $code    = 200;
            $isCountUp = false;
            // 存在しなければインサート
        } catch (Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            $MemberFav->load(Input::put());
            $MemberFav->save();
            $code = 200;
            $isCountUp = true;
        } catch (\Exception $e){
            $message = $e->getMessage();
            $code = 500;
        }

        if(Request::isAjax()){
            Response::headers()->set('Content-Type', 'application/json');
            Response::setBody(json_encode(
                array(
                    'message'   => $message,
                    'code'      => $code,
                    'isCountUp' => $isCountUp,
                )
            ));
        }else{
            Response::redirect($this->siteUrl('/'));
        }
    }
}