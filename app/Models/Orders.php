<?php

namespace App\Models;

use CodeIgniter\Model;
use CodeIgniter\I18n\Time;

class Orders extends Model
{
   protected $table = 'productcheckout';

   // Variable data table pesanan verifying
   protected $column_order_verify = ['checkouts.id', 'checkouts.invoice', 'user.fullname', 'checkouts.created_at', 'conf.created_at', 'conf.name', 'conf.bank'];
   protected $column_search_verify = ['checkouts.invoice', 'u.fullname', 'checkouts.created_at', 'c.created_at', 'c.name', 'c.bank'];
   protected $order_verify = ['checkouts.created_at' => 'DESC'];

   // Variable data table pesanan proccessing
   protected $column_order_proccess = ['checkouts.id', 'checkouts.invoice', 'user.fullname', 'checkouts.created_at'];
   protected $column_search_proccess = ['checkouts.invoice', 'u.fullname', 'checkouts.created_at'];
   protected $order_proccess = ['checkouts.created_at' => 'DESC'];

   // Variable data table pesanan sending
   protected $column_order_send = ['checkouts.id', 'checkouts.invoice', 'user.fullname', 'checkouts.jalan', 'checkouts.courier', 'checkouts.shipping_type', 'checkouts.estimate_date'];
   protected $column_search_send = ['checkouts.invoice', 'u.fullname', 'checkouts.jalan', 'checkouts.courier', 'checkouts.shipping_type', 'checkouts.estimate_date'];
   protected $order_send = ['checkouts.invoice' => 'DESC'];

   public function __construct()
   {
      parent::__construct();
      $this->checkouts = new Checkouts();
   }

