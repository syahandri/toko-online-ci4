<?= $this->extend('pages/_templates/main') ?>

<?= $this->section('page') ?>

<div class="row mt-5">
    <h1 class="fw-bold text-capitalize"><?= $title; ?></h1>
    <div class="col-md-4">
        <div class="card card-body shadow border-0">
            <form action="" method="POST" enctype="multipart/form-data" id="formConfirm">
                <?= csrf_field(); ?>
                <div class="mb-2">
                    <label for="invoice" class="form-label">Invoice</label>
                    <select class="form-select" name="invoice" required>
                        <option value="">--- Nomor Pemesanan ---</option>
                        <?php if ($invoice) : ?>
                            <?php foreach ($invoice as $invoice) : ?>
                                <option value="<?= $invoice['invoice']; ?>"><?= $invoice['invoice']; ?></option>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </select>
                    <div class="invalid-feedback invalid-invoice"></div>
                </div>
                <label class="form-label">Transfer ke Bank</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="bank" value="BCA" checked required>
                        <label class="form-check-label" for="bank">BCA</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="bank" value="BRI" required>
                        <label class="form-check-label" for="bank">BRI</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="bank" value="MANDIRI" required>
                        <label class="form-check-label" for="bank">MANDIRI</label>
                    </div>
                </div>
                <span class="small text-danger mb-2 invalid-bank"></span>
                <div class="mb-2">
                    <label for="name" class="form-label">Rekening Anda (Atas Nama)</label>
                    <input type="text" class="form-control text-capitalize" name="name" maxlength="50" required>
                    <div class="invalid-feedback invalid-name"></div>
                </div>
                <div class="mb-2">
                    <label for="image_transfer" class="form-label">Foto Bukti Transfer</label>
                    <input class="form-control" type="file" name="image_transfer" required>
                    <div class="invalid-feedback invalid-image"></div>
                    <small class="small text-secondary">*Upload bukti transfer berupa JPG/JPEG/PNG</small><br>
                    <small class="small text-secondary">*Maks. 1MB</small>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">
                        <span class="spinner-border-sm" role="status"></span>
                        Konfirmasi
                    </button>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-8">
        <div class="card card-body shadow border-0">
            <div class="table-responsive" id="tableDetail">
                <table class="table table-sm table-bordered">
                    <thead class="table-secondary">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Produk</th>
                            <th scope="col">Ukuran</th>
                            <th scope="col">Warna</th>
                            <th scope="col">Harga</th>
                            <th scope="col">Jumlah</th>
                            <th scope="col">Grand Total</th>
                            <th scope="col">Catatan</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="text-end">
                <h6 class="fw-bold ongkir">Ongkir</h6>
                <h5 class="fw-bold total">Total</h5>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>