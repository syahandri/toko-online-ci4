<?php

namespace App\Models;

use CodeIgniter\Model;

class Sizes extends Model
{
    protected $table            = 'sizes';
    protected $allowedFields    = ['name'];
    protected $useTimestamps = true;
}
