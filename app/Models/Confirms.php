<?php

namespace App\Models;

use CodeIgniter\Model;

class Confirms extends Model
{
    protected $table            = 'confirms';
    protected $allowedFields    = ['invoice', 'user_id', 'name', 'bank', 'image_transfer'];
    protected $useTimestamps = true;


    public function confirm($data)
    {
        $email = \Config\Services::email();
        $to = $email->fromEmail;
        $from = user()->email;
        $subject = 'Konfirmasi Pesanan';
        $message = view('confirm_message', [
            'invoice'   => $data['invoice'],
            'bank'      => $data['bank'],
            'name'      => $data['name'],
            'image'     => $data['image_transfer'],
        ]);

        $email->setTo($to);
        $email->setFrom($from, user()->fullname);
        $email->setSubject($subject);
        $email->attach('img/bukti-transfer/' . $data['image_transfer']);
        $email->setMessage($message);

        if ($email->send()) {

            // simpan konfirmasi ke tabel confirms
            $this->save($data);

            // ubah status pesanan menjadi menunggu verifikasi
            $checkouts = new Checkouts();
            $checkouts->where('invoice', $data['invoice'])->set(['status' => 'Verifying'])->update();

            return [
                'status' => true,
                'confirm' => 'Terima kasih! Konfirmasi pesanan sudah kami terima, pesanan kamu akan segera kami proses.'
            ];
        } else {
            // hapus foto bukti transfer jika gagal kirim email
            unlink('img/bukti-transfer/' . $data['image_transfer']);
            return [
                'status' => false,
                'confirm' => 'Konfirmasi pesanan gagal, silahkan coba lagi dalam beberapa saat.'
            ];
        }
    }
}
