<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Historyuser extends Migration
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
         'tgl_registrasi' => [
            'type' => 'DATETIME',
            'null' => true
         ],
         'tgl_gabung_member' => [
            'type' => 'DATETIME',
            'null' => true
         ]
      ]);
      $this->forge->addKey('id', true);
      $this->forge->createTable('historyusers');
   }

   public function down()
   {
      $this->forge->dropTable('historyusers');
   }
}
