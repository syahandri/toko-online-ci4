<?php

namespace App\Controllers;

use App\Models\Carts;
use App\Models\Categories;
use App\Controllers\BaseController;
use App\Models\Address;

class CartController extends BaseController
{
    public function __construct()
    {
        $this->carts = new Carts();
    }
    /**
     * Halaman keranjang
     */
    public function index()
    {
        $categories = new Categories();
        $address = new Address();
        return view('user/keranjang', [
            'title' => 'Keranjang',
            'keyword' => '',
            'categories' => $categories->getCategories(),
            'address' => $address->getAddress(),
            'carts' => $this->carts->getCarts()
        ]);
    }

    /**
     * Tambah produk ke keranjang
     */
    public function addCart()
    {
        $request = [
            'product_id' => $this->request->getVar('id'),
            'quantity' => $this->request->getVar('qty'),
            'size' => $this->request->getVar('size'),
            'color' => $this->request->getVar('color'),
        ];

        try {
            return json_encode($this->carts->addCart($request));
        } catch (\Throwable $th) {
            return json_encode(false);
        }
    }

    /**
     * Hapus produk dari keranjang
     */
    public function deleteItem()
    {
        $request = [
            'cart_id' => $this->request->getVar('cart_id'),
            'product_id' => $this->request->getVar('product_id'),
            'size' => $this->request->getVar('size'),
            'color' => $this->request->getVar('color'),
        ];

        try {
            return json_encode($this->carts->deleteItem($request));
        } catch (\Throwable $th) {
            return json_encode(false);
        }
    }

    /**
     * Hitung jumlah produk di keranjang user
     */
    public function countCart()
    {
        return json_encode($this->carts->countCart());
    }

    /**
     * ambil ongkir
     * API raja ongkir
     */
    public function getOngkir()
    {
        $origin = 41;
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/cost",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 60,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => "origin=" . $origin . "&destination=" . $this->request->getVar('destination') . "&weight=" . $this->request->getVar('weight') . "&courier=" . $this->request->getVar('courier') . "",
            CURLOPT_HTTPHEADER => array(
                "content-type: application/x-www-form-urlencoded",
                "key: 69334668430f3432cc8c8ab8f0c0bd48"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            return $err;
        } else {
            return $response;
        }
    }
}
