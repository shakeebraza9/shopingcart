<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;

class DailySalesReportMail extends Mailable
{
    public $orders;

    public function __construct($orders)
    {
        $this->orders = $orders;
    }

    public function build()
    {
        return $this->subject('Daily Sales Report')
            ->view('emails.daily_sales_report');
    }
}
