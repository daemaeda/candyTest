<?php

use Candy\Base\Model;

class Recipe extends Model
{

    protected $table = 'recipe';
    protected $fillable = ['title', 'clip', 'thumb', 'servings_for', 'explain', 'point', 'mistake', 'view', 'love', 'member_id'];

    protected static function rules()
    {
        return [
            'title' => ['required', 'string'],
            'explain' => ['required', 'string'],
            'servings_for' => ['required', 'string'],
            'point' => ['string'],
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

    public function findRelatedVideo($tags)
    {
        return DB::table('recipe')
            ->join('tag_recipe_relations', 'recipe.id', '=', 'tag_recipe_relations.recipe_id')
            ->join('tag', 'tag_recipe_relations.tag_id', '=', 'tag.id')
            ->select('recipe.*')
            ->selectRaw('GROUP_CONCAT(tag.name) as tag')
            ->whereIn('tag_recipe_relations.tag_id', array_column($tags->toArray(), 'tag_id'))
            ->groupBy('recipe.id')
            ->orderBy('recipe.love', 'desc')->orderBy('recipe.view', 'desc')
            ->take(10)
            ->get();
    }

    public function findRecipe($category, $scene, $aryKeyword)
    {
        $findRecipe = DB::table('recipe')
            ->join('tag_recipe_relations', 'recipe.id', '=', 'tag_recipe_relations.recipe_id')
            ->join('tag', 'tag_recipe_relations.tag_id', '=', 'tag.id')
            ->join('member', 'member.id', '=', 'recipe.member_id')
            ->select('recipe.*', 'member.name AS member_name')
            ->selectRaw('GROUP_CONCAT(tag.name) as tag_name')
            ->selectRaw('GROUP_CONCAT(tag.id) as tag_id')
            ->groupBy('recipe.id');

        $findRecipe->whereIn('recipe.id', function ($query) use ($category, $scene) {
            $query->select('recipe_id')
                ->from('tag_recipe_relations');
            if (strlen($category) > 0) {
                $query->orWhere('tag_id', $category);
            }
        });
		
		$findRecipe->whereIn('recipe.id', function ($query) use ($category, $scene) {
			$query->select('recipe_id')
				->from('tag_recipe_relations');
			if (strlen($scene) > 0) {
				$query->orWhere('tag_id', $scene);
			}
		});
	
        foreach ($aryKeyword as $value) {
            if (strlen($value) > 0) {
                $findRecipe->where('title', 'like', '%' . $value . '%');
            }
        }
        $findRecipe->orderBy('recipe.created_at', 'desc');
        return $findRecipe;
    }

}
