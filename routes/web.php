<?php



$router->group(['middleware' => 'auth'], function () use ($router) {
    
    $router->get('/', function () use ($router) {
        return $router->app->version();
    });

});

$router->post('/register', 'AuthController@register');
$router->post('/login', 'AuthController@login');