<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<!-- Card Profile -->
<div class="row mt-5">
   <h1 class="fw-bold"><?= $title; ?></h1>
   <?php if (in_groups('user')) : ?>
      <div class="col-12">
         <div class="alert alert-warning text-dark mb-3" role="alert">
            <h4 class="alert-heading">Hello, <?= user()->fullname ?></h4>
            <p class="m-0">Dengan bergabung menjadi <strong>Member</strong>, kamu dapat menikmati diskon untuk semua produk. Tunggu apa lagi, bergabung sekarang dengan klik tombol <strong>Upgrade ke Member</strong> di bawah.</p>
            <hr>
            <p class="m-0">Untuk info lebih lanjut mengenai <strong>Member</strong>, <a href="#detailMemberModal" class="fw-bold text-decoration-none" data-bs-toggle="modal">Klik di sini</a></p>
         </div>
      </div>
   <?php endif; ?>
   <div class="col-lg-3 col-md-4 col-sm-5 mb-2 mb-sm-0">
      <div class="card shadow p-3 rounded-3 border-5 border-primary border-0 border-start">
         <img src="/img/foto-profile/<?= user()->picture ?>" alt="<?= user()->fullname ?>" class="img-profile img-fluid mx-auto d-block">
         <div class="card-body text-center">
            <h4 class="card-title fw-bold"><?= user()->fullname ?></h4>
            <p class="card-text small">
               <?php if (in_groups('admin')) : ?>
                  <span class="badge rounded-pill px-3 bg-primary">Admin</span>
               <?php elseif (in_groups('member')) : ?>
                  <span class="badge rounded-pill px-3 bg-danger">Member</span>
               <?php else : ?>
                  <span class="badge rounded-pill px-3 bg-success">User</span>
               <?php endif; ?>
            </p>
            <?php if (in_groups('user')) : ?>
               <a href="#upgradeMemberModal" class="btn btn-yellow rounded-pill" data-bs-toggle="modal">Upgrade ke Member</a>
            <?php endif; ?>
         </div>
      </div>
   </div>
   <div class="col-lg-9 col-md-8 col-sm-7">
      <div class="card shadow rounded-3 border-5 border-primary border-0 border-end">
         <div class="card-body table-responsive">
            <table class="table table-sm">
               <tr>
                  <th>Fullname</th>
                  <td><?= user()->fullname ?></td>
               </tr>
               <tr>
                  <th>Username</th>
                  <td><?= user()->username ?></td>
               </tr>
               <tr>
                  <th>Email</th>
                  <td><?= user()->email ?></td>
               </tr>
               <tr>
                  <th>Phone</th>
                  <td><?= user()->phone ?></td>
               </tr>
               <tr>
                  <th>Alamat</th>
                  <?php if ($address) : ?>
                     <td><?= $address[0]['jalan'] . ', ' . $address[0]['kecamatan']  . ', ' . $address[0]['kabupaten']  . ', ' . $address[0]['provinsi']  . ', ' . $address[0]['kode_pos'] ?></td>
                  <?php endif ?>
               </tr>
            </table>
            <a href="/profile/edit/<?= user_id() ?>" class="btn btn-primary btn-sm px-5"><i class="fas fa-pencil-alt"></i> Edit Profile</a>
         </div>
      </div>
   </div>
</div>


