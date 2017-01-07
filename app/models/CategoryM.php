<?php

use Candy\Base\Model;

class CategoryM extends Model {

    protected $table = 'category_m';
    protected $fillable = ['category_l_id', 'name'];
}