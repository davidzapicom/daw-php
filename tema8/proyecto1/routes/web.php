<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
   // return view('welcome');
   return '¡Hola Mundo!';
});

Route::get('a', function () {
    return '¡Hola Mundo! A';
});

Route::get('b', function () {
   return '¡Hola Mundo! B';
});