<!-- Card Status Pesanan -->
<div class="row mt-5">
   <h1 class="fw-bold">Status Pesanan</h1>
   <div class="col-lg-3 col-md-6 mb-2">
      <div class="card border-0 border-5 border-start border-danger shadow h-100 py-2">
         <div class="card-body">
            <div class="row g-0 d-flex align-items-center">
               <div class="col me-2">
                  <div class="fw-bold text-danger text-uppercase mb-1">Menunggu Pembayaran</div>
                  <div class="h6 mb-0 fw-bold text-secondary"><?= $countPending->invoice ?> Invoice</div>
               </div>
               <div class="col-auto">
                  <i class="fas fa-credit-card fa-3x text-secondary"></i>
               </div>
            </div>
            <a class="stretched-link order-status" data-bs-toggle="collapse" href="#pendingStatus" role="button"></a>
         </div>
      </div>
   </div>
   <div class="col-lg-3 col-md-6 mb-2">
      <div class="card border-0 border-5 border-start border-info shadow h-100 py-2">
         <div class="card-body">
            <div class="row g-0 d-flex align-items-center">
               <div class="col me-2">
                  <div class="fw-bold text-info text-uppercase mb-1">Menunggu Verifikasi</div>
                  <div class="h6 mb-0 fw-bold text-secondary"><?= $countVerify->invoice ?> Invoice</div>
               </div>
               <div class="col-auto">
                  <i class="fas fa-sticky-note fa-3x text-secondary"></i>
               </div>
            </div>
            <a class="stretched-link order-status" data-bs-toggle="collapse" href="#verifyingStatus" role="button"></a>
         </div>
      </div>
   </div>
   <div class="col-lg-3 col-md-6 mb-2">
      <div class="card border-0 border-5 border-start border-warning shadow h-100 py-2">
         <div class="card-body">
            <div class="row g-0 d-flex align-items-center">
               <div class="col me-2">
                  <div class="fw-bold text-warning text-uppercase mb-1">Diproses</div>
                  <div class="h6 mb-0 fw-bold text-secondary"><?= $countProccess->invoice ?> Invoice</div>
               </div>
               <div class="col-auto">
                  <i class="fas fa-box-open fa-3x text-secondary"></i>
               </div>
            </div>
            <a class="stretched-link order-status" data-bs-toggle="collapse" href="#proccessStatus" role="button"></a>
         </div>
      </div>
   </div>
   <div class="col-lg-3 col-md-6 mb-2">
      <div class="card border-0 border-5 border-start border-success shadow h-100 py-2">
         <div class="card-body">
            <div class="row g-0 d-flex align-items-center">
               <div class="col me-2">
                  <div class="fw-bold text-success text-uppercase mb-1">Dikirim</div>
                  <div class="h6 mb-0 fw-bold text-secondary"><?= $countSending->invoice ?> Invoice</div>
               </div>
               <div class="col-auto">
                  <i class="fas fa-truck-loading fa-3x text-secondary"></i>
               </div>
            </div>
            <a class="stretched-link order-status" data-bs-toggle="collapse" href="#sendingStatus" role="button"></a>
         </div>
      </div>
   </div>

   <!-- Tabel pesanan pending -->
   <div class="collapse mb-2" id="pendingStatus">
      <div class="card card-body shadow border-0 table-responsive">
         <table class="table caption-top">
            <caption>Menunggu Pembayaran</caption>
            <thead>
               <tr>
                  <th scope="col">#</th>
                  <th scope="col">Invoice</th>
                  <th scope="col">Kurir</th>
                  <th scope="col">Jenis Pengiriman</th>
                  <th scope="col">Ongkir</th>
                  <th scope="col">Total</th>
                  <th scope="col">Aksi</th>
               </tr>
            </thead>
            <tbody>
               <?php foreach ($pending as $i => $data) : ?>
                  <tr>
                     <th><?= $i + 1 ?></th>
                     <th><?= $data['invoice'] ?></th>
                     <th><?= strtoupper($data['courier']) ?></th>
                     <th><?= $data['shipping_type'] ?></th>
                     <th>Rp. <?= number_format($data['cost']) ?></th>
                     <th>Rp. <?= number_format($data['total']) ?></th>
                     <td>
                        <div class="btn-group" role="group">
                           <button type="button" class="btn btn-primary btn-sm btn-detail-pending" data-invoice="<?= $data['invoice'] ?>" data-status="<?= $data['status'] ?>">Detail</button>
                        </div>
                     </td>
                  </tr>
               <?php endforeach ?>
            </tbody>
         </table>
      </div>
   </div>

   <!-- Tabel pesanan verifying -->
   <div class="collapse mb-2" id="verifyingStatus">
      <div class="card card-body shadow border-0 table-responsive">
         <table class="table caption-top">
            <caption>Menunggu Verifikasi</caption>
            <thead>
               <tr>
                  <th scope="col">#</th>
                  <th scope="col">Invoice</th>
                  <th scope="col">Kurir</th>
                  <th scope="col">Jenis Pengiriman</th>
                  <th scope="col">Ongkir</th>
                  <th scope="col">Total</th>
                  <th scope="col">Aksi</th>
               </tr>
            </thead>
            <tbody>
               <?php foreach ($verify as $i => $data) : ?>
                  <tr>
                     <th><?= $i + 1 ?></th>
                     <th><?= $data['invoice'] ?></th>
                     <th><?= strtoupper($data['courier']) ?></th>
                     <th><?= $data['shipping_type'] ?></th>
                     <th>Rp. <?= number_format($data['cost']) ?></th>
                     <th>Rp. <?= number_format($data['total']) ?></th>
                     <td>
                        <div class="btn-group" role="group">
                           <button type="button" class="btn btn-primary btn-sm btn-detail" data-invoice="<?= $data['invoice'] ?>" data-status="<?= $data['status'] ?>">Detail</button>
                        </div>
                     </td>
                  </tr>
               <?php endforeach ?>
            </tbody>
         </table>
      </div>
   </div>

   <!-- Tabel pesanan proccess -->
   <div class="collapse mb-2" id="proccessStatus">
      <div class="card card-body shadow border-0 table-responsive">
         <table class="table caption-top">
            <caption>Diproses</caption>
            <thead>
               <tr>
                  <th scope="col">#</th>
                  <th scope="col">Invoice</th>
                  <th scope="col">Kurir</th>
                  <th scope="col">Jenis Pengiriman</th>
                  <th scope="col">Ongkir</th>
                  <th scope="col">Total</th>
                  <th scope="col">Aksi</th>
               </tr>
            </thead>
            <tbody>
               <?php foreach ($proccess as $i => $data) : ?>
                  <tr>
                     <th><?= $i + 1 ?></th>
                     <th><?= $data['invoice'] ?></th>
                     <th><?= strtoupper($data['courier']) ?></th>
                     <th><?= $data['shipping_type'] ?></th>
                     <th>Rp. <?= number_format($data['cost']) ?></th>
                     <th>Rp. <?= number_format($data['total']) ?></th>
                     <td>
                        <div class="btn-group" role="group">
                           <button type="button" class="btn btn-primary btn-sm btn-detail" data-invoice="<?= $data['invoice'] ?>" data-status="<?= $data['status'] ?>">Detail</button>
                        </div>
                     </td>
                  </tr>
               <?php endforeach ?>
            </tbody>
         </table>
      </div>
   </div>

   <!-- Tabel pesanan sending -->
   <div class="collapse mb-2" id="sendingStatus">
      <div class="card card-body shadow border-0 table-responsive">
         <table class="table caption-top">
            <caption>Dikirim</caption>
            <thead>
               <tr>
                  <th scope="col">#</th>
                  <th scope="col">Invoice</th>
                  <th scope="col">Kurir</th>
                  <th scope="col">Jenis Pengiriman</th>
                  <th scope="col">Ongkir</th>
                  <th scope="col">Total</th>
                  <th scope="col">Aksi</th>
               </tr>
            </thead>
            <tbody>
               <?php foreach ($sending as $i => $data) : ?>
                  <tr>
                     <th><?= $i + 1 ?></th>
                     <th><?= $data['invoice'] ?></th>
                     <th><?= strtoupper($data['courier']) ?></th>
                     <th><?= $data['shipping_type'] ?></th>
                     <th>Rp. <?= number_format($data['cost']) ?></th>
                     <th>Rp. <?= number_format($data['total']) ?></th>
                     <td>
                        <div class="btn-group" role="group">
                           <button type="button" class="btn btn-primary btn-sm btn-detail" data-invoice="<?= $data['invoice'] ?>" data-status="<?= $data['status'] ?>">Detail</button>
                        </div>
                     </td>
                  </tr>
               <?php endforeach ?>
            </tbody>
         </table>
      </div>
   </div>
