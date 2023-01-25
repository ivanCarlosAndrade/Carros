<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\usuarioController;
use App\Http\Controllers\carroController;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/index',[carroController::class, 'index']);
Route::post ('/resgistar',[carroController::class, 'store']);
Route::get('/update',[carroController::class, 'update']);
Route::post ('/delete',[carroController::class, 'delete']);
Route::post('/inserir',[usuarioController::class, 'inserir_usuario']);
Route::post('/login',[usuarioController::class, 'login']);
Route::post('/logout',[usuarioController::class, 'logout']);