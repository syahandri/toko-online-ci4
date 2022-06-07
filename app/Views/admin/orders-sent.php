<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card card-body shadow border-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-sm" id="tableSent">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Invoice</th>
                                <th>Nama Pemesan</th>
                                <th>Alamat</th>
                                <th>Kurir</th>
                                <th>Jenis Pengiriman</th>
                                <th>Estimasi (hari)</th>
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

<!-- Modal detail order sending-->
<div class="modal fade" id="modalSending" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detail Pesanan</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary btn-sm px-3" data-bs-dismiss="modal">OKE</button>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>