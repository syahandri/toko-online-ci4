<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">

    <!-- Info Produk dan Kategori -->
    <div class="row">
        <div class="col-sm-6 mb-3">
            <div class="card card-body shadow border-left-primary border-0 h-100">
                <div class="row g-0 align-items-center mb-2">
                    <div class="col">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Jumlah Produk</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $countProduct->id ?> Produk</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-box fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 mb-3">
            <div class="card card-body shadow border-left-danger border-0 h-100">
                <div class="row g-0 align-items-center mb-2">
                    <div class="col">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Jumlah Kategori</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $countCategory->id ?> Kategori</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-th-large fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Info Pesanan -->
    <div class="row justify-content-center">
        <div class="col-sm-6 col-md-4 mb-3">
            <div class="card card-body shadow border-left-warning border-0 h-100">
                <div class="row g-0 align-items-center mb-2">
                    <div class="col">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Menunggu Verifikasi</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $countVerify->invoice ?> Pesanan</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-check-double fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4 mb-3">
            <div class="card card-body shadow border-left-info border-0 h-100">
                <div class="row g-0 align-items-center mb-2">
                    <div class="col">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Dalam Proses</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $countProccess->invoice ?> Pesanan</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-tasks fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4 mb-3">
            <div class="card card-body shadow border-left-success border-0 h-100">
                <div class="row g-0 align-items-center mb-2">
                    <div class="col">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Dalam Pengiriman</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $countSent->invoice ?> Pesanan</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-truck-loading fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Info Event -->
    <div class="row justify-content-center">
        <?php foreach ($events as $event) : ?>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                <div class="card card-body shadow border-0 h-100">
                    <img src="<?= base_url('img/event/' . $event['image']) ?>" alt="<?= $event['name'] ?>" class="img-fluid rounded">
                    <h6 class="fw-bold text-center text-gray-800 mt-2"><?= $event['name'] ?></h6>
                    <?php if ($event['published']) : ?>
                        <span class="small text-center text-success">Diterbitkan <i class="fas fa-check-circle text-success"></i></span>
                    <?php else : ?>
                        <span class="small text-center text-danger">Belum diterbitkan <i class="fas fa-times-circle text-danger"></i></span>
                    <?php endif ?>
                </div>
            </div>
        <?php endforeach ?>
    </div>
</div>

<?= $this->endSection() ?>