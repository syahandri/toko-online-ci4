<?php

namespace App\Controllers;

use App\Models\Categories;
use App\Controllers\BaseController;
use App\Models\Address;
use App\Models\Checkouts;
use CodeIgniter\I18n\Time;
use Myth\Auth\Models\UserModel;

class ProfileController extends BaseController
{
   public function __construct()
   {
      $this->categories = new Categories();
      $this->users = new UserModel();
      $this->address = new Address();
      $this->checkouts = new Checkouts();
   }
   /**
    * Halaman profile user
    */
   public function index()
   {
      return view('user/profile', [
         'title' => 'My Profile',
         'keyword' => '',
         'categories' => $this->categories->getCategories(),
         'address' => $this->address->where('user_id', user_id())->findAll(),
         'pending' => $this->checkouts->where('user_id', user_id())->where('status', 'Pending')->groupBy('invoice')->findAll(),
         'countPending' => $this->checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('user_id', user_id())->where('status', 'Pending')->get()->getRow(),
         'verify' => $this->checkouts->where('user_id', user_id())->where('status', 'Verifying')->groupBy('invoice')->findAll(),
         'countVerify' => $this->checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('user_id', user_id())->where('status', 'Verifying')->get()->getRow(),
         'proccess' => $this->checkouts->where('user_id', user_id())->where('status', 'Proccessing')->groupBy('invoice')->findAll(),
         'countProccess' => $this->checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('user_id', user_id())->where('status', 'Proccessing')->get()->getRow(),
         'sending' => $this->checkouts->where('user_id', user_id())->where('status', 'Sending')->groupBy('invoice')->findAll(),
         'countSending' => $this->checkouts->select('COUNT(DISTINCT(invoice)) as invoice')->where('user_id', user_id())->where('status', 'Sending')->get()->getRow(),
      ]);
   }

   /**
    * Halaman edit profile
    */
   public function edit($id)
   {
      if (user_id() != $id) {
         throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
      }

      $address = $this->address->where('user_id', user_id())->first();
      return view('user/edit-profile', [
         'title' => 'Edit Profile',
         'keyword' => '',
         'categories' => $this->categories->getCategories(),
         'address' => $address,
         'province' => $this->getProvinsi(),
         'city' => $address ? $this->getKabupaten($address['kode_provinsi']) : $this->getKabupaten(''),
      ]);
   }

   /**
    * Update profile
    */
   public function update()
   {
      if (!$this->validate([
         'fullname' => 'required',
         'username' => 'required|is_unique[users.username,id,' . user_id() . ']',
         'email' => 'required|valid_email|is_unique[users.email,id,' . user_id() . ']',
         'phone' => 'required|max_length[13]|integer',
         'picture' => 'is_image[picture]|max_size[picture,1024]|mime_in[picture,image/png,image/jpg,image/jpeg]|ext_in[picture,png,jpg,jpeg]',
         'jalan' => 'required',
         'provinsi' => 'required',
         'kode_provinsi' => 'required',
         'kabupaten' => 'required',
         'kode_kabupaten' => 'required',
         'kecamatan' => 'required',
         'kode_pos' => 'required',
      ])) {
         return json_encode(['invalid' => $this->validator->getErrors()]);
      }

      // ambil foto profil
      $profilePicture = $this->request->getFile('picture');

      // cek apakah tidak ada gambar yang diupload
      if ($profilePicture->getError() == 4) {
         $nameFile = user()->picture;
      } else {

         if (user()->picture != 'profile.png') {
            unlink('img/foto-profile/' . user()->picture);
         }

         // generate nama foto profil
         $nameFile = $profilePicture->getRandomName();
         // simpan foto ke folder img/foto-profile
         $profilePicture->move('img/foto-profile', $nameFile);
      }

      $dataUser = [
         'id' => user_id(),
         'fullname' => $this->request->getVar('fullname'),
         'username' => $this->request->getVar('username'),
         'email' => $this->request->getVar('email'),
         'phone' => $this->request->getVar('phone'),
         'picture' => $nameFile,
      ];

      $dataAlamat = [
         'id' => $this->request->getVar('id'),
         'user_id' => user_id(),
         'jalan' => $this->request->getVar('jalan'),
         'kecamatan' => $this->request->getVar('kecamatan'),
         'kabupaten' => $this->request->getVar('kabupaten'),
         'provinsi' => $this->request->getVar('provinsi'),
         'kode_kabupaten' => $this->request->getVar('kode_kabupaten'),
         'kode_provinsi' => $this->request->getVar('kode_provinsi'),
         'kode_pos' => $this->request->getVar('kode_pos'),
         'flags' => 1
      ];

      $this->users->save($dataUser);
      $this->address->save($dataAlamat);

      return json_encode(['status' => true]);
   }

   /**
    * Manage user (admin)
    */
   public function manageUsers()
   {
      $users = $this->users->select('users.id, users.fullname, users.phone, users.picture, auth_groups.name as role')
         ->join('auth_groups_users', 'users.id = auth_groups_users.user_id')
         ->join('auth_groups', 'auth_groups.id = auth_groups_users.group_id')
         ->whereNotIn('auth_groups.name', ['admin'])
         ->get()->getResult();

      return view('admin/manage-users', [
         'title' => 'Manage User',
         'users' => $users
      ]);
   }

   /**
    * Jadikan user sebagai member
    */
   public function asMember($id)
   {
      $db = \Config\Database::connect();
      $user = $this->users->select('fullname')->find($id);
      $db->table('auth_groups_users')->set('group_id', 2)->where('user_id', $id)->update();
      $db->table('historyusers')->set('tgl_gabung_member', Time::now())->where('user_id', $id)->update();

      session()->setFlashdata('info', $user->fullname . ' berhasil dijadikan member');
      return redirect()->to('/web-admin/users/manage');
   }

   /**
    * Ambil data provinsi dari API raja ongkir
    */
   public function getProvinsi()
   {
      $curl = curl_init();

      curl_setopt_array($curl, array(
         CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
         CURLOPT_RETURNTRANSFER => true,
         CURLOPT_ENCODING => "",
         CURLOPT_MAXREDIRS => 10,
         CURLOPT_TIMEOUT => 30,
         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
         CURLOPT_CUSTOMREQUEST => "GET",
         CURLOPT_HTTPHEADER => array(
            "key: 69334668430f3432cc8c8ab8f0c0bd48"
         ),
      ));

      $response = curl_exec($curl);
      $err = curl_error($curl);

      curl_close($curl);

      if ($err) {
         return $err;
      } else {
         return $response;
      }
   }

   /**
    * Ambil data kabupaten berdasarkan provinsi dari API raja ongkir
    */
   public function getKabupaten($provinsi)
   {
      $curl = curl_init();

      curl_setopt_array($curl, array(
         CURLOPT_URL => "https://api.rajaongkir.com/starter/city?province=" . $provinsi . "",
         CURLOPT_RETURNTRANSFER => true,
         CURLOPT_ENCODING => "",
         CURLOPT_MAXREDIRS => 10,
         CURLOPT_TIMEOUT => 30,
         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
         CURLOPT_CUSTOMREQUEST => "GET",
         CURLOPT_HTTPHEADER => array(
            "key: 69334668430f3432cc8c8ab8f0c0bd48"
         ),
      ));

      $response = curl_exec($curl);
      $err = curl_error($curl);

      curl_close($curl);

      if ($err) {
         return $err;
      } else {
         return $response;
      }
   }
}