</div>

<!-- Detail status pesanan offcanvas -->
<div class="offcanvas offcanvas-end offcanvas-end-status" tabindex="-1" id="offCanvasDetailStatus">
   <div class="offcanvas-header">
      <h5>Detail Pesanan</h5>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
   </div>
   <div class="offcanvas-body">

   </div>
</div>

<!-- Modal info detail member -->
<div class="modal fade" id="detailMemberModal" tabindex="-1">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">Info Member</h5>
         </div>
         <div class="modal-body">
            <!-- detail member -->
            <p>Member adalah Anggota yang merupakan sebuah status yang diberikan kepada seseorang atau lembaga dari sebuah perkumpulan, organisasi, atau institusi setelah memenuhi beberapa persyaratan yang telah ditetapkan oleh perkumpulan, organisasi, atau institusi tersebut.</p>
            <p>Kawan Baiker’s Indonesia adalah komunitas motor dari segala jenis motor yang dirikan oleh 12 founder yang berasal dari penjuru Indonesia mulai dari Lombok, Sulawesi, Jawa, hingga Sumatera.</p>
            <p>Struktur organisasi ini memiliki ketua yang bernama Moh Oesai Basyrahil dan wakil ketua H. Reza serta bendahara Erland Darmadi dan penasehat Wuwuh Setiawan.</p>
            <p> Untuk anggotanya sudah mencapai 340 yang terdiri dari penjuru Indonesia. Wilayah yang sudah terdaftar dalam organisasi ini yaitu Banyumas, Pemalang, Tangerang, Bekasi, Sidoarjo, Surabaya, Muara Enim, Padang Pariaman, Rokan Hulu,Sulawesi Selatan, Lampung, Lombok. </p>
            <p>Untuk mendaftar menjadi member kami, kawan- kawan dapat mendaftar langsung ke admin kami dengan biaya pendaftara Rp250.000.
               Yuk tunggu apa lagi daftar sekarang juga dan dapatkan potongan harga sebesar 50% !</p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary px-4 btn-sm" data-bs-dismiss="modal">OKE</button>
         </div>
      </div>
   </div>
