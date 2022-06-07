<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Productcheckout extends Migration
{
   public function up()
   {
      $this->forge->addField([
         'checkout_id' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true,
         ],
         'product_id' => [
            'type' => 'INT',
            'constaint' => 11,
            'unsigned' => true
         ],
         'color' => [
            'type' => 'VARCHAR',
            'constraint' => 15
         ],
         'size' => [
            'type' => 'VARCHAR',
            'constraint' => 5
         ],
         'price' => [
            'type' => 'BIGINT',
            'constraint' => 20,
            'unsigned' => true
         ],
         'quantity' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
         ],
         'grand_total' => [
            'type' => 'BIGINT',
            'constraint' => 20,
            'unsigned' => true
         ],
         'note' => [
            'type' => 'TEXT'
         ]
      ]);
      
      // Trigger stock product
      $this->forge->createTable('productcheckout');
      $this->db->query('CREATE TRIGGER `kurangStok` AFTER INSERT ON `productcheckout` FOR EACH ROW UPDATE products SET stock = stock - NEW.quantity WHERE id = NEW.product_id');
      $this->db->query('CREATE TRIGGER `ubahStok` AFTER UPDATE ON `productcheckout` FOR EACH ROW UPDATE products SET stock = (stock + OLD.quantity) - NEW.quantity WHERE id = OLD.product_id');
      $this->db->query('CREATE TRIGGER `hapusStok` AFTER DELETE ON `productcheckout` FOR EACH ROW UPDATE products SET stock = stock + OLD.quantity WHERE id = OLD.product_id');

      // Trigger sold product
      $this->db->query('CREATE TRIGGER `tambahSold` AFTER INSERT ON `productcheckout` FOR EACH ROW UPDATE products SET sold = sold + NEW.quantity WHERE id = NEW.product_id');
      $this->db->query('CREATE TRIGGER `ubahSold` AFTER UPDATE ON `productcheckout` FOR EACH ROW UPDATE products SET sold = (sold - OLD.quantity) + NEW.quantity WHERE id = OLD.product_id');
      $this->db->query('CREATE TRIGGER `hapusSold` AFTER DELETE ON `productcheckout` FOR EACH ROW UPDATE products SET sold = sold - OLD.quantity WHERE id = OLD.product_id');
   }

   public function down()
   {
      $this->forge->dropTable('productcheckout');
   }
}