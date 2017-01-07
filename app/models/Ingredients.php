<?php

use Candy\Base\Model;

class Ingredients extends Model {

    protected $table = 'ingredients';
    protected $fillable = ['recipe_id', 'ingredients_no', 'name', 'quantity'];

    protected static function rules()
    {
        return [
            'name' => ['required_with:quantity', 'string'],
            'quantity' => ['required_with:name', 'string'],
        ];
    }
}