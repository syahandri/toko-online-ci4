<?php

namespace App\Models;

use CodeIgniter\Model;

class ReportUsers extends Model
{
   protected $table = 'historyusers';
   protected $allowedFields = ['user_id', 'tgl_registrasi', 'tgl_gabung_member'];

   // Variable data table
   protected $column_order = ['id', 'usr.fullname', 'role.name', 'tgl_registrasi', 'tgl_gabung_member'];
   protected $column_search = ['u.fullname', 'r.name', 'historyusers.tgl_registrasi', 'historyusers.tgl_gabung_member'];
   protected $order = ['id' => 'ASC'];

   /**
    * Query untuk ambil data table
    */
   public function getDataTablesQuery($inputSearch, $inputOrder)
   {
      $i = 0;
      foreach ($this->column_search as $search) {
         if ($inputSearch['value']) {
            if ($i == 0) {
               $this->groupStart();
               $this->select('historyusers.*, u.fullname as fullname, r.name as role')
                  ->join('users u', 'u.id = historyusers.user_id')
                  ->join('auth_groups_users g', 'g.user_id = u.id')
                  ->join('auth_groups r', 'r.id = g.group_id')
                  ->like($search, $inputSearch['value']);
            } else {
               $this->orLike($search, $inputSearch['value']);
            }

            if (count($this->column_search) - 1 == $i)
               $this->groupEnd();
         }

         $i++;
      }

      if ($inputOrder) {
         $this->select('historyusers.*, usr.fullname as fullname, role.name as role')
                  ->join('users usr', 'usr.id = historyusers.user_id')
                  ->join('auth_groups_users group', 'group.user_id = usr.id')
                  ->join('auth_groups role', 'role.id = group.group_id')
            ->orderBy($this->column_order[$inputOrder[0]['column']], $inputOrder[0]['dir']);
      } else if (isset($this->order)) {
         $order = $this->order;
         $this->select('historyusers.*, usr.fullname as fullname, role.name as role')
                  ->join('users usr', 'usr.id = historyusers.user_id')
                  ->join('auth_groups_users group', 'group.user_id = usr.id')
                  ->join('auth_groups role', 'role.id = group.group_id')
            ->orderBy(key($order), $order[key($order)]);
      }
   }

   /**
    * Ambil data table
    */
   public function getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart)
   {
      $this->getDataTablesQuery($inputSearch, $inputOrder);
      if ($inputLength != 1) {
         $this->select('historyusers.*, users.fullname as fullname, auth_groups.name as role')
                  ->join('users', 'users.id = historyusers.user_id')
                  ->join('auth_groups_users', 'auth_groups_users.user_id = users.id')
                  ->join('auth_groups', 'auth_groups.id = auth_groups_users.group_id')
            ->limit($inputLength, $inputStart);
         return $this->get()->getResult();
      }
   }

   /**
    * Hitung data terfilter
    */
   public function countFiltered($inputSearch, $inputOrder)
   {
      $this->getDataTablesQuery($inputSearch, $inputOrder);
      return $this->get()->getNumRows();
   }

   /**
    * Hitung semua data
    */
   public function countAll()
   {
      return $this->countAllResults();
   }

   /**
    * Ambil data user untuk data table
    */
   public function getHistoryUsers($inputSearch, $inputOrder, $inputLength, $inputStart, $inputDraw)
   {
      $lists = $this->getDataTables($inputSearch, $inputOrder, $inputLength, $inputStart);
      $data = [];
      $no = $inputStart;

      foreach ($lists as $list) {
         $row = [];
         $row[] = ++$no;
         $row[] = $list->fullname;
         $row[] = strtoupper($list->role);
         $row[] = $list->tgl_registrasi;
         $row[] = $list->tgl_gabung_member;

         $data[] = $row;
      }

      $output = [
         'draw' => $inputDraw,
         'recordsTotal' => $this->countAll(),
         'recordsFiltered' => $this->countFiltered($inputSearch, $inputOrder),
         'data' => $data
      ];

      return $output;
   }
}
