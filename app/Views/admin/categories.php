<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-12 col-md-8 col-lg-7 mb-2">
            <div class="card card-body shadow border-0">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-sm" id="tableCategory">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Kategori</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4 col-lg-5 mb-2">
            <div class="card card-body shadow border-0">
                <form action="" method="post" id="formCategory">
                    <h4 class="fw-bold">Tambah Kategori</h4>
                    <?= csrf_field() ?>
                    <div class="mb-2">
                        <input type="hidden" name="id" value="">
                        <label for="category" class="form-label">Nama Kategori</label>
                        <input type="text" class="form-control text-capitalize" name="category" placeholder="Mis: Aksesoris" required>
                        <div class="invalid-feedback invalid-category"></div>
                    </div>
                    <button type="reset" class="btn btn-secondary btn-sm btn-reset-category"><i class="fas fa-times"></i> Reset</button>
                    <button type="submit" class="btn btn-success btn-sm"><i class="fas fa-plus"></i> Tambah</button>
                </form>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>