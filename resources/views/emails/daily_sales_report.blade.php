<h2>Daily Sales Report ({{ now()->toDateString() }})</h2>

@foreach($orders as $order)
    <h4>Order #{{ $order->id }}</h4>
    <ul>
        @foreach($order->items as $item)
            <li>
                {{ $item->title }} —
                Qty: {{ $item->quantity }} —
                Price: {{ $item->price }}
            </li>
        @endforeach
    </ul>
@endforeach
