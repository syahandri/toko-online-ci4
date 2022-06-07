<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Categories;
use App\Models\Checkouts;
use App\Models\Confirms;

class ConfirmController extends BaseController
{
   public function __construct()
   {
      $this->confirms = new Confirms();
   }

   public function index()
   {
      $categories = new Categories();
      $checkouts = new Checkouts();
      return view('pages/konfirmasi', [
         'title' => 'Konfirmasi Pembayaran',
         'categories' => $categories->findAll(),
         'keyword' => '',
         'invoice' => $checkouts->select('invoice')->where('user_id', user_id())->where('status', 'Pending')->groupBy('invoice')->findAll()
      ]);
   }

   public function confirm()
   {
      // validasi input
      if (!$this->validate([
         'invoice'           => 'required',
         'bank'              => 'required',
         'name'              => 'required',
         'image_transfer'    => 'uploaded[image_transfer]|is_image[image_transfer]|mime_in[image_transfer,image/png,image/jpg,image/jpeg]|max_size[image_transfer,1024]'
      ])) {
         // return redirect()->back()->withInput();
         return json_encode(['invalid' => $this->validator->getErrors()]);
      }

      // ambil foto transfer
      $imgTransfer = $this->request->getFile('image_transfer');
      // generate nama foto bukti transfer
      $nameFile = $imgTransfer->getRandomName();
      // simpan foto ke folder img/bukti-transfer
      $imgTransfer->move('img/bukti-transfer', $nameFile);

      // simpan ke tabel confirms
      $data = [
         'invoice'           => $this->request->getVar('invoice'),
         'user_id'           => user_id(),
         'name'              => ucwords($this->request->getVar('name')),
         'bank'              => $this->request->getVar('bank'),
         'image_transfer'    => $nameFile
      ];

      return json_encode($this->confirms->confirm($data));
   }
}
