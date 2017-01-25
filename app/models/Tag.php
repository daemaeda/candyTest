<?php

use Candy\Base\Model;

class Tag extends Model {

    protected $table = 'tag';
    protected $fillable = ['name', 'type'];

    public function recipeRelation()
    {
        return $this->hasMany('TagRecipeRelations');
    }
}