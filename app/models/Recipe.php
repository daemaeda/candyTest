<?php

use Candy\Base\Model;

class Recipe extends Model {

    protected $table = 'recipe';
    protected $fillable = ['title', 'clip' ,'thumb', 'servings_for', 'explain', 'point', 'mistake', 'member_id'];

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

    public function member()
    {
        return $this->belongsTo('Member');
    }

}
