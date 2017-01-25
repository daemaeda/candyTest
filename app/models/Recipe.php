<?php

use Candy\Base\Model;

class Recipe extends Model
{

    protected $table = 'recipe';
    protected $fillable = ['title', 'clip', 'thumb', 'servings_for', 'explain', 'point', 'mistake', 'member_id'];

    protected static function rules()
    {
        return [
            'title' => ['required', 'string'],
            'servings_for' => ['required', 'string'],
            'explain' => ['required', 'string'],
            'mistake' => ['string'],
        ];
    }

    public function ingredients()
    {
        return $this->hasMany('Ingredients');
    }

    public function review()
    {
        return $this->hasMany('Review', 'recipe_id');
    }

    public function tagRelations()
    {
        return $this->hasMany('TagRecipeRelations', 'recipe_id');
    }

    public function member()
    {
        return $this->belongsTo('Member');
    }

    public function findRecipe($category, $scene, $aryKeyword)
    {
        $findRecipe = DB::table('recipe')
            ->join('tag_recipe_relations', 'recipe.id', '=', 'tag_recipe_relations.recipe_id')
            ->join('tag', 'tag_recipe_relations.tag_id', '=', 'tag.id')
            ->join('member', 'member.id', '=', 'recipe.member_id')
            ->select('recipe.*', 'member.name AS member_name')
            ->selectRaw('GROUP_CONCAT(tag.name) as tag')
            ->groupBy('recipe.id');

        foreach ($aryKeyword as $value) {
            $findRecipe->orWhere('title', 'like', '%' . $value . '%');
        }

        if (strlen($category) != 0) {
            $findRecipe->where('tag_recipe_relations.tag_id', $category);
        }

        if (strlen($scene) != 0) {
            $findRecipe->where('tag_recipe_relations.tag_id', $scene);
        }


        $findRecipe->orderBy('recipe.created_at', 'desc');
        return $findRecipe;

    }

}
