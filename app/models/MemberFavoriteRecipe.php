<?php

use Candy\Base\Model;

class MemberFavoriteRecipe extends Model {

    protected $table = 'member_favorite_recipe';
    protected $fillable = ['member_id', 'recipe_id'];
    private $recipeId;

    /**
     * @return mixed
     */
    public function getRecipeId()
    {
        return $this->recipeId;
    }

    /**
     * @param mixed $recipeId
     */
    public function setRecipeId($recipeId)
    {
        $this->recipeId = $recipeId;
    }

    public function isFavorite() {
        $_SESSION['userId'] = '1';
        if(isset($_SESSION['userId'])) {
            return $this->newQuery()->where('member_id', $_SESSION['userId'])->where('recipe_id', $this->getRecipeId())->exists();
        }
        return false;
    }

    public function getFavCount() {
        return $this->newQuery()->where('recipe_id', $this->getRecipeId())->count();
    }
}