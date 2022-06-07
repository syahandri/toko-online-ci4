<?php

namespace App\Models;

use CodeIgniter\Model;

class Address extends Model
{
    protected $table = 'address';
    protected $allowedFields = ['user_id', 'jalan', 'kecamatan', 'kabupaten', 'provinsi', 'kode_provinsi', 'kode_kabupaten', 'kode_pos', 'flags'];
    protected $useTimestamps = true;

    /**
     * Ambil alamat dari user yang login
     */
    public function getAddress()
    {
        return $this->where('user_id', user_id())->where('flags', 1)->first();
    }
}