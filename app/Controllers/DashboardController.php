<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Categories;
use App\Models\Checkouts;
use App\Models\Events;
use App\Models\Products;

class DashboardController extends BaseController
{
    public function index()
    {
        $events = new Events();
        $products = new Products();
        $categories = new Categories();
        $checkouts = new Checkouts();
        return view('admin/dashboard', [
            'title' => 'Dashboard',
            'events' => $events->limit(10)->find(),
            'countProduct' => $products->selectCount('id')->get()->getRow(),
            'countCategory' => $categories->selectCount('id')->get()->getRow(),
            'countVerify' => $checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('status', 'Verifying')->get()->getRow(),
            'countProccess' => $checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('status', 'Proccessing')->get()->getRow(),
            'countSent' => $checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('status', 'Sending')->get()->getRow(),
        ]);
    }
}
