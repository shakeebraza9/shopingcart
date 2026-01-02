<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Collection;
use App\Models\Cart;
use App\Models\OrderStatus;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\ProductCollection;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\NotifyEmail;
use App\Http\Utilities\EmailUtility;
use Mpdf\Mpdf;

class ProductController extends Controller
{







   public function shop(Request $request)
    {
        $data = Product::query();


        if ($request->has('search') && $request->search != '') {
            $searchTerm = $request->search;
            $data->where(function ($query) use ($searchTerm) {
                $query->where('title', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('slug', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('sku', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('details', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('description', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('meta_title', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('meta_description', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('meta_keywords', 'LIKE', "%{$searchTerm}%");
            });
        }

        // 2️⃣ Sorting
        if ($request->has('sort') && $request->sort != '') {
            switch ($request->sort) {
                case 'newest':
                    $data->orderBy('id', 'desc');
                    break;
                case 'ascending':
                    $data->orderBy('title', 'asc');
                    break;
                case 'descending':
                    $data->orderBy('title', 'desc');
                    break;
                case 'price-low':
                    $data->orderBy('price', 'asc');
                    break;
                case 'price-high':
                    $data->orderBy('price', 'desc');
                    break;
                default:
                    $data->orderBy('id', 'desc');
                    break;
            }
        } else {
            $data->orderBy('id', 'desc');
        }

        // 3️⃣ Category filter
        if ($request->has('category') && $request->category != '') {
            $category = Category::where('slug', $request->category)->first();
            if ($category) {
                $data->where('category_id', $category->id);
            }
        }

        // 4️⃣ Collection filter
        if ($request->has('collection') && $request->collection != '') {
            $collection = Collection::where('slug', $request->collection)->first();
            if ($collection) {
                $productCollectionIds = ProductCollection::where('collection_id', $collection->id)
                    ->pluck('product_id')
                    ->toArray();
                $data->whereIn('id', $productCollectionIds);
            }
        }

        // 5️⃣ Pagination
        $perPage = $request->has('per_page') ? intval($request->per_page) : 10;
        $products = $data->paginate($perPage);

        // 6️⃣ Discount
        $discountSetting = DB::table('settings')->where('field', 'discount_percent')->first();
        $discountPercent = $discountSetting ? floatval($discountSetting->value) : 0;

        $products->getCollection()->transform(function ($product) use ($discountPercent) {
            $discountAmount = ($product->price * $discountPercent) / 100;
            $product->price = round($product->price - $discountAmount, 2);
            return $product;
        });

        // 7️⃣ JSON Response
        return response()->json([
            'status' => true,
            'data' => $products
        ]);
    }
    public function singleProduct($slug)
    {
        $product = Product::where('slug', $slug)->first();

        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found'
            ], 404);
        }

        // Discount
        $discountSetting = DB::table('settings')
            ->where('field', 'discount_percent')
            ->first();

        $discountPercent = $discountSetting ? floatval($discountSetting->value) : 0;

        $discountAmount = ($product->price * $discountPercent) / 100;
        $product->price = round($product->price - $discountAmount, 2);

        // Calculate total stock quantity from variations
        $stockQuantity = DB::table('variations')
            ->where('product_id', $product->id)
            ->sum('quantity');
        $product->stock_quantity = (int) $stockQuantity;

        return response()->json([
            'status' => true,
            'data' => $product
        ]);
    }




public function checkStockInAva($productId, Request $request)
    {

        $variationId = $request->variation_id;
        $requestedQty = (int) $request->quantity;

        if (!$variationId || !$requestedQty) {
            return response()->json([
                'status' => false,
                'message' => 'variation_id and quantity required'
            ], 400);
        }


        $variation = DB::table('variations')
            ->where('id', $variationId)
            ->where('product_id', $productId)
            ->first();

        if (!$variation) {
            return response()->json([
                'status' => false,
                'message' => 'Variation not found for this product'
            ], 404);
        }

        $totalStock = $variation->quantity ?? 0;

       // step 2 already sold quantity(only from completed orders)
        $soldQty = DB::table('order_items')
            ->join('orders', 'orders.id', '=', 'order_items.order_id')
            ->where('order_items.variation_id', $variationId)
            ->where('orders.order_status', 'completed') // ya tumhari order_status ka condition
            ->sum('order_items.quantity');

        $availableStock = $totalStock - $soldQty;

        //step 3 check if requested quantity is less than or equal to available stock
        if ($requestedQty <= $availableStock) {
            return response()->json([
                'status' => true,
                'message' => 'Stock available',
                'available_stock' => $availableStock
            ]);
        }

        return response()->json([
            'status' => false,
            'message' => 'Not enough stock',
            'available_stock' => $availableStock
        ]);
    }

    public function checkStock(Request $request)
{
    $request->validate([
        'variation_id' => 'required|integer',
    ]);

    $variationId = $request->variation_id;

    // 1️⃣ Variation quantity
    $variation = DB::table('variations')->where('id', $variationId)->first();
    if (!$variation) {
        return response()->json([
            'status'  => false,
            'message' => 'Variation not found',
        ], 404);
    }

    $variationQty = (int) $variation->quantity;

    // 2️⃣ Already sold from order_items
    $soldQty = DB::table('order_items')
        ->where('variation_id', $variationId)
        ->sum('quantity');

    $soldQty = (int) $soldQty;

    // 3️⃣ Calculate available stock
    $availableStock = max($variationQty - $soldQty, 0);

    // 4️⃣ Return result (only stock)
    return response()->json([
        'status'          => $availableStock > 0,
        'available_stock' => $availableStock,
    ]);
}
public function storenotify(Request $request)
    {
        $request->validate([
            'product_id'   => 'required|integer',
            'variation_id' => 'nullable|integer',
            'email'        => 'required|email',
        ]);

        $notify = NotifyEmail::create([
            'product_id'   => $request->product_id,
            'variation_id' => $request->variation_id,
            'email'        => $request->email,
        ]);

        return response()->json([
            'status'  => true,
            'message' => 'Email notification request saved successfully',
            'data'    => $notify
        ]);
    }



public function checkoutSubmitApi(Request $request)
{

    $validator = Validator::make($request->all(), [
        "name" => "required|max:255",
        "phone" => "required|max:255",
        "email" => "required|email",
        "country" => "required|max:255",
        "city" => "required|max:255",
        "address" => "required|max:255",
        "order_notes" => "nullable|max:500",
        "cart_items" => "required|array|min:1",
        "cart_items.*.variation_id" => "required|integer",
        "cart_items.*.title" => "required|string",
        "cart_items.*.sku" => "required|string",
        "cart_items.*.price" => "required|numeric",
        "cart_items.*.quantity" => "required|integer",
        "cart_items.*.total" => "required|numeric",
    ]);

    if ($validator->fails()) {
        return response()->json([
            "status" => false,
            "errors" => $validator->errors()
        ], 422);
    }

   
    $subtotal = collect($request->cart_items)->sum('total');
    $delivery_charges = 100; 
    $grand_total = $subtotal + $delivery_charges;

    DB::beginTransaction();

    try {

        $status = OrderStatus::where('id', 1)->first();

        $tracking_id = "ORD-" . uniqid();


        $order = Order::create([
            "customer_name" => $request->name,
            "customer_email" => $request->email,
            "customer_phone" => $request->phone,
            "country" => $request->country,
            "city" => $request->city,
            "address" => $request->address,
            "customer_notes" => $request->order_notes,
            "payment_method" => 1, 
            "payment_status" => "unpaid",
            "tracking_id" => $tracking_id,
            "order_status" => $status->id,
            "subtotal" => $subtotal,
            "delivery_charges" => $delivery_charges,
            "grandtotal" => $grand_total,
            "is_enable" => 1,
        ]);

        // 5️⃣ Order Items
        foreach ($request->cart_items as $item) {
            OrderItem::create([
                "order_id" => $order->id,
                "variation_id" => $item['variation_id'],
                "title" => $item['title'],
                "sku" => $item['sku'],
                "attr" => json_encode($item['attributes'] ?? []),
                "image_id" => $item['image'] ?? null,
                "quantity" => $item['quantity'],
                "price" => $item['price'],
                "total" => $item['total'],
            ]);
        }


        // EmailUtility::send_customer_email($order->id);

        DB::commit();


        return response()->json([
            "status" => true,
            "message" => "Order placed successfully",
            "data" => [
                "order_id" => $order->id,
                "tracking_id" => $tracking_id,
                "grand_total" => $grand_total,
                "payment_method" => "Cash on Delivery"
            ]
        ], 200);

    } catch (\Exception $e) {
        DB::rollBack();

        return response()->json([
            "status" => false,
            "message" => "Checkout failed",
            "error" => $e->getMessage()
        ], 500);
    }
}




}
