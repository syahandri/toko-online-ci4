<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Checkouts extends Migration
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
         'courier' => [
            'type' => 'VARCHAR',
            'constraint' => 10
         ],
         'shipping_type' => [
            'type' => 'VARCHAR',
            'constraint' => 100,
         ],
         'estimate_date' => [
            'type' => 'VARCHAR',
            'constraint' => 20
         ],
         'cost' => [
            'type' => 'INT',
            'unsigned' => true
         ],
         'total' => [
            'type' => 'BIGINT',
            'constraint' => 20,
            'unsigned' => true
         ],
         'status' => [
            'type' => 'VARCHAR',
            'constraint' => 50,
            'default' => 'Pending'
         ],
         'resi_number' => [
            'type' => 'VARCHAR',
            'constraint' => 100
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
         'kode_pos' => [
            'type' => 'INT',
            'constraint' => 11,
            'unsigned' => true
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
      $this->forge->createTable('checkouts');

      // $this->db->query('CREATE VIEW detailcheckouts AS
      //                 SELECT
      //                     `checkouts`.`invoice` AS `invoice`,
      //                     `checkouts`.`resi_number` AS `resi_number`,
      //                     `checkouts`.`user_id` AS `user_id`,
      //                     `users`.`fullname` AS `user`,
      //                     `products`.`name` AS `product`,
      //                     `checkouts`.`size` AS `size`,
      //                     `checkouts`.`color` AS `color`,
      //                     `checkouts`.`price` AS `price`,
      //                     `checkouts`.`quantity` AS `quantity`,
      //                     `checkouts`.`grand_total` AS `grand_total`,
      //                     `checkouts`.`courier` AS `courier`,
      //                     `checkouts`.`shipping_type` AS `shipping_type`,
      //                     `checkouts`.`estimate_date` AS `estimate_date`,
      //                     `checkouts`.`cost` AS `cost`,
      //                     `checkouts`.`total` AS `total`,
      //                     `checkouts`.`note` AS `note`,
      //                     `checkouts`.`status` AS `status`,
      //                     `address`.`jalan` AS `address`,
      //                     `address`.`kecamatan` AS `kecamatan`,
      //                     `address`.`kabupaten` AS `kabupaten`,
      //                     `address`.`provinsi` AS `provinsi`,
      //                     `address`.`kode_pos` AS `kode_pos`,
      //                     `checkouts`.`created_at` AS `order_date` 
      //                 FROM
      //                     `checkouts`
      //                     JOIN `users` ON `checkouts`.`user_id` = `users`.`id`
      //                     JOIN `products` ON `checkouts`.`product_id` = `products`.`id`
      //                     JOIN `address` ON `checkouts`.`address_id` = `address`.`id`');
   }

   public function down()
   {
      // $this->forge->dropTable('detailcheckouts');
      $this->forge->dropTable('checkouts');
   }
}
