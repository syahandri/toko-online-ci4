<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Productsize extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'product_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ],
            'size_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ]
        ]);
        $this->forge->createTable('productsize');
    }

    public function down()
    {
        $this->forge->dropTable('productsize');
    }
}
