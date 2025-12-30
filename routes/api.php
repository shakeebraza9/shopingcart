<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProductController as ApiProductController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Api\UserController;

Route::get('/admin', function (Request $request) {
        return $request->user();
    })->middleware('auth:sanctum');
    


Route::prefix('auth')->group(function () {

    Route::post('/login', [AuthController::class, 'login']);
});

Route::get('shop', [ApiProductController::class, 'shop']);
Route::get('/shop/{slug}', [ApiProductController::class, 'singleProduct']);
Route::post('/checkout', [ApiProductController::class, 'checkoutSubmitApi']);

Route::apiResource('/products', AdminProductController::class);
// Route::get('product/{id}', [AdminProductController::class, 'show']);
Route::get('/categories', [AdminProductController::class, 'getCategories']); 
Route::get('/getfiles', [AdminProductController::class, 'Getfiles']); 


