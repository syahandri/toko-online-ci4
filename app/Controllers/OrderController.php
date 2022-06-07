<?php

namespace App\Controllers;

use App\Models\Orders;
use App\Models\Checkouts;
use CodeIgniter\I18n\Time;
use App\Controllers\BaseController;
use App\Models\Products;

class OrderController extends BaseController
{
   public function __construct()
   {
      $this->orders = new Orders();
      $this->checkouts = new Checkouts();
   }

   /**
    * Halaman pesanan menunggu verifikasi
    */
   public function verify()
   {
      return view('admin/orders-verify', [
         'title' => 'Menunggu Verifikasi'
      ]);
   }

   /**
    * Halaman pesanan diproses
    */
   public function proccess()
   {
      return view('admin/orders-proccess', [
         'title' => 'Pesanan Diproses'
      ]);
   }

   /**
    * Halaman pesanan dikirim
    */
   public function sent()
   {
      return view('admin/orders-sent', [
         'title' => 'Pesanan Dikirim'
      ]);
   }

   /**
    * Halaman riwayat pesanan
    */
   public function history()
   {
      return view('admin/orders-history', [
         'title' => 'Riwayat Pesanan'
      ]);
   }

   /**
    * Ambil data pesanan yang menunggu verifikasi untuk data table
    */
   public function listOrdersVerify()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->orders->listOrdersVerify($search, $order, $length, $start, $draw));
   }

   /**
    * Ambil data pesanan yang diproses untuk data table
    */
   public function listOrdersProccess()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->orders->listOrdersProccess($search, $order, $length, $start, $draw));
   }

   /**
    * Ambil data pesanan yang dikirim untuk data table
    */
   public function listOrdersSent()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->orders->listOrdersSending($search, $order, $length, $start, $draw));
   }

   /**
    * Ambil data riwayat pesanan untuk data table
    */
   public function listHistoryOrders()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->orders->listHistoryOrders($search, $order, $length, $start, $draw));
   }

   /**
    * Ambil pesanan menunggu verifikasi by invoice
    */
   public function findVerify($invoice)
   {
      return json_encode($this->checkouts->select('checkouts.invoice, checkouts.total, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, confirms.created_at as confirm_date, confirms.image_transfer as image, products.name as product')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('confirms', 'checkouts.invoice = confirms.invoice')
         ->where('checkouts.invoice', $invoice)
         ->findAll());
   }

   /**
    * Ambil pesanan dikirim by invoice
    */
   public function findProccess($invoice)
   {
      return json_encode($this->checkouts->select('checkouts.*, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, productcheckout.grand_total as grand_total, productcheckout.note as note, products.name as product, users.fullname as fullname')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('users', 'checkouts.user_id = users.id')
         ->where('checkouts.invoice', $invoice)
         ->findAll());
   }

   /**
    * Ambil pesanan dikirim by invoice
    */
   public function findSent($invoice)
   {
      return json_encode($this->checkouts->select('checkouts.*, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, productcheckout.grand_total as grand_total, productcheckout.note as note, products.name as product, users.fullname as fullname')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('users', 'checkouts.user_id = users.id')
         ->where('checkouts.invoice', $invoice)
         ->findAll());
   }

   /**
    * Konfirmasi pesanan => pesanan akan diproses
    */
   public function confirm($invoice)
   {
      return json_encode($this->checkouts->set('status', 'Proccessing')->where('invoice', $invoice)->update());
   }

   /**
    * Tolak konfirmasi pesanan => pesanan akan dibatalkan
    */
   public function cancel($invoice)
   {
      $email = \Config\Services::email();
      $db = \Config\Database::connect();

      $data = $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.user_id, productcheckout.color as color, productcheckout.size as size, productcheckout.quantity as quantity, products.name as product, users.email as user_email')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('users', 'checkouts.user_id = users.id')
         ->where('checkouts.status', 'Verifying')
         ->where('checkouts.invoice', $invoice)
         ->findAll();

      /**
       * Simpanan pesanan Verify ke tabel cancel_orders
       * hapus pesanan verify dari tabel checkout
       */

      $dataCancel = [];
      if ($data) {
         foreach ($data as $order) {
            $dataCancel[] = [
               'invoice' => $order['invoice'],
               'user_id' => $order['user_id'],
               'product' => $order['product'],
               'color' => $order['color'],
               'size' => $order['size'],
               'quantity' => $order['quantity'],
               'status' => 'Cancel By Admin',
               'flags' => 0,
               'created_at' => Time::now(),
               'updated_at' => Time::now(),
            ];
         }

         $email->setTo($data[0]['user_email']);
         $email->setFrom($email->fromEmail, $email->fromName);
         $email->setSubject('Pesanan Dibatalkan');
         $email->setMessage(view('cancel_message', [
            'invoice' => $invoice,
            'data' => $data,
            'alasan' => 'konfirmasi pembayaran ditolak'
         ]));

         if ($email->send()) {
            $db->table('cancel_orders')->insertBatch($dataCancel);
            $this->checkouts->where('status', 'Verifying')->where('invoice', $invoice)->delete();
            $db->table('productcheckout')->where('checkout_id', $order['id'])->delete();
            return json_encode(true);
         } else {
            return json_encode(false);
         }
      }
   }

   public function send()
   {
      $productModel = new Products();
      $db = \Config\Database::connect();
      
      $checkout_id = $this->checkouts->select('id')->where('invoice', $this->request->getVar('invoice'))->first();
      $product_checkout = $db->table('productcheckout')->select('product_id, quantity')->where('checkout_id', $checkout_id['id'])->get()->getResultArray();

      $product_id = [];
      $quantity = [];
      foreach ($product_checkout as $p) {
         $product_id[] = $p['product_id'];
         $quantity[] = $p['quantity'];
      }

      $products = $productModel->select('name, stock')->whereIn('id', $product_id)->find();

      if ($this->checkouts->set(['status' => 'Sending', 'resi_number' => strtoupper($this->request->getVar('resi_number'))])->where('invoice', $this->request->getVar('invoice'))->update()) {
         foreach ($products as $i => $product) {
            $db->table('historysales')->insert([
               'product' => $product['name'],
               'stock' => $product['stock'] + $quantity[$i],
               'sold' => $quantity[$i],
               'tgl_transaksi' => Time::now()
            ]);
         }

         return json_encode(true);
      }
   }
}
