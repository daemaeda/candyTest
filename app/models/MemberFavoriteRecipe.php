<?php

use Candy\Base\Model;

class MemberFavoriteRecipe extends Model {

    protected $table = 'member_favorite_recipe';
    protected $fillable = ['member_id', 'recipe_id'];
}