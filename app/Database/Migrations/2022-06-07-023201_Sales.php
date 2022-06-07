<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Sales extends Migration
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
         'product' => [
            'type' => 'VARCHAR',
            'constaint' => 100
         ],
         'stock' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true,
         ],
         'sold' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true,
         ],
         'tgl_transaksi' => [
            'type' => 'DATETIME',
            'null' => true
         ]
      ]);

      $this->forge->addKey('id', true);
      $this->forge->createTable('sales');
   }

   public function down()
   {
      $this->forge->dropTable('sales');
   }
}
