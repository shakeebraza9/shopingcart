<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class LowStockMail extends Mailable
{
    use Queueable, SerializesModels;

    public $variations;

    public function __construct($variations)
    {
        $this->variations = $variations;
    }

    public function build()
    {
        return $this->subject('Low Stock Alert')
                    ->view('emails.low_stock');
    }
}
