<?php

namespace App\Models;

use CodeIgniter\Model;

class ReportSales extends Model
{
   protected $table = 'historysales';
   protected $allowedFields = ['product_id', 'tgl_transaksi'];

   // Variable data table
   protected $column_order = ['id', 'product', 'stock', 'sold', 'tgl_transaksi'];
   protected $column_search = ['product', 'stock', 'sold', 'tgl_transaksi'];
   protected $order = ['tgl_transaksi' => 'DESC'];

   /**
    * Query untuk ambil data table
    */
   public function getDataTablesQuery($inputSearch, $inputOrder)
   {
      $i = 0;
      foreach ($this->column_search as $search) {
         if ($inputSearch['value']) {
            if ($i == 0) {
               $this->groupStart();
               $this->select('product,stock,sold,tgl_transaksi')
                  ->like($search, $inputSearch['value']);
            } else {
               $this->orLike($search, $inputSearch['value']);
            }

            if (count($this->column_search) - 1 == $i)
               $this->groupEnd();
         }

         $i++;
      }

      if ($inputOrder) {
         $this->select('product,stock,sold,tgl_transaksi')
            ->orderBy($this->column_order[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order)) {
         $order = $this->order;
         $this->select('product,stock,sold,tgl_transaksi')
            ->orderBy(key($order), $order[key($order)]);
      }
   }

   /**
    * Ambil data table
    */
   public function getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart)
   {
      $this->getDataTablesQuery($inputSearch, $inputOrder);
      if ($inputLength != 1) {
         $this->select('product,stock,sold,tgl_transaksi')
            ->limit($inputLength, $inputStart);
         return $this->get()->getResult();
      }
   }

   /**
    * Hitung data terfilter
    */
   public function countFiltered($inputSearch, $inputOrder)
   {
      $this->getDataTablesQuery($inputSearch, $inputOrder);
      return $this->get()->getNumRows();
   }

   /**
    * Hitung semua data
    */
   public function countAll()
   {
      return $this->countAllResults();
   }

   /**
    * Ambil data penjualan untuk data table
    */
   public function getHistorySales($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
   {
      $lists = $this->getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart);
      $data = [];
      $no = $inputStart;

      foreach ($lists as $list) {
         $row = [];
         $row[] = ++$no;
         $row[] = $list->product;
         $row[] = $list->stock;
         $row[] = $list->sold;
         $row[] = $list->tgl_transaksi;

         $data[] = $row;
      }

      $output = [
         'draw' => $inputDraw,
         'recordsTotal' => $this->countAll(),
         'recordsFiltered' => $this->countFiltered($inputSearch, $inputOrder),
         'data' => $data
      ];

      return $output;
   }
}
