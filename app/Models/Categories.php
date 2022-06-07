<?php

namespace App\Models;

use CodeIgniter\Model;

class Categories extends Model
{
    protected $table = 'categories';
    protected $allowedFields = ['name', 'slug'];
    protected $useTimestamps = true;

    // Variable data table
    protected $column_order = ['id', 'name'];
    protected $column_search = ['name'];
    protected $order = ['name' => 'ASC'];

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
                    $this->like($search, $inputSearch['value']);
                } else {
                    $this->orLike($search, $inputSearch['value']);
                }

                if (count($this->column_search) - 1 == $i)
                    $this->groupEnd();
            }

            $i++;
        }

        if ($inputOrder) {
            $this->orderBy($this->column_order[$inputOrder[0]['column']], $inputOrder[0]['dir']);
        } else if (isset($this->order)) {
            $order = $this->order;
            $this->orderBy(key($order), $order[key($order)]);
        }
    }

    /**
     * Ambil data table
     */
    public function getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart)
    {
        $this->getDataTablesQuery($inputSearch, $inputOrder);
        if ($inputLength != 1) {
            $this->limit($inputLength, $inputStart);
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
     * Ambil data category untuk data table
     */
    public function listCategories($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
    {
        $lists = $this->getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart);
        $data = [];
        $no = $inputStart;

        foreach ($lists as $list) {
            $row = [];
            $row[] = ++$no;
            $row[] = $list->name;

            $row[] = '
            <div class="btn-group" role="group">
                <button type="button" data-slug="' . $list->slug . '" class="btn btn-sm btn-success btn-edit-category">Edit</button>
                <button type="button" data-id="' . $list->id . '" class="btn btn-sm  btn-danger btn-delete-category">Hapus</button>
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

    // Ambil semua data kategori
    public function getCategories()
    {
        return $this->findAll();
    }

    // ambil category by slug
    public function bySlug($slug)
    {
        return $this->where('slug', $slug)->first();
    }
}
