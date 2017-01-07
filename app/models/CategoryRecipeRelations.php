<?php

use Candy\Base\Model;

class CategoryRecipeRelations extends Model {

    protected $table = 'category_recipe_relations';
    protected $fillable = ['recipe_id', 'category_s_id', 'category_m_id', 'category_l_id'];
}