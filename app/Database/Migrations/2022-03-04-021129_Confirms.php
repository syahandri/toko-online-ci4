<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Confirms extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
                'auto_increment' => true
            ],
            'invoice' => [
                'type' => 'VARCHAR',
                'constraint' => 50
            ],
            'user_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true
            ],
            'name' => [
                'type' => 'VARCHAR',
                'constraint' => 50
            ],
            'bank' => [
                'type' => 'VARCHAR',
                'constraint' => 20
            ],
            'image_transfer' => [
                'type' => 'VARCHAR',
                'constraint' => 100
            ],
            'created_at' => [
                'type' => 'DATETIME',
                'null' => true
            ],
            'updated_at' => [
                'type' => 'DATETIME',
                'null' => true
            ]
        ]);

        $this->forge->addKey('id', true);
        $this->forge->createTable('confirms');
    }

    public function down()
    {
        $this->forge->dropTable('confirms');
    }
}
