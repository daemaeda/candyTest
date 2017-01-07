<?php

Route::get('/login', 'AuthController:login')->name('login');
Route::get('/logout', 'AuthController:logout')->name('logout');
Route::post('/login', 'AuthController:doLogin');

Route::get('/', 'RecipeController:index');
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

// Error
App::notFound(function(){
    View::display('404.twig');
});

