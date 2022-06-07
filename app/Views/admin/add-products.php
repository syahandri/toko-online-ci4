<?= $this->extend('admin/_templates/main') ?>

<?= $this->section('page') ?>

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="card card-body shadow border-0">
                <form action="/web-admin/products/store" method="post" enctype="multipart/form-data" class="row" id="formAddProduct">
                    <?= csrf_field() ?>
                    <div class="col-12 col-sm-6">
                        <div class="mb-2">
                            <label for="name" class="form-label">Nama Produk</label>
                            <input type="text" class="form-control text-capitalize <?= !$validation->hasError('name') ?: 'is-invalid' ?>" name="name" placeholder="Mis: Kaos" value="<?= old('name') ?>" required>
                            <?php if ($validation->hasError('name')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('name') ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="mb-2">
                            <label for="price" class="form-label">Harga Produk</label>
                            <input type="text" class="form-control only-number <?= !$validation->hasError('price') ?: 'is-invalid' ?>" name="price" placeholder="Mis: 1000000" value="<?= old('price') ?>" required>
                            <?php if ($validation->hasError('price')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('price') ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="mb-2">
                            <label for="discount" class="form-label">Diskon Produk Untuk Member (%)</label>
                            <input type="text" class="form-control only-number <?= !$validation->hasError('discount') ?: 'is-invalid' ?>" name="discount" placeholder="Mis: 50" value="<?= old('discount', 0) ?>">
                            <?php if ($validation->hasError('discount')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('discount') ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="mb-2">
                            <label for="weight" class="form-label">Berat Produk (gram)</label>
                            <input type="text" class="form-control only-number <?= !$validation->hasError('weight') ?: 'is-invalid' ?>" name="weight" placeholder="Mis: 1000" value="<?= old('weight') ?>" required>
                            <?php if ($validation->hasError('weight')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('weight') ?>
                                </div>
                            <?php endif ?>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6">
                        <div class="mb-2">
                            <label for="stock" class="form-label">Stok Produk</label>
                            <input type="text" class="form-control only-number <?= !$validation->hasError('stock') ?: 'is-invalid' ?>" name="stock" placeholder="Mis: 100" value="<?= old('stock') ?>" required>
                            <?php if ($validation->hasError('stock')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('stock') ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="mb-2">
                            <label for="category" class="form-label">Kategori Produk</label>
                            <select class="form-select <?= !$validation->hasError('category') ?: 'is-invalid' ?>" name="category" required>
                                <option value="">-- Pilih Kategori --</option>
                                <?php foreach ($categories as $category) : ?>
                                    <option value="<?= $category['id'] ?>" <?= old('category') == $category['id'] ? 'selected' : '' ?>><?= $category['name'] ?></option>
                                <?php endforeach ?>
                            </select>
                            <?php if ($validation->hasError('category')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('category') ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="mb-0">
                            <label for="size" class="form-label">Varian Ukuran Produk</label>
                            <br>
                            <?php foreach ($sizes as $size) : ?>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input size <?= !$validation->hasError('size') ?: 'is-invalid' ?>" type="checkbox" name="size[][id]" value="<?= $size['id'] ?>" <?php if (old('size')) : ?> <?php foreach (old('size') as $old) : ?> <?= $old['id'] == $size['id'] ? 'checked' : '' ?> <?php endforeach ?> <?php endif ?>>
                                    <label class="form-check-label"><?= $size['name'] ?></label>
                                </div>
                            <?php endforeach ?>
                            <?php if ($validation->hasError('size')) : ?>
                                <div class="small text-danger">
                                    <?= $validation->getError('size') ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="mb-2">
                            <label for="size" class="form-label">Varian Warna Produk</label>
                            <br>
                            <?php foreach ($colors as $color) : ?>
                                <div class="form-check form-check-inline">
                                    <input data-style="<?= $color['name'] ?>" class="form-check-input color bg-<?= $color['name'] ?> <?= $color['name'] != 'white' ?: 'color-white' ?> <?= !$validation->hasError('color') ?: 'is-invalid' ?>" type="checkbox" name="color[][id]" value="<?= $color['id'] ?>" title="<?= $color['name'] ?>" <?php if (old('color')) : ?> <?php foreach (old('color') as $old) : ?> <?= $old['id'] == $color['id'] ? 'checked' : '' ?> <?php endforeach ?> <?php endif ?>>
                                </div>
                            <?php endforeach ?>
                            <?php if ($validation->hasError('color')) : ?>
                                <div class="small text-danger">
                                    <?= $validation->getError('color') ?>
                                </div>
                            <?php endif ?>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="mb-2">
                            <label for="detail" class="form-label">Detail Produk</label>
                            <input type="hidden" id="detail" name="detail" value="<?= old('detail') ?>" required>
                            <trix-editor input="detail" class="<?= !$validation->hasError('detail') ?: 'is-invalid' ?>"></trix-editor>
                            <?php if ($validation->hasError('detail')) : ?>
                                <div class="invalid-feedback">
                                    <?= $validation->getError('detail') ?>
                                </div>
                            <?php endif ?>
                        </div>
                    </div>

                    <div class="col-12 col-md-8">
                        <div class="mb-2">
                            <label for="image" class="form-label">Foto Produk</label>
                            <div class="row justify-content-center">
                                <div class="col-12 col-md-6 col-lg-4 mb-2 mb-md-3">
                                    <div class="drop-zone <?= !$validation->hasError('image_1') ?: 'is-invalid' ?>">
                                        <span class="drop-zone__prompt small">Drop file here or click to upload</span>
                                        <input type="file" name="image_1" class="drop-zone__input">
                                    </div>
                                    <?php if ($validation->hasError('image_1')) : ?>
                                        <div class="invalid-feedback">
                                            <?= $validation->getError('image_1') ?>
                                        </div>
                                    <?php endif ?>
                                </div>
                                <div class="col-12 col-md-6 col-lg-4 mb-2 mb-md-3">
                                    <div class="drop-zone <?= !$validation->hasError('image_2') ?: 'is-invalid' ?>">
                                        <span class="drop-zone__prompt small">Drop file here or click to upload</span>
                                        <input type="file" name="image_2" class="drop-zone__input">
                                    </div>
                                    <?php if ($validation->hasError('image_2')) : ?>
                                        <div class="invalid-feedback">
                                            <?= $validation->getError('image_2') ?>
                                        </div>
                                    <?php endif ?>
                                </div>
                                <div class="col-12 col-md-6 col-lg-4 mb-2 mb-md-3">
                                    <div class="drop-zone <?= !$validation->hasError('image_3') ?: 'is-invalid' ?>">
                                        <span class="drop-zone__prompt small">Drop file here or click to upload</span>
                                        <input type="file" name="image_3" class="drop-zone__input">
                                    </div>
                                    <?php if ($validation->hasError('image_3')) : ?>
                                        <div class="invalid-feedback">
                                            <?= $validation->getError('image_3') ?>
                                        </div>
                                    <?php endif ?>
                                </div>
                            </div>
                            <small class="small text-muted">*dimensi foto produk 500x500 (png, jpg, jpeg)</small>
                            <small class="small text-muted">*maksimal 1MB</small>
                        </div>
                    </div>

                    <div class="col-6">
                        <button type="submit" class="btn btn-success px-3"><i class="fas fa-save"></i> Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>