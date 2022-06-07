<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-12 mb-2">
            <div class="card card-body shadow border-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-sm" id="tableEvent">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Nama Event</th>
                                <th>Diterbitkan</th>
                                <th>Tanggal Mulai</th>
                                <th>Tanggal Akhir</th>
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


<!-- Modal tambah / ubah event -->
<div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modalEvent" tabindex="-1">
    <form action="/web-admin/events/store" method="post" enctype="multipart/form-data" id="formEvent">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Tambah Event</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body row">
                    <?= csrf_field() ?>
                    <input type="hidden" id="id" name="id">
                    <input type="hidden" id="image_lama" name="image_lama">
                    <div class="col-12 col-sm-6">
                        <div class="mb-2">
                            <label for="event" class="form-label">Nama Event</label>
                            <input type="text" class="form-control text-capitalize" name="event" placeholder="Masukan nama event..." required>
                            <div class="invalid-feedback invalid-event"></div>
                        </div>
                        <div class="mb-2">
                            <label for="start_date" class="form-label">Tanggal Mulai</label>
                            <input type="date" class="form-control text-capitalize" name="start_date" required>
                            <div class="invalid-feedback invalid-start"></div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6">
                        <div class="mb-2">
                            <label for="image" class="form-label">Gambar Event</label>
                            <input class="form-control" type="file" name="image">
                            <div class="invalid-feedback invalid-image"></div>
                        </div>
                        <div class="mb-2">
                            <label for="end_date" class="form-label">Tanggal Akhir</label>
                            <input type="date" class="form-control text-capitalize" name="end_date" required>
                            <div class="invalid-feedback invalid-end"></div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-check form-switch ms-4 mb-2">
                            <input class="form-check-input" type="checkbox" role="switch" name="publish" value="1">
                            <label class="form-check-label ms-0 px-0" for="publish">Terbitkan Event</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mb-2">
                            <label for="detail" class="form-label">Detail Event</label>
                            <input type="hidden" id="detail" name="detail">
                            <trix-editor input="detail" class="trix-event"></trix-editor>
                            <div class="invalid-feedback invalid-detail"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Batal</button>
                    <button type="submit" class="btn btn-sm btn-success"><i class="fas fa-save"></i> Simpan</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal detail event -->
<div class="modal fade" id="modalDetailEvent" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detail Event</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>