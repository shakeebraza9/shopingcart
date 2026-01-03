<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Attribute;
use App\Models\Collection;
use App\Models\ProductCollection;
use App\Models\Variation;
use App\Models\VariationAttribute;
use App\Models\Role;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Carbon\Carbon;
use Auth;
use Collator;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\URL;
use Illuminate\Validation\Rule;;
use App\Models\Filemanager;
use App\Models\OrderStatus;
use App\Models\Order;
use App\Models\OrderItem;
class ProductController extends Controller
{


    public function index(Request $request)
    {
        $query = Product::query();

        // 🔹 Parse parameters
        $page   = $request->input('params.page', 1);
        $length = $request->input('params.length', 10);
        $search = $request->input('params.search', '');

        // 🔹 Search filter
        if(!empty($search)){
            $query->where(function($q) use ($search) {
                $q->where('title', 'like', '%'.$search.'%')
                ->orWhere('slug', 'like', '%'.$search.'%')
                ->orWhere('description', 'like', '%'.$search.'%');
            });
        }

        // 🔹 Optional filters
        if($request->filled('params.category_id')){
            $query->where('category_id', $request->input('params.category_id'));
        }
        if($request->filled('params.is_enable')){
            $query->where('is_enable', $request->input('params.is_enable'));
        }
        if($request->filled('params.is_featured')){
            $query->where('is_featured', $request->input('params.is_featured'));
        }

        $totalRecords = $query->count();

        // 🔹 Pagination
        $products = $query->skip(($page - 1) * $length)
                        ->take($length)
                        ->orderBy('id', 'desc')
                        ->get();

        // 🔹 Format data for API
        $data = $products->map(function($product){
            return [
                'id'          => $product->id,
                'encrypted_id'=> Crypt::encryptString($product->id),
                'title'       => $product->title,
                'slug'        => $product->slug,
                'price'       => $product->price,
                'category'    => $product->get_category()?->title ?? '-',
                'is_enable'   => (bool) $product->is_enable,
                'is_featured' => (bool) $product->is_featured,
                'image'       => $product->image ? asset($product->image) : null,
            ];
        });

        return response()->json([
            'status' => true,
            'message' => 'Products fetched successfully',
            'current_page' => $page,
            'per_page' => $length,
            'total' => $totalRecords,
            'data' => $data
        ]);
    }

