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

        $db = \DB::getConnection();
        try {
            // 既にデータがある場合は物理削除 スマートではないが、データが増え続けるよりは良い
            $db->beginTransaction();
            $deleteFav = $MemberFav->newQuery()->where('member_id', $memberId)->where('recipe_id', $recipeId)->firstOrFail();
            $deleteFav->delete();
            DB::table('recipe')->where('id', '=', $recipeId)->decrement('love');
            $code    = 200;
            $isCountUp = false;
            $db->commit();
            // 存在しなければインサート
        } catch (Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            $MemberFav->load(Input::put());
            $MemberFav->save();
            DB::table('recipe')->where('id', '=', $recipeId)->increment('love');
            $code = 200;
            $isCountUp = true;
            $db->commit();
        } catch (\Exception $e){
            $db->rollBack();
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