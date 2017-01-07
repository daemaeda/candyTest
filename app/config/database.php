<?php

$config['database'] = array(
    'default'       => 'mysql',

    'connections'   => array(

        'mysql' => array(
            'driver'    => 'mysql',
            // http://qiita.com/dolaemoso/items/35f6bba22801b4027ec4
            'host'      => isset($_SERVER['CANDY_HOST']) ? $_SERVER['CANDY_HOST'] : '',
            'database'  => isset($_SERVER['CANDY_NAME']) ? $_SERVER['CANDY_NAME'] : '',
            'username'  => isset($_SERVER['CANDY_USER']) ? $_SERVER['CANDY_USER'] : '',
            'password'  => isset($_SERVER['CANDY_PASS']) ? $_SERVER['CANDY_PASS'] : '',
            'charset'   => 'utf8',
            'collation' => 'utf8_unicode_ci',
            'prefix'    => '',
        ),
    )
);