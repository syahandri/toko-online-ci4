<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Productcart extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'cart_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
            ],
            'product_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true
            ],
            'quantity' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true
            ],
            'size' => [
                'type' => 'VARCHAR',
                'constraint' => 50
            ],
            'color' => [
                'type' => 'VARCHAR',
                'constraint' => 50
            ]
        ]);
        $this->forge->createTable('productcart');
    }

    public function down()
    {
        $this->forge->dropTable('productcart');
    }
}
