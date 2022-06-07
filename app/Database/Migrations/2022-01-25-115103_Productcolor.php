<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Productcolor extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'product_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ],
            'color_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ]
        ]);
        $this->forge->createTable('productcolor');
    }

    public function down()
    {
        $this->forge->dropTable('productcolor');
    }
}
