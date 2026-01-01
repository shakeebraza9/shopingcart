<h2>Low Stock Alert</h2>

<p>The following products have low stock (≤5):</p>

<ul>
@foreach($variations as $variation)
    <li>
        Product: {{ $variation->product->title ?? 'N/A' }} <br>
        Variation SKU: {{ $variation->sku ?? 'N/A' }} <br>
        Quantity: {{ $variation->quantity ?? 'N/A' }}
    </li>
@endforeach
</ul>
