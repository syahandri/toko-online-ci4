<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Historysales extends Migration
{
   public function up()
   {
      $this->forge->addField([
         'id' => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
         'product' => ['type' => 'VARCHAR', 'constraint' => 100],
         'stock' => ['type' => 'INT'],
         'sold' => ['type' => 'INT'],
         'tgl_transaksi' => ['type' => 'DATETIME', null => true]
      ]);
      $this->forge->addKey('id', true);
      $this->forge->createTable('historysales');
   }

   public function down()
   {
      $this->forge->dropTable('historysales');
   }
}
