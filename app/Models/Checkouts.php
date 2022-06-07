<?php

namespace App\Models;

use CodeIgniter\Model;
use App\Models\Products;
use CodeIgniter\I18n\Time;
use Myth\Auth\Models\UserModel;

class Checkouts extends Model
{
   protected $table = 'checkouts';
   protected $allowedFields = ['invoice', 'user_id', 'courier', 'shipping_type', 'cost', 'estimate_date', 'total', 'status', 'resi_number', 'jalan', 'kecamatan', 'kabupaten', 'provinsi', 'kode_pos'];
   protected $useTimestamps = true;

   /**
    * Tambah produk ke checkout
    */
   public function checkout($product_id, $quantity, $data)
   {
      $products = new Products();
      $carts = new Carts();
      $invoice = strtoupper(random_string('alnum', 5)) . str_replace([" ", "-", ":"], "", Time::now()) . user_id();
      $idCart = $carts->select('id')->where('user_id', user_id())->first();

      // Cek stok produk yang dipilih
      $stock = $products->select('stock')->whereIn('id', $product_id)->findAll();
      foreach ($stock as $i => $value) {
         if ($value['stock'] < $quantity[$i] && $value['stock'] > 0) {
            return (['status' => false, 'id' => $product_id[$i], 'stock' => $value['stock'], 'error' => 'Stok tidak cukup!']);
         }

         if ($value['stock'] == 0) {
            return (['status' => false, 'id' => $product_id[$i], 'stock' => $value['stock'], 'error' => 'Stok sudah habis!']);
         }
      }

      // Simpan ke table checkouts
      $checkout = [
         'invoice'       => $invoice,
         'user_id'       => user_id(),
         'courier'       => $data['courier'],
         'shipping_type' => $data['shipping_type'],
         'estimate_date' => $data['estimate_date'],
         'cost'          => $data['cost'],
         'total'         => $data['total'],
         'jalan'         => $data['jalan'],
         'kecamatan'     => $data['kecamatan'],
         'kabupaten'     => $data['kabupaten'],
         'provinsi'      => $data['provinsi'],
         'kode_pos'      => $data['kode_pos']
      ];
      $this->save($checkout);

      // Simpan produk checkout
      $id = $this->select('id')->where('invoice', $invoice)->first();
      foreach ($data['product_id'] as $i => $product_id) {
         $productCheckout = [
            'checkout_id'   => $id['id'],
            'product_id'    => $product_id,
            'color'         => $data['color'][$i],
            'size'          => $data['size'][$i],
            'price'         => $data['price'][$i],
            'quantity'      => $data['quantity'][$i],
            'grand_total'   => $data['grand_total'][$i],
            'note'          => $data['note'][$i]
         ];

         $this->db->table('productcheckout')->insert($productCheckout);

         // Tambah jumlah sold di tabel products
         // $sold = $products->select('sold')->where('id', $productCheckout['product_id'])->first();
         // $products->update($productCheckout['product_id'], ['sold' => $sold['sold'] + 1]);

         // Hapus produk dalam keranjang sesuai dengan produk yang dicheckout
         $this->db->table('productcart')->where('cart_id', $idCart)
            ->where('product_id', $productCheckout['product_id'])
            ->where('color', $productCheckout['color'])
            ->where('size', $productCheckout['size'])
            ->delete();
      }

      // Hitung produk dalam tabel product cart, jika < 1 kosongkan tabel keranjang
      $count =  $this->db->table('productcart')->selectCount('cart_id')->where('cart_id', $idCart)->get()->getRow();
      if ($count->cart_id < 1) {
         $carts->delete($idCart);
      }

      // Kirimkan detail checkout dan waktu deadline ke user
      $orderDate = $this->select('created_at')->where('invoice', $invoice)->get()->getRow();
      $deadline = new Time($orderDate->created_at . ('+1 days'), 'Asia/Jakarta', 'id-ID');
      $dataCheckout = $this->select('checkouts.*, productcheckout.product_id as product_id, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, productcheckout.grand_total as grand_total, productcheckout.note as note, products.name as product, users.fullname as fullname')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('users', 'checkouts.user_id = users.id')
         ->where('checkouts.invoice', $invoice)
         ->findAll();
      return [
         'status' => true,
         'data' => $dataCheckout,
         'deadline_date' => Time::parse($deadline, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy'),
         'deadline_time' => $deadline->format('H:i')
      ];
   }

   /**
    * Ambil produk by invoice
    */
   public function getByInvoice($invoice)
   {
      $data = $this->select('checkouts.*, productcheckout.product_id as product_id, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, productcheckout.grand_total as grand_total, productcheckout.note as note, products.name as product')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->where('checkouts.invoice', $invoice)
         ->findAll();
      return $data;
   }

   /**
    * Ambil invoice berdasarkan status pesanan
    */
   public function getByStatus($invoice, $status)
   {
      $data = $this->select('checkouts.*, productcheckout.product_id as product_id, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, productcheckout.grand_total as grand_total, productcheckout.note as note, products.name as product, users.fullname as fullname')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('users', 'checkouts.user_id = users.id')
         ->where('checkouts.status', $status)
         ->where('checkouts.invoice', $invoice)
         ->findAll();
      $orderDate = $this->select('created_at')->where('invoice', $invoice)->where('status', $status)->get()->getRow();
      $deadline = new Time($orderDate->created_at . ('+1 days'), 'Asia/Jakarta', 'id-ID');
      return [
         'data' => $data,
         'deadline_date' => Time::parse($deadline, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy'),
         'deadline_time' => $deadline->format('H:i')
      ];
   }

   /**
    * Batalkan / hapus pesanan
    * jika melewati deadline konfirmasi
    * kirim email notifikasi ke user pesanan dibatalkan
    */
   public function deleteCheckout()
   {

      $checkouts = $this->select('checkouts.*, users.email as user_email')->join('users', 'checkouts.user_id = users.id')->where('checkouts.status', 'Pending')->findAll();

      if ($checkouts) {
         foreach ($checkouts as $checkout) {
            $deadline = new Time($checkout['created_at'] . ('+1 days'));
            if (Time::now() > $deadline) {
               $data = $this->select('checkouts.id, checkouts.invoice, checkouts.user_id, productcheckout.color as color, productcheckout.size as size, productcheckout.quantity as quantity, products.name as product')
                  ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
                  ->join('products', 'productcheckout.product_id = products.id')
                  ->where('checkouts.status', 'Pending')
                  ->where('checkouts.user_id', $checkout['user_id'])
                  ->findAll();

               $email = \Config\Services::email();
               $email->setTo($checkout['user_email']);
               $email->setFrom($email->fromEmail, $email->fromName);
               $email->setSubject('Pesanan Dibatalkan');
               $email->setMessage(view('cancel_message', [
                  'invoice' => $checkout['invoice'],
                  'data' => $data,
                  'alasan' => 'tidak melakukan konfirmasi sampai batas waktu'
               ]));

               if ($email->send()) {
                  foreach ($data as $val) {
                     $dataCancel = [
                        'invoice' => $val['invoice'],
                        'user_id' => $val['user_id'],
                        'product' => $val['product'],
                        'color' => $val['color'],
                        'size' => $val['size'],
                        'quantity' => $val['quantity'],
                        'status' => 'Cancel By System',
                        'created_at' => Time::now(),
                        'updated_at' => Time::now(),
                     ];
                     $this->db->table('cancel_orders')->insert($dataCancel);
                  }

                  $this->where('created_at', $checkout['created_at'])->where('status', 'Pending')->delete();
                  $this->db->table('productcheckout')->where('checkout_id', $checkout['id'])->delete();
               }
            }
         }
      }
      return true;
   }
}
