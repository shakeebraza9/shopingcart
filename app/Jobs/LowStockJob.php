<?php

namespace App\Jobs;

use App\Models\Product;
use App\Models\Variation;
use App\Mail\LowStockMail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class LowStockJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function handle()
    {

        $lowStockVariations = Variation::with('product')
            ->where('quantity', '<=', 5)
            ->get();

        if ($lowStockVariations->isEmpty()) {
            return;
        }


        Mail::to('man411210@gmail.com')
            ->send(new LowStockMail($lowStockVariations));
    }
}
