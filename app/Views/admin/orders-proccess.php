<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card card-body shadow border-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-sm" id="tableProccess">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Invoice</th>
                                <th>Nama Pemesan</th>
                                <th>Tanggal Pesan</th>
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

<!-- Modal detail order proccess-->
<div class="modal fade" id="modalProccess" tabindex="-1">
    <form action="" method="post" id="formSendOrders">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Kirim Pesanan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm px-3" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary btn-sm px-3">Kirim</button>
                </div>
            </div>
        </div>
    </form>
</div>

<?= $this->endSection() ?>