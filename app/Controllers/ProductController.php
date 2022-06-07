<?php

namespace App\Controllers;

use App\Models\Sizes;
use App\Models\Colors;
use App\Models\Products;
use App\Models\Categories;
use App\Controllers\BaseController;

class ProductController extends BaseController
{
   public function __construct()
   {
      $this->products = new Products();
      $this->categories = new Categories();
      $this->sizes = new Sizes();
      $this->colors = new Colors();
   }

   /**
    * Ambil data produk terbaru
    */
   public function newest()
   {
      return view('pages/produk', [
         'title' => 'Produk Terbaru',
         'keyword' => '',
         'categories' => $this->categories->getCategories(),
         'products' => $this->products->newProducts(),
         'pager' => $this->products->pager
      ]);
   }

   /**
    * Ambil data produk termurah
    */
   public function cheapest()
   {
      return view('pages/produk', [
         'title' => 'Produk Termurah',
         'keyword' => '',
         'categories' => $this->categories->getCategories(),
         'products' => $this->products->cheapProducts(),
         'pager' => $this->products->pager
      ]);
   }

   /**
    * Ambil data produk terlaris
    */
   public function bestSeller()
   {
      return view('pages/produk', [
         'title' => 'Produk Terlaris',
         'keyword' => '',
         'categories' => $this->categories->getCategories(),
         'products' => $this->products->bestSellerProducts(),
         'pager' => $this->products->pager
      ]);
   }

   /**
    * Ambil data produk berdasarkan kategori
    */
   public function getProductsByCategory($category)
   {
      return view('pages/produk', [
         'title' => 'Semua Produk ' . $category,
         'keyword' => '',
         'categories' => $this->categories->getCategories(),
         'products' => $this->products->getProductsByCategory($category),
         'pager' => $this->products->pager
      ]);
   }

   /**
    * Ambil satu produk berdasarkan slug
    * dari parameter yang dikirimkan
    */
   public function find($slug)
   {
      return json_encode($this->products->getProductBySlug($slug));
   }

   /**
    * Mencari produk berdasarkan keyword pencarian
    */
   public function search()
   {
      $keyword = $this->request->getVar('keyword');
      return view('pages/cari-produk', [
         'title' => 'Hasil pencarian ' . $keyword,
         'keyword' => $keyword,
         'categories' => $this->categories->getCategories(),
         'products' => $this->products->search($keyword),
         'pager' => $this->products->pager
      ]);
   }

   /**
    * Halaman Daftar Produk
    */
   public function listProducts()
   {
      return view('admin/products', [
         'title' => 'Daftar Produk',
      ]);
   }

   /**
    * Ambil data produk untuk data table
    */
   public function getProducts()
   {
      $search = $this->request->getVar('search');
      $order = $this->request->getVar('order');
      $length = $this->request->getVar('length');
      $start = $this->request->getVar('start');
      $draw = $this->request->getVar('draw');
      return json_encode($this->products->getProducts($search, $order, $length, $start, $draw));
   }

   /**
    * Halaman tambah produk
    */
   public function save()
   {
      return view('admin/add-products', [
         'title' => 'Tambah Produk',
         'categories' => $this->categories->getCategories(),
         'sizes' => $this->sizes->findAll(),
         'colors' => $this->colors->findAll(),
         'validation' => \Config\Services::validation()
      ]);
   }

