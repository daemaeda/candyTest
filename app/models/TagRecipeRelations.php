<?php

use Candy\Base\Model;

class TagRecipeRelations extends Model
{

    protected $table = 'tag_recipe_relations';
    protected $fillable = ['recipe_id', 'tag_id'];

    public function recipe()
    {
        return $this->belongsTo('Recipe');
    }

    public function tag()
    {
        return $this->belongsTo('Tag');
    }

    public function getTags($recipeId)
    {
        return $this->newQuery()->where('recipe_id', $recipeId)->get();
    }
}