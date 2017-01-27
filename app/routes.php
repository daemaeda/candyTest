<?php

Route::get('/login', 'AuthController:login')->name('login');
Route::get('/logout', 'AuthController:logout')->name('logout');
Route::post('/login', 'AuthController:doLogin');

Route::get('/', 'HomeController:index');
Route::group('/recipe', function(){
    Route::get('/', 'RecipeController:index');
    Route::get('/create', 'RecipeController:create');
    Route::post('/', 'RecipeController:store');
    Route::get('/:id', 'RecipeController:show');
    Route::get('/:id/edit', 'RecipeController:edit');
    Route::put('/:id', 'RecipeController:update');
    Route::get('/:id/delete', 'RecipeController:delete');
    Route::delete('/:id', 'RecipeController:destroy');
});

Route::group('/user', function(){
    Route::get('/', 'UserController:index');
    Route::get('/create', 'UserController:create');
    Route::put('/favorite', 'UserController:favorite');
    Route::post('/', 'UserController:store');
    Route::get('/:id', 'UserController:show');
    Route::get('/:id/edit', 'UserController:edit');
    Route::put('/:id', 'UserController:update');
    Route::get('/:id/delete', 'UserController:delete');
    Route::delete('/:id', 'UserController:destroy');
});

Route::group('/review', function(){
    Route::post('/', 'ReviewController:store');
});

// Error
App::notFound(function(){
    View::display('404.twig');
});

