<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Events extends Migration
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
            'name' => [
                'type' => 'VARCHAR',
                'constraint' => 50
            ],
            'slug' => [
                'type' => 'VARCHAR',
                'constraint' => 100
            ],
            'detail' => [
                'type' => 'TEXT'
            ],
            'image' => [
                'type' => 'VARCHAR',
                'constraint' => 50,
                'default' => 'event.jpg'
            ],
            'published' => [
                'type' => 'BIT'
            ],
            'start_date' => [
                'type' => 'DATE',
                'null' => true
            ],
            'end_date' => [
                'type' => 'DATE',
                'null' => true
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
        $this->forge->createTable('events');
    }

    public function down()
    {
        $this->forge->dropTable('events');
    }
}
