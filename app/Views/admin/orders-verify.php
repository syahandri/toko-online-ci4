<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card card-body shadow border-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-sm" id="tableVerify">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Invoice</th>
                                <th>Nama Pemesan</th>
                                <th>Tanggal Pesan</th>
                                <th>Tanggal konfirmasi</th>
                                <th>Atas Nama</th>
                                <th>Bank</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal detail order verify-->
<div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modalVerify" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detail Pesanan</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-2">
                    <div class="col-6">
                        <p class="fs-6 my-0">Invoice :</p>
                        <p class="fw-bold fs-6 my-0" id="invoice">XXXX-XXXX-XXXX</p>
                    </div>
                    <div class="col-6 text-end">
                        <p class="fs-6 my-0">Tanggal Konfirmasi :</p>
                        <p class="fw-bold fs-6 my-0" id="confirmDate">XXXX-XXXX-XXXX</p>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-sm table-striped table-hover" id="tableProductVerify">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Produk</th>
                                <th scope="col">Ukuran</th>
                                <th scope="col">Warna</th>
                                <th scope="col">Jumlah Beli</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                <div class="text-end">
                    <h5 class="fw-bold" id="total"></h5>
                </div>
                <hr>
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="card card-body shadow-sm border-0">
                            <img src="" alt="" class="img-fluid rounded w-100" id="imgTransfer">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>