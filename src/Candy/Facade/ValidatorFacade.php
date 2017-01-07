<?php

namespace Candy\Facade;

class ValidatorFacade extends \SlimFacades\Facade{
    protected static function getFacadeAccessor() { return 'validator'; }
}