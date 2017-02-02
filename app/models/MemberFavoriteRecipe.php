<?php

use Candy\Base\Model;

class MemberFavoriteRecipe extends Model {

    protected $table = 'member_favorite_recipe';
    protected $fillable = ['member_id', 'recipe_id'];

    public function isFavorite($recipeId) {
        $_SESSION['userId'] = '1';
        if(isset($_SESSION['userId'])) {
            return $this->newQuery()->where('member_id', $_SESSION['userId'])->where('recipe_id', $recipeId)->exists();
        }
        return false;
    }

    public function getFavCount($recipeId) {
        return $this->newQuery()->where('recipe_id', $recipeId)->count();
    }
}