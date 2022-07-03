<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Address extends Migration
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
         'user_id' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'jalan' => [
            'type' => 'TEXT'
         ],
         'kecamatan' => [
            'type' => 'VARCHAR',
            'constraint' => 50
         ],
         'kabupaten' => [
            'type' => 'VARCHAR',
            'constraint' => 50
         ],
         'provinsi' => [
            'type' => 'VARCHAR',
            'constraint' => 50
         ],
         'kode_kabupaten' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'kode_provinsi' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'kode_pos' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'flags' => [
            'type' => 'BIT',
            'default' => 1
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
      $this->forge->createTable('address');
   }

   public function down()
   {
      $this->forge->dropTable('address');
   }
}
