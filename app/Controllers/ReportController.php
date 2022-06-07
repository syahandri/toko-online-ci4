<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\ReportSales;
use App\Models\ReportUsers;

class ReportController extends BaseController
{
   public function __construct()
   {
      $this->reportUser = new ReportUsers();
      $this->reportSale = new ReportSales();
   }

   public function sales()
   {
      return view('admin/sales-report', [
         'title' => 'Laporan Penjualan'
      ]);
   }

   public function users()
   {
      return view('admin/users-report', [
         'title' => 'Laporan User dan Member',
      ]);
   }

   public function getHistoryUsers()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->reportUser->getHistoryUsers($search, $order, $length, $start, $draw));
   }

   public function getHistorySales()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->reportSale->getHistorySales($search, $order, $length, $start, $draw));
   }
}
