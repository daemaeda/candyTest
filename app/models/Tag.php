<?php

use Candy\Base\Model;

class Tag extends Model {

    protected $table = 'tag';
    protected $fillable = ['name', 'type'];

    public function recipeRelation()
    {
        return $this->hasMany('TagRecipeRelations', 'tag_id');
    }

    public function getCategory() {
        return $this->newQuery()->where('type', CATEGORY)->get();
    }

    public function getSCENE() {
        return $this->newQuery()->where('type', SCENE)->get();
    }
}