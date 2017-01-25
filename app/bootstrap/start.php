<?php

session_cache_limiter(false);
//session_start();

define('ROOT_PATH'  , __DIR__.'/../../');
define('VENDOR_PATH', __DIR__.'/../../vendor/');
define('APP_PATH'   , __DIR__.'/../../app/');
define('MODULE_PATH', __DIR__.'/../../app/modules/');
define('PUBLIC_PATH', __DIR__.'/../../public/');
define('CMD_PATH', __DIR__.'/../../app/cmd/');

// CANDY用
define('FFMPEG_APP_PATH', CMD_PATH.'ffmpeg');
define('THUMB_PATH', PUBLIC_PATH.'thumb/');
define('VIDEO_PATH', PUBLIC_PATH.'video/');
define('PAGING_THEMES_PATH', ROOT_PATH.'src/Candy/themes/default');

require VENDOR_PATH.'autoload.php';

define('CATEGORY', 0);
define('SCENE', 1);
/**
 * Load the configuration
 */
$config = array(
    'path.root'     => ROOT_PATH,
    'path.public'   => PUBLIC_PATH,
    'path.app'      => APP_PATH,
    'path.module'   => MODULE_PATH
);

foreach (glob(APP_PATH.'config/*.php') as $configFile) {
    require $configFile;
}

/** Merge cookies config to slim config */
if(isset($config['cookies'])){
    foreach($config['cookies'] as $configKey => $configVal){
        $config['slim']['cookies.'.$configKey] = $configVal;
    }
}

/**
 * Initialize Slim and Candy application
 */
$app        = new \Slim\Slim($config['slim']);
$starter    = new \Candy\Bootstrap($app);

$starter->setConfig($config);

/**
 * if called from the install script, disable all hooks, middlewares, and database init
 */
if(!defined('INSTALL')){
    /** boot up Candy */
    $starter->boot();

    /** Setting up Slim hooks and middleware */
    require APP_PATH.'bootstrap/app.php';

    /** registering modules */
    foreach (glob(APP_PATH.'modules/*') as $module) {
        $className = basename($module);
        $moduleBootstrap = "\\$className\\Initialize";

        $app->module->register(new $moduleBootstrap);
    }

    $app->module->boot();

    /** Start the route */
    require APP_PATH.'routes.php';
}else{
    /** disregard sentry configuration on install */
    $config['aliases']['Sentry'] = 'Cartalyst\Sentry\Facades\Native\Sentry';

    $starter->bootFacade($config['aliases']);
}

return $starter;