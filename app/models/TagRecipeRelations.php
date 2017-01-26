<?php

use Candy\Base\Model;

class TagRecipeRelations extends Model {

    protected $table = 'tag_recipe_relations';
    protected $fillable = ['recipe_id', 'tag_id'];
    private $recipeId;

    public function recipe()
    {
        return $this->belongsTo('Recipe');
    }

    public function tag()
    {
        return $this->belongsTo('Tag');
    }

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

    public function getTags() {
        return $this->newQuery()->where('recipe_id', $this->getRecipeId())->get();
    }
}