<?php

namespace App\Models;

use CodeIgniter\Model;

class Carts extends Model
{
    protected $table = 'carts';
    protected $allowedFields = ['user_id'];
    protected $useTimestamps = true;

    /**
     * Ambil data keranjang user
     */
    public function getCarts()
    {
        $cart = $this->select('id')->where('user_id', user_id())->first();
        return $this->db->table('productcart')->join('products', 'productcart.product_id = products.id')
            ->where('productcart.cart_id', $cart)
            ->orderBy('product_id', 'ASC')
            ->get()->getResultArray();
    }

    /**
     * Tambah produk ke keranjang
     */
    public function addCart($product)
    {
        // Simpan ke tabel carts
        $productCart = $this->db->table('productcart');
        $cart = $this->select('id')->where('user_id', user_id())->first();
        $data = [
            'id' => $cart ? $cart : '',
            'user_id' => user_id(),
        ];
        $this->save($data);

        $cart = $this->select('id')->where('user_id', user_id())->first();
        $productcart = [
            'cart_id' => $cart,
            'product_id' => $product['product_id'],
            'size' => $product['size'],
            'color' => $product['color']
        ];

        // Update quantity jika produk yang sesuai sudah ada
        $checkProduct = $productCart->where($productcart)->get()->getResultArray();
        if ($checkProduct) {
            $quantity = $product['quantity'] + $checkProduct[0]['quantity'];
            return $productCart->where($productcart)->update(['quantity' => $quantity]);
        }

        // Simpan ke tabel productcart / detail keranjang
        $productcart['quantity'] = $product['quantity'];
        return $productCart->insert($productcart);
    }

    /**
     * Hapus produk dari keranjang
     */
    public function deleteItem($product)
    {
        $productCart = $this->db->table('productcart');
        $cart = $this->select('id')->where('user_id', user_id())->first();

        $productCart->where('cart_id', $cart)
            ->where('product_id', $product['product_id'])
            ->where('color', $product['color'])
            ->where('size', $product['size'])
            ->delete();

        $count =  $productCart->selectCount('cart_id')->where('cart_id', $cart)->get()->getRow();
        if ($count->cart_id < 1) {
            return $this->delete($cart);
        }

        return true;
    }

    /**
     * Hitung jumlah produk di keranjang user
     */
    public function countCart()
    {
        $productCart = $this->db->table('productcart');
        $cart = $this->select('id')->where('user_id', user_id())->first();
        if (!$cart) {
            return ['cart_id' => 0];
        }
        return $productCart->selectCount('cart_id')->where('cart_id', $cart)->get()->getRow();
    }
}
