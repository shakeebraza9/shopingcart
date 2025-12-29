<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductController;

// Route::get('/user', function (Request $request) {
    //     return $request->user();
    // })->middleware('auth:sanctum');
    


// Route::prefix('auth')->group(function () {

//     Route::get('/profile', [AuthController::class, 'profile'])->middleware(['auth:sanctum']);
//     // Route::post('/profile',[AuthController::class,'profileUpdate'])->middleware(['auth:sanctum']);

//     Route::post('/login', [AuthController::class, 'login']);
//     // Route::post('/register',[AuthController::class,'register']);

//     Route::post('/changePassword', [AuthController::class, 'changePassword'])->middleware(['auth:sanctum']);
// });

Route::get('shop', [ProductController::class, 'shop']);
Route::get('/shop/{slug}', [ProductController::class, 'singleProduct']);
Route::post('/checkout', [ProductController::class, 'checkoutSubmitApi']);


// Route::apiResource('users', UserController::class);