    public function show($id)
    {
        try {
    
            $productId =  $id ;

    
            $product = Product::findOrFail($productId);


            $data = [
                'id'          => $product->id,
                'title'       => $product->title,
                'slug'        => $product->slug,
                'price'       => $product->price,
                'selling_price' => $product->selling_price,
                'category'    => $product->get_category()?->title ?? '-',
                'is_enable'   => (bool) $product->is_enable,
                'is_featured' => (bool) $product->is_featured,
                'description' => $product->description,
                'image'       => $product->image ? asset($product->image) : null,
                'hover_image' => $product->hover_image ? asset($product->hover_image) : null,
            ];

            return response()->json([
                'status' => true,
                'message' => 'Product fetched successfully',
                'data' => $data
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found',
                'error' => $e->getMessage()
            ], 404);
        }
    }


    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:255',
            'slug'  => [
                'required',
                'max:255',
                Rule::unique('products', 'slug')
            ],
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Validation errors',
                'errors'  => $validator->errors()
            ], 422);
        }
        $product = Product::create([
            'title'     => $request->title,
            'slug'      => $request->slug,
            'is_enable' => 0,
        ]);
        return response()->json([
            'status'  => true,
            'message' => 'Product created successfully',
            'data'    => [
                'id'        => $product->id,
                'title'     => $product->title,
                'slug'      => $product->slug,
                'is_enable' => $product->is_enable,
            ]
        ], 201);
    }

    public function update(Request $request, $id)
    {



        $product = Product::find($id);
        if (!$product) {
            return response()->json(['error' => 'Record not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'required|max:255',
            'slug' => [
                'required',
                'max:255',
                Rule::unique('products')->ignore($id),
            ],
            
            'description' => 'max:9000',
            'category_id' => 'integer|nullable',
            'price' => 'numeric|nullable',
            'selling_price' => 'numeric|nullable',
            'hover_image' => 'string|nullable',
            
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $fields = [
            'title', 'slug', 'details', 'description', 'category_id',
            'selling_price', 'image', 'hover_image'
        ];

        foreach ($fields as $field) {
            if ($request->has($field)) {
                $product->$field = $request->$field;
            }
        }

        ProductCollection::where('product_id', $product->id)->delete();
        if ($request->has('collections') && is_array($request->collections)) {
            foreach ($request->collections as $collectId) {
                ProductCollection::create([
                    'product_id' => $product->id,
                    'collection_id' => $collectId
                ]);
            }
        }


        if ($request->has('gallery') && is_array($request->gallery)) {
            $product->images = implode(',', $request->gallery);
        }

        $product->save();

        return response()->json([
            'status' => true,
            'message' => 'Product updated successfully',
            'data' => $product
        ]);
    }


    public function getCategories(Request $request)
    {
    
        $categories = Category::where('is_enable', 1)
            ->select('id', 'title')
            ->orderBy('title', 'asc')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $categories
        ], 200);
    }

    public function Getfiles(Request $request)
    {
        $query = Filemanager::where('is_enable', 1);


        if ($request->filled('q')) {
            $q = $request->q;
            $query->where(function($qbuilder) use ($q) {
                $qbuilder->where('title', 'like', '%'.$q.'%')
                        ->orWhere('filename', 'like', '%'.$q.'%')
                        ->orWhere('path', 'like', '%'.$q.'%');
            });
        }


        $files = $query->limit(10)->get();

        $results = $files->map(function($file){
            return [
                'savepath'   => $file->path,       
                'text' => $file->title,        
                'img'  => $file->path ? asset($file->path) : null,
            ];
        });

        return response()->json([
            'success' => true,
            'results' => $results
        ], 200);
    }

    public function destroy($id)
    {
       
        $product = Product::find($id);
        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }
        $product->delete();

        return response()->json([
            'success' => true,
            'message' => 'Product deleted successfully'
        ], 200);
    }


    public function getOrders(Request $request)
{
    $query = Order::leftJoin('payment_methods','payment_methods.id','=','orders.payment_method')
                  ->leftJoin('order_status', 'order_status.id', '=', 'orders.order_status')
                  ->select('orders.*', 'payment_methods.title as payment_method_title');

    if ($request->filled('id')) {
        $query->where('orders.id', $request->id);
    }
    if ($request->filled('order_status')) {
        $query->where('orders.order_status', $request->order_status);
    }
    if ($request->filled('payment_status')) {
        $query->where('orders.payment_status', $request->payment_status);
    }
    if ($request->filled('tracking_id')) {
        $query->where('orders.tracking_id', $request->tracking_id);
    }
    if ($request->filled('fullname')) {
        $query->where('orders.customer_name', 'like', '%'.$request->fullname.'%');
    }
    if ($request->filled('phone')) {
        $query->where('orders.customer_phone', 'like', '%'.$request->phone.'%');
    }
    if ($request->filled('grand_total')) {
        $query->where('orders.grand_total', $request->grand_total);
    }

    $page   = $request->input('page', 1);
    $length = $request->input('length', 10);
    $total  = $query->count();

    $orders = $query->skip(($page - 1) * $length)
                    ->take($length)
                    ->orderBy('orders.id','desc')
                    ->get();


    $data = $orders->map(function($order){
        $status = OrderStatus::find($order->order_status);

        return [
            'id' => $order->id,
            'tracking_id' => $order->tracking_id,
            'customer_name' => $order->customer_name,
            'customer_phone' => $order->customer_phone,
            'order_status' => $status ? $status->title : null,
            'payment_status' => $order->payment_status,
            'payment_method' => $order->payment_method_title,
            'grand_total' => $order->grand_total,
        ];
    });

    return response()->json([
        'success' => true,
        'message' => 'Orders fetched successfully',
        'current_page' => $page,
        'per_page' => $length,
        'total' => $total,
        'data' => $data
    ]);
}
}