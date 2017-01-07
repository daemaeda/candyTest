<?php

use Candy\Base\Model;

class Review extends Model {

    protected $table = 'review';
    protected $fillable = ['recipe_id', 'review_no', 'reply_id', 'comment', 'member_id'];
}