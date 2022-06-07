<?php

namespace App\Controllers;

use Dompdf\Dompdf;
use App\Models\Checkouts;
use CodeIgniter\I18n\Time;
use App\Controllers\BaseController;
use Myth\Auth\Models\UserModel;

class CheckoutController extends BaseController
{
   public function __construct()
   {
      $this->checkouts = new Checkouts();
   }

   /**
    * Checkout
    */
   public function checkout()
   {
      $data = [
         'product_id' => $this->request->getVar('product_id'),
         'size' => $this->request->getVar('size'),
         'color' => $this->request->getVar('color'),
         'price' => $this->request->getVar('price'),
         'quantity' => $this->request->getVar('quantity'),
         'note' => $this->request->getVar('note'),
         'courier' => $this->request->getVar('courier'),
         'shipping_type' => $this->request->getVar('shipping_type'),
         'cost' => $this->request->getVar('ongkir'),
         'estimate_date' => $this->request->getVar('etd'),
         'grand_total' => $this->request->getVar('grand_total'),
         'total' => $this->request->getVar('total'),
         'jalan' => $this->request->getVar('jalan'),
         'kecamatan' => $this->request->getVar('kecamatan'),
         'kabupaten' => $this->request->getVar('kabupaten'),
         'provinsi' => $this->request->getVar('provinsi'),
         'kode_pos' => $this->request->getVar('kode_pos'),
      ];

      return json_encode($this->checkouts->checkout($this->request->getVar('product_id'), $this->request->getVar('quantity'), $data));
   }

   /**
    * Ambil produk by invoice
    */
   public function getByInvoice($invoice)
   {
      return json_encode($this->checkouts->getByInvoice($invoice));
   }

   /**
    * Ambil invoice berdasarkan status pesanan
    */
   public function getByStatus($invoice, $status)
   {
      return json_encode($this->checkouts->getByStatus($invoice, $status));
   }

   /**
    * Batalkan / hapus pesanan
    * jika melewati deadline konfirmasi
    */
   public function deleteCheckout()
   {
      return json_encode($this->checkouts->deleteCheckout());
   }

   /**
    * Cetak invoice PDF
    */
   public function printInvoice($invoice)
   {

      $orderDate = $this->checkouts->select('created_at')->where('invoice', $invoice)->get()->getRow();
      $deadline = new Time($orderDate->created_at . ('+1 days'), 'Asia/Jakarta', 'id-ID');
      $dataCheckout = $this->checkouts->select('checkouts.*, productcheckout.product_id as product_id, productcheckout.color as color, productcheckout.size as size, productcheckout.price as price, productcheckout.quantity as quantity, productcheckout.grand_total as grand_total, productcheckout.note as note, products.name as product, users.fullname as fullname')
         ->join('productcheckout', 'checkouts.id = productcheckout.checkout_id')
         ->join('products', 'productcheckout.product_id = products.id')
         ->join('users', 'checkouts.user_id = users.id')
         ->where('checkouts.invoice', $invoice)
         ->findAll();
      $dompdf = new \Dompdf\Dompdf(['isRemoteEnabled' => true]);
      $dompdf->loadHtml(view('invoice', [
         'data' => $dataCheckout,
         'deadline_date' => Time::parse($deadline, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy'),
         'deadline_time' => $deadline->format('H:i')
      ]));
      $dompdf->setPaper('A3', 'landscape');
      $dompdf->render();
      $dompdf->stream();
   }
}