   /**
    * Simpan produk ke tabel
    */
   public function store()
   {
      $db = \Config\Database::connect();

      if (!$this->validate([
         'name' => 'required|is_unique[products.name]',
         'category' => 'required',
         'detail' => 'required',
         'price' => 'required|numeric|greater_than[0]',
         'discount' => 'numeric',
         'weight' => 'required|numeric|greater_than[0]',
         'stock' => 'required|numeric|greater_than[0]',
         'image_1' => 'is_image[image_1]|ext_in[image_1,png,jpg,jpeg]|mime_in[image_1,image/png,image/jpg,image/jpeg]|max_size[image_1,1024]',
         'image_2' => 'is_image[image_2]|ext_in[image_2,png,jpg,jpeg]|mime_in[image_2,image/png,image/jpg,image/jpeg]|max_size[image_2,1024]',
         'image_3' => 'is_image[image_3]|ext_in[image_3,png,jpg,jpeg]|mime_in[image_3,image/png,image/jpg,image/jpeg]|max_size[image_3,1024]',
         'size' => 'required',
         'color' => 'required'
      ])) {
         return redirect()->back()->withInput();
      }

      // ambil foto produk
      $image_1 = $this->request->getFile('image_1');
      $image_2 = $this->request->getFile('image_2');
      $image_3 = $this->request->getFile('image_3');

      // cek apakah tidak ada gambar yang diupload
      if ($image_1->getError() == 4) {
         $nameFile_1 = 'product.jpg';
      } else {
         // generate nama foto produk
         $nameFile_1 = $image_1->getRandomName();
         // simpan foto ke folder img/foto-produk
         $image_1->move('img/foto-produk', $nameFile_1);
      }

      if ($image_2->getError() == 4) {
         $nameFile_2 = 'product.jpg';
      } else {
         $nameFile_2 = $image_2->getRandomName();
         $image_2->move('img/foto-produk', $nameFile_2);
      }

      if ($image_3->getError() == 4) {
         $nameFile_3 = 'product.jpg';
      } else {
         $nameFile_3 = $image_3->getRandomName();
         $image_3->move('img/foto-produk', $nameFile_3);
      }


      $data = [
         'name' => ucwords($this->request->getVar('name')),
         'slug' => strtolower(str_replace(' ', '-', $this->request->getVar('name'))),
         'category_id' => $this->request->getVar('category'),
         'detail' => $this->request->getVar('detail'),
         'price' => $this->request->getVar('price'),
         'discount' => $this->request->getVar('discount'),
         'weight' => $this->request->getVar('weight'),
         'stock' => $this->request->getVar('stock'),
         'image_1' => $nameFile_1,
         'image_2' => $nameFile_2,
         'image_3' => $nameFile_3,
      ];

      $this->products->save($data);
      $id = $this->products->select('id')->where('slug', $data['slug'])->first();

      foreach ($this->request->getVar('size') as $size) {
         $db->table('productsize')->insert(['product_id' => $id['id'], 'size_id' => $size['id']]);
      }

      foreach ($this->request->getVar('color') as $color) {
         $db->table('productcolor')->insert(['product_id' => $id['id'], 'color_id' => $color['id']]);
      }

      session()->setFlashdata('info', 'Produk Berhasil Ditambahkan');
      return redirect()->to('/web-admin/products');
   }

   /**
    * Halaman edit produk
    */
   public function edit($slug)
   {
      $products = $this->products->getProductBySlug($slug);
      return view('admin/edit-products', [
         'title' => 'Edit Produk',
         'categories' => $this->categories->getCategories(),
         'sizes' => $this->sizes->findAll(),
         'colors' => $this->colors->findAll(),
         'products' => $products,
         'validation' => \Config\Services::validation()
      ]);
   }

