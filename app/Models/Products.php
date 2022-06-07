<?php

namespace App\Models;

use CodeIgniter\Model;

class Products extends Model
{
   protected $table = 'products';
   protected $allowedFields = ['category_id', 'name', 'slug', 'detail', 'price', 'discount', 'weight', 'stock', 'image_1', 'image_2', 'image_3', 'sold'];
   protected $useTimestamps = true;

   // Variable data table
   protected $column_order = ['id', 'name', 'ctg.name', 'price', 'discount', 'weight', 'stock', 'sold'];
   protected $column_search = ['products.name', 'c.name', 'products.price', 'products.discount', 'products.stock', 'products.sold'];
   protected $order = ['created_at' => 'DESC'];

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
               $this->select('products.*, c.name as category')
                  ->join('categories c', 'products.category_id = c.id')
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
         $this->select('products.*, ctg.name as category')
            ->join('categories ctg', 'products.category_id = ctg.id')
            ->orderBy($this->column_order[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order)) {
         $order = $this->order;
         $this->select('products.*, ctg.name as category')
            ->join('categories ctg', 'products.category_id = ctg.id')
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
         $this->select('products.*, categories.name as category')
            ->join('categories', 'products.category_id = categories.id')
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
    * Ambil data produk untuk data table
    */
   public function getProducts($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
   {
      $lists = $this->getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart);
      $data = [];
      $no = $inputStart;

      foreach ($lists as $list) {
         $row = [];
         $row[] = ++$no;
         $row[] = $list->name;
         $row[] = $list->category;
         $row[] = 'Rp. ' . number_format($list->price);
         $row[] = $list->discount . '%';
         $row[] = number_format($list->weight) . ' gram';
         $row[] = $list->stock;
         $row[] = $list->sold;

         $row[] = '
            <div class="btn-group" role="group">
                <buton type="button" data-slug="' . $list->slug . '" class="btn btn-primary btn-sm btn-detail-product">Detail</buton>
                <a href="/web-admin/products/edit/' . $list->slug . '" type="button" class="btn btn-sm btn-success">Edit</a>
                <button type="button" data-id="' . $list->id . '" class="btn btn-danger btn-sm btn-delete-product">Hapus</button>
            </div>
            ';

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

   /**
    * Ambil data produk terbaru
    */
   public function newProducts()
   {
      return $this->select('products.*, categories.name as category')
         ->join('categories', 'products.category_id = categories.id')
         ->orderBy('products.created_at', 'DESC')
         ->paginate(20);
   }

   /**
    * Ambil data produk termurah
    */
   public function cheapProducts()
   {
      return $this->select('products.*, categories.name as category')
         ->join('categories', 'products.category_id = categories.id')
         ->orderBy('products.price', 'ASC')
         ->paginate(20);
   }

   /**
    * Ambil data produk terlaris
    */
   public function bestSellerProducts()
   {
      return $this->select('products.*, categories.name as category')
         ->join('categories', 'products.category_id = categories.id')
         ->orderBy('products.sold', 'DESC')
         ->paginate(20);
   }

   /**
    * Ambil data produk berdasarkan slug
    */
   public function getProductBySlug($slug)
   {
      $query = $this->db->query("SELECT id FROM products WHERE slug ='$slug'")->getResultArray();
      return [
         'in_groups' => in_groups('member'),
         'product' => $this->select('products.*, categories.name as category')
            ->join('categories', 'products.category_id = categories.id')
            ->where('products.slug', $slug)
            ->first(),
         'size' => $this->db->table('sizes')
            ->select('sizes.id, sizes.name')
            ->join('productsize', 'sizes.id = productsize.size_id')
            ->whereIn('productsize.product_id', $query[0])->get()->getResultArray(),
         'color' => $this->db->table('colors')
            ->select('colors.id, colors.name')
            ->join('productcolor', 'colors.id = productcolor.color_id')
            ->whereIn('productcolor.product_id', $query[0])->get()->getResultArray()
      ];
   }

   /**
    * Ambil data produk berdasarkan kategori
    */
   public function getProductsByCategory($category)
   {
      return $this->select('products.*, categories.name as category')
         ->join('categories', 'products.category_id = categories.id')
         ->where('categories.slug', $category)
         ->paginate(20);
   }

   /**
    * Ambil data produk berdasarkan keyword pencarian (nama dan kategori produk)
    */
   public function search($keyword)
   {
      return $this->select('products.*, categories.name as category')
         ->join('categories', 'products.category_id = categories.id')
         ->like('products.name', $keyword)
         ->orLike('categories.name', $keyword)
         ->paginate(20, 'search');
   }
}
