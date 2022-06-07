<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Products extends Migration
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
         'category_id' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'name' => [
            'type' => 'VARCHAR',
            'constraint' => 100,
         ],
         'slug' => [
            'type' => 'VARCHAR',
            'constraint' => 200,
            'UNIQUE' => true
         ],
         'detail' => [
            'type' => 'TEXT'
         ],
         'price' => [
            'type' => 'INT',
            'constraint' => 11
         ],
         'discount' => [
            'type' => 'FLOAT'
         ],
         'weight' => [
            'type' => 'INT'
         ],
         'stock' => [
            'type' => 'INT'
         ],
         'image_1' => [
            'type' => 'VARCHAR',
            'constraint' => 255,
            'default' => 'product.jpg'
         ],
         'image_2' => [
            'type' => 'VARCHAR',
            'constraint' => 255,
            'default' => 'product.jpg'
         ],
         'image_3' => [
            'type' => 'VARCHAR',
            'constraint' => 255,
            'default' => 'product.jpg'
         ],
         'sold' => [
            'type' => 'INT',
            'constraint' => 11,
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
      $this->forge->createTable('products');
   }

   public function down()
   {
      $this->forge->dropTable('products');
   }
}