</div>

<!-- Modal upgrade member -->
<div class="modal fade" id="upgradeMemberModal" tabindex="-1">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">Upgrade Member</h5>
         </div>
         <div class="modal-body">
            <div class="alert alert-warning" role="alert">
               <h6 class="alert-heading text-center">Terima kasih sudah bergabung menjadi member kami.</h6>
               <p class="my-0 text-center">Untuk biaya menjadi member sebesar <strong>Rp250.000</strong>, anda dapat melakukan pembayaran melalui bank di bawah ini.</p>
               <hr>
               <p class="my-0 text-center">Jika anda sudah melakukan pembayaran, segera konfirmasi ke kami melalui Telp / Whatsapp <strong>+62 812-2559-2522</strong> agar segera kami diproses.
               </p>
            </div>
            <div class="row">
               <div class="col-md-4 mb-2">
                  <div class="card card-body">
                     <h5 class="card-title"><img src="img/bri-logo.png" class="rounded img-thumbnail bank-logo" alt=""> BRI</h5>
                     <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                     <p class="card-text mb-0">Atas Nama : Ndog</p>

                  </div>
               </div>
               <div class="col-md-4 mb-2">
                  <div class="card card-body">
                     <h5 class="card-title"><img src="img/bca-logo.png" class="rounded img-thumbnail bank-logo" alt=""> BCA</h5>
                     <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                     <p class="card-text mb-0">Atas Nama : Ndog</p>
                  </div>
               </div>
               <div class="col-md-4 mb-2">
                  <div class="card card-body">
                     <h5 class="card-title"><img src="img/mandiri-logo.png" class="rounded img-thumbnail bank-logo" alt=""> Mandiri</h5>
                     <p class="card-text mb-0">No. Rekening : 0393884384293939239</p>
                     <p class="card-text mb-0">Atas Nama : Ndog</p>
                  </div>
               </div>
            </div>
            <hr>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary px-4 btn-sm" data-bs-dismiss="modal">OKE</button>
         </div>
      </div>
   </div>
</div>

<!-- Modal Checkout -->
<?= $this->include('pages/modal-checkout') ?>

<?= $this->endSection() ?>