   /**
    * Update tabel produk
    */
   public function update()
   {
      $db = \Config\Database::connect();

      if (!$this->validate([
         'name' => 'required|is_unique[products.name,id,{id}]',
         'category' => 'required',
         'detail' => 'required',
         'price' => 'required|numeric|greater_than[0]',
         'discount' => 'numeric',
         'weight' => 'required|numeric|greater_than[0]',
         'stock' => 'required|numeric|greater_than[0]',
         'image_1' => 'is_image[image_1]|ext_in[image_1,png,jpg,jpeg]|mime_in[image_1,image/png,image/jpg,image/jpeg]|max_size[image_1,1024]',
         'image_2' => 'is_image[image_2]|ext_in[image_2,png,jpg,jpeg]|mime_in[image_2,image/png,image/jpg,image/jpeg]|max_size[image_2,1024]',
         'image_3' => 'is_image[image_3]|ext_in[image_3,png,jpg,jpeg]|mime_in[image_3,image/png,image/jpg,image/jpeg]|max_size[image_3,1024]',
         'size' => 'required',
         'color' => 'required'
      ])) {
         return redirect()->back()->withInput();
      }

      // ambil foto produk
      $image_1 = $this->request->getFile('image_1');
      $image_2 = $this->request->getFile('image_2');
      $image_3 = $this->request->getFile('image_3');

      // cek apakah tidak ada gambar yang diupload
      if ($image_1->getError() == 4) {
         $nameFile_1 = $this->request->getVar('image_1Lama');
      } else {

         // hapus foto lama jika upload foto baru
         if ($this->request->getVar('image_1Lama') != 'product.jpg') {
            unlink('img/foto-produk/' . $this->request->getVar('image_1Lama'));
         }

         // generate nama foto produk
         $nameFile_1 = $image_1->getRandomName();
         // simpan foto ke folder img/foto-produk
         $image_1->move('img/foto-produk/', $nameFile_1);
      }

      if ($image_2->getError() == 4) {
         $nameFile_2 = $this->request->getVar('image_2Lama');
      } else {
         if ($this->request->getVar('image_2Lama') != 'product.jpg') {
            unlink('img/foto-produk/' . $this->request->getVar('image_2Lama'));
         }
         $nameFile_2 = $image_2->getRandomName();
         $image_2->move('img/foto-produk/', $nameFile_2);
      }

      if ($image_3->getError() == 4) {
         $nameFile_3 = $this->request->getVar('image_3Lama');
      } else {
         if ($this->request->getVar('image_3Lama') != 'product.jpg') {
            unlink('img/foto-produk/' . $this->request->getVar('image_3Lama'));
         }
         $nameFile_3 = $image_3->getRandomName();
         $image_3->move('img/foto-produk/', $nameFile_3);
      }


      $data = [
         'id' => $this->request->getVar('id'),
         'name' => ucwords($this->request->getVar('name')),
         'slug' => strtolower(str_replace(' ', '-', $this->request->getVar('name'))),
         'category_id' => $this->request->getVar('category'),
         'detail' => $this->request->getVar('detail'),
         'price' => $this->request->getVar('price'),
         'discount' => $this->request->getVar('discount'),
         'weight' => $this->request->getVar('weight'),
         'stock' => $this->request->getVar('stock'),
         'image_1' => $nameFile_1,
         'image_2' => $nameFile_2,
         'image_3' => $nameFile_3,
      ];

      $this->products->save($data);

      $db->table('productsize')->delete(['product_id' => $data['id']]);
      foreach ($this->request->getVar('size') as $size) {
         $db->table('productsize')->insert(['product_id' => $data['id'], 'size_id' => $size['id']]);
      }

      $db->table('productcolor')->delete(['product_id' => $data['id']]);
      foreach ($this->request->getVar('color') as $color) {
         $db->table('productcolor')->insert(['product_id' => $data['id'], 'color_id' => $color['id']]);
      }

      session()->setFlashdata('info', 'Produk Berhasil Diubah');
      return redirect()->to('/web-admin/products');
   }

   /**
    * Hapus produk
    */
   public function delete($id)
   {
      $db = \Config\Database::connect();
      $product = $this->products->find($id);

      // hapus data
      if ($this->products->delete($id)) {
         $db->table('productsize')->delete(['product_id' => $id]);
         $db->table('productsize')->delete(['product_id' => $id]);

         // Hapus foto produk jika tidak default
         if ($product['image_1'] != 'product.jpg') {
            unlink('img/foto-produk/' . $product['image_1']);
         }

         if ($product['image_2'] != 'product.jpg') {
            unlink('img/foto-produk/' . $product['image_2']);
         }

         if ($product['image_3'] != 'product.jpg') {
            unlink('img/foto-produk/' . $product['image_3']);
         }

         return json_encode(true);
      }
   }
}