   /**
    * Query untuk ambil data table pesanan verifying
    */
   public function getDataTablesQueryVerify($inputSearch, $inputOrder)
   {
      $i = 0;
      foreach ($this->column_search_verify as $search) {
         if ($inputSearch['value']) {
            if ($i == 0) {
               $this->checkouts->groupStart();
               $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, u.fullname as fullname, c.created_at as confirm_date, c.name as name, c.bank as bank')
                  ->join('confirms c', 'checkouts.invoice = c.invoice')
                  ->join('users u', 'checkouts.user_id = u.id')
                  ->where('checkouts.status', 'Verifying')
                  ->like($search, $inputSearch['value']);
            } else {
               $this->checkouts->orLike($search, $inputSearch['value']);
            }

            if (count($this->column_search_verify) - 1 == $i)
               $this->checkouts->groupEnd();
         }

         $i++;
      }

      if ($inputOrder) {
         $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, user.fullname as fullname, conf.created_at as confirm_date, conf.name as name, conf.bank as bank')
            ->join('confirms conf', 'checkouts.invoice = conf.invoice')
            ->join('users user', 'checkouts.user_id = user.id')
            ->where('checkouts.status', 'Verifying')
            ->orderBy($this->column_order_verify[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order_verify)) {
         $order = $this->order_verify;
         $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, user.fullname as fullname, conf.created_at as confirm_date, conf.name as name, conf.bank as bank')
            ->join('confirms conf', 'checkouts.invoice = conf.invoice')
            ->join('users user', 'checkouts.user_id = user.id')
            ->where('checkouts.status', 'Verifying')
            ->orderBy(key($order), $order[key($order)]);
      }
   }

   /**
    * Ambil data table pesanan verifying
    */
   public function getDataTablesVerify($inputSearch, $inputOrder, $inputLength, $inputStart)
   {
      $this->getDataTablesQueryVerify($inputSearch, $inputOrder);
      if ($inputLength != 1) {
         return $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, users.fullname as fullname, confirms.created_at as confirm_date, confirms.name as name, confirms.bank as bank')
            ->join('users', 'checkouts.user_id = users.id')
            ->join('confirms', 'checkouts.invoice = confirms.invoice')
            ->where('checkouts.status', 'Verifying')
            ->groupBy('checkouts.invoice')
            ->limit($inputLength, $inputStart)->get()->getResult();
      }
   }

   /**
    * Hitung data pesanan verifying terfilter
    */
   public function countFilteredVerify($inputSearch, $inputOrder)
   {
      $this->getDataTablesQueryVerify($inputSearch, $inputOrder);
      return $this->checkouts->where('checkouts.status', 'Verifying')->groupBy('checkouts.invoice')->get()->getNumRows();
   }

   /**
    * Hitung semua data pesanan verifying
    */
   public function countAllVerify()
   {
      return $this->checkouts->where('checkouts.status', 'Verifying')->groupBy('checkouts.invoice')->countAllResults();
   }


   /**
    * Ambil data pesanan verifying untuk data table
    */
   public function listOrdersVerify($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
   {
      $lists = $this->getDataTablesVerify($inputSearch, $inputOrder, $inputLength, $inputStart);
      $data = [];
      $no = $inputStart;

      foreach ($lists as $list) {
         $row = [];
         $row[] = ++$no;
         $row[] = $list->invoice;
         $row[] = $list->fullname;
         $row[] = Time::parse($list->created_at, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy');
         $row[] = Time::parse($list->confirm_date, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy');
         $row[] = $list->name;
         $row[] = $list->bank;

         $row[] = '
            <div class="btn-group" role="group">
                <buton type="button" data-invoice="' . $list->invoice . '" class="btn btn-primary btn-sm btn-detail-verify">Detail</buton>
            </div>
            ';

         $data[] = $row;
      }

      $output = [
         'draw' => $inputDraw,
         'recordsTotal' => $this->countAllVerify(),
         'recordsFiltered' => $this->countFilteredVerify($inputSearch, $inputOrder),
         'data' => $data
      ];

      return $output;
   }

   /**
    * Query untuk ambil data table pesanan proccessing
    */
   public function getDataTablesQueryProccess($inputSearch, $inputOrder)
   {
      $i = 0;
      foreach ($this->column_search_proccess as $search) {
         if ($inputSearch['value']) {
            if ($i == 0) {
               $this->checkouts->groupStart();
               $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, u.fullname as fullname')
                  ->join('users u', 'checkouts.user_id = u.id')
                  ->where('checkouts.status', 'Proccessing')
                  ->like($search, $inputSearch['value']);
            } else {
               $this->checkouts->orLike($search, $inputSearch['value']);
            }

            if (count($this->column_search_proccess) - 1 == $i)
               $this->checkouts->groupEnd();
         }

         $i++;
      }

      if ($inputOrder) {
         $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, user.fullname as fullname')
            ->join('users user', 'checkouts.user_id = user.id')
            ->where('checkouts.status', 'Proccessing')
            ->orderBy($this->column_order_proccess[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order_proccess)) {
         $order = $this->order_proccess;
         $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, user.fullname as fullname')
            ->join('users user', 'checkouts.user_id = user.id')
            ->where('checkouts.status', 'Proccessing')
            ->orderBy(key($order), $order[key($order)]);
      }
   }

   /**
    * Ambil data table pesanan proccessing
    */
   public function getDataTablesProccess($inputSearch, $inputOrder, $inputLength, $inputStart)
   {
      $this->getDataTablesQueryProccess($inputSearch, $inputOrder);
      if ($inputLength != 1) {
         return $this->checkouts->select('checkouts.id, checkouts.invoice, checkouts.created_at, users.fullname as fullname')
            ->join('users', 'checkouts.user_id = users.id')
            ->where('checkouts.status', 'Proccessing')
            ->groupBy('checkouts.invoice')
            ->limit($inputLength, $inputStart)->get()->getResult();
      }
   }

   /**
    * Hitung data pesanan proccessing terfilter
    */
   public function countFilteredProccess($inputSearch, $inputOrder)
   {
      $this->getDataTablesQueryProccess($inputSearch, $inputOrder);
      return $this->checkouts->where('checkouts.status', 'Proccessing')->groupBy('checkouts.invoice')->get()->getNumRows();
   }

   /**
    * Hitung semua data pesanan proccessing
    */
   public function countAllProccess()
   {
      return $this->checkouts->where('checkouts.status', 'Proccessing')->groupBy('checkouts.invoice')->countAllResults();
   }


   /**
    * Ambil data pesanan proccessing untuk data table
    */
   public function listOrdersProccess($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
   {
      $lists = $this->getDataTablesProccess($inputSearch, $inputOrder, $inputLength, $inputStart);
      $data = [];
      $no = $inputStart;

      foreach ($lists as $list) {
         $row = [];
         $row[] = ++$no;
         $row[] = $list->invoice;
         $row[] = $list->fullname;
         $row[] = Time::parse($list->created_at, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy');

         $row[] = '
            <div class="btn-group" role="group">
                <buton type="button" data-invoice="' . $list->invoice . '" class="btn btn-success btn-sm btn-send">Kirim</buton>
            </div>
            ';

         $data[] = $row;
      }

      $output = [
         'draw' => $inputDraw,
         'recordsTotal' => $this->countAllProccess(),
         'recordsFiltered' => $this->countFilteredProccess($inputSearch, $inputOrder),
         'data' => $data
      ];

      return $output;
   }

   /**
    * Query untuk ambil data table pesanan sending
    */
   public function getDataTablesQuerySending($inputSearch, $inputOrder)
   {
      $i = 0;
      foreach ($this->column_search_send as $search) {
         if ($inputSearch['value']) {
            if ($i == 0) {
               $this->checkouts->groupStart();
               $this->checkouts->select('checkouts.*, u.fullname as fullname')
                  ->join('users u', 'checkouts.user_id = u.id')
                  ->where('checkouts.status', 'Sending')
                  ->like($search, $inputSearch['value']);
            } else {
               $this->checkouts->orLike($search, $inputSearch['value']);
            }

            if (count($this->column_search_send) - 1 == $i)
               $this->checkouts->groupEnd();
         }

         $i++;
      }

      if ($inputOrder) {
         $this->checkouts->select('checkouts.*, user.fullname as fullname')
            ->join('users user', 'checkouts.user_id = user.id')
            ->where('checkouts.status', 'Sending')
            ->orderBy($this->column_order_send[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order_send)) {
         $order = $this->order_send;
         $this->checkouts->select('checkouts.*, user.fullname as fullname')
            ->join('users user', 'checkouts.user_id = user.id')
            ->where('checkouts.status', 'Sending')
            ->orderBy(key($order), $order[key($order)]);
      }
   }

   /**
    * Ambil data table pesanan sending
    */
   public function getDataTablesSending($inputSearch, $inputOrder, $inputLength, $inputStart)
   {
      $this->getDataTablesQuerySending($inputSearch, $inputOrder);
      if ($inputLength != 1) {
         return $this->checkouts->select('checkouts.*, users.fullname as fullname')
            ->join('users', 'checkouts.user_id = users.id')
            ->where('checkouts.status', 'Sending')
            ->groupBy('checkouts.invoice')
            ->limit($inputLength, $inputStart)->get()->getResult();
      }
   }

   /**
    * Hitung data pesanan sending terfilter
    */
   public function countFilteredSending($inputSearch, $inputOrder)
   {
      $this->getDataTablesQuerySending($inputSearch, $inputOrder);
      return $this->checkouts->where('checkouts.status', 'Sending')->groupBy('checkouts.invoice')->get()->getNumRows();
   }

   /**
    * Hitung semua data pesanan sending
    */
   public function countAllSending()
   {
      return $this->checkouts->where('checkouts.status', 'Sending')->groupBy('checkouts.invoice')->countAllResults();
   }


   /**
    * Ambil data pesanan sending untuk data table
    */
   public function listOrdersSending($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
   {
      $lists = $this->getDataTablesSending($inputSearch, $inputOrder, $inputLength, $inputStart);
      $data = [];
      $no = $inputStart;

      foreach ($lists as $list) {
         $row = [];
         $row[] = ++$no;
         $row[] = $list->invoice;
         $row[] = $list->fullname;
         $row[] = $list->jalan . ', ' . $list->kecamatan . ', ' . $list->kabupaten . ', ' . $list->provinsi . ', ' . $list->kode_pos;
         $row[] = strtoupper($list->courier);
         $row[] = $list->shipping_type;
         $row[] = $list->estimate_date;

         $row[] = '
            <div class="btn-group" role="group">
                <buton type="button" data-invoice="' . $list->invoice . '" class="btn btn-success btn-sm btn-detail-sent">Detail</buton>
            </div>
            ';

         $data[] = $row;
      }

      $output = [
         'draw' => $inputDraw,
         'recordsTotal' => $this->countAllSending(),
         'recordsFiltered' => $this->countFilteredSending($inputSearch, $inputOrder),
         'data' => $data
      ];

      return $output;
   }

   /**
    * Query untuk ambil data table riwayat pesanan
    */
   public function getDataTablesQueryHistory($inputSearch, $inputOrder)
   {
      $i = 0;
      foreach ($this->column_search_history as $search) {
         if ($inputSearch['value']) {
            if ($i == 0) {
               $this->checkouts->groupStart();
               $this->checkouts->select('checkouts.id, checkouts.created_at, checkouts.status, u.fullname as fullname, p.name as product, d.size as size, d.color as color, d.quantity as quantity')
                  ->join('users u', 'checkouts.user_id = u.id')
                  ->join('productcheckout d', 'checkouts.id = d.checkout_id')
                  ->join('products p', 'd.product_id = p.id')
                  ->like($search, $inputSearch['value']);
            } else {
               $this->checkouts->orLike($search, $inputSearch['value']);
            }

            if (count($this->column_search_history) - 1 == $i)
               $this->checkouts->groupEnd();
         }

         $i++;
      }

      if ($inputOrder) {
         $this->checkouts->select('checkouts.id, checkouts.created_at, checkouts.status, user.fullname as fullname, product.name as product, detail.size as size, detail.color as color, detail.quantity as quantity')
            ->join('users user', 'checkouts.user_id = user.id')
            ->join('productcheckout detail', 'checkouts.id = detail.checkout_id')
            ->join('products product', 'detail.product_id = product.id')
            ->orderBy($this->column_order_history[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order_history)) {
         $order = $this->order_history;
         $this->checkouts->select('checkouts.id, checkouts.created_at, checkouts.status, user.fullname as fullname, product.name as product, detail.size as size, detail.color as color, detail.quantity as quantity')
            ->join('users user', 'checkouts.user_id = user.id')
            ->join('productcheckout detail', 'checkouts.id = detail.checkout_id')
            ->join('products product', 'detail.product_id = product.id')
            ->orderBy(key($order), $order[key($order)]);
      }
   }
}
