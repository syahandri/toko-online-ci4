<?php

namespace App\Models;

use CodeIgniter\I18n\Time;
use CodeIgniter\Model;

class Events extends Model
{
    protected $table            = 'events';
    protected $allowedFields    = ['name', 'slug', 'detail', 'image', 'published', 'start_date', 'end_date'];
    protected $useTimestamps = true;

    // Variable data table
    protected $column_order = ['id', 'name', 'start_date', 'end_date'];
    protected $column_search = ['name', 'detail', 'published', 'start_date', 'end_date'];
    protected $order = ['start_date' => 'DESC'];

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
     * Ambil data event untuk data table
     */
    public function listEvents($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
    {
        $lists = $this->getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart);
        $data = [];
        $no = $inputStart;

        foreach ($lists as $list) {
            $row = [];
            $row[] = ++$no;
            $row[] = $list->name;
            $row[] = $list->published == 1 ? 'Diterbitkan' : 'Belum diterbitkan';
            $row[] = Time::parse($list->start_date, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy');
            $row[] = Time::parse($list->end_date, 'Asia/Jakarta', 'id-ID')->toLocalizedString('dd MMMM yyyy');

            $row[] = '
            <div class="btn-group" role="group">
                <button type="button" data-slug="' . $list->slug . '" class="btn btn-sm btn-primary btn-detail-event">Detail</button>
                <button type="button" data-slug="' . $list->slug . '" class="btn btn-sm btn-success btn-edit-event">Edit</button>
                <button type="button" data-id="' . $list->id . '" class="btn btn-sm  btn-danger btn-delete-event">Hapus</button>
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

}
