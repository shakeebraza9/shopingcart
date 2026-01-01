<?php

namespace App\Jobs;

use App\Models\Order;
use App\Mail\DailySalesReportMail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class DailySalesReportJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    public function handle()
    {
        $orders = Order::all()
            ->with('items')
            ->get();

        if ($orders->isEmpty()) {
            return;
        }

        Mail::to('man411210@gmail.com')
            ->send(new DailySalesReportMail($orders));
    }
}
