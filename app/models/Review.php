<?php

use Candy\Base\Model;

class Review extends Model {

    protected $table = 'review';
    protected $fillable = ['recipe_id', 'reply_id', 'comment', 'member_id'];

    public function member()
    {
        return $this->belongsTo('Member');
    }
}