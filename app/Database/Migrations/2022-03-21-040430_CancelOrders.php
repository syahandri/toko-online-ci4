<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CancelOrders extends Migration
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
         'product' => [
            'type' => 'VARCHAR',
            'constraint' => 100,
         ],
         'color' => [
            'type' => 'VARCHAR',
            'constraint' => 15
         ],
         'size' => [
            'type' => 'VARCHAR',
            'constraint' => 5
         ],
         'quantity' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'status' => [
            'type' => 'VARCHAR',
            'constraint' => 50,
         ],
         'flags' => [
            'type' => 'BIT',
            'constraint' => 1,
            'default' => 0
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
      $this->forge->createTable('cancel_orders');
   }

   public function down()
   {
      $this->forge->dropTable('cancel_orders');
   }
}
