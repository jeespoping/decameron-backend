<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

$router->group(['middleware' => 'auth:api'], function () use ($router) {
    
    $router->get('/', function () use ($router) {
        return $router->app->version();
    });

    $router->get('/checktoken', function (Request $request) {
        return response()->json([
            'user' => [
                'email' => Auth::user()->email,
                'name' => Auth::user()->name
            ],
            'res' => true
        ]);
    });

    $router->post('/hotel', 'HotelController@store');
    $router->put('/hotel/{id}', 'HotelController@update');
    $router->delete('/hotel/{id}', 'HotelController@delete');

    $router->post('/habitacion', 'DescriptionController@store');
    $router->delete('/habitacion/{id}', 'DescriptionController@delete');
});

$router->get('/hotel', 'HotelController@index');
$router->get('/hotel/{id}', 'HotelController@show');

$router->get('/hotel/room/{id}', 'HotelController@rooms');

$router->post('/register', 'AuthController@register');
$router->post('/login', 'AuthController@login');