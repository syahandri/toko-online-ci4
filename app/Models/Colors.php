<?php

namespace App\Models;

use CodeIgniter\Model;

class Colors extends Model
{
    protected $table            = 'colors';
    protected $allowedFields    = ['name'];
    protected $useTimestamps = true;
}
