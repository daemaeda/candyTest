<?php
return array(
    'colors' => true,
    'databases' => array(
        'migration' => array(
            // PDO Connection settings.
            'database_dsn'       => isset($_SERVER['CANDY_DNS']) ? $_SERVER['CANDY_DNS'] : 'mysql:dbname=candy;host=localhost',
            'database_user'      => isset($_SERVER['CANDY_USER']) ? $_SERVER['CANDY_USER'] : 'root',
            'database_password'  => isset($_SERVER['CANDY_PASS']) ? $_SERVER['CANDY_PASS'] : '123',

            // schema version table
            'schema_version_table' => 'schema_version',

            // directory contains migration task files.
            'migration_dir' => './migration'
        ),
    ),
);
