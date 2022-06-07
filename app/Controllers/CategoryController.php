<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Categories;

class CategoryController extends BaseController
{
    public function __construct()
    {
        $this->categories = new Categories();
    }

    /**
     * Halaman daftar category
     */
    public function index()
    {
        return view('admin/categories', [
            'title' => 'Daftar Kategori',
        ]);
    }

    /**
     * Ambil data category untuk data table
     */
    public function listCategories()
    {
        $search = $this->request->getVar('search');
        $order = $this->request->getVar('order');
        $length = $this->request->getVar('length');
        $start = $this->request->getVar('start');
        $draw = $this->request->getVar('draw');
        return json_encode($this->categories->listCategories($search, $order, $length, $start, $draw));
    }

    // ambil category by slug
    public function bySlug($slug)
    {
        return json_encode($this->categories->bySlug($slug));
    }

    // Simpan category ke tabel
    public function store()
    {
        // Cek jika tidak ada id, simpan
        // jika ada id, update
        if (!$this->request->getVar('id')) {
            $rules = ['category' => 'required|is_unique[categories.name]'];
            $isSave = true;
        } else {
            $rules = ['category' => 'required|is_unique[categories.name,id,{id}]'];
            $isSave = false;
        }

        if (!$this->validate($rules)) {
            return json_encode(['status' => false, 'validation' => $this->validator->getError('category')]);
        }

        $data = [
            'id' => $this->request->getVar('id'),
            'name' => ucwords($this->request->getVar('category')),
            'slug' => strtolower(str_replace(' ', '-', $this->request->getVar('category')))
        ];

        $this->categories->save($data);
        return json_encode(['status' => true, 'isSave' => $isSave]);
    }

    // Hapus category
    public function delete($id)
    {
        $this->categories->delete($id);
        return json_encode(true);
    }
}
