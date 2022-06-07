<?php

namespace App\Controllers;

use App\Models\Products;
use App\Models\Categories;
use App\Controllers\BaseController;
use App\Models\Events;

class HomeController extends BaseController
{
    /**
     * Halaman beranda
     * Menampilkan event
     * Menampilkan produk terbaru, terlaris, dan termurah
     */
    public function index()
    {
        $products = new Products();
        $categories = new Categories();
        $events = new Events();
        return view('pages/beranda', [
            'title' => 'Beranda',
            'keyword' => '',
            'categories' => $categories->getCategories(),
            'newest' => $products->newProducts(),
            'bestselling' => $products->bestSellerProducts(),
            'cheapest' => $products->cheapProducts(),
            'events' => $events->where('published', 1)->orderBy('start_date', 'DESC')->findAll()
        ]);
    }
}
