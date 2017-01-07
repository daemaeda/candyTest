<?php

$config['aliases'] = array(
    'Slim'      => 'Slim\Slim',
    'Middleware'=> 'Slim\Middleware',
    'Model'     => 'Illuminate\Database\Eloquent\Model',
    'App'       => 'SlimFacades\App',
    'Config'    => 'SlimFacades\Config',
    'Input'     => 'SlimFacades\Input',
    'Log'       => 'SlimFacades\Log',
    'Request'   => 'SlimFacades\Request',
    'View'      => 'SlimFacades\View',
    'Response'  => 'Candy\Facade\ResponseFacade',
    'Sentry'    => 'Candy\Facade\SentryFacade',
    'Route'     => 'Candy\Facade\RouteFacade',
    'DB'        => 'Candy\Facade\DatabaseFacade',
    'Module'    => 'Candy\Facade\ModuleManagerFacade',
    'Menu'      => 'Candy\Facade\MenuManagerFacade',
    'Validator' => 'Candy\Facade\ValidatorFacade',
    'CSRF'      => 'Candy\Facade\CsrfProtectionFacade'